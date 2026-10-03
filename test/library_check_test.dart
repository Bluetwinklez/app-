import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/domain/ndef_record.dart';
import 'package:nfc_tag_master/domain/tag_library.dart';

void main() {
  final created = DateTime(2026, 1, 1);
  TagLibraryEntry entry({String id = '1', String? uid, int? every, DateTime? seen, List<NdefRecordModel>? records}) =>
      TagLibraryEntry(
        id: id,
        name: 'Tag $id',
        uid: uid,
        checkEveryDays: every,
        lastSeenAt: seen,
        records: records ?? const [],
        createdAt: created,
        updatedAt: created,
      );

  group('inspection interval', () {
    test('no interval is never due', () {
      expect(entry().isCheckDue(DateTime(2030)), isFalse);
      expect(entry().nextCheckAt, isNull);
    });

    test('counts from creation, then from the last scan', () {
      final e = entry(every: 30);
      expect(e.nextCheckAt, DateTime(2026, 1, 31));
      expect(e.isCheckDue(DateTime(2026, 1, 30)), isFalse);
      expect(e.isCheckDue(DateTime(2026, 1, 31)), isTrue);
      final seen = e.copyWith(lastSeenAt: DateTime(2026, 2, 1));
      expect(seen.isCheckDue(DateTime(2026, 2, 15)), isFalse);
    });

    test('survives JSON and can be cleared', () {
      final e = entry(every: 7);
      expect(TagLibraryEntry.fromJsonMap(e.toJsonMap()).checkEveryDays, 7);
      expect(e.copyWith(clearCheck: true).checkEveryDays, isNull);
      expect(entry().toJsonMap().containsKey('checkEveryDays'), isFalse);
    });
  });

  group('clone suspect', () {
    final records = [NdefCodec.encodeUri('https://example.com/a')];
    final library = [
      entry(id: '1', uid: '04:AA', records: records),
      entry(id: '2', uid: '04:BB', records: [NdefCodec.encodeText('other')]),
    ];

    test('same content on another UID is flagged', () {
      expect(TagLibraryEntry.cloneSuspect(library, '04:CC', records)?.id, '1');
    });

    test('the original itself or different content is not flagged', () {
      expect(TagLibraryEntry.cloneSuspect(library, '04:aa', records), isNull);
      expect(TagLibraryEntry.cloneSuspect(library, '04:CC', [NdefCodec.encodeText('x')]), isNull);
      expect(TagLibraryEntry.cloneSuspect(library, '', records), isNull);
    });

    test('a scanned UID that is saved elsewhere is not flagged', () {
      expect(TagLibraryEntry.cloneSuspect(library, '04:BB', records), isNull);
    });
  });
}
