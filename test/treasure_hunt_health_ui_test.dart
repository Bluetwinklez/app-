import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/controllers/nfc_controller.dart';
import 'package:nfc_tag_master/domain/ndef_record.dart';
import 'package:nfc_tag_master/domain/nfc_tag_info.dart';
import 'package:nfc_tag_master/domain/treasure_hunt.dart';
import 'package:nfc_tag_master/l10n/app_localizations.dart';
import 'package:nfc_tag_master/services/app_storage_service.dart';
import 'package:nfc_tag_master/ui/tag_health_page.dart';
import 'package:nfc_tag_master/ui/treasure_hunt_page.dart';
import 'phase2_storage_and_history_test.dart' show MockNfcPlatformService;

Widget _app(Widget home) => MaterialApp(
      locale: const Locale('en'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: home,
    );

void main() {
  testWidgets('health check scans and shows a score with findings', (tester) async {
    final storage = InMemoryAppStorageService();
    final service = MockNfcPlatformService()
      ..nextScanResult = NfcTagInfo(
        identifier: '04AABB',
        isNdefSupported: true,
        isWritable: true,
        maxByteCapacity: 144,
        currentBytesUsed: 30,
        records: [NdefCodec.encodeUri('https://example.com')],
      );
    final controller = NfcStateController(service: service, storage: storage);
    await controller.init();
    await tester.pumpWidget(_app(TagHealthPage(controller: controller)));
    await tester.tap(find.text('Scan tag'));
    await tester.pumpAndSettle();
    expect(find.text('100'), findsOneWidget);
    expect(find.text('This tag is healthy and ready to use.'), findsOneWidget);
    expect(find.text('114 of 144 bytes free'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('treasure hunts: create one and play it to the end', (tester) async {
    final storage = InMemoryAppStorageService();
    final service = MockNfcPlatformService();
    final controller = NfcStateController(service: service, storage: storage);
    await controller.init();
    await tester.pumpWidget(_app(TreasureHuntsPage(controller: controller)));

    await tester.tap(find.text('New hunt'));
    await tester.pumpAndSettle();
    final fields = find.byType(TextField);
    await tester.enterText(fields.at(0), 'Garden');
    await tester.enterText(fields.at(1), 'Look under the mat');
    await tester.enterText(fields.at(2), 'Check the mailbox');
    await tester.enterText(fields.at(3), 'You win!');
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    expect(find.text('Garden'), findsOneWidget);
    final hunt = TreasureHunt.decodeAll(storage.treasureHuntsJson).single;
    expect(hunt.clues, ['Check the mailbox', 'You win!']);

    await tester.tap(find.text('Play'));
    await tester.pumpAndSettle();
    expect(find.text('Look under the mat'), findsOneWidget);

    for (var i = 0; i < hunt.stations; i++) {
      service.nextScanResult = NfcTagInfo(
        identifier: '04$i',
        isNdefSupported: true,
        records: hunt.recordsFor(i, langCode: 'en'),
      );
      await tester.tap(find.text('Scan the tag you found'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));
    }
    await tester.pump(const Duration(seconds: 1));
    expect(find.text('You win!'), findsOneWidget);
    await tester.tap(find.text('Finish'));
    await tester.pumpAndSettle();
    expect(TreasureHunt.decodeAll(storage.treasureHuntsJson).single.bestTime, isNotNull);
    expect(tester.takeException(), isNull);
  });
}
