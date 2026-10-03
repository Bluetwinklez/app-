package com.antigravity.nfc_tag_master

import android.app.Activity
import android.app.KeyguardManager
import android.content.Intent
import android.nfc.NfcAdapter
import android.nfc.TagLostException
import android.nfc.Tag
import android.nfc.tech.Ndef
import android.nfc.tech.MifareClassic
import android.nfc.tech.NfcA
import android.nfc.tech.NdefFormatable
import android.nfc.NdefMessage
import android.nfc.NdefRecord
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.util.concurrent.ExecutorService
import java.util.concurrent.Executors

class MainActivity : FlutterActivity(), NfcAdapter.ReaderCallback {
    private val CHANNEL = "com.antigravity.nfc_tag_master/nfc"
    private var nfcAdapter: NfcAdapter? = null

    // Background executor for NFC blocking operations
    private val nfcExecutor: ExecutorService = Executors.newSingleThreadExecutor()

    // Synchronization lock for pending state
    private val stateLock = Any()
    private var pendingOperation: String? = null // "scan" or "write"
    private var pendingResult: MethodChannel.Result? = null
    private var stagedRecordsData: List<Map<String, Any>>? = null
    private var verifyAfterWrite: Boolean = true

    // Action requested by a nfctagmaster:// link, waiting for Flutter
    private var launchChannel: MethodChannel? = null
    private var pendingLaunchAction: String? = null

    // App lock: device credential confirmation in flight
    private var pendingAuthResult: MethodChannel.Result? = null
    private val AUTH_REQUEST_CODE = 4711

    @Deprecated("Deprecated in Java")
    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        if (requestCode == AUTH_REQUEST_CODE) {
            pendingAuthResult?.success(resultCode == Activity.RESULT_OK)
            pendingAuthResult = null
            return
        }
        @Suppress("DEPRECATION")
        super.onActivityResult(requestCode, resultCode, data)
    }

    // Raw command session (NTAG / MIFARE Ultralight tools)
    @Volatile private var rawNfcA: NfcA? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        nfcAdapter = NfcAdapter.getDefaultAdapter(this)

        launchChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "com.antigravity.nfc_tag_master/launch").also { channel ->
            channel.setMethodCallHandler { call, result ->
                if (call.method == "takeLaunchAction") {
                    val action = pendingLaunchAction
                    pendingLaunchAction = null
                    result.success(action)
                } else if (call.method == "requestReview") {
                    result.success(openUri("market://details?id=$packageName") ||
                        openUri("https://play.google.com/store/apps/details?id=$packageName"))
                } else if (call.method == "canAuthenticate") {
                    val km = getSystemService(KEYGUARD_SERVICE) as KeyguardManager
                    result.success(km.isDeviceSecure)
                } else if (call.method == "authenticate") {
                    val km = getSystemService(KEYGUARD_SERVICE) as KeyguardManager
                    @Suppress("DEPRECATION")
                    val intent = if (km.isDeviceSecure)
                        km.createConfirmDeviceCredentialIntent(call.argument<String>("title"), call.argument<String>("reason"))
                    else null
                    if (intent == null) {
                        result.success(null)
                    } else {
                        pendingAuthResult?.success(false)
                        pendingAuthResult = result
                        @Suppress("DEPRECATION")
                        startActivityForResult(intent, AUTH_REQUEST_CODE)
                    }
                } else if (call.method == "openUrl") {
                    val url = call.argument<String>("url")
                    result.success(url != null && openUri(url))
                } else {
                    result.notImplemented()
                }
            }
        }
        handleLaunchIntent(intent)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "checkAvailability" -> {
                    checkAvailability(result)
                }
                "scanTag" -> {
                    startScanTag(result)
                }
                "writeTag" -> {
                    val records = call.argument<List<Map<String, Any>>>("records")
                    val verify = call.argument<Boolean>("verifyReadAfterWrite") ?: true
                    startWriteTag(records, verify, result)
                }
                "startRawSession" -> {
                    if (rawNfcA != null) {
                        result.error("OPERATION_IN_PROGRESS", "Zaten devam eden bir NFC işlemi var", null)
                    } else {
                        startReaderOperation("raw", result)
                    }
                }
                "transceive" -> {
                    val command = call.argument<ByteArray>("command")
                    val nfcA = rawNfcA
                    if (command == null || command.isEmpty()) {
                        result.error("INVALID_ARGS", "Geçersiz komut", null)
                    } else if (nfcA == null) {
                        result.error("NO_SESSION", "Etiket bağlantısı yok veya kesildi", null)
                    } else {
                        nfcExecutor.execute {
                            try {
                                val response = nfcA.transceive(command)
                                postSuccess(result, response)
                            } catch (e: TagLostException) {
                                postError(result, "TAG_LOST", e.message ?: "", null)
                            } catch (e: Exception) {
                                postError(result, "TRANSCEIVE_FAILED", e.message ?: "", null)
                            }
                        }
                    }
                }
                "endRawSession" -> {
                    val nfcA = rawNfcA
                    rawNfcA = null
                    nfcExecutor.execute {
                        try { nfcA?.close() } catch (_: Exception) {}
                    }
                    synchronized(stateLock) {
                        if (pendingResult == null) stopReaderModeLocked()
                    }
                    result.success(null)
                }
                "lockTag" -> {
                    startLockTag(result)
                }
                "cancelSession" -> {
                    val activeResult: MethodChannel.Result?
                    synchronized(stateLock) {
                        stopReaderModeLocked()
                        activeResult = pendingResult
                        pendingResult = null
                    }
                    activeResult?.let {
                        postError(it, "SESSION_CANCELLED", "İşlem kullanıcı tarafından iptal edildi", null)
                    }
                    result.success(null)
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }

    private fun checkAvailability(result: MethodChannel.Result) {
        val adapter = nfcAdapter
        if (adapter == null) {
            result.success("notSupported")
        } else if (!adapter.isEnabled) {
            result.success("disabled")
        } else {
            result.success("available")
        }
    }

    private fun startScanTag(result: MethodChannel.Result) {
        val adapter = nfcAdapter
        if (adapter == null || !adapter.isEnabled) {
            result.error("NFC_NOT_AVAILABLE", "NFC donanımı mevcut değil veya kapalı", null)
            return
        }

        synchronized(stateLock) {
            if (pendingResult != null) {
                result.error("OPERATION_IN_PROGRESS", "Zaten devam eden bir NFC işlemi var", null)
                return
            }
            pendingOperation = "scan"
            pendingResult = result
        }

        val flags = NfcAdapter.FLAG_READER_NFC_A or
                    NfcAdapter.FLAG_READER_NFC_B or
                    NfcAdapter.FLAG_READER_NFC_F or
                    NfcAdapter.FLAG_READER_NFC_V or
                    NfcAdapter.FLAG_READER_NO_PLATFORM_SOUNDS

        adapter.enableReaderMode(this, this, flags, null)
    }

    private fun startWriteTag(
        records: List<Map<String, Any>>?,
        verify: Boolean,
        result: MethodChannel.Result
    ) {
        val adapter = nfcAdapter
        if (adapter == null || !adapter.isEnabled) {
            result.error("NFC_NOT_AVAILABLE", "NFC donanımı mevcut değil veya kapalı", null)
            return
        }

        if (records == null) {
            result.error("INVALID_ARGUMENTS", "Yazılacak NDEF kaydı belirtilmedi", null)
            return
        }

        synchronized(stateLock) {
            if (pendingResult != null) {
                result.error("OPERATION_IN_PROGRESS", "Zaten devam eden bir NFC işlemi var", null)
                return
            }
            pendingOperation = "write"
            stagedRecordsData = records
            verifyAfterWrite = verify
            pendingResult = result
        }

        val flags = NfcAdapter.FLAG_READER_NFC_A or
                    NfcAdapter.FLAG_READER_NFC_B or
                    NfcAdapter.FLAG_READER_NFC_F or
                    NfcAdapter.FLAG_READER_NFC_V or
                    NfcAdapter.FLAG_READER_NO_PLATFORM_SOUNDS

        adapter.enableReaderMode(this, this, flags, null)
    }

    private fun startReaderOperation(operation: String, result: MethodChannel.Result) {
        val adapter = nfcAdapter
        if (adapter == null || !adapter.isEnabled) {
            result.error("NFC_NOT_AVAILABLE", "NFC donanımı mevcut değil veya kapalı", null)
            return
        }

        synchronized(stateLock) {
            if (pendingResult != null) {
                result.error("OPERATION_IN_PROGRESS", "Zaten devam eden bir NFC işlemi var", null)
                return
            }
            pendingOperation = operation
            pendingResult = result
        }

        val flags = NfcAdapter.FLAG_READER_NFC_A or
                    NfcAdapter.FLAG_READER_NFC_B or
                    NfcAdapter.FLAG_READER_NFC_F or
                    NfcAdapter.FLAG_READER_NFC_V or
                    NfcAdapter.FLAG_READER_NO_PLATFORM_SOUNDS

        adapter.enableReaderMode(this, this, flags, null)
    }

    private fun startLockTag(result: MethodChannel.Result) {
        val adapter = nfcAdapter
        if (adapter == null || !adapter.isEnabled) {
            result.error("NFC_NOT_AVAILABLE", "NFC donanımı mevcut değil veya kapalı", null)
            return
        }

        synchronized(stateLock) {
            if (pendingResult != null) {
                result.error("OPERATION_IN_PROGRESS", "Zaten devam eden bir NFC işlemi var", null)
                return
            }
            pendingOperation = "lock"
            pendingResult = result
        }

        val flags = NfcAdapter.FLAG_READER_NFC_A or
                    NfcAdapter.FLAG_READER_NFC_B or
                    NfcAdapter.FLAG_READER_NFC_F or
                    NfcAdapter.FLAG_READER_NFC_V or
                    NfcAdapter.FLAG_READER_NO_PLATFORM_SOUNDS

        adapter.enableReaderMode(this, this, flags, null)
    }

    private fun stopReaderModeLocked() {
        try {
            nfcAdapter?.disableReaderMode(this)
        } catch (_: Exception) {}
        pendingOperation = null
        stagedRecordsData = null
    }

    private fun postSuccess(result: MethodChannel.Result, value: Any?) {
        runOnUiThread {
            result.success(value)
        }
    }

    private fun postError(result: MethodChannel.Result, errorCode: String, errorMessage: String?, errorDetails: Any?) {
        runOnUiThread {
            result.error(errorCode, errorMessage, errorDetails)
        }
    }

    // Runs on NFC reader callback thread (background thread)
    override fun onTagDiscovered(tag: Tag?) {
        if (tag == null) return

        val op: String?
        val currentResult: MethodChannel.Result?
        val stagedRecords: List<Map<String, Any>>?
        val shouldVerify: Boolean

        synchronized(stateLock) {
            op = pendingOperation
            currentResult = pendingResult
            stagedRecords = stagedRecordsData
            shouldVerify = verifyAfterWrite

            if (currentResult == null || op == null) {
                return
            }

            // Mark completed so duplicate discovery doesn't re-trigger.
            // Raw sessions keep reader mode on until endRawSession so the
            // connection stays alive across several commands.
            if (op == "raw") {
                pendingOperation = null
            } else {
                stopReaderModeLocked()
            }
            pendingResult = null
        }

        val result = currentResult ?: return
        nfcExecutor.execute {
            when (op) {
                "scan" -> handleTagRead(tag, result)
                "write" -> handleTagWrite(tag, stagedRecords, shouldVerify, result)
                "lock" -> handleTagLock(tag, result)
                "raw" -> handleRawTag(tag, result)
            }
        }
    }

    private fun handleTagRead(tag: Tag, result: MethodChannel.Result) {
        var ndef: Ndef? = null
        try {
            val idHex = bytesToHex(tag.id)
            // MIFARE Classic carries its size so the app can tell 1K / 4K / Mini.
            val techList = tag.techList.map { tech ->
                val name = tech.substringAfterLast('.')
                if (name == "MifareClassic") {
                    val size = try { MifareClassic.get(tag)?.size } catch (_: Exception) { null }
                    if (size != null) "MifareClassic:$size" else name
                } else name
            }
            ndef = Ndef.get(tag)

            if (ndef == null) {
                // Not standard NDEF formatted
                val map = mapOf(
                    "identifier" to idHex,
                    "standardTechnologies" to techList,
                    "isNdefSupported" to false,
                    "isWritable" to false,
                    "maxByteCapacity" to 0,
                    "currentBytesUsed" to 0,
                    "records" to emptyList<Map<String, Any>>(),
                    "error" to "Etiket NDEF formatında değil veya desteklenmiyor"
                )
                postSuccess(result, map)
                return
            }

            ndef.connect()
            val ndefMessage = ndef.ndefMessage
            val isWritable = ndef.isWritable
            val maxCapacity = ndef.maxSize
            val rawRecords = mutableListOf<Map<String, Any>>()

            var usedBytes = 0
            if (ndefMessage != null) {
                usedBytes = ndefMessage.byteArrayLength
                for (rec in ndefMessage.records) {
                    rawRecords.add(
                        mapOf(
                            "tnf" to rec.tnf.toInt(),
                            "type" to rec.type,
                            "id" to rec.id,
                            "payload" to rec.payload
                        )
                    )
                }
            }
            ndef.close()

            val map = mapOf(
                "identifier" to idHex,
                "standardTechnologies" to techList,
                "isNdefSupported" to true,
                "isWritable" to isWritable,
                "maxByteCapacity" to maxCapacity,
                "currentBytesUsed" to usedBytes,
                "records" to rawRecords,
                "error" to null
            )
            postSuccess(result, map)
        } catch (e: TagLostException) {
            try { ndef?.close() } catch (_: Exception) {}
            postError(result, "TAG_LOST", e.message ?: "", null)
        } catch (e: Exception) {
            try { ndef?.close() } catch (_: Exception) {}
            postError(result, "READ_FAILED", e.message ?: "", null)
        }
    }

    private fun handleTagWrite(
        tag: Tag,
        recordsData: List<Map<String, Any>>?,
        shouldVerify: Boolean,
        result: MethodChannel.Result
    ) {
        if (recordsData == null) {
            postError(result, "NO_DATA", "Yazılacak veri bulunamadı", null)
            return
        }

        var ndef: Ndef? = null
        var formatable: NdefFormatable? = null
        try {
            val ndefRecords = recordsData.map { map ->
                val tnf = (map["tnf"] as? Number)?.toShort() ?: NdefRecord.TNF_WELL_KNOWN
                val type = (map["type"] as? ByteArray) ?: ByteArray(0)
                val id = (map["id"] as? ByteArray) ?: ByteArray(0)
                val payload = (map["payload"] as? ByteArray) ?: ByteArray(0)
                NdefRecord(tnf, type, id, payload)
            }.toTypedArray()

            val ndefMessage = NdefMessage(ndefRecords)
            val expectedBytes = ndefMessage.toByteArray()
            val messageLength = ndefMessage.byteArrayLength

            ndef = Ndef.get(tag)
            if (ndef != null) {
                ndef.connect()
                if (!ndef.isWritable) {
                    try { ndef.close() } catch (_: Exception) {}
                    postError(result, "TAG_READ_ONLY", "Etiket salt okunur (kilitli) ve yazılamaz.", null)
                    return
                }

                if (ndef.maxSize < messageLength) {
                    val max = ndef.maxSize
                    try { ndef.close() } catch (_: Exception) {}
                    postError(
                        result,
                        "CAPACITY_EXCEEDED",
                        "Etiket kapasitesi yetersiz! Gerekli: $messageLength Bayt, Kapasite: $max Bayt",
                        mapOf("required" to messageLength, "capacity" to max)
                    )
                    return
                }

                // Write NDEF message
                ndef.writeNdefMessage(ndefMessage)

                if (shouldVerify) {
                    val verifyMsg = ndef.ndefMessage
                    val actualBytes = verifyMsg?.toByteArray()
                    if (actualBytes == null || !actualBytes.contentEquals(expectedBytes)) {
                        try { ndef.close() } catch (_: Exception) {}
                        postError(
                            result,
                            "VERIFICATION_FAILED",
                            "Doğrulama başarısız: Yazılan baytlar etiketteki baytlarla eşleşmiyor",
                            null
                        )
                        return
                    }
                }
                ndef.close()

                postSuccess(
                    result,
                    mapOf(
                        "isSuccess" to true,
                        "message" to "Etikete başarıyla yazıldı",
                        "bytesWritten" to messageLength,
                        "verificationPassed" to shouldVerify
                    )
                )
            } else {
                // Check if formattable
                formatable = NdefFormatable.get(tag)
                if (formatable != null) {
                    formatable.connect()
                    formatable.format(ndefMessage)
                    formatable.close()

                    var verified = false
                    if (shouldVerify) {
                        // Read back via Ndef to verify formatted tag bytes
                        val formattedNdef = Ndef.get(tag)
                        if (formattedNdef != null) {
                            try {
                                formattedNdef.connect()
                                val verifyMsg = formattedNdef.ndefMessage
                                val actualBytes = verifyMsg?.toByteArray()
                                verified = (actualBytes != null && actualBytes.contentEquals(expectedBytes))
                                formattedNdef.close()
                            } catch (_: Exception) {
                                verified = false
                            }
                        }

                        if (!verified) {
                            postError(
                                result,
                                "VERIFICATION_FAILED",
                                "Doğrulama başarısız: Formatlama sonrası etiket okunamadı veya baytlar eşleşmiyor",
                                null
                            )
                            return
                        }
                    }

                    postSuccess(
                        result,
                        mapOf(
                            "isSuccess" to true,
                            "message" to "Etiket formatlandı ve başarıyla yazıldı",
                            "bytesWritten" to messageLength,
                            "verificationPassed" to verified
                        )
                    )
                } else {
                    postError(result, "TAG_NOT_SUPPORTED", "Etiket NDEF yazmayı desteklemiyor", null)
                }
            }
        } catch (e: Exception) {
            try { ndef?.close() } catch (_: Exception) {}
            try { formatable?.close() } catch (_: Exception) {}
            val code = if (e is TagLostException) "TAG_LOST" else "WRITE_EXCEPTION"
            postError(result, code, e.message ?: "", null)
        }
    }

    private fun handleRawTag(tag: Tag, result: MethodChannel.Result) {
        val nfcA = NfcA.get(tag)
        if (nfcA == null) {
            postError(result, "UNSUPPORTED_TAG", "Bu araç yalnızca NTAG / MIFARE Ultralight etiketlerde çalışır", null)
            return
        }
        try {
            nfcA.connect()
            // Writes to NTAG EEPROM can take longer than the default timeout.
            nfcA.timeout = 1500
            rawNfcA = nfcA
            postSuccess(result, mapOf("identifier" to bytesToHex(tag.id)))
        } catch (e: Exception) {
            try { nfcA.close() } catch (_: Exception) {}
            postError(result, "CONNECT_FAILED", e.message ?: "", null)
        }
    }

    private fun handleTagLock(tag: Tag, result: MethodChannel.Result) {
        val ndef = Ndef.get(tag)
        if (ndef == null) {
            postError(result, "TAG_NOT_SUPPORTED", "Etiket NDEF biçiminde değil; önce bir kayıt yazın", null)
            return
        }
        try {
            ndef.connect()
            if (!ndef.isWritable) {
                postError(result, "ALREADY_LOCKED", "Etiket zaten kilitli (salt okunur)", null)
                return
            }
            if (!ndef.canMakeReadOnly()) {
                postError(result, "LOCK_NOT_SUPPORTED", "Bu etiket türü kilitlemeyi desteklemiyor", null)
                return
            }
            if (!ndef.makeReadOnly()) {
                postError(result, "LOCK_FAILED", null, null)
                return
            }
            postSuccess(
                result,
                mapOf(
                    "isSuccess" to true,
                    "message" to "Etiket kalıcı olarak kilitlendi"
                )
            )
        } catch (e: TagLostException) {
            postError(result, "TAG_LOST", e.message ?: "", null)
        } catch (e: Exception) {
            postError(result, "LOCK_FAILED", e.message ?: "", null)
        } finally {
            try { ndef.close() } catch (_: Exception) {}
        }
    }

    private fun openUri(uri: String): Boolean {
        return try {
            startActivity(Intent(Intent.ACTION_VIEW, android.net.Uri.parse(uri)).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK))
            true
        } catch (_: Exception) {
            false
        }
    }

    private fun bytesToHex(bytes: ByteArray): String {
        val sb = StringBuilder()
        for (b in bytes) {
            sb.append(String.format("%02X:", b))
        }
        return if (sb.isNotEmpty()) sb.substring(0, sb.length - 1) else ""
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        setIntent(intent)
        handleLaunchIntent(intent)
    }

    private fun handleLaunchIntent(intent: Intent?) {
        val data = intent?.data ?: return
        if (data.scheme?.lowercase() != "nfctagmaster") return
        val action = data.host?.lowercase() ?: return
        if (action !in listOf("scan", "write", "tools", "history", "settings")) return
        pendingLaunchAction = action
        launchChannel?.invokeMethod("launchActionAvailable", null)
    }

    override fun onPause() {
        super.onPause()
        // A raw session cannot survive the app leaving the foreground.
        val nfcA = rawNfcA
        rawNfcA = null
        if (nfcA != null) {
            nfcExecutor.execute { try { nfcA.close() } catch (_: Exception) {} }
        }
        synchronized(stateLock) {
            stopReaderModeLocked()
            pendingResult?.let {
                postError(it, "ACTIVITY_PAUSED", "Uygulama arka plana geçtiği için işlem iptal edildi", null)
                pendingResult = null
            }
        }
    }

    override fun onDestroy() {
        super.onDestroy()
        nfcExecutor.shutdown()
    }
}
