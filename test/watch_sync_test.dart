import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/domain/logbook.dart';
import 'package:nfc_tag_master/domain/ndef_record.dart';
import 'package:nfc_tag_master/domain/storage_models.dart';
import 'package:nfc_tag_master/domain/watch_sync.dart';

void main() {
  final now = DateTime(2026, 10, 3, 15);

  ScanHistoryEntry scan(String id, List<NdefRecordModel> records) => ScanHistoryEntry(
        id: id,
        timestamp: now,
        identifier: '04AABB',
        records: records,
      );

  LogBook book(String id, {List<LogEntry> entries = const []}) => LogBook(
        id: id,
        name: 'Book $id',
        kind: LogBookKind.habit,
        createdAt: now,
        entries: entries,
      );

  test('titles use the first readable record, else the UID', () {
    expect(WatchSync.titleOf(scan('a', [NdefCodec.encodeUri('https://example.com')])), 'https://example.com');
    expect(WatchSync.titleOf(scan('b', const [])), 'UID: 04AABB');
    final long = 'x' * 200;
    expect(WatchSync.titleOf(scan('c', [NdefCodec.encodeText(long, langCode: 'en')])).length,
        WatchSync.maxTitle + 1);
  });

  test('context lists recent scans and counts today\'s entries', () {
    final history = [for (var i = 0; i < 20; i++) scan('$i', const [])];
    final books = [
      book('1', entries: [
        LogEntry(time: now.subtract(const Duration(hours: 1)), uid: '', label: 'x'),
        LogEntry(time: now.subtract(const Duration(days: 1)), uid: '', label: 'y'),
      ]),
    ];
    final ctx = WatchSync.context(history: history, books: books, now: now);
    expect((ctx['scans'] as List).length, WatchSync.maxScans);
    final b = (ctx['books'] as List).single as Map;
    expect(b['id'], '1');
    expect(b['today'], 1);
    expect(b['kind'], 'habit');
    expect(b['last'], isNotNull);
  });

  test('watch events become logbook entries; unknown ones are ignored', () {
    final books = [book('1'), book('2')];
    final at = now.millisecondsSinceEpoch / 1000;
    final changed = WatchSync.applyEvents([
      {'type': 'log', 'book': '1', 'at': at},
      {'type': 'log', 'book': '1', 'at': at + 60},
      {'type': 'log', 'book': 'missing', 'at': at},
      {'type': 'other', 'book': '2'},
      'garbage',
    ], books, label: 'Apple Watch');
    expect(changed.map((b) => b.id), ['1']);
    expect(changed.single.entries.length, 2);
    expect(changed.single.entries.first.label, 'Apple Watch');
    expect(changed.single.entries.first.time, now.add(const Duration(minutes: 1)));
  });
}
