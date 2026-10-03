import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/controllers/nfc_controller.dart';
import 'package:nfc_tag_master/main.dart';
import 'package:nfc_tag_master/services/app_storage_service.dart';
import 'phase2_storage_and_history_test.dart' show MockNfcPlatformService;

void main() {
  testWidgets('simple mode shows one big button and exits on long press', (tester) async {
    tester.view.physicalSize = const Size(1179, 2556);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);
    final storage = InMemoryAppStorageService();
    await storage.setOnboardingDone(true);
    await storage.setLocaleCode('tr');
    await storage.setSimpleMode(true);
    final controller = NfcStateController(service: MockNfcPlatformService(), storage: storage);
    await tester.pumpWidget(NfcTagMasterApp(controller: controller));
    await tester.pumpAndSettle();

    expect(find.text('Etiketi Okut'), findsOneWidget);
    expect(find.text('Araçlar'), findsNothing, reason: 'no tab bar');
    expect(tester.takeException(), isNull);

    await tester.longPress(find.text('Normal görünüme dönmek için basılı tutun'));
    await tester.pumpAndSettle();
    expect(storage.simpleMode, isFalse);
    expect(find.text('Araçlar'), findsWidgets);
  });
}
