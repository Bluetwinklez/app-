import 'logbook.dart';
import 'record_text.dart';
import 'storage_models.dart';

/// What the Apple Watch app shows, and how its taps come back.
///
/// The phone sends recent scans and the logbooks; the watch sends
/// `{type: 'log', book: <id>, at: <epoch seconds>}` events that become
/// logbook entries.
class WatchSync {
  static const int maxScans = 15;
  static const int maxBooks = 20;
  static const int maxTitle = 80;

  static String titleOf(ScanHistoryEntry entry) {
    for (final r in entry.records) {
      final text = RecordText.textOf(r)?.trim();
      if (text != null && text.isNotEmpty) {
        return text.length > maxTitle ? '${text.substring(0, maxTitle)}…' : text;
      }
    }
    return 'UID: ${entry.identifier}';
  }

  static Map<String, Object?> context({
    required List<ScanHistoryEntry> history,
    required List<LogBook> books,
    DateTime? now,
  }) {
    final today = now ?? DateTime.now();
    final start = DateTime(today.year, today.month, today.day);
    return {
      'scans': [
        for (final e in history.take(maxScans))
          {
            'title': titleOf(e),
            'uid': e.identifier,
            'at': e.timestamp.millisecondsSinceEpoch / 1000,
          },
      ],
      'books': [
        for (final b in books.take(maxBooks))
          {
            'id': b.id,
            'name': b.name,
            'kind': b.kind.name,
            'today': b.entries.where((e) => !e.time.toLocal().isBefore(start)).length,
            if (b.entries.isNotEmpty) 'last': b.entries.first.time.millisecondsSinceEpoch / 1000,
          },
      ],
    };
  }

  /// Logbooks changed by the watch [events]; entries are labelled [label].
  static List<LogBook> applyEvents(List<Object?> events, List<LogBook> books, {required String label}) {
    final byId = {for (final b in books) b.id: b};
    final changed = <String>{};
    for (final raw in events) {
      if (raw is! Map) continue;
      if (raw['type'] != 'log') continue;
      final book = byId[raw['book']];
      if (book == null) continue;
      final at = raw['at'];
      final time = at is num
          ? DateTime.fromMillisecondsSinceEpoch((at * 1000).round())
          : DateTime.now();
      byId[book.id] = book.add(LogEntry(time: time, uid: 'watch', label: label));
      changed.add(book.id);
    }
    return [for (final id in changed) byId[id]!];
  }
}
