import UIKit
import Flutter
import CoreNFC

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate, NFCNDEFReaderSessionDelegate {
    private let CHANNEL = "com.antigravity.nfc_tag_master/nfc"
    private var nfcSession: NFCNDEFReaderSession?
    private var pendingResult: FlutterResult?
    private var pendingOperation: String? // "scan" or "write"
    private var stagedRecordsData: [[String: Any]]?
    private var verifyAfterWrite: Bool = true

    private let lock = NSLock()
    private var isCompleted: Bool = false

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
                if NFCNDEFReaderSession.readingAvailable {
                    result("available")
                } else {
                    result("notSupported")
                }

            case "scanTag":
                guard NFCNDEFReaderSession.readingAvailable else {
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
                guard NFCNDEFReaderSession.readingAvailable else {
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
        let session = NFCNDEFReaderSession(delegate: self, queue: nil, invalidateAfterFirstRead: false)
        session.alertMessage = alertMessage
        self.nfcSession = session
        session.begin()
    }

    // MARK: - NFCNDEFReaderSessionDelegate

    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        // Handled in didDetect tags for comprehensive query & write support
    }

    func readerSession(_ session: NFCNDEFReaderSession, didDetect tags: [NFCNDEFTag]) {
        guard let tag = tags.first else { return }

        session.connect(to: tag) { [weak self] (error: Error?) in
            guard let self = self else { return }

            if let error = error {
                self.finishWithResult(FlutterError(code: "CONNECT_FAILED", message: error.localizedDescription, details: nil))
                session.invalidate(errorMessage: "Bağlantı hatası: \(error.localizedDescription)")
                return
            }

            tag.queryNDEFStatus { (status: NFCNDEFStatus, capacity: Int, error: Error?) in
                if let error = error {
                    self.finishWithResult(FlutterError(code: "QUERY_FAILED", message: error.localizedDescription, details: nil))
                    session.invalidate(errorMessage: "Durum okunamadı: \(error.localizedDescription)")
                    return
                }

                self.lock.lock()
                let op = self.pendingOperation
                self.lock.unlock()

                if op == "scan" {
                    self.handleTagScan(session: session, tag: tag, status: status, capacity: capacity)
                } else if op == "write" {
                    self.handleTagWrite(session: session, tag: tag, status: status, capacity: capacity)
                }
            }
        }
    }

    private func handleTagScan(session: NFCNDEFReaderSession, tag: NFCNDEFTag, status: NFCNDEFStatus, capacity: Int) {
        tag.readNDEF { [weak self] (message: NFCNDEFMessage?, error: Error?) in
            guard let self = self else { return }

            if let error = error {
                self.finishWithResult(FlutterError(code: "READ_FAILED", message: error.localizedDescription, details: nil))
                session.invalidate(errorMessage: "Etiket okunamadı")
                return
            }

            let isWritable = (status == .readWrite)
            var rawRecords: [[String: Any]] = []
            var usedBytes = 0

            if let msg = message {
                usedBytes = msg.length
                for r in msg.records {
                    let typeData = FlutterStandardTypedData(bytes: r.type)
                    let idData = FlutterStandardTypedData(bytes: r.identifier)
                    let payloadData = FlutterStandardTypedData(bytes: r.payload)
                    rawRecords.append([
                        "tnf": Int(r.typeNameFormat.rawValue),
                        "type": typeData,
                        "id": idData,
                        "payload": payloadData
                    ])
                }
            }

            let tagInfo: [String: Any] = [
                "identifier": "iOS-NFC-Tag",
                "standardTechnologies": ["CoreNFC", "NDEF"],
                "isNdefSupported": (status != .notSupported),
                "isWritable": isWritable,
                "maxByteCapacity": capacity,
                "currentBytesUsed": usedBytes,
                "records": rawRecords
            ]

            session.alertMessage = "Etiket başarıyla okundu!"
            self.finishWithResult(tagInfo)
            session.invalidate()
        }
    }

    private func handleTagWrite(session: NFCNDEFReaderSession, tag: NFCNDEFTag, status: NFCNDEFStatus, capacity: Int) {
        guard status == .readWrite else {
            self.finishWithResult(FlutterError(code: "TAG_NOT_WRITABLE", message: "Etiket salt okunur, yazılamaz", details: nil))
            session.invalidate(errorMessage: "Etiket salt okunur veya kilitli!")
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

    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
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
    }
}
