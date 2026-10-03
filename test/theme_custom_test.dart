import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/controllers/nfc_controller.dart';
import 'package:nfc_tag_master/main.dart';
import 'package:nfc_tag_master/services/app_storage_service.dart';
import 'package:nfc_tag_master/ui/app_theme.dart';
import 'phase2_storage_and_history_test.dart' show MockNfcPlatformService;

void main() {
  testWidgets('accent colour and text size apply app-wide', (tester) async {
    final storage = InMemoryAppStorageService();
    await storage.setOnboardingDone(true);
    await storage.setLocaleCode('tr');
    final controller = NfcStateController(service: MockNfcPlatformService(), storage: storage);
    await tester.pumpWidget(NfcTagMasterApp(controller: controller));
    await tester.pumpAndSettle();

    await controller.setAccentIndex(2);
    await controller.setTextScalePercent(130);
    await tester.pumpAndSettle();
    expect(storage.accentIndex, 2);
    expect(AppColors.accent, AppColors.accentPresets[2].$1);
    final ctx = tester.element(find.text('Etiketi Tara'));
    expect(MediaQuery.textScalerOf(ctx).scale(10), closeTo(13, 0.01));
    expect(tester.takeException(), isNull);

    await controller.setTextScalePercent(400);
    expect(storage.textScalePercent, 150, reason: 'clamped');
    await controller.setAccentIndex(0);
    await tester.pumpAndSettle();
  });
}
