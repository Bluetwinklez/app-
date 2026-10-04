import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/domain/logbook.dart';
import 'package:nfc_tag_master/domain/reminder_plan.dart';
import 'package:nfc_tag_master/domain/tag_library.dart';

void main() {
  final now = DateTime(2026, 6, 1, 12);
  List<PlannedReminder> plan(List<LogBook> books, List<TagLibraryEntry> lib) => ReminderPlan.build(
        books: books,
        library: lib,
        now: now,
        bookBody: (b) => 'scan ${b.name}',
        inspectionTitle: (e) => 'check ${e.name}',
        inspectionBody: 'body',
      );

  TagLibraryEntry tag(String id, int? every, DateTime created) =>
      TagLibraryEntry(id: id, name: id, checkEveryDays: every, createdAt: created, updatedAt: created);

  test('daily reminders for books with a time, none without', () {
    final r = plan([
      LogBook(id: 'a', name: 'İlaç', kind: LogBookKind.medication, createdAt: now, reminderMinutes: 21 * 60 + 30),
      LogBook(id: 'b', name: 'x', kind: LogBookKind.custom, createdAt: now),
    ], []);
    expect(r, hasLength(1));
    expect((r.single.daily, r.single.hour, r.single.minute, r.single.title), (true, 21, 30, 'İlaç'));
  });

  test('inspection reminders at 10:00 on the due day, soonest first, overdue skipped', () {
    final r = plan([], [
      tag('late', 30, DateTime(2026, 6, 20)), // due 20 July
      tag('soon', 7, DateTime(2026, 5, 30)), // due 6 June
      tag('overdue', 7, DateTime(2026, 5, 1)),
      tag('none', null, DateTime(2026, 5, 1)),
    ]);
    expect(r.map((x) => x.title), ['check soon', 'check late']);
    expect(r.first.at, DateTime(2026, 6, 6, 10));
    expect(r.map((x) => x.id).toSet(), hasLength(2));
  });

  test('never more than the iOS pending limit', () {
    final lib = [for (int i = 0; i < 100; i++) tag('t$i', 30, DateTime(2026, 6, 1))];
    expect(plan([], lib), hasLength(ReminderPlan.maxPending));
  });

  test('reminder time survives JSON and can be cleared', () {
    final b = LogBook(id: 'a', name: 'a', kind: LogBookKind.habit, createdAt: now, reminderMinutes: 480);
    expect(LogBook.fromJsonMap(b.toJsonMap()).reminderMinutes, 480);
    expect(b.copyWith(clearReminder: true).reminderMinutes, isNull);
    expect(b.add(LogEntry(time: now, uid: 'u', label: 'l')).reminderMinutes, 480);
  });

  test('warranty end gets a reminder when a title builder is given', () {
    final e = TagLibraryEntry(
        id: 'w', name: 'Laptop', warrantyUntil: DateTime(2026, 7, 1), createdAt: now, updatedAt: now);
    final r = ReminderPlan.build(
      books: const [],
      library: [e],
      now: now,
      bookBody: (_) => '',
      inspectionTitle: (_) => '',
      inspectionBody: '',
      warrantyTitle: (x) => 'warranty ${x.name}',
      warrantyBody: 'ends',
    );
    expect(r.single.title, 'warranty Laptop');
    expect(r.single.at, DateTime(2026, 7, 1, 10));
  });
}
