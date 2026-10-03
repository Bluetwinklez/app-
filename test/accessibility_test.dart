import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/controllers/nfc_controller.dart';
import 'package:nfc_tag_master/main.dart';
import 'package:nfc_tag_master/services/app_storage_service.dart';
import 'phase2_storage_and_history_test.dart' show MockNfcPlatformService;

/// Large Dynamic Type on a small iPhone (SE) in a long-word language.
void main() {
  for (final lang in ['tr', 'de', 'ru']) {
    testWidgets('all tabs fit with 1.6x text on iPhone SE ($lang)', (tester) async {
      tester.view.physicalSize = const Size(750, 1334);
      tester.view.devicePixelRatio = 2;
      tester.platformDispatcher.textScaleFactorTestValue = 1.6;
      addTearDown(tester.view.reset);
      addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);

      final storage = InMemoryAppStorageService();
      await storage.setOnboardingDone(true);
      await storage.setLocaleCode(lang);
      final controller = NfcStateController(service: MockNfcPlatformService(), storage: storage);
      await tester.pumpWidget(NfcTagMasterApp(controller: controller));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull, reason: 'home');

      for (int i = 0; i < 5; i++) {
        await tester.tap(find.byKey(ValueKey('nav-$i')));
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull, reason: 'tab $i');
      }
    });
  }
}
