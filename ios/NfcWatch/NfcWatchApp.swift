import SwiftUI
import WatchConnectivity

struct WatchScan: Identifiable, Hashable {
    let id: Int
    let title: String
    let uid: String
    let at: Date
}

struct WatchBook: Identifiable, Hashable {
    let id: String
    let name: String
    let kind: String
    let today: Int
    let last: Date?
}

/// Recent scans and logbooks sent by the iPhone app; taps on a logbook are
/// sent back and recorded there.
final class WatchStore: NSObject, ObservableObject, WCSessionDelegate {
    private static let cacheKey = "context"

    @Published private(set) var scans: [WatchScan] = []
    @Published private(set) var books: [WatchBook] = []
    @Published private(set) var syncedAt: Date?
    @Published var justLogged: String?

    override init() {
        super.init()
        if let cached = UserDefaults.standard.dictionary(forKey: Self.cacheKey) {
            apply(cached)
        }
        if WCSession.isSupported() {
            WCSession.default.delegate = self
            WCSession.default.activate()
        }
    }

    func log(_ book: WatchBook) {
        let event: [String: Any] = ["type": "log", "book": book.id, "at": Date().timeIntervalSince1970]
        let session = WCSession.default
        if session.activationState == .activated && session.isReachable {
            session.sendMessage(event, replyHandler: nil) { _ in
                session.transferUserInfo(event)
            }
        } else {
            session.transferUserInfo(event)
        }
        // Show the tap right away; the phone confirms on the next sync.
        books = books.map {
            $0.id == book.id
                ? WatchBook(id: $0.id, name: $0.name, kind: $0.kind, today: $0.today + 1, last: Date())
                : $0
        }
        justLogged = book.id
    }

    private func apply(_ context: [String: Any]) {
        let rawScans = context["scans"] as? [[String: Any]] ?? []
        scans = rawScans.enumerated().map { index, item in
            WatchScan(
                id: index,
                title: item["title"] as? String ?? "",
                uid: item["uid"] as? String ?? "",
                at: Date(timeIntervalSince1970: (item["at"] as? Double) ?? 0)
            )
        }
        let rawBooks = context["books"] as? [[String: Any]] ?? []
        books = rawBooks.map { item in
            WatchBook(
                id: item["id"] as? String ?? "",
                name: item["name"] as? String ?? "",
                kind: item["kind"] as? String ?? "custom",
                today: item["today"] as? Int ?? 0,
                last: (item["last"] as? Double).map { Date(timeIntervalSince1970: $0) }
            )
        }
        if let sent = context["sentAt"] as? Double {
            syncedAt = Date(timeIntervalSince1970: sent)
        }
    }

    private func receive(_ context: [String: Any]) {
        DispatchQueue.main.async {
            UserDefaults.standard.set(context, forKey: Self.cacheKey)
            self.apply(context)
        }
    }

    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        if !session.receivedApplicationContext.isEmpty {
            receive(session.receivedApplicationContext)
        }
    }

    func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String: Any]) {
        receive(applicationContext)
    }
}

private func symbol(for kind: String) -> String {
    switch kind {
    case "medication": return "pills.fill"
    case "habit": return "flame.fill"
    case "chores": return "checklist"
    case "feeding": return "pawprint.fill"
    case "timeClock": return "clock.fill"
    case "visitors": return "person.2.fill"
    case "inventory": return "shippingbox.fill"
    case "attendance": return "person.crop.circle.badge.checkmark"
    default: return "book.closed.fill"
    }
}

struct BookRow: View {
    @EnvironmentObject private var store: WatchStore
    let book: WatchBook

    var body: some View {
        Button {
            store.log(book)
        } label: {
            HStack {
                Image(systemName: symbol(for: book.kind))
                    .foregroundStyle(.tint)
                VStack(alignment: .leading) {
                    Text(book.name).lineLimit(2)
                    Text("Today: \(book.today)")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                }
                Spacer()
                Image(systemName: store.justLogged == book.id ? "checkmark.circle.fill" : "plus.circle")
                    .foregroundStyle(store.justLogged == book.id ? .green : .accentColor)
            }
        }
    }
}

struct ContentView: View {
    @EnvironmentObject private var store: WatchStore

    var body: some View {
        NavigationStack {
            List {
                Section("Logbooks") {
                    if store.books.isEmpty {
                        Text("Create a logbook in the iPhone app.")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                    }
                    ForEach(store.books) { book in
                        BookRow(book: book)
                    }
                }
                Section("Recent Scans") {
                    if store.scans.isEmpty {
                        Text("No scans yet")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                    }
                    ForEach(store.scans) { scan in
                        VStack(alignment: .leading, spacing: 2) {
                            Text(scan.title).lineLimit(3)
                            Text(scan.at, style: .relative)
                                .font(.caption2)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                if store.syncedAt == nil {
                    Text("Open the app on your iPhone to sync.")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
            }
            .navigationTitle("NFC Tag Master")
        }
    }
}

@main
struct NfcWatchApp: App {
    @StateObject private var store = WatchStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}
