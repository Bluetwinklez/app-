import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/domain/logbook.dart';
import 'package:nfc_tag_master/services/app_storage_service.dart';

void main() {
  LogEntry e(DateTime t, String uid, [String label = 'x']) => LogEntry(time: t, uid: uid, label: label);
  final day = DateTime(2026, 5, 4, 12);

  test('daily counts and distinct tags', () {
    var book = LogBook(id: '1', name: 'Sınıf', kind: LogBookKind.attendance, createdAt: day);
    book = book.add(e(day, 'A')).add(e(day.add(const Duration(minutes: 5)), 'B')).add(e(day, 'A'));
    book = book.add(e(day.subtract(const Duration(days: 1)), 'C'));
    expect(book.entriesOn(day), hasLength(3));
    expect(book.distinctTagsOn(day), 2);
    expect(book.entries.first.uid, 'C', reason: 'newest added first');
  });

  test('inventory keeps the latest sighting per tag', () {
    var book = LogBook(id: '1', name: 'Depo', kind: LogBookKind.inventory, createdAt: day);
    book = book.add(e(day, 'A', 'old')).add(e(day, 'B')).add(e(day, 'A', 'new'));
    final latest = book.latestPerTag();
    expect(latest.map((x) => x.uid), ['A', 'B']);
    expect(latest.first.label, 'new');
  });

  test('entries are capped and survive JSON and a storage restart', () async {
    var book = LogBook(id: '9', name: 'İlaç', kind: LogBookKind.medication, createdAt: day);
    for (int i = 0; i < LogBook.maxEntries + 3; i++) {
      book = book.add(e(day, '$i'));
    }
    expect(book.entries, hasLength(LogBook.maxEntries));

    final dir = await Directory.systemTemp.createTemp('logbooks');
    addTearDown(() => dir.delete(recursive: true));
    final s1 = LocalFileAppStorageService(baseDirectoryPath: dir.path);
    await s1.init();
    await s1.saveLogBook(book);
    final s2 = LocalFileAppStorageService(baseDirectoryPath: dir.path);
    await s2.init();
    final back = s2.getLogBooks().single;
    expect(back.kind, LogBookKind.medication);
    expect(back.entries, hasLength(LogBook.maxEntries));
    await s2.deleteLogBook('9');
    expect(s2.getLogBooks(), isEmpty);
  });

  test('time clock alternates in/out per tag and sums worked time', () {
    final d = DateTime(2026, 5, 4);
    var book = LogBook(id: 't', name: 'Mesai', kind: LogBookKind.timeClock, createdAt: d);
    book = book
        .add(e(d.add(const Duration(hours: 9)), 'A', 'Ali'))
        .add(e(d.add(const Duration(hours: 9, minutes: 30)), 'B', 'Ayşe'))
        .add(e(d.add(const Duration(hours: 12)), 'A', 'Ali'))
        .add(e(d.add(const Duration(hours: 13)), 'A', 'Ali'));
    expect(book.entries.map((x) => x.checkIn), [true, false, true, true]);
    expect(book.isInside('A'), isTrue);
    expect(book.presentNow().map((x) => x.uid), ['A', 'B']);

    final now = d.add(const Duration(hours: 15));
    final worked = book.workedOn(d, now: now);
    expect(worked['A']!.worked, const Duration(hours: 5));
    expect(worked['B']!.worked, const Duration(hours: 5, minutes: 30));
    expect(book.totalWorkedOn(d, now: now), const Duration(hours: 10, minutes: 30));

    final back = LogBook.fromJsonMap(book.toJsonMap());
    expect(back.entries.map((x) => x.checkIn), [true, false, true, true]);
  });

  test('time clock clips a night shift to the day asked', () {
    final d = DateTime(2026, 5, 4);
    var book = LogBook(id: 't', name: 'Gece', kind: LogBookKind.timeClock, createdAt: d);
    book = book.add(e(d.add(const Duration(hours: 22)), 'A')).add(e(d.add(const Duration(hours: 30)), 'A'));
    expect(book.workedOn(d)['A']!.worked, const Duration(hours: 2));
    expect(book.workedOn(d.add(const Duration(days: 1)))['A']!.worked, const Duration(hours: 6));
  });

  test('habit streak counts consecutive days and keeps today open', () {
    final today = DateTime(2026, 5, 10, 20);
    var book = LogBook(id: 'h', name: 'Su', kind: LogBookKind.habit, createdAt: today);
    for (final d in [1, 2, 3, 6, 7, 8, 9]) {
      book = book.add(e(DateTime(2026, 5, d, 9), 'A'));
    }
    // Not yet done today: yesterday's run still counts.
    expect(book.streak(today: today), (current: 4, best: 4));
    book = book.add(e(DateTime(2026, 5, 10, 8), 'A'));
    expect(book.streak(today: today), (current: 5, best: 5));
    expect(book.streak(today: DateTime(2026, 5, 12)).current, 0);
    expect(LogBook(id: 'x', name: 'x', kind: LogBookKind.habit, createdAt: today).streak(), (current: 0, best: 0));
  });

  test('notes are kept and survive JSON', () {
    final entry = LogEntry(time: day, uid: 'A', label: 'Kart 1', note: 'Ayşe Y.');
    expect(LogEntry.fromJsonMap(entry.toJsonMap()).note, 'Ayşe Y.');
    final clock = LogBook(id: 't', name: 't', kind: LogBookKind.timeClock, createdAt: day).add(entry);
    expect(clock.entries.single.note, 'Ayşe Y.');
  });
}
