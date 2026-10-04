import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/controllers/nfc_controller.dart';
import 'package:nfc_tag_master/domain/logbook.dart';
import 'package:nfc_tag_master/domain/ndef_record.dart';
import 'package:nfc_tag_master/domain/tag_library.dart';
import 'package:nfc_tag_master/services/app_storage_service.dart';
import 'phase2_storage_and_history_test.dart' show MockNfcPlatformService;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('scanning a library tag with an auto-log book adds alternating clock entries', () async {
    final storage = InMemoryAppStorageService();
    final now = DateTime.now();
    await storage.saveLogBook(LogBook(id: 'b1', name: 'Mesai', kind: LogBookKind.timeClock, createdAt: now));
    await storage.saveLibraryEntry(TagLibraryEntry(
      id: 'e1',
      name: 'Kapı',
      uid: '04A1B2C3D4',
      autoLogBookId: 'b1',
      createdAt: now,
      updatedAt: now,
    ));
    final controller = NfcStateController(service: MockNfcPlatformService(), storage: storage);
    await controller.init();

    await controller.scanTag();
    expect(controller.lastAutoLog?.book, 'Mesai');
    expect(controller.lastAutoLog?.entry.checkIn, isTrue);
    await controller.scanTag();
    expect(controller.lastAutoLog?.entry.checkIn, isFalse);

    // The logbook page logs scans itself.
    await controller.scanTag(autoLog: false);
    expect(controller.lastAutoLog, isNull);

    final book = storage.getLogBooks().single;
    expect(book.entries.map((e) => e.label), ['Kapı', 'Kapı']);
    expect(storage.getLibrary().single.lastSeenAt, isNotNull);
  });

  test('auto-log book id survives JSON and can be cleared', () {
    final now = DateTime(2026);
    final e = TagLibraryEntry(id: '1', name: 'x', autoLogBookId: 'b', createdAt: now, updatedAt: now);
    expect(TagLibraryEntry.fromJsonMap(e.toJsonMap()).autoLogBookId, 'b');
    expect(e.copyWith(clearAutoLog: true).autoLogBookId, isNull);
  });

  test('"made with" note is appended only when enabled', () async {
    final storage = InMemoryAppStorageService();
    final service = MockNfcPlatformService();
    final controller = NfcStateController(service: service, storage: storage);
    await controller.init();
    final records = [NdefCodec.encodeUri('https://example.com')];
    await controller.writeRecords(records);
    expect(service.lastWrittenRecords, hasLength(1));
    await storage.setAddMadeWith(true);
    await controller.writeRecords(records);
    expect(service.lastWrittenRecords, hasLength(2));
    expect(storage.firstTagDone, isTrue);
  });
}
