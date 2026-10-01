package com.antigravity.nfc_tag_master

import android.nfc.NfcAdapter
import android.nfc.Tag
import android.nfc.tech.Ndef
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

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        nfcAdapter = NfcAdapter.getDefaultAdapter(this)

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

            // Mark completed so duplicate discovery doesn't re-trigger
            stopReaderModeLocked()
            pendingResult = null
        }

        val result = currentResult ?: return
        nfcExecutor.execute {
            when (op) {
                "scan" -> handleTagRead(tag, result)
                "write" -> handleTagWrite(tag, stagedRecords, shouldVerify, result)
            }
        }
    }

    private fun handleTagRead(tag: Tag, result: MethodChannel.Result) {
        try {
            val idHex = bytesToHex(tag.id)
            val techList = tag.techList.map { it.substringAfterLast('.') }
            val ndef = Ndef.get(tag)

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
        } catch (e: Exception) {
            postError(result, "READ_FAILED", "Etiket okuma başarısız: ${e.message}", null)
        }
    }

    private fun handleTagWrite(
        tag: Tag,
        recordsData: List<Map<String, Any>>?,
        shouldVerify: Boolean,
        result: MethodChannel.Result
    ) {
        if (recordsData == null) {
            postError(result, "WRITE_ERROR", "Yazılacak veri bulunamadı", null)
            return
        }

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

            val ndef = Ndef.get(tag)
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
                        null
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
                val formatable = NdefFormatable.get(tag)
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
            postError(result, "WRITE_EXCEPTION", "Yazma sırasında hata oluştu: ${e.message}", null)
        }
    }

    private fun bytesToHex(bytes: ByteArray): String {
        val sb = StringBuilder()
        for (b in bytes) {
            sb.append(String.format("%02X:", b))
        }
        return if (sb.isNotEmpty()) sb.substring(0, sb.length - 1) else ""
    }

    override fun onPause() {
        super.onPause()
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
