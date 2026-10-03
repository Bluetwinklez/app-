import 'logbook.dart';
import 'tag_library.dart';

/// One notification to schedule.
class PlannedReminder {
  final int id;
  final String title;
  final String body;

  /// Daily reminders repeat at [hour]:[minute]; one-shot ones fire at [at].
  final bool daily;
  final int hour;
  final int minute;
  final DateTime? at;

  const PlannedReminder.daily(this.id, this.title, this.body, this.hour, this.minute)
      : daily = true,
        at = null;

  const PlannedReminder.once(this.id, this.title, this.body, DateTime this.at)
      : daily = false,
        hour = 0,
        minute = 0;
}

/// Turns logbooks and library inspection intervals into notifications.
/// Kept pure so the scheduling rules are testable without the plugin.
class ReminderPlan {
  /// iOS keeps at most 64 pending notifications.
  static const int maxPending = 60;

  /// Inspection reminders fire at this hour on the due day.
  static const int inspectionHour = 10;

  static int _id(String prefix, String key) => (('$prefix:$key').hashCode & 0x3fffffff);

  static List<PlannedReminder> build({
    required List<LogBook> books,
    required List<TagLibraryEntry> library,
    required DateTime now,
    required String Function(LogBook) bookBody,
    required String Function(TagLibraryEntry) inspectionTitle,
    required String inspectionBody,
  }) {
    final out = <PlannedReminder>[];
    for (final b in books) {
      final m = b.reminderMinutes;
      if (m == null) continue;
      out.add(PlannedReminder.daily(_id('book', b.id), b.name, bookBody(b), m ~/ 60, m % 60));
    }
    final due = <(DateTime, TagLibraryEntry)>[];
    for (final e in library) {
      final next = e.nextCheckAt;
      if (next == null) continue;
      var at = DateTime(next.year, next.month, next.day, inspectionHour);
      if (!at.isAfter(now)) continue; // already overdue: shown in the app instead
      due.add((at, e));
    }
    due.sort((a, b) => a.$1.compareTo(b.$1));
    for (final (at, e) in due) {
      if (out.length >= maxPending) break;
      out.add(PlannedReminder.once(_id('check', e.id), inspectionTitle(e), inspectionBody, at));
    }
    return out;
  }
}
