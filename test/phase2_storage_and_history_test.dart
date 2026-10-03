import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/domain/ndef_record.dart';
import 'package:nfc_tag_master/domain/nfc_tag_info.dart';
import 'package:nfc_tag_master/domain/storage_models.dart';
import 'package:nfc_tag_master/services/app_storage_service.dart';
import 'package:nfc_tag_master/services/nfc_service.dart';
import 'package:nfc_tag_master/controllers/nfc_controller.dart';

class MockNfcPlatformService implements NfcPlatformService {
  NfcAvailability availability = NfcAvailability.available;
  NfcTagInfo? nextScanResult;
  NfcWriteResult? nextWriteResult;
  List<NdefRecordModel>? lastWrittenRecords;

  @override
  Future<NfcAvailability> checkAvailability() async => availability;

  @override
  Future<NfcTagInfo> scanTag({String? promptMessage}) async {
    return nextScanResult ??
        const NfcTagInfo(
          identifier: '04A1B2C3D4',
          isNdefSupported: true,
          isWritable: true,
          records: [],
        );
  }

  @override
  Future<NfcWriteResult> writeTag({
    required List<NdefRecordModel> records,
    String? promptMessage,
    bool verifyReadAfterWrite = true,
  }) async {
    lastWrittenRecords = records;
    return nextWriteResult ??
        const NfcWriteResult(
          isSuccess: true,
          message: 'Başarılı',
          bytesWritten: 120,
          verificationPassed: true,
        );
  }

  @override
  Future<NfcWriteResult> clearTag({
    String? promptMessage,
  }) async {
    return const NfcWriteResult(
      isSuccess: true,
      message: 'Sıfırlandı',
      bytesWritten: 0,
      verificationPassed: true,
    );
  }

  int lockCalls = 0;
  final List<Uint8List> sentCommands = [];
  Uint8List Function(Uint8List command)? rawResponder;
  bool rawSessionOpen = false;
  String? lastRawError;

  @override
  Future<String> startRawSession({String? promptMessage}) async {
    rawSessionOpen = true;
    return '04:A1:B2';
  }

  @override
  Future<Uint8List> transceive(Uint8List command) async {
    sentCommands.add(command);
    return rawResponder?.call(command) ?? Uint8List.fromList([0x0A]);
  }

  @override
  Future<void> endRawSession({String? errorMessage, String? successMessage}) async {
    rawSessionOpen = false;
    lastRawError = errorMessage;
  }

  @override
  Future<NfcWriteResult> lockTag({
    String? promptMessage,
  }) async {
    lockCalls++;
    return nextWriteResult ??
        const NfcWriteResult(isSuccess: true, message: 'Kilitlendi');
  }

  @override
  Future<void> cancelSession() async {}
}

void main() {
  group('NDEF Exact Serialization Roundtrip Tests (TNF, Type, Id, Payload)', () {
    test('Exact roundtrip preservation of binary TNF, type, id, and payload', () {
      final sampleRecord = NdefRecordModel(
        tnf: NdefTnf.media,
        type: Uint8List.fromList(utf8.encode('application/vnd.custom.type')),
        id: Uint8List.fromList([0xAA, 0xBB, 0xCC, 0x01]),
        payload: Uint8List.fromList([0x00, 0xFF, 0x42, 0x13, 0x37, 0xDE, 0xAD, 0xBE, 0xEF]),
      );

      final jsonMap = sampleRecord.toJsonMap();
      expect(jsonMap['tnf'], equals(NdefTnf.media.index));

      final restored = NdefRecordModel.fromJsonMap(jsonMap);

      expect(restored.tnf, equals(sampleRecord.tnf));
      expect(restored.type, equals(sampleRecord.type));
      expect(restored.id, equals(sampleRecord.id));
      expect(restored.payload, equals(sampleRecord.payload));
    });

    test('ScanHistoryEntry preserves full structure and multiple records in JSON roundtrip', () {
      final textRec = NdefCodec.encodeText('Giriş Bileti', langCode: 'tr');
      final urlRec = NdefCodec.encodeUri('https://etkinlik.org/bilet/987');
      final originalEntry = ScanHistoryEntry(
        id: 'scan-12345',
        timestamp: DateTime(2026, 9, 30, 15, 30),
        identifier: '04F2E1A98765',
        standardTechnologies: ['IsoDep', 'NfcA'],
        isNdefSupported: true,
        isWritable: false,
        maxByteCapacity: 512,
        currentBytesUsed: 128,
        records: [textRec, urlRec],
      );

      final jsonMap = originalEntry.toJsonMap();
      final restored = ScanHistoryEntry.fromJsonMap(jsonMap);

      expect(restored.id, equals('scan-12345'));
      expect(restored.identifier, equals('04F2E1A98765'));
      expect(restored.isNdefSupported, isTrue);
      expect(restored.isWritable, isFalse);
      expect(restored.maxByteCapacity, equals(512));
      expect(restored.currentBytesUsed, equals(128));
      expect(restored.records.length, equals(2));
      expect(NdefCodec.decodeText(restored.records[0]), equals('Giriş Bileti'));
      expect(NdefCodec.decodeUri(restored.records[1]), equals('https://etkinlik.org/bilet/987'));
    });

    test('WriteTemplate preserves name, timestamp, and records in JSON roundtrip', () {
      final smsRec = NdefCodec.encodeSms(phoneNumber: '+905550001122', message: 'Şablon Mesajı');
      final originalTemplate = WriteTemplate(
        id: 'template-001',
        name: 'SMS Acil Durum',
        createdAt: DateTime(2026, 9, 30, 16, 0),
        records: [smsRec],
      );

      final jsonMap = originalTemplate.toJsonMap();
      final restored = WriteTemplate.fromJsonMap(jsonMap);

      expect(restored.id, equals('template-001'));
      expect(restored.name, equals('SMS Acil Durum'));
      expect(restored.records.length, equals(1));
      final parsed = NdefCodec.parseRecord(restored.records[0]);
      expect(parsed.type, equals(ParsedRecordType.sms));
      expect(parsed.content, equals('+905550001122'));
      expect(parsed.extra['message'], equals('Şablon Mesajı'));
    });
  });

  group('Scan History Policy & Error Avoidance Tests', () {
    late InMemoryAppStorageService storage;
    late MockNfcPlatformService mockNfc;
    late NfcStateController controller;

    setUp(() async {
      storage = InMemoryAppStorageService();
      await storage.init();
      mockNfc = MockNfcPlatformService();
      controller = NfcStateController(service: mockNfc, storage: storage);
      await controller.init();
    });

    test('History is disabled by default and successful scans are NOT saved', () async {
      // Requirement: Do not store history by default unless user enables it in settings
      expect(storage.isHistoryEnabled, isFalse);
      expect(storage.getHistory(), isEmpty);

      mockNfc.nextScanResult = NfcTagInfo(
        identifier: '04AABBCCDD',
        isNdefSupported: true,
        isWritable: true,
        records: [NdefCodec.encodeText('Test')],
      );

      await controller.scanTag();

      expect(controller.lastScannedTag, isNotNull);
      expect(controller.lastScannedTag!.identifier, equals('04AABBCCDD'));
      // History must remain empty
      expect(storage.getHistory(), isEmpty);
    });

    test('When history is explicitly enabled, successful scans are recorded', () async {
      await storage.setHistoryEnabled(true);
      expect(storage.isHistoryEnabled, isTrue);

      final testRecord = NdefCodec.encodeText('Kaydedilen Başarılı Tarama');
      mockNfc.nextScanResult = NfcTagInfo(
        identifier: '0411223344',
        isNdefSupported: true,
        isWritable: true,
        maxByteCapacity: 256,
        currentBytesUsed: 40,
        records: [testRecord],
      );

      await controller.scanTag();

      expect(storage.getHistory().length, equals(1));
      final entry = storage.getHistory().first;
      expect(entry.identifier, equals('0411223344'));
      expect(entry.records.length, equals(1));
      expect(NdefCodec.decodeText(entry.records[0]), equals('Kaydedilen Başarılı Tarama'));
    });

    test('Avoid storing scans with errors even when history is enabled', () async {
      // Requirement: Avoid storing scans with errors
      await storage.setHistoryEnabled(true);
      expect(storage.isHistoryEnabled, isTrue);

      mockNfc.nextScanResult = const NfcTagInfo(
        identifier: 'Hata',
        records: [],
        error: 'Etiket bağlantısı koptu (Tag lost)',
      );

      await controller.scanTag();

      expect(controller.lastScannedTag?.error, isNotNull);
      // History must still be empty because the scan resulted in an error
      expect(storage.getHistory(), isEmpty);
    });

    test('History clear and delete controls operate correctly', () async {
      await storage.setHistoryEnabled(true);

      mockNfc.nextScanResult = NfcTagInfo(
        identifier: 'TAG-1',
        isNdefSupported: true,
        isWritable: true,
        records: [NdefCodec.encodeText('İlk')],
      );
      await controller.scanTag();

      mockNfc.nextScanResult = NfcTagInfo(
        identifier: 'TAG-2',
        isNdefSupported: true,
        isWritable: true,
        records: [NdefCodec.encodeText('İkinci')],
      );
      await controller.scanTag();

      expect(storage.getHistory().length, equals(2));

      // Delete specific entry
      final firstId = storage.getHistory().first.id;
      await storage.deleteHistoryEntry(firstId);
      expect(storage.getHistory().length, equals(1));

      // Clear all
      await storage.clearHistory();
      expect(storage.getHistory(), isEmpty);
    });
  });

  group('Reusable Write Templates Tests', () {
    late InMemoryAppStorageService storage;

    setUp(() async {
      storage = InMemoryAppStorageService();
      await storage.init();
    });

    test('Templates are explicitly saved, retrieved, and deleted by user', () async {
      expect(storage.getTemplates(), isEmpty);

      final template1 = WriteTemplate(
        id: 'tpl-1',
        name: 'Şirket Web Sitesi',
        createdAt: DateTime.now(),
        records: [NdefCodec.encodeUri('https://sirket.com')],
      );

      final template2 = WriteTemplate(
        id: 'tpl-2',
        name: 'Ofis Wi-Fi / İletişim',
        createdAt: DateTime.now(),
        records: [
          NdefCodec.encodePhone('+902120000000'),
          NdefCodec.encodeEmail(recipient: 'ofis@sirket.com'),
        ],
      );

      await storage.saveTemplate(template1);
      await storage.saveTemplate(template2);

      expect(storage.getTemplates().length, equals(2));
      expect(storage.getTemplates()[1].name, equals('Şirket Web Sitesi'));
      expect(storage.getTemplates()[0].name, equals('Ofis Wi-Fi / İletişim'));

      // Delete template
      await storage.deleteTemplate('tpl-1');
      expect(storage.getTemplates().length, equals(1));
      expect(storage.getTemplates().first.id, equals('tpl-2'));

      // Clear all templates
      await storage.clearTemplates();
      expect(storage.getTemplates(), isEmpty);
    });
  });

  test('blank tag write offers formatting and writes in one raw session', () async {
    final mock = MockNfcPlatformService();
    final controller = NfcStateController(service: mock, storage: InMemoryAppStorageService());
    await controller.init();

    mock.nextWriteResult = const NfcWriteResult(
      isSuccess: false,
      message: 'not formatted',
      errorCode: 'NOT_NDEF_FORMATTED',
    );
    final ok = await controller.writeRecords([NdefCodec.encodeText('Merhaba')]);
    expect(ok, isFalse);
    expect(controller.lastWriteResult!.needsFormatting, isTrue);

    // GET_VERSION -> NTAG213, every READ returns zeros, WRITE acks
    mock.rawResponder = (cmd) {
      if (cmd[0] == 0x60) return Uint8List.fromList([0, 4, 4, 2, 1, 0, 0x0F, 3]);
      if (cmd[0] == 0x30) return Uint8List(16);
      return Uint8List.fromList([0x0A]);
    };
    // Verification will fail because the mock memory does not store writes
    final written = await controller.formatAndWriteRecords([NdefCodec.encodeText('Merhaba')]);
    expect(written, isFalse);
    expect(mock.sentCommands.any((c) => c[0] == 0xA2 && c[1] == 3), isTrue, reason: 'CC written');
    expect(mock.sentCommands.any((c) => c[0] == 0xA2 && c[1] == 4), isTrue, reason: 'TLV written');
    expect(mock.rawSessionOpen, isFalse);
  });
}
