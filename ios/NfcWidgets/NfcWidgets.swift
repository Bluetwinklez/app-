import AppIntents
import SwiftUI
import WidgetKit

/// The widgets are shortcuts into the app: each tap opens a
/// nfctagmaster://<action> link the app already understands.
private func link(_ action: String) -> URL {
    URL(string: "nfctagmaster://\(action)")!
}

struct StaticEntry: TimelineEntry {
    let date: Date
}

struct StaticProvider: TimelineProvider {
    func placeholder(in context: Context) -> StaticEntry { StaticEntry(date: Date()) }

    func getSnapshot(in context: Context, completion: @escaping (StaticEntry) -> Void) {
        completion(StaticEntry(date: Date()))
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<StaticEntry>) -> Void) {
        completion(Timeline(entries: [StaticEntry(date: Date())], policy: .never))
    }
}

private let accent = Color(red: 0.16, green: 0.45, blue: 0.95)

private extension View {
    @ViewBuilder
    func widgetBackground() -> some View {
        if #available(iOS 17.0, *) {
            containerBackground(for: .widget) {
                LinearGradient(colors: [accent, accent.opacity(0.75)],
                               startPoint: .topLeading, endPoint: .bottomTrailing)
            }
        } else {
            background(LinearGradient(colors: [accent, accent.opacity(0.75)],
                                      startPoint: .topLeading, endPoint: .bottomTrailing))
        }
    }
}

struct ActionTile: View {
    let title: LocalizedStringKey
    let symbol: String
    let action: String

    var body: some View {
        Link(destination: link(action)) {
            VStack(spacing: 4) {
                Image(systemName: symbol)
                    .font(.system(size: 20, weight: .semibold))
                Text(title)
                    .font(.caption2.weight(.semibold))
                    .lineLimit(1)
                    .minimumScaleFactor(0.7)
            }
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.white.opacity(0.18), in: RoundedRectangle(cornerRadius: 14))
        }
    }
}

struct QuickScanView: View {
    @Environment(\.widgetFamily) private var family

    var body: some View {
        switch family {
        case .accessoryCircular:
            ZStack {
                AccessoryWidgetBackground()
                Image(systemName: "wave.3.right")
                    .font(.system(size: 22, weight: .semibold))
            }
            .widgetURL(link("scan"))
            .widgetBackgroundIfNeeded()
        case .accessoryRectangular:
            HStack(spacing: 8) {
                Image(systemName: "wave.3.right.circle.fill")
                    .font(.system(size: 26))
                VStack(alignment: .leading) {
                    Text("Scan Tag").font(.headline)
                    Text("NFC").font(.caption)
                }
            }
            .widgetURL(link("scan"))
            .widgetBackgroundIfNeeded()
        case .accessoryInline:
            Label("Scan Tag", systemImage: "wave.3.right")
                .widgetURL(link("scan"))
        default:
            VStack(alignment: .leading, spacing: 6) {
                Image(systemName: "wave.3.right.circle.fill")
                    .font(.system(size: 40))
                Spacer(minLength: 0)
                Text("Scan Tag")
                    .font(.headline)
                Text("Hold your iPhone near a tag")
                    .font(.caption2)
                    .opacity(0.85)
                    .lineLimit(2)
            }
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .widgetURL(link("scan"))
            .widgetBackground()
        }
    }
}

private extension View {
    /// Lock screen widgets need an (empty) container background on iOS 17+.
    @ViewBuilder
    func widgetBackgroundIfNeeded() -> some View {
        if #available(iOS 17.0, *) {
            containerBackground(for: .widget) { Color.clear }
        } else {
            self
        }
    }
}

struct ShortcutsView: View {
    var body: some View {
        Grid(horizontalSpacing: 8, verticalSpacing: 8) {
            GridRow {
                ActionTile(title: "Scan", symbol: "wave.3.right", action: "scan")
                ActionTile(title: "Write", symbol: "square.and.pencil", action: "write")
            }
            GridRow {
                ActionTile(title: "History", symbol: "clock.arrow.circlepath", action: "history")
                ActionTile(title: "Tools", symbol: "wrench.and.screwdriver", action: "tools")
            }
        }
        .widgetBackground()
    }
}

struct QuickScanWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: "QuickScan", provider: StaticProvider()) { _ in
            QuickScanView()
        }
        .configurationDisplayName("Quick Scan")
        .description("Scan an NFC tag with one tap.")
        .supportedFamilies([.systemSmall, .accessoryCircular, .accessoryRectangular, .accessoryInline])
    }
}

struct ShortcutsWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: "Shortcuts", provider: StaticProvider()) { _ in
            ShortcutsView()
        }
        .configurationDisplayName("NFC Shortcuts")
        .description("Scan, write and open your history in one tap.")
        .supportedFamilies([.systemMedium])
    }
}

@available(iOS 18.0, *)
struct ScanControl: ControlWidget {
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: "com.bluetwinklez.nfctagmaster.scan-control") {
            ControlWidgetButton(action: ScanTagIntent()) {
                Label("Scan Tag", systemImage: "wave.3.right")
            }
        }
        .displayName("Scan Tag")
        .description("Scan an NFC tag with one tap.")
    }
}

@available(iOS 18.0, *)
struct WriteControl: ControlWidget {
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: "com.bluetwinklez.nfctagmaster.write-control") {
            ControlWidgetButton(action: WriteTagIntent()) {
                Label("Write Tag", systemImage: "square.and.pencil")
            }
        }
        .displayName("Write Tag")
    }
}

@main
struct NfcWidgetsBundle: WidgetBundle {
    var body: some Widget {
        QuickScanWidget()
        ShortcutsWidget()
        if #available(iOS 18.0, *) {
            ScanControl()
            WriteControl()
        }
    }
}
