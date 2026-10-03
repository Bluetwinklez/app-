import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/domain/ndef_record.dart';
import 'package:nfc_tag_master/domain/storage_models.dart';
import 'package:nfc_tag_master/domain/tag_library.dart';
import 'package:nfc_tag_master/domain/team_pack.dart';

void main() {
  final now = DateTime(2026, 4, 1);
  TagLibraryEntry entry(String id, String? uid) => TagLibraryEntry(
        id: id,
        name: 'Tag $id',
        uid: uid,
        labels: const ['ofis'],
        photoPath: 'tag_photos/$id.jpg',
        lastSeenAt: now,
        autoLogBookId: 'book',
        checkEveryDays: 30,
        records: [NdefCodec.encodeUri('https://example.com/$id')],
        createdAt: now,
        updatedAt: now,
      );

  test('round trip keeps content and drops device-local fields', () {
    final pack = TeamPack(
      name: 'Ofis',
      createdAt: now,
      entries: [entry('1', '04:AA')],
      templates: [WriteTemplate(id: 't1', name: 'Wi-Fi', createdAt: now, records: [NdefCodec.encodeText('x')])],
    );
    final json = pack.encode();
    expect(TeamPack.isPack(json), isTrue);
    expect(json, isNot(contains('tag_photos')));
    final back = TeamPack.decode(json);
    expect(back.name, 'Ofis');
    final e = back.entries.single;
    expect(e.labels, ['ofis']);
    expect(e.checkEveryDays, 30);
    expect(e.photoPath, isNull);
    expect(e.lastSeenAt, isNull);
    expect(e.autoLogBookId, isNull);
    expect(back.templates.single.name, 'Wi-Fi');
  });

  test('merge skips known UIDs, ids and templates', () {
    final pack = TeamPack(name: 'p', createdAt: now, entries: [
      entry('1', '04:AA'),
      entry('2', '04:bb'),
      entry('3', null),
    ], templates: [
      WriteTemplate(id: 't1', name: 'a', createdAt: now, records: const []),
      WriteTemplate(id: 't2', name: 'b', createdAt: now, records: const []),
    ]);
    final library = [entry('x', '04:BB'), entry('3', null)];
    final existing = [WriteTemplate(id: 't1', name: 'a', createdAt: now, records: const [])];
    final r = pack.mergeInto(library, existing, now: now);
    expect(r.entries.map((e) => e.id), ['1']);
    expect(r.templates.map((t) => t.id), ['t2']);
    expect(r.skipped, 3);
  });

  test('rejects other files and newer versions', () {
    expect(TeamPack.isPack('{"format":"other"}'), isFalse);
    expect(() => TeamPack.decode('nope'), throwsA(isA<TeamPackException>()));
    expect(() => TeamPack.decode('{"format":"nfc-tag-master-pack","version":99}'),
        throwsA(isA<TeamPackException>()));
  });
}
