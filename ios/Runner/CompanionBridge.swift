import Flutter
import Foundation
import WatchConnectivity

/// iCloud backup (key-value store) and the Apple Watch link, reached through
/// the launch channel.
final class CompanionBridge: NSObject, WCSessionDelegate {
    private static let backupKey = "backup.v1"
    private static let backupDateKey = "backup.v1.at"
    private static let watchQueueKey = "watch.pendingEvents"
    /// The key-value store holds 1 MB in total; leave room for the date.
    private static let maxBackupBytes = 1_000_000 - 4_096

    private let channel: FlutterMethodChannel
    private var latestWatchContext: [String: Any] = [:]

    init(channel: FlutterMethodChannel) {
        self.channel = channel
        super.init()
        if WCSession.isSupported() {
            WCSession.default.delegate = self
            WCSession.default.activate()
        }
        NotificationCenter.default.addObserver(
            forName: NSUbiquitousKeyValueStore.didChangeExternallyNotification,
            object: NSUbiquitousKeyValueStore.default, queue: .main
        ) { [weak self] _ in
            self?.channel.invokeMethod("iCloudBackupChanged", arguments: nil)
        }
        NSUbiquitousKeyValueStore.default.synchronize()
    }

    /// Returns false when [call] is not one of ours.
    func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) -> Bool {
        let args = call.arguments as? [String: Any]
        switch call.method {
        case "iCloudSupported":
            // Set by the release build when the profile carries iCloud.
            result(Bundle.main.object(forInfoDictionaryKey: "NfcICloudBackup") as? Bool == true)
        case "iCloudAvailable":
            result(FileManager.default.ubiquityIdentityToken != nil)
        case "iCloudSave":
            guard let typed = args?["data"] as? FlutterStandardTypedData else {
                result(FlutterError(code: "BAD_ARGS", message: nil, details: nil))
                return true
            }
            guard typed.data.count <= Self.maxBackupBytes else {
                result(FlutterError(code: "TOO_LARGE", message: nil, details: nil))
                return true
            }
            guard FileManager.default.ubiquityIdentityToken != nil else {
                result(FlutterError(code: "NO_ACCOUNT", message: nil, details: nil))
                return true
            }
            let store = NSUbiquitousKeyValueStore.default
            store.set(typed.data, forKey: Self.backupKey)
            store.set(Date().timeIntervalSince1970, forKey: Self.backupDateKey)
            result(store.synchronize())
        case "iCloudLoad":
            let store = NSUbiquitousKeyValueStore.default
            store.synchronize()
            guard let data = store.data(forKey: Self.backupKey) else {
                result(nil)
                return true
            }
            result([
                "data": FlutterStandardTypedData(bytes: data),
                "savedAt": store.double(forKey: Self.backupDateKey),
            ])
        case "updateWatch":
            latestWatchContext = args ?? [:]
            pushWatchContext()
            result(WCSession.isSupported() && WCSession.default.isPaired)
        case "takeWatchEvents":
            let defaults = UserDefaults.standard
            let events = defaults.array(forKey: Self.watchQueueKey) ?? []
            defaults.removeObject(forKey: Self.watchQueueKey)
            result(events)
        default:
            return false
        }
        return true
    }

    private func pushWatchContext() {
        guard WCSession.isSupported(),
              WCSession.default.activationState == .activated,
              WCSession.default.isPaired,
              WCSession.default.isWatchAppInstalled else { return }
        var context = latestWatchContext
        context["sentAt"] = Date().timeIntervalSince1970
        try? WCSession.default.updateApplicationContext(context)
    }

    /// Watch actions are queued so none is lost while Flutter is not running.
    private func enqueue(_ event: [String: Any]) {
        DispatchQueue.main.async {
            let defaults = UserDefaults.standard
            var events = defaults.array(forKey: Self.watchQueueKey) ?? []
            events.append(event)
            defaults.set(Array(events.suffix(200)), forKey: Self.watchQueueKey)
            self.channel.invokeMethod("watchEventsAvailable", arguments: nil)
        }
    }

    // MARK: WCSessionDelegate

    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        DispatchQueue.main.async { self.pushWatchContext() }
    }

    func sessionDidBecomeInactive(_ session: WCSession) {}

    func sessionDidDeactivate(_ session: WCSession) {
        WCSession.default.activate()
    }

    func sessionWatchStateDidChange(_ session: WCSession) {
        DispatchQueue.main.async { self.pushWatchContext() }
    }

    func session(_ session: WCSession, didReceiveUserInfo userInfo: [String: Any] = [:]) {
        enqueue(userInfo)
    }

    func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
        enqueue(message)
    }
}
