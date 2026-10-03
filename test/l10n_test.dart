import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/controllers/nfc_controller.dart';
import 'package:nfc_tag_master/main.dart';
import 'package:nfc_tag_master/services/app_storage_service.dart';
import 'phase2_storage_and_history_test.dart' show MockNfcPlatformService;

void main() {
  test('every ARB key is referenced from lib/', () {
    final template = jsonDecode(File('lib/l10n/app_tr.arb').readAsStringSync()) as Map<String, dynamic>;
    final source = Directory('lib')
        .listSync(recursive: true)
        .whereType<File>()
        .where((f) => f.path.endsWith('.dart') && !f.path.contains('app_localizations'))
        .map((f) => f.readAsStringSync())
        .join('\n');
    final unused = template.keys
        .where((k) => !k.startsWith('@'))
        .where((k) => !RegExp('\\.${RegExp.escape(k)}\\b').hasMatch(source))
        .toList();
    expect(unused, isEmpty, reason: 'Unused keys: ${unused.join(', ')}');
  });

  group('ARB Localization Consistency Tests', () {
    const l10nDir = 'lib/l10n';
    const templateFileName = 'app_tr.arb';
    final templateFile = File('$l10nDir/$templateFileName');

    late Map<String, dynamic> templateJson;
    late Set<String> templateKeys;

    setUpAll(() {
      expect(templateFile.existsSync(), isTrue, reason: 'Template ARB $templateFileName must exist');
      templateJson = json.decode(templateFile.readAsStringSync()) as Map<String, dynamic>;
      // Filter out metadata keys starting with @
      templateKeys = templateJson.keys.where((k) => !k.startsWith('@')).toSet();
    });

    const supportedLanguages = NfcStateController.supportedLanguageCodes;

    for (final code in supportedLanguages) {
      test('Language ARB for "$code" is consistent with template', () {
        final arbFile = File('$l10nDir/app_$code.arb');
        expect(arbFile.existsSync(), isTrue, reason: 'ARB file for $code must exist');

        final content = arbFile.readAsStringSync();
        final Map<String, dynamic> arbJson = json.decode(content) as Map<String, dynamic>;
        final keys = arbJson.keys.where((k) => !k.startsWith('@')).toSet();

        // 1. Exactly the same keys as app_tr.arb
        expect(keys, equals(templateKeys), reason: 'Keys in app_$code.arb must exactly match app_tr.arb');

        // 2. No value is empty
        for (final key in keys) {
          final val = arbJson[key];
          expect(val is String, isTrue, reason: 'Key $key in $code must have a string value');
          final str = val as String;
          expect(str.trim().isNotEmpty, isTrue, reason: 'Value for key "$key" in $code must not be empty');

          // 3. Placeholders match template
          final meta = templateJson['@$key'] as Map<String, dynamic>?;
          final templateVal = templateJson[key] as String;
          final templatePlaceholders = _extractPlaceholders(templateVal, meta);
          final langPlaceholders = _extractPlaceholders(str, meta);
          expect(
            langPlaceholders,
            equals(templatePlaceholders),
            reason: 'Placeholders for key "$key" in $code must match template: expected $templatePlaceholders, got $langPlaceholders',
          );
        }
      });
    }
  });

  group('Multi-Language Layout & No Overflow Widget Tests', () {
    for (final lang in ['en', 'de', 'ar']) {
      testWidgets('visits all 5 bottom navigation tabs in "$lang" without overflow at iPhone size', (tester) async {
        // iPhone size: 1179 x 2556, dpr 3
        tester.view.physicalSize = const Size(1179, 2556);
        tester.view.devicePixelRatio = 3.0;
        addTearDown(tester.view.reset);

        final storage = InMemoryAppStorageService();
        await storage.setLocaleCode(lang);

        final controller = NfcStateController(
          service: MockNfcPlatformService(),
          storage: storage,
        );

        await tester.pumpWidget(NfcTagMasterApp(controller: controller));
        await tester.pumpAndSettle();

        expect(tester.takeException(), isNull, reason: 'Initial load in $lang had exception');

        // Visit each bottom navigation destination by tapping each of the 5 nav items
        // The floating nav bar has 5 expanded items inside the nav row
        final navItems = find.byType(InkResponse);
        expect(navItems, findsAtLeastNWidgets(5));

        for (int i = 0; i < 5; i++) {
          await tester.tap(navItems.at(i));
          await tester.pumpAndSettle();
          expect(tester.takeException(), isNull, reason: 'Tab $i in $lang resulted in an exception / overflow');
        }
      });
    }
  });
}

Set<String> _extractPlaceholders(String text, [Map<String, dynamic>? meta]) {
  if (meta != null && meta['placeholders'] != null) {
    final ph = meta['placeholders'] as Map<String, dynamic>;
    return ph.keys.toSet();
  }
  // Fallback regex matching {varName} or {varName, plural, ...}
  final reg = RegExp(r'\{([a-zA-Z_][a-zA-Z0-9_]*)');
  final matches = reg.allMatches(text);
  final keywords = {'plural', 'select', 'other'};
  return matches.map((m) => m.group(1)!).where((name) => !keywords.contains(name)).toSet();

}
