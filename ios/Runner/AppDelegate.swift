import UIKit
import Flutter
import CoreNFC
import AppIntents
import StoreKit
import LocalAuthentication

extension Notification.Name {
    static let nfcLaunchAction = Notification.Name("NfcTagMasterLaunchAction")
}

/// Siri / Shortcuts: "Scan a tag" opens the app and starts a scan.
@available(iOS 16.0, *)
struct ScanTagIntent: AppIntent {
    static let title: LocalizedStringResource = "Scan Tag"
    static let openAppWhenRun: Bool = true

    @MainActor
    func perform() async throws -> some IntentResult {
        NotificationCenter.default.post(name: .nfcLaunchAction, object: "scan")
        return .result()
    }
}

/// Siri / Shortcuts: opens the write screen.
@available(iOS 16.0, *)
struct WriteTagIntent: AppIntent {
    static let title: LocalizedStringResource = "Write Tag"
    static let openAppWhenRun: Bool = true

    @MainActor
    func perform() async throws -> some IntentResult {
        NotificationCenter.default.post(name: .nfcLaunchAction, object: "write")
        return .result()
    }
}

/// Phrases and titles are English keys; translations live in
/// <lang>.lproj/AppShortcuts.strings and Localizable.strings.
@available(iOS 16.0, *)
struct NfcTagMasterShortcuts: AppShortcutsProvider {
    static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: ScanTagIntent(),
            phrases: [
                "Scan a tag with \(.applicationName)"
            ],
            shortTitle: "Scan Tag",
            systemImageName: "wave.3.right"
        )
        AppShortcut(
            intent: WriteTagIntent(),
            phrases: [
                "Write a tag with \(.applicationName)"
            ],
            shortTitle: "Write Tag",
            systemImageName: "square.and.pencil"
        )
    }
}

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

    // Action requested by a URL (nfctagmaster://scan) or a Siri shortcut,
    // waiting for Flutter to pick it up
    private var launchChannel: FlutterMethodChannel?
    private var privacyCoverEnabled = false
    private var authenticating = false
    private var privacyCover: UIView?
    private var pendingLaunchAction: String?

    // Texts for the system NFC sheet in the app's chosen language, sent by
    // Flutter with each call; the Turkish fallbacks are only used if missing.
    private var ui: [String: String] = [:]

    private func t(_ key: String, _ fallback: String) -> String {
        return ui[key] ?? fallback
    }

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        let nfcChannel = FlutterMethodChannel(name: CHANNEL, binaryMessenger: controller.binaryMessenger)

        nfcChannel.setMethodCallHandler({ [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            guard let self = self else { return }

            if let ui = (call.arguments as? [String: Any])?["ui"] as? [String: String] {
                self.ui = ui
            }

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

        let launchChannel = FlutterMethodChannel(name: "com.antigravity.nfc_tag_master/launch", binaryMessenger: controller.binaryMessenger)
        launchChannel.setMethodCallHandler({ [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            guard let self = self else { return }
            if call.method == "takeLaunchAction" {
                let action = self.pendingLaunchAction
                self.pendingLaunchAction = nil
                result(action)
            } else if call.method == "requestReview" {
                // Apple decides whether the prompt is shown (never in TestFlight).
                if let scene = UIApplication.shared.connectedScenes
                    .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
                    SKStoreReviewController.requestReview(in: scene)
                    result(true)
                } else {
                    result(false)
                }
            } else if call.method == "canAuthenticate" {
                var error: NSError?
                result(LAContext().canEvaluatePolicy(.deviceOwnerAuthentication, error: &error))
            } else if call.method == "authenticate" {
                let reason = (call.arguments as? [String: Any])?["reason"] as? String ?? "Unlock"
                let context = LAContext()
                var error: NSError?
                guard context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) else {
                    result(nil)
                    return
                }
                self.authenticating = true
                context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { ok, _ in
                    DispatchQueue.main.async {
                        self.authenticating = false
                        result(ok)
                    }
                }
            } else if call.method == "setAppIcon" {
                guard UIApplication.shared.supportsAlternateIcons else {
                    result(false)
                    return
                }
                let name = (call.arguments as? [String: Any])?["name"] as? String
                UIApplication.shared.setAlternateIconName(name) { error in
                    DispatchQueue.main.async { result(error == nil) }
                }
            } else if call.method == "currentAppIcon" {
                result(UIApplication.shared.alternateIconName)
            } else if call.method == "setPrivacyCover" {
                self.privacyCoverEnabled = (call.arguments as? [String: Any])?["enabled"] as? Bool ?? false
                if !self.privacyCoverEnabled { self.removePrivacyCover() }
                result(true)
            } else if call.method == "openUrl" {
                guard let text = (call.arguments as? [String: Any])?["url"] as? String,
                      let url = URL(string: text) else {
                    result(false)
                    return
                }
                UIApplication.shared.open(url, options: [:]) { ok in result(ok) }
            } else {
                result(FlutterMethodNotImplemented)
            }
        })
        self.launchChannel = launchChannel

        NotificationCenter.default.addObserver(forName: .nfcLaunchAction, object: nil, queue: .main) { [weak self] note in
            if let action = note.object as? String {
                self?.queueLaunchAction(action)
            }
        }

        NotificationCenter.default.addObserver(forName: UIApplication.willResignActiveNotification, object: nil, queue: .main) { [weak self] _ in
            self?.showPrivacyCover()
        }
        NotificationCenter.default.addObserver(forName: UIApplication.didEnterBackgroundNotification, object: nil, queue: .main) { [weak self] _ in
            self?.showPrivacyCover(force: true)
        }
        NotificationCenter.default.addObserver(forName: UIApplication.didBecomeActiveNotification, object: nil, queue: .main) { [weak self] _ in
            self?.removePrivacyCover()
        }

        if let url = launchOptions?[.url] as? URL {
            handleLaunchUrl(url)
        }

        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    override func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey: Any] = [:]
    ) -> Bool {
        if handleLaunchUrl(url) {
            return true
        }
        return super.application(app, open: url, options: options)
    }

    @discardableResult
    private func handleLaunchUrl(_ url: URL) -> Bool {
        guard url.scheme?.lowercased() == "nfctagmaster" else { return false }
        let action = (url.host ?? "").lowercased()
        guard ["scan", "write", "tools", "history", "settings"].contains(action) else { return false }
        queueLaunchAction(action)
        return true
    }

    /// Blurs the app in the app switcher. The NFC sheet and Face ID prompt also
    /// make the app inactive, so those only cover once it really backgrounds.
    private func showPrivacyCover(force: Bool = false) {
        guard privacyCoverEnabled, privacyCover == nil else { return }
        if !force && (nfcSession != nil || authenticating) { return }
        let window = self.window ?? UIApplication.shared.connectedScenes
            .compactMap { ($0 as? UIWindowScene)?.windows.first(where: { $0.isKeyWindow }) }.first
        guard let window = window else { return }
        let cover = UIVisualEffectView(effect: UIBlurEffect(style: .systemMaterial))
        cover.frame = window.bounds
        cover.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        window.addSubview(cover)
        privacyCover = cover
    }

    private func removePrivacyCover() {
        privacyCover?.removeFromSuperview()
        privacyCover = nil
    }

    private func queueLaunchAction(_ action: String) {
        pendingLaunchAction = action
        launchChannel?.invokeMethod("launchActionAvailable", arguments: nil)
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
            session.alertMessage = self.t("multipleTags", "Birden fazla etiket algılandı. Yalnızca bir etiket yaklaştırın.")
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
        let family: String
        switch tag {
        case .miFare(let value):
            ndefTag = value
            tagIdentifier = value.identifier
            switch value.mifareFamily {
            case .ultralight: family = "MifareUltralight"
            case .desfire: family = "MifareDesfire"
            case .plus: family = "MifarePlus"
            default: family = "NfcA"
            }
        case .iso15693(let value):
            ndefTag = value
            tagIdentifier = value.identifier
            family = "NfcV"
        case .iso7816(let value):
            ndefTag = value
            tagIdentifier = value.identifier
            family = "IsoDep"
        case .feliCa(let value):
            ndefTag = value
            tagIdentifier = value.currentIDm
            family = "NfcF"
        @unknown default:
            finishWithResult(FlutterError(code: "UNSUPPORTED_TAG", message: "Bu NFC etiket türü desteklenmiyor", details: nil))
            session.invalidate(errorMessage: self.t("unsupportedTag", "Etiket türü desteklenmiyor"))
            return
        }

        session.connect(to: tag) { [weak self] (error: Error?) in
            guard let self = self else { return }

            if let error = error {
                self.finishWithResult(FlutterError(code: "CONNECT_FAILED", message: error.localizedDescription, details: nil))
                session.invalidate(errorMessage: self.t("connectFailed", "Bağlantı hatası"))
                return
            }

            ndefTag.queryNDEFStatus { (status: NFCNDEFStatus, capacity: Int, error: Error?) in
                if let error = error {
                    self.finishWithResult(FlutterError(code: "QUERY_FAILED", message: error.localizedDescription, details: nil))
                    session.invalidate(errorMessage: self.t("readFailed", "Etiket okunamadı"))
                    return
                }

                self.lock.lock()
                let op = self.pendingOperation
                self.lock.unlock()

                if op == "scan" {
                    self.handleTagScan(session: session, tag: ndefTag, identifier: tagIdentifier, status: status, capacity: capacity, family: family)
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
            let message = self.t("ntagOnly", "Bu araç yalnızca NTAG / MIFARE Ultralight etiketlerde çalışır")
            finishWithResult(FlutterError(code: "UNSUPPORTED_TAG", message: message, details: nil))
            session.invalidate(errorMessage: message)
            return
        }
        session.connect(to: tag) { [weak self] (error: Error?) in
            guard let self = self else { return }
            if let error = error {
                self.finishWithResult(FlutterError(code: "CONNECT_FAILED", message: error.localizedDescription, details: nil))
                session.invalidate(errorMessage: self.t("connectFailed", "Bağlantı hatası"))
                return
            }
            self.lock.lock()
            self.rawTag = mifare
            self.lock.unlock()
            session.alertMessage = self.t("connected", "Etiket bağlandı, işlem yapılıyor...")
            self.finishWithResult([
                "identifier": mifare.identifier.map { String(format: "%02X", $0) }.joined(separator: ":")
            ] as [String: Any])
        }
    }

    private func handleTagScan(session: NFCTagReaderSession, tag: NFCNDEFTag, identifier: Data, status: NFCNDEFStatus, capacity: Int, family: String) {
        if status == .notSupported {
            finishWithResult(tagInfo(identifier: identifier, status: status, capacity: capacity, message: nil, family: family))
            session.alertMessage = self.t("notNdefRead", "Etiket algılandı; NDEF biçiminde değil.")
            session.invalidate()
            return
        }

        tag.readNDEF { [weak self] (message: NFCNDEFMessage?, error: Error?) in
            guard let self = self else { return }

            if let error = error {
                if let nfcError = error as? NFCReaderError,
                   nfcError.code == .ndefReaderSessionErrorZeroLengthMessage {
                    session.alertMessage = self.t("emptyRead", "Boş etiket başarıyla okundu!")
                    self.finishWithResult(self.tagInfo(identifier: identifier, status: status, capacity: capacity, message: nil, family: family))
                    session.invalidate()
                    return
                }
                self.finishWithResult(FlutterError(code: "READ_FAILED", message: error.localizedDescription, details: nil))
                session.invalidate(errorMessage: self.t("readFailed", "Etiket okunamadı"))
                return
            }

            session.alertMessage = self.t("readOk", "Etiket başarıyla okundu!")
            self.finishWithResult(self.tagInfo(identifier: identifier, status: status, capacity: capacity, message: message, family: family))
            session.invalidate()
        }
    }

    private func tagInfo(identifier: Data, status: NFCNDEFStatus, capacity: Int, message: NFCNDEFMessage?, family: String) -> [String: Any] {
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
                "standardTechnologies": status == .notSupported ? [family] : [family, "Ndef"],
                "isNdefSupported": (status != .notSupported),
                "isWritable": (status == .readWrite),
                "maxByteCapacity": capacity,
                "currentBytesUsed": message?.length ?? 0,
                "records": rawRecords
        ]
    }

    private func handleTagWrite(session: NFCTagReaderSession, tag: NFCNDEFTag, status: NFCNDEFStatus, capacity: Int) {
        guard status == .readWrite else {
            let message = status == .notSupported ? self.t("notNdefWrite", "Etiket NDEF biçiminde değil; iPhone bu etikete NDEF yazamıyor") : self.t("readOnly", "Etiket salt okunur, yazılamaz")
            let code = status == .notSupported ? "NOT_NDEF_FORMATTED" : "TAG_NOT_WRITABLE"
            self.finishWithResult(FlutterError(code: code, message: message, details: nil))
            session.invalidate(errorMessage: message)
            return
        }

        self.lock.lock()
        let recordsData = self.stagedRecordsData
        let shouldVerify = self.verifyAfterWrite
        self.lock.unlock()

        guard let recordsData = recordsData else {
            self.finishWithResult(FlutterError(code: "NO_DATA", message: "Yazılacak NDEF verisi yok", details: nil))
            session.invalidate(errorMessage: self.t("noData", "Yazılacak veri bulunamadı"))
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
            self.finishWithResult(FlutterError(code: "CAPACITY_EXCEEDED", message: "Etiket boyutu yetersiz (\(totalSize) > \(capacity))", details: ["required": totalSize, "capacity": capacity]))
            session.invalidate(errorMessage: self.t("capacity", "Kapasite yetersiz! Gerekli: {required} B, Maks: {max} B")
                .replacingOccurrences(of: "{required}", with: "\(totalSize)")
                .replacingOccurrences(of: "{max}", with: "\(capacity)"))
            return
        }

        tag.writeNDEF(messageToWrite) { [weak self] (error: Error?) in
            guard let self = self else { return }

            if let error = error {
                self.finishWithResult(FlutterError(code: "WRITE_ERROR", message: error.localizedDescription, details: nil))
                session.invalidate(errorMessage: self.t("writeFailed", "Yazma başarısız"))
                return
            }

            if shouldVerify {
                // Read back to verify complete TNF, type, id, and payload bytes
                tag.readNDEF { [weak self] (readMsg: NFCNDEFMessage?, readErr: Error?) in
                    guard let self = self else { return }

                    if let readErr = readErr {
                        self.finishWithResult(FlutterError(code: "VERIFICATION_FAILED", message: "Yazma sonrası etiket okunamadı: \(readErr.localizedDescription)", details: nil))
                        session.invalidate(errorMessage: self.t("verifyFailed", "Doğrulama başarısız"))
                        return
                    }

                    guard let readMsg = readMsg, self.recordsMatch(expected: ndefRecords, actual: readMsg.records) else {
                        self.finishWithResult(FlutterError(code: "VERIFICATION_FAILED", message: "Doğrulama başarısız: Yazılan veri etiketteki veriyle eşleşmiyor", details: nil))
                        session.invalidate(errorMessage: self.t("verifyFailed", "Doğrulama başarısız"))
                        return
                    }

                    session.alertMessage = self.t("writeVerified", "Yazma ve doğrulama başarılı!")
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
                session.alertMessage = self.t("written", "Etikete yazıldı!")
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
            let message = self.t("alreadyLocked", "Etiket zaten kilitli (salt okunur)")
            finishWithResult(FlutterError(code: "ALREADY_LOCKED", message: message, details: nil))
            session.invalidate(errorMessage: message)
            return
        }
        guard status == .readWrite else {
            let message = self.t("lockNotNdef", "Etiket NDEF biçiminde değil; önce bir kayıt yazın")
            finishWithResult(FlutterError(code: "TAG_NOT_WRITABLE", message: message, details: nil))
            session.invalidate(errorMessage: message)
            return
        }

        tag.writeLock { [weak self] (error: Error?) in
            guard let self = self else { return }
            if let error = error {
                self.finishWithResult(FlutterError(code: "LOCK_FAILED", message: error.localizedDescription, details: nil))
                session.invalidate(errorMessage: self.t("lockFailed", "Kilitleme başarısız"))
                return
            }
            session.alertMessage = self.t("locked", "Etiket kalıcı olarak kilitlendi!")
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
            } else if let nfcErr = error as? NFCReaderError, nfcErr.code == .readerSessionInvalidationErrorSessionTimeout {
                finishWithResult(FlutterError(code: "SESSION_TIMEOUT", message: error.localizedDescription, details: nil))
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
