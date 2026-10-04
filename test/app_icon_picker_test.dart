import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/l10n/app_localizations.dart';
import 'package:nfc_tag_master/ui/app_icon_picker.dart';

void main() {
  testWidgets('choosing an icon calls the native switch', (tester) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    final calls = <MethodCall>[];
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
        const MethodChannel('com.antigravity.nfc_tag_master/launch'), (call) async {
      calls.add(call);
      return call.method == 'setAppIcon' ? true : null;
    });
    await tester.pumpWidget(const MaterialApp(
      locale: Locale('en'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(body: AppIconPicker()),
    ));
    await tester.pumpAndSettle();
    expect(AppIconPicker.supported, isTrue);
    await tester.tap(find.text('Night'));
    await tester.pumpAndSettle();
    final set = calls.singleWhere((c) => c.method == 'setAppIcon');
    expect(set.arguments, {'name': 'AppIcon-Dark'});
    debugDefaultTargetPlatformOverride = null;
  });

  test('every option has a preview asset on disk', () {
    for (final (_, asset, _) in AppIconPicker.options) {
      expect(File(asset).existsSync(), isTrue, reason: asset);
    }
  });
}
