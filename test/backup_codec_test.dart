import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/domain/ndef_record.dart';
import 'package:nfc_tag_master/domain/storage_models.dart';
import 'package:nfc_tag_master/domain/tag_rule.dart';
import 'package:nfc_tag_master/services/backup_codec.dart';

void main() {
  group('BackupCodec - Serialization and Hash Calculation', () {
    test('computes deterministic SHA-256 for exact NDEF bytes', () {
      final records = [
        NdefCodec.encodeText('Örnek Etiket', langCode: 'tr'),
      ];
      final bytes = encodeNdefMessage(records);
      final hash1 = BackupCodec.computeNdefSha256(bytes);
      final hash2 = BackupCodec.computeNdefSha256(bytes);

      expect(hash1, equals(hash2));
      expect(hash1.length, equals(64));
      expect(RegExp(r'^[0-9a-f]{64}$').hasMatch(hash1), isTrue);
    });

    test('encodes valid backup JSON with schema version 1', () {
      final template = WriteTemplate(
        id: 'tpl-1',
        name: 'Ofis Wi-Fi',
        createdAt: DateTime(2026, 3, 30, 10, 0, 0),
        records: [
          NdefCodec.encodeWifiWsc(
            ssid: 'OfficeNet',
            authType: WifiAuthType.wpa2Psk,
            password: 'SecretWifiPass123',
          ),
        ],
      );

      final rule = TagRule(
        ndefSha256: 'a' * 64,
        note: 'Giriş Kapısı Etiketi',
        createdAt: DateTime(2026, 3, 30, 11, 0, 0),
        updatedAt: DateTime(2026, 3, 30, 11, 0, 0),
      );

      final jsonStr = BackupCodec.encodeBackup(
        templates: [template],
        tagRules: [rule],
        clientAppVersion: '1.0.0+1',
      );

      expect(jsonStr, contains('"schemaVersion": 1'));
      expect(jsonStr, contains('"app": "nfc_tag_master"'));
      expect(jsonStr, contains('Ofis Wi-Fi'));
      expect(jsonStr, contains('Giriş Kapısı Etiketi'));

      // Validate decode
      final payload = BackupCodec.decodeAndValidate(jsonStr);
      expect(payload.schemaVersion, equals(1));
      expect(payload.templates.length, equals(1));
      expect(payload.templates.first.name, equals('Ofis Wi-Fi'));
      expect(payload.tagRules?.length, equals(1));
      expect(payload.tagRules?.first.note, equals('Giriş Kapısı Etiketi'));
      expect(payload.history, isNull);
    });

    test('preserves optional scan history when provided in export', () {
      final historyEntry = ScanHistoryEntry(
        id: 'hist-1',
        timestamp: DateTime(2026, 3, 30, 12, 0, 0),
        identifier: '04A1B2C3D4E5',
        standardTechnologies: ['NfcA'],
        isNdefSupported: true,
        isWritable: true,
        maxByteCapacity: 512,
        currentBytesUsed: 50,
        records: [
          NdefCodec.encodeUri('https://example.com/item/42'),
        ],
      );

      final jsonStr = BackupCodec.encodeBackup(
        templates: [],
        history: [historyEntry],
      );

      final payload = BackupCodec.decodeAndValidate(jsonStr);
      expect(payload.history?.length, equals(1));
      expect(payload.history?.first.identifier, equals('04A1B2C3D4E5'));
      expect(payload.history?.first.records.length, equals(1));
      final parsed =
          NdefCodec.parseRecord(payload.history!.first.records.first);
      expect(parsed.type, equals(ParsedRecordType.url));
      expect(parsed.content, equals('https://example.com/item/42'));
    });
  });

  group('BackupCodec - Strict Validation and Security Boundaries', () {
    test('rejects malformed date fields with a validation error', () {
      const invalidDate =
          '{"schemaVersion":1,"templates":[{"id":"t","name":"N","createdAt":42,"records":[]}]}';
      expect(
        () => BackupCodec.decodeAndValidate(invalidDate),
        throwsA(isA<BackupValidationException>()),
      );
    });
    test('rejects JSON exceeding 2 MiB byte size', () {
      // Create a payload string that exceeds 2 MiB (2 * 1024 * 1024 = 2097152 bytes)
      final hugeString = 'x' * (2 * 1024 * 1024 + 10);
      expect(
        () => BackupCodec.decodeAndValidate(hugeString),
        throwsA(isA<BackupValidationException>().having(
          (e) => e.message,
          'message',
          contains('2 MiB'),
        )),
      );
    });

    test('rejects missing or unsupported schema version', () {
      const invalidVersionJson = '''
      {
        "schemaVersion": 2,
        "templates": []
      }
      ''';
      expect(
        () => BackupCodec.decodeAndValidate(invalidVersionJson),
        throwsA(isA<BackupValidationException>().having(
          (e) => e.message,
          'message',
          contains('Desteklenmeyen yedek şema sürümü: 2'),
        )),
      );

      const noVersionJson = '''
      {
        "templates": []
      }
      ''';
      expect(
        () => BackupCodec.decodeAndValidate(noVersionJson),
        throwsA(isA<BackupValidationException>().having(
          (e) => e.message,
          'message',
          contains('"schemaVersion" alanı eksik'),
        )),
      );
    });

    test('rejects invalid Base64 in record payloads', () {
      const corruptBase64Json = '''
      {
        "schemaVersion": 1,
        "templates": [
          {
            "id": "tpl-bad",
            "name": "Bozuk Şablon",
            "createdAt": "2026-03-30T10:00:00.000Z",
            "records": [
              {
                "tnf": 1,
                "type": "VGV4dA==",
                "id": "",
                "payload": "!!!NOT_VALID_BASE64!!!"
              }
            ]
          }
        ]
      }
      ''';
      expect(
        () => BackupCodec.decodeAndValidate(corruptBase64Json),
        throwsA(isA<BackupValidationException>().having(
          (e) => e.message,
          'message',
          contains('geçerli Base64 verisi değil'),
        )),
      );
    });

    test('rejects invalid TNF value out of enum range', () {
      const badTnfJson = '''
      {
        "schemaVersion": 1,
        "templates": [
          {
            "id": "tpl-bad-tnf",
            "name": "Bozuk TNF",
            "createdAt": "2026-03-30T10:00:00.000Z",
            "records": [
              {
                "tnf": 999,
                "type": "",
                "id": "",
                "payload": ""
              }
            ]
          }
        ]
      }
      ''';
      expect(
        () => BackupCodec.decodeAndValidate(badTnfJson),
        throwsA(isA<BackupValidationException>().having(
          (e) => e.message,
          'message',
          contains('Geçersiz TNF değeri'),
        )),
      );
    });

    test('rejects invalid SHA-256 in tag rules', () {
      const badShaJson = '''
      {
        "schemaVersion": 1,
        "tagRules": [
          {
            "ndefSha256": "not-a-valid-sha-256",
            "note": "Test"
          }
        ]
      }
      ''';
      expect(
        () => BackupCodec.decodeAndValidate(badShaJson),
        throwsA(isA<BackupValidationException>().having(
          (e) => e.message,
          'message',
          contains('64 karakterli SHA-256'),
        )),
      );
    });
  });
}
