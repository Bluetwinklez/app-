import AppIntents
import Foundation

// Compiled into both the app and the widget extension, so Control Center
// controls and widgets can run these intents; they always run in the app.

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

/// Control Center / Action button: opens the scan history.
@available(iOS 16.0, *)
struct OpenHistoryIntent: AppIntent {
    static let title: LocalizedStringResource = "Scan History"
    static let openAppWhenRun: Bool = true

    @MainActor
    func perform() async throws -> some IntentResult {
        NotificationCenter.default.post(name: .nfcLaunchAction, object: "history")
        return .result()
    }
}
