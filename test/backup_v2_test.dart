import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/domain/ndef_record.dart';
import 'package:nfc_tag_master/domain/tag_library.dart';
import 'package:nfc_tag_master/services/app_storage_service.dart';
import 'package:nfc_tag_master/services/backup_codec.dart';

void main() {
  final now = DateTime.utc(2026, 10, 3);
  TagLibraryEntry entry(String id) => TagLibraryEntry(
        id: id,
        name: 'Mutfak $id',
        category: TagCategory.home,
        photoPath: 'tag_photos/$id.jpg',
        uid: '04:A1',
        records: [NdefCodec.encodeUri('https://example.com/$id')],
        createdAt: now,
        updatedAt: now,
      );

  test('v2 backup round-trips the tag library without photos', () {
    final json = BackupCodec.encodeBackup(templates: const [], tagLibrary: [entry('1'), entry('2')]);
    expect(jsonDecode(json)['schemaVersion'], 2);
    final payload = BackupCodec.decodeAndValidate(json);
    expect(payload.tagLibrary!.map((e) => e.name), ['Mutfak 1', 'Mutfak 2']);
    expect(payload.tagLibrary!.first.photoPath, isNull);
    expect(NdefCodec.decodeUri(payload.tagLibrary!.first.records.single), 'https://example.com/1');
  });

  test('v1 backups without a library still import', () {
    final v1 = jsonEncode({
      'schemaVersion': 1,
      'app': 'nfc_tag_master',
      'exportedAt': now.toIso8601String(),
      'templates': [],
    });
    final payload = BackupCodec.decodeAndValidate(v1);
    expect(payload.schemaVersion, 1);
    expect(payload.tagLibrary, isNull);
  });

  test('future schema versions are rejected', () {
    final v3 = jsonEncode({'schemaVersion': 3, 'exportedAt': now.toIso8601String(), 'templates': []});
    expect(() => BackupCodec.decodeAndValidate(v3), throwsA(isA<BackupValidationException>()));
  });

  test('invalid library entries are rejected', () {
    final bad = jsonEncode({
      'schemaVersion': 2,
      'exportedAt': now.toIso8601String(),
      'templates': [],
      'tagLibrary': [
        {'id': '', 'name': 'x'}
      ],
    });
    expect(() => BackupCodec.decodeAndValidate(bad), throwsA(isA<BackupValidationException>()));
  });

  test('merge adds new library entries and keeps local ones', () async {
    final storage = InMemoryAppStorageService();
    await storage.saveLibraryEntry(entry('1').copyWith(name: 'Yerel'));
    final payload = BackupCodec.decodeAndValidate(
      BackupCodec.encodeBackup(templates: const [], tagLibrary: [entry('1'), entry('2')]),
    );
    final result = await storage.mergeBackup(payload);
    expect(result.addedLibrary, 1);
    expect(storage.getLibrary().map((e) => e.name).toSet(), {'Yerel', 'Mutfak 2'});
    expect(result.toSummaryMessage(), contains('1'));
  });
}
