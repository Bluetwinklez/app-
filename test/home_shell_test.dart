import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/controllers/nfc_controller.dart';
import 'package:nfc_tag_master/main.dart';
import 'package:nfc_tag_master/services/app_storage_service.dart';
import 'phase2_storage_and_history_test.dart' show MockNfcPlatformService;

void main() {
  testWidgets('every section renders at iPhone size without layout errors', (tester) async {
    tester.view.physicalSize = const Size(1179, 2556);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);

    final storage = InMemoryAppStorageService();
    await storage.setOnboardingDone(true);
    await storage.setLocaleCode('tr');
    final controller = NfcStateController(
      service: MockNfcPlatformService(),
      storage: storage,
    );
    await tester.pumpWidget(NfcTagMasterApp(controller: controller));
    await tester.pumpAndSettle();

    expect(find.text('Etiketi Tara'), findsOneWidget);
    expect(find.text('NFC Hazır'), findsOneWidget);

    for (final label in ['Yaz', 'Araçlar', 'Geçmiş', 'Ayarlar', 'Oku']) {
      await tester.tap(find.text(label).last);
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull, reason: 'section $label');
    }

    await tester.tap(find.text('Araçlar').last);
    await tester.pumpAndSettle();
    expect(find.text('Etiket Kopyala'), findsOneWidget);
    final toolsList =
        find.ancestor(of: find.text('Etiket Kopyala'), matching: find.byType(Scrollable)).first;
    await tester.scrollUntilVisible(find.text('Belleği Oku'), 200, scrollable: toolsList);
    expect(find.text('Belleği Oku'), findsOneWidget);
    await tester.scrollUntilVisible(find.text('Şifre Belirle'), 200, scrollable: toolsList);
    expect(find.text('Şifre Belirle'), findsOneWidget);
  });

  testWidgets('first launch shows onboarding, finishing opens the app once', (tester) async {
    tester.view.physicalSize = const Size(1179, 2556);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);

    final storage = InMemoryAppStorageService();
    await storage.setLocaleCode('tr');
    final controller = NfcStateController(service: MockNfcPlatformService(), storage: storage);
    await tester.pumpWidget(NfcTagMasterApp(controller: controller));
    await tester.pumpAndSettle();

    expect(find.text('Etiketi okut'), findsOneWidget);
    expect(find.text('Etiketi Tara'), findsNothing);

    await tester.tap(find.text('Geç'));
    await tester.pumpAndSettle();
    expect(find.text('Etiketi Tara'), findsOneWidget);
    expect(storage.onboardingDone, isTrue);
  });

  testWidgets('settings offer library, templates, shortcuts and theme', (tester) async {
    tester.view.physicalSize = const Size(1179, 2556);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);

    final storage = InMemoryAppStorageService();
    await storage.setOnboardingDone(true);
    await storage.setLocaleCode('tr');
    final controller = NfcStateController(service: MockNfcPlatformService(), storage: storage);
    await tester.pumpWidget(NfcTagMasterApp(controller: controller));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Ayarlar').last);
    await tester.pumpAndSettle();
    expect(find.text('Güvenlik ve gizlilik'), findsOneWidget);
    await tester.scrollUntilVisible(find.text('Koyu'), 300, scrollable: find.byType(Scrollable).last);
    await tester.pumpAndSettle();
    expect(find.text('Görünüm'), findsOneWidget);

    await tester.tap(find.text('Koyu'));
    await tester.pumpAndSettle();
    expect(storage.themeMode, 'dark');
    expect(tester.takeException(), isNull);
  });
}
