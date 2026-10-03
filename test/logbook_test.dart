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
}
