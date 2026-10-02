import UIKit
import Flutter
import CoreNFC

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate, NFCTagReaderSessionDelegate {
    private let CHANNEL = "com.antigravity.nfc_tag_master/nfc"
    private var nfcSession: NFCTagReaderSession?
    private var pendingResult: FlutterResult?
    private var pendingOperation: String? // "scan" or "write"
    private var stagedRecordsData: [[String: Any]]?
    private var verifyAfterWrite: Bool = true

    private let lock = NSLock()
    private var isCompleted: Bool = false

    // Raw command session (NTAG / MIFARE Ultralight tools)
    private var rawTag: NFCMiFareTag?

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        let nfcChannel = FlutterMethodChannel(name: CHANNEL, binaryMessenger: controller.binaryMessenger)

        nfcChannel.setMethodCallHandler({ [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            guard let self = self else { return }

            switch call.method {
            case "checkAvailability":
                if NFCTagReaderSession.readingAvailable {
                    result("available")
                } else {
                    result("notSupported")
                }

            case "scanTag":
                guard NFCTagReaderSession.readingAvailable else {
                    result(FlutterError(code: "NFC_UNAVAILABLE", message: "Bu iOS cihazında NFC okuyucu desteklenmiyor", details: nil))
                    return
                }

                self.lock.lock()
                if self.pendingResult != nil {
                    self.lock.unlock()
                    result(FlutterError(code: "OPERATION_IN_PROGRESS", message: "Zaten devam eden bir NFC işlemi var", details: nil))
                    return
                }
                self.isCompleted = false
                self.pendingResult = result
                self.pendingOperation = "scan"
                self.lock.unlock()

                let prompt = (call.arguments as? [String: Any])?["promptMessage"] as? String ?? "Etiketi iPhone'un üst kısmına yaklaştırın"
                self.startSession(alertMessage: prompt)

            case "writeTag":
                guard NFCTagReaderSession.readingAvailable else {
                    result(FlutterError(code: "NFC_UNAVAILABLE", message: "Bu iOS cihazında NFC okuyucu desteklenmiyor", details: nil))
                    return
                }
                guard let args = call.arguments as? [String: Any],
                      let records = args["records"] as? [[String: Any]] else {
                    result(FlutterError(code: "INVALID_ARGS", message: "Geçersiz yazma parametreleri", details: nil))
                    return
                }
                let prompt = args["promptMessage"] as? String ?? "Yazmak istediğiniz NFC etiketini yaklaştırın"
                let verify = args["verifyReadAfterWrite"] as? Bool ?? true

                self.lock.lock()
                if self.pendingResult != nil {
                    self.lock.unlock()
                    result(FlutterError(code: "OPERATION_IN_PROGRESS", message: "Zaten devam eden bir NFC işlemi var", details: nil))
                    return
                }
                self.isCompleted = false
                self.pendingResult = result
                self.pendingOperation = "write"
                self.stagedRecordsData = records
                self.verifyAfterWrite = verify
                self.lock.unlock()

                self.startSession(alertMessage: prompt)

            case "lockTag":
                guard NFCTagReaderSession.readingAvailable else {
                    result(FlutterError(code: "NFC_UNAVAILABLE", message: "Bu iOS cihazında NFC okuyucu desteklenmiyor", details: nil))
                    return
                }
                let prompt = (call.arguments as? [String: Any])?["promptMessage"] as? String ?? "Kilitlemek istediğiniz etiketi yaklaştırın"

                self.lock.lock()
                if self.pendingResult != nil {
                    self.lock.unlock()
                    result(FlutterError(code: "OPERATION_IN_PROGRESS", message: "Zaten devam eden bir NFC işlemi var", details: nil))
                    return
                }
                self.isCompleted = false
                self.pendingResult = result
                self.pendingOperation = "lock"
                self.lock.unlock()

                self.startSession(alertMessage: prompt)

            case "startRawSession":
                guard NFCTagReaderSession.readingAvailable else {
                    result(FlutterError(code: "NFC_UNAVAILABLE", message: "Bu iOS cihazında NFC okuyucu desteklenmiyor", details: nil))
                    return
                }
                let prompt = (call.arguments as? [String: Any])?["promptMessage"] as? String ?? "Etiketi iPhone'un üst kısmına yaklaştırın"

                self.lock.lock()
                if self.pendingResult != nil || self.rawTag != nil {
                    self.lock.unlock()
                    result(FlutterError(code: "OPERATION_IN_PROGRESS", message: "Zaten devam eden bir NFC işlemi var", details: nil))
                    return
                }
                self.isCompleted = false
                self.pendingResult = result
                self.pendingOperation = "raw"
                self.lock.unlock()

                self.startSession(alertMessage: prompt)

            case "transceive":
                guard let args = call.arguments as? [String: Any],
                      let command = (args["command"] as? FlutterStandardTypedData)?.data,
                      !command.isEmpty else {
                    result(FlutterError(code: "INVALID_ARGS", message: "Geçersiz komut", details: nil))
                    return
                }
                self.lock.lock()
                let tag = self.rawTag
                self.lock.unlock()
                guard let rawTag = tag else {
                    result(FlutterError(code: "NO_SESSION", message: "Etiket bağlantısı yok veya kesildi", details: nil))
                    return
                }
                rawTag.sendMiFareCommand(commandPacket: command) { (response: Data, error: Error?) in
                    DispatchQueue.main.async {
                        if let error = error {
                            result(FlutterError(code: "TRANSCEIVE_FAILED", message: error.localizedDescription, details: nil))
                        } else {
                            result(FlutterStandardTypedData(bytes: response))
                        }
                    }
                }

            case "endRawSession":
                let args = call.arguments as? [String: Any]
                let errorMessage = args?["errorMessage"] as? String
                let successMessage = args?["successMessage"] as? String
                self.lock.lock()
                let activeSession = self.nfcSession
                self.rawTag = nil
                self.lock.unlock()
                if let activeSession = activeSession {
                    if let errorMessage = errorMessage {
                        activeSession.invalidate(errorMessage: errorMessage)
                    } else {
                        if let successMessage = successMessage {
                            activeSession.alertMessage = successMessage
                        }
                        activeSession.invalidate()
                    }
                }
                result(nil)

            case "cancelSession":
                self.lock.lock()
                let activeSession = self.nfcSession
                self.nfcSession = nil
                self.lock.unlock()
                self.finishWithResult(FlutterError(code: "SESSION_CANCELLED", message: "İşlem iptal edildi", details: nil))
                activeSession?.invalidate()
                result(nil)

            default:
                result(FlutterMethodNotImplemented)
            }
        })

        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    private func startSession(alertMessage: String) {
        guard let session = NFCTagReaderSession(pollingOption: [.iso14443, .iso15693], delegate: self, queue: nil) else {
            finishWithResult(FlutterError(code: "NFC_UNAVAILABLE", message: "NFC taraması başlatılamadı", details: nil))
            return
        }
        session.alertMessage = alertMessage
        self.nfcSession = session
        session.begin()
    }

    // MARK: - NFCTagReaderSessionDelegate

    func tagReaderSessionDidBecomeActive(_ session: NFCTagReaderSession) {}

    func tagReaderSession(_ session: NFCTagReaderSession, didDetect tags: [NFCTag]) {
        guard tags.count == 1, let tag = tags.first else {
            session.alertMessage = "Birden fazla etiket algılandı. Yalnızca bir etiket yaklaştırın."
            session.restartPolling()
            return
        }

        self.lock.lock()
        let currentOp = self.pendingOperation
        self.lock.unlock()
        if currentOp == "raw" {
            handleRawTag(session: session, tag: tag)
            return
        }

        let ndefTag: NFCNDEFTag
        let tagIdentifier: Data
        switch tag {
        case .miFare(let value):
            ndefTag = value
            tagIdentifier = value.identifier
        case .iso15693(let value):
            ndefTag = value
            tagIdentifier = value.identifier
        case .iso7816(let value):
            ndefTag = value
            tagIdentifier = value.identifier
        case .feliCa(let value):
            ndefTag = value
            tagIdentifier = value.currentIDm
        @unknown default:
            finishWithResult(FlutterError(code: "UNSUPPORTED_TAG", message: "Bu NFC etiket türü desteklenmiyor", details: nil))
            session.invalidate(errorMessage: "Etiket türü desteklenmiyor")
            return
        }

        session.connect(to: tag) { [weak self] (error: Error?) in
            guard let self = self else { return }

            if let error = error {
                self.finishWithResult(FlutterError(code: "CONNECT_FAILED", message: error.localizedDescription, details: nil))
                session.invalidate(errorMessage: "Bağlantı hatası: \(error.localizedDescription)")
                return
            }

            ndefTag.queryNDEFStatus { (status: NFCNDEFStatus, capacity: Int, error: Error?) in
                if let error = error {
                    self.finishWithResult(FlutterError(code: "QUERY_FAILED", message: error.localizedDescription, details: nil))
                    session.invalidate(errorMessage: "Durum okunamadı: \(error.localizedDescription)")
                    return
                }

                self.lock.lock()
                let op = self.pendingOperation
                self.lock.unlock()

                if op == "scan" {
                    self.handleTagScan(session: session, tag: ndefTag, identifier: tagIdentifier, status: status, capacity: capacity)
                } else if op == "write" {
                    self.handleTagWrite(session: session, tag: ndefTag, status: status, capacity: capacity)
                } else if op == "lock" {
                    self.handleTagLock(session: session, tag: ndefTag, status: status)
                }
            }
        }
    }

    private func handleRawTag(session: NFCTagReaderSession, tag: NFCTag) {
        guard case .miFare(let mifare) = tag, mifare.mifareFamily == .ultralight else {
            let message = "Bu araç yalnızca NTAG / MIFARE Ultralight etiketlerde çalışır"
            finishWithResult(FlutterError(code: "UNSUPPORTED_TAG", message: message, details: nil))
            session.invalidate(errorMessage: message)
            return
        }
        session.connect(to: tag) { [weak self] (error: Error?) in
            guard let self = self else { return }
            if let error = error {
                self.finishWithResult(FlutterError(code: "CONNECT_FAILED", message: error.localizedDescription, details: nil))
                session.invalidate(errorMessage: "Bağlantı hatası: \(error.localizedDescription)")
                return
            }
            self.lock.lock()
            self.rawTag = mifare
            self.lock.unlock()
            session.alertMessage = "Etiket bağlandı, işlem yapılıyor..."
            self.finishWithResult([
                "identifier": mifare.identifier.map { String(format: "%02X", $0) }.joined(separator: ":")
            ] as [String: Any])
        }
    }

    private func handleTagScan(session: NFCTagReaderSession, tag: NFCNDEFTag, identifier: Data, status: NFCNDEFStatus, capacity: Int) {
        if status == .notSupported {
            finishWithResult(tagInfo(identifier: identifier, status: status, capacity: capacity, message: nil))
            session.alertMessage = "Etiket algılandı; NDEF biçiminde değil."
            session.invalidate()
            return
        }

        tag.readNDEF { [weak self] (message: NFCNDEFMessage?, error: Error?) in
            guard let self = self else { return }

            if let error = error {
                if let nfcError = error as? NFCReaderError,
                   nfcError.code == .ndefReaderSessionErrorZeroLengthMessage {
                    session.alertMessage = "Boş etiket başarıyla okundu!"
                    self.finishWithResult(self.tagInfo(identifier: identifier, status: status, capacity: capacity, message: nil))
                    session.invalidate()
                    return
                }
                self.finishWithResult(FlutterError(code: "READ_FAILED", message: error.localizedDescription, details: nil))
                session.invalidate(errorMessage: "Etiket okunamadı: \(error.localizedDescription)")
                return
            }

            session.alertMessage = "Etiket başarıyla okundu!"
            self.finishWithResult(self.tagInfo(identifier: identifier, status: status, capacity: capacity, message: message))
            session.invalidate()
        }
    }

    private func tagInfo(identifier: Data, status: NFCNDEFStatus, capacity: Int, message: NFCNDEFMessage?) -> [String: Any] {
        let rawRecords: [[String: Any]] = message?.records.map { record in
            [
                "tnf": Int(record.typeNameFormat.rawValue),
                "type": FlutterStandardTypedData(bytes: record.type),
                "id": FlutterStandardTypedData(bytes: record.identifier),
                "payload": FlutterStandardTypedData(bytes: record.payload)
            ]
        } ?? []
        return [
                "identifier": identifier.isEmpty ? "iOS-NFC-Tag" : identifier.map { String(format: "%02X", $0) }.joined(separator: ":"),
                "standardTechnologies": status == .notSupported ? ["CoreNFC"] : ["CoreNFC", "NDEF"],
                "isNdefSupported": (status != .notSupported),
                "isWritable": (status == .readWrite),
                "maxByteCapacity": capacity,
                "currentBytesUsed": message?.length ?? 0,
                "records": rawRecords
        ]
    }

    private func handleTagWrite(session: NFCTagReaderSession, tag: NFCNDEFTag, status: NFCNDEFStatus, capacity: Int) {
        guard status == .readWrite else {
            let message = status == .notSupported ? "Etiket NDEF biçiminde değil; iPhone bu etikete NDEF yazamıyor" : "Etiket salt okunur, yazılamaz"
            self.finishWithResult(FlutterError(code: "TAG_NOT_WRITABLE", message: message, details: nil))
            session.invalidate(errorMessage: message)
            return
        }

        self.lock.lock()
        let recordsData = self.stagedRecordsData
        let shouldVerify = self.verifyAfterWrite
        self.lock.unlock()

        guard let recordsData = recordsData else {
            self.finishWithResult(FlutterError(code: "NO_DATA", message: "Yazılacak NDEF verisi yok", details: nil))
            session.invalidate(errorMessage: "Yazılacak veri bulunamadı")
            return
        }

        var ndefRecords: [NFCNDEFPayload] = []
        for rMap in recordsData {
            let tnfRaw = UInt8((rMap["tnf"] as? Int) ?? 1)
            let tnf = NFCTypeNameFormat(rawValue: tnfRaw) ?? .nfcWellKnown
            let type = (rMap["type"] as? FlutterStandardTypedData)?.data ?? Data()
            let id = (rMap["id"] as? FlutterStandardTypedData)?.data ?? Data()
            let payload = (rMap["payload"] as? FlutterStandardTypedData)?.data ?? Data()

            let payloadObj = NFCNDEFPayload(format: tnf, type: type, identifier: id, payload: payload)
            ndefRecords.append(payloadObj)
        }

        let messageToWrite = NFCNDEFMessage(records: ndefRecords)
        let totalSize = messageToWrite.length

        if totalSize > capacity {
            self.finishWithResult(FlutterError(code: "CAPACITY_EXCEEDED", message: "Etiket boyutu yetersiz (\(totalSize) > \(capacity))", details: nil))
            session.invalidate(errorMessage: "Kapasite yetersiz! Gerekli: \(totalSize)B, Maks: \(capacity)B")
            return
        }

        tag.writeNDEF(messageToWrite) { [weak self] (error: Error?) in
            guard let self = self else { return }

            if let error = error {
                self.finishWithResult(FlutterError(code: "WRITE_ERROR", message: error.localizedDescription, details: nil))
                session.invalidate(errorMessage: "Yazma başarısız: \(error.localizedDescription)")
                return
            }

            if shouldVerify {
                // Read back to verify complete TNF, type, id, and payload bytes
                tag.readNDEF { [weak self] (readMsg: NFCNDEFMessage?, readErr: Error?) in
                    guard let self = self else { return }

                    if let readErr = readErr {
                        self.finishWithResult(FlutterError(code: "VERIFICATION_FAILED", message: "Yazma sonrası etiket okunamadı: \(readErr.localizedDescription)", details: nil))
                        session.invalidate(errorMessage: "Doğrulama okuması başarısız: \(readErr.localizedDescription)")
                        return
                    }

                    guard let readMsg = readMsg, self.recordsMatch(expected: ndefRecords, actual: readMsg.records) else {
                        self.finishWithResult(FlutterError(code: "VERIFICATION_FAILED", message: "Doğrulama başarısız: Yazılan veri etiketteki veriyle eşleşmiyor", details: nil))
                        session.invalidate(errorMessage: "Doğrulama başarısız: Etiket içeriği uyuşmuyor")
                        return
                    }

                    session.alertMessage = "Yazma ve doğrulama başarılı!"
                    let res: [String: Any] = [
                        "isSuccess": true,
                        "message": "Etikete başarıyla yazıldı",
                        "bytesWritten": totalSize,
                        "verificationPassed": true
                    ]
                    self.finishWithResult(res)
                    session.invalidate()
                }
            } else {
                session.alertMessage = "Etikete yazıldı!"
                let res: [String: Any] = [
                    "isSuccess": true,
                    "message": "Etikete başarıyla yazıldı",
                    "bytesWritten": totalSize,
                    "verificationPassed": false
                ]
                self.finishWithResult(res)
                session.invalidate()
            }
        }
    }

    private func handleTagLock(session: NFCTagReaderSession, tag: NFCNDEFTag, status: NFCNDEFStatus) {
        if status == .readOnly {
            let message = "Etiket zaten kilitli (salt okunur)"
            finishWithResult(FlutterError(code: "ALREADY_LOCKED", message: message, details: nil))
            session.invalidate(errorMessage: message)
            return
        }
        guard status == .readWrite else {
            let message = "Etiket NDEF biçiminde değil; önce bir kayıt yazın"
            finishWithResult(FlutterError(code: "TAG_NOT_WRITABLE", message: message, details: nil))
            session.invalidate(errorMessage: message)
            return
        }

        tag.writeLock { [weak self] (error: Error?) in
            guard let self = self else { return }
            if let error = error {
                self.finishWithResult(FlutterError(code: "LOCK_FAILED", message: error.localizedDescription, details: nil))
                session.invalidate(errorMessage: "Kilitleme başarısız: \(error.localizedDescription)")
                return
            }
            session.alertMessage = "Etiket kalıcı olarak kilitlendi!"
            self.finishWithResult([
                "isSuccess": true,
                "message": "Etiket kalıcı olarak kilitlendi"
            ] as [String: Any])
            session.invalidate()
        }
    }

    private func recordsMatch(expected: [NFCNDEFPayload], actual: [NFCNDEFPayload]) -> Bool {
        if expected.count != actual.count {
            return false
        }
        for (exp, act) in zip(expected, actual) {
            if exp.typeNameFormat != act.typeNameFormat {
                return false
            }
            if exp.type != act.type {
                return false
            }
            if exp.identifier != act.identifier {
                return false
            }
            if exp.payload != act.payload {
                return false
            }
        }
        return true
    }

    private func finishWithResult(_ val: Any) {
        var callback: FlutterResult?
        lock.lock()
        if !isCompleted {
            isCompleted = true
            callback = pendingResult
            pendingResult = nil
            pendingOperation = nil
            stagedRecordsData = nil
        }
        lock.unlock()

        if let callback = callback {
            DispatchQueue.main.async {
                callback(val)
            }
        }
    }

    func tagReaderSession(_ session: NFCTagReaderSession, didInvalidateWithError error: Error) {
        lock.lock()
        let completed = isCompleted
        lock.unlock()

        if !completed {
            if let nfcErr = error as? NFCReaderError, nfcErr.code == .readerSessionInvalidationErrorUserCanceled {
                finishWithResult(FlutterError(code: "USER_CANCELLED", message: "Kullanıcı taramayı iptal etti", details: nil))
            } else {
                finishWithResult(FlutterError(code: "SESSION_ERROR", message: error.localizedDescription, details: nil))
            }
        }
        self.nfcSession = nil
        lock.lock()
        rawTag = nil
        lock.unlock()
    }
}
