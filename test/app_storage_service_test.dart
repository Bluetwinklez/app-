import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/domain/ndef_record.dart';
import 'package:nfc_tag_master/domain/storage_models.dart';
import 'package:nfc_tag_master/domain/tag_rule.dart';
import 'package:nfc_tag_master/services/app_storage_service.dart';
import 'package:nfc_tag_master/services/backup_codec.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tempDir;
  late LocalFileAppStorageService storage;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('nfc_storage_test_');
    storage = LocalFileAppStorageService(baseDirectoryPath: tempDir.path);
    await storage.init();
  });

  tearDown(() async {
    if (await tempDir.exists()) {
      await tempDir.delete(recursive: true);
    }
  });

  group('LocalFileAppStorageService - Safe writes and persistence', () {
    test('persists history enabled setting across instances', () async {
      expect(storage.isHistoryEnabled, isFalse);

      await storage.setHistoryEnabled(true);
      expect(storage.isHistoryEnabled, isTrue);

      // Reopen storage with fresh instance pointing to same directory
      final newStorage =
          LocalFileAppStorageService(baseDirectoryPath: tempDir.path);
      await newStorage.init();
      expect(newStorage.isHistoryEnabled, isTrue);
    });

    test('adds and persists scan history entry', () async {
      await storage.setHistoryEnabled(true);

      final entry = ScanHistoryEntry(
        id: 'hist-1',
        timestamp: DateTime(2026, 3, 30, 12, 0, 0),
        identifier: '04A1B2C3D4E5',
        standardTechnologies: ['IsoDep', 'NfcA'],
        isNdefSupported: true,
        isWritable: true,
        maxByteCapacity: 512,
        currentBytesUsed: 42,
        records: [
          NdefCodec.encodeText('Test History', langCode: 'en'),
        ],
      );

      await storage.addHistoryEntry(entry);
      expect(storage.getHistory().length, equals(1));
      expect(storage.getHistory().first.identifier, equals('04A1B2C3D4E5'));

      // Check persistent reload
      final reloaded =
          LocalFileAppStorageService(baseDirectoryPath: tempDir.path);
      await reloaded.init();
      expect(reloaded.getHistory().length, equals(1));
      expect(reloaded.getHistory().first.id, equals('hist-1'));
      expect(reloaded.getHistory().first.records.length, equals(1));
    });

    test('saves, updates, and deletes write templates', () async {
      final template1 = WriteTemplate(
        id: 'tmpl-1',
        name: 'Web URL Template',
        createdAt: DateTime(2026, 3, 30, 10, 0),
        records: [
          NdefCodec.encodeUri('https://example.com'),
        ],
      );

      await storage.saveTemplate(template1);
      expect(storage.getTemplates().length, equals(1));
      expect(storage.getTemplates().first.name, equals('Web URL Template'));

      // Update same template
      final updated = WriteTemplate(
        id: 'tmpl-1',
        name: 'Updated Web URL',
        createdAt: DateTime(2026, 3, 30, 10, 0),
        records: [
          NdefCodec.encodeUri('https://flutter.dev'),
        ],
      );
      await storage.saveTemplate(updated);
      expect(storage.getTemplates().length, equals(1));
      expect(storage.getTemplates().first.name, equals('Updated Web URL'));

      // Delete template
      await storage.deleteTemplate('tmpl-1');
      expect(storage.getTemplates(), isEmpty);

      // Verify empty after reinit
      final reloaded =
          LocalFileAppStorageService(baseDirectoryPath: tempDir.path);
      await reloaded.init();
      expect(reloaded.getTemplates(), isEmpty);
    });

    test('preserves other valid files when one file is corrupt', () async {
      await storage.setHistoryEnabled(true);

      // Save a valid template
      final template = WriteTemplate(
        id: 'tmpl-ok',
        name: 'Valid Template',
        createdAt: DateTime.now(),
        records: [NdefCodec.encodeText('Persistent')],
      );
      await storage.saveTemplate(template);

      // Intentionally corrupt the scan history file
      final historyFile = File('${tempDir.path}/nfc_scan_history.json');
      await historyFile.writeAsString('{{{INVALID JSON CORRUPT DATA...');

      // Re-init storage: templates and settings should load safely despite corrupt history file
      final freshStorage =
          LocalFileAppStorageService(baseDirectoryPath: tempDir.path);
      await freshStorage.init();

      expect(freshStorage.isHistoryEnabled, isTrue);
      expect(freshStorage.getTemplates().length, equals(1));
      expect(freshStorage.getTemplates().first.name, equals('Valid Template'));
      expect(freshStorage.getHistory(), isEmpty);
    });

    test(
        'propagates save error when target path is not writable and reverts memory cache',
        () async {
      // Create a file where a directory should be to force a write error
      final nonWritableDir = '${tempDir.path}/readonly_file_blocking_dir';
      final blockingFile = File(nonWritableDir);
      await blockingFile.writeAsString('not a dir');

      final faultyStorage = LocalFileAppStorageService(
        baseDirectoryPath: '$nonWritableDir/sub_dir',
      );

      final template = WriteTemplate(
        id: 'tmpl-fail',
        name: 'Will Fail',
        createdAt: DateTime.now(),
        records: [],
      );

      // Must throw an exception rather than silently succeeding
      await expectLater(
        faultyStorage.saveTemplate(template),
        throwsA(isA<FileSystemException>()),
      );

      // In-memory cache should be rolled back
      expect(faultyStorage.getTemplates(), isEmpty);
    });

    test('saves, persists, and deletes TagRules keyed by NDEF SHA-256',
        () async {
      final shaKey = 'b' * 64;
      final rule = TagRule(
        ndefSha256: shaKey,
        note: 'Özel Raf Etiketi',
        createdAt: DateTime(2026, 3, 30, 9, 0, 0),
        updatedAt: DateTime(2026, 3, 30, 9, 0, 0),
      );

      await storage.saveTagRule(rule);
      expect(storage.getTagRules().length, equals(1));
      expect(
          storage.getTagRuleBySha256(shaKey)?.note, equals('Özel Raf Etiketi'));

      // Check persistent reload
      final reloaded =
          LocalFileAppStorageService(baseDirectoryPath: tempDir.path);
      await reloaded.init();
      expect(reloaded.getTagRules().length, equals(1));
      expect(reloaded.getTagRuleBySha256(shaKey)?.note,
          equals('Özel Raf Etiketi'));

      // Delete rule
      await storage.deleteTagRule(shaKey);
      expect(storage.getTagRules(), isEmpty);
      expect(storage.getTagRuleBySha256(shaKey), isNull);
    });

    test(
        'mergeBackup merges without wiping existing data and respects history disabled state',
        () async {
      // Existing data
      final existingTpl = WriteTemplate(
        id: 'tpl-existing',
        name: 'Mevcut Şablon',
        createdAt: DateTime.now(),
        records: [],
      );
      await storage.saveTemplate(existingTpl);
      expect(storage.isHistoryEnabled, isFalse);

      final incomingTpl = WriteTemplate(
        id: 'tpl-new',
        name: 'Yeni Şablon',
        createdAt: DateTime.now(),
        records: [],
      );
      final incomingHistory = ScanHistoryEntry(
        id: 'hist-incoming',
        timestamp: DateTime.now(),
        identifier: '04FF112233',
        records: [],
      );

      final payload = BackupPayload(
        schemaVersion: 1,
        exportedAt: DateTime.now(),
        templates: [incomingTpl],
        history: [incomingHistory],
      );

      // Import when history is disabled and enableHistoryIfDisabled is false:
      // History should be skipped, existing template preserved, new template added.
      final result1 =
          await storage.mergeBackup(payload, enableHistoryIfDisabled: false);
      expect(result1.addedTemplates, equals(1));
      expect(result1.historySkippedDueToDisabled, isTrue);
      expect(storage.isHistoryEnabled, isFalse);
      expect(storage.getHistory(), isEmpty);
      expect(storage.getTemplates().length,
          equals(2)); // Both existing and incoming exist

      // Import when enableHistoryIfDisabled is true
      final result2 =
          await storage.mergeBackup(payload, enableHistoryIfDisabled: true);
      expect(result2.addedHistory, equals(1));
      expect(storage.isHistoryEnabled, isTrue);
      expect(storage.getHistory().length, equals(1));
    });
    test('mergeBackup preserves local records on matching keys', () async {
      final now = DateTime.now();
      await storage.saveTemplate(WriteTemplate(
        id: 'same',
        name: 'Yerel',
        createdAt: now,
        records: [],
      ));
      await storage.saveTagRule(TagRule(
        ndefSha256: 'a' * 64,
        note: 'Yerel not',
        createdAt: now,
        updatedAt: now,
      ));
      await storage.mergeBackup(BackupPayload(
        schemaVersion: 1,
        exportedAt: now,
        templates: [
          WriteTemplate(
            id: 'same',
            name: 'Yedek',
            createdAt: now,
            records: [],
          )
        ],
        tagRules: [
          TagRule(
            ndefSha256: 'a' * 64,
            note: 'Yedek not',
            createdAt: now,
            updatedAt: now,
          )
        ],
      ));
      expect(storage.getTemplates().single.name, 'Yerel');
      expect(storage.getTagRuleBySha256('a' * 64)?.note, 'Yerel not');
    });
  });
}
