import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/domain/library_import.dart';
import 'package:nfc_tag_master/domain/ndef_record.dart';
import 'package:nfc_tag_master/domain/tag_library.dart';

void main() {
  final now = DateTime(2026, 3, 1);

  test('rows without a header use the default column order', () {
    final r = LibraryCsvImporter.parse(
      'Ofis kapısı,https://example.com/door,Kat 2,"ofis, kapı",Not 1,04:aa:bb\n'
      'Saksı,Haftada bir sula\n',
      existing: const [],
      now: now,
    );
    expect(r.entries, hasLength(2));
    final door = r.entries.first;
    expect(door.name, 'Ofis kapısı');
    expect(door.locationNote, 'Kat 2');
    expect(door.labels, ['ofis', 'kapı']);
    expect(door.note, 'Not 1');
    expect(door.uid, '04:AA:BB');
    expect(NdefCodec.parseRecord(door.records.single).content, 'https://example.com/door');
    expect(String.fromCharCodes(door.records.single.type), 'U');
    expect(NdefCodec.parseRecord(r.entries[1].records.single).content, 'Haftada bir sula');
  });

  test('header columns are matched by name, in any order, including app export headers', () {
    final r = LibraryCsvImporter.parse(
      'UID;Name;Kategori;Bilinmeyen;Inhalt\n04:01;Auto;car;x;Hallo\n',
      existing: const [],
      headerAliases: const {'Inhalt': LibraryColumn.content},
      now: now,
    );
    final e = r.entries.single;
    expect(e.name, 'Auto');
    expect(e.uid, '04:01');
    expect(e.category, TagCategory.car);
    expect(NdefCodec.parseRecord(e.records.single).content, 'Hallo');
    expect(e.note, '');
  });

  test('existing and repeated UIDs are skipped, nameless rows reported', () {
    final existing = [TagLibraryEntry(id: '1', name: 'old', uid: '04:01', createdAt: now, updatedAt: now)];
    final r = LibraryCsvImporter.parse(
      'name,uid\nA,04:01\nB,04:02\nC,04:02\n,04:03\n',
      existing: existing,
      now: now,
    );
    expect(r.entries.map((e) => e.name), ['B']);
    expect(r.duplicates, 2);
    expect(r.invalidRows, [5]);
    expect(r.entries.map((e) => e.id).toSet(), hasLength(1));
  });

  test('tab-separated cells pasted from a spreadsheet keep their commas', () {
    final r = LibraryCsvImporter.parse('Ad\tEtiketler\nKapı\tofis, kat 2\n', existing: const [], now: now);
    expect(r.entries.single.labels, ['ofis', 'kat 2']);
  });
}
