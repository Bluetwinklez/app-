import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/l10n/app_localizations.dart';
import 'package:nfc_tag_master/services/app_storage_service.dart';
import 'package:nfc_tag_master/ui/everyday_tools_page.dart';

Widget _app(Widget home) => MaterialApp(
      locale: const Locale('en'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: home,
    );

void main() {
  testWidgets('unit converter converts as you type', (tester) async {
    await tester.pumpWidget(_app(const UnitConverterPage()));
    await tester.enterText(find.byType(TextField), '2');
    await tester.pump();
    expect(find.text('0.002'), findsOneWidget); // 2 m -> km
    await tester.tap(find.text('Temperature'));
    await tester.pump();
    await tester.enterText(find.byType(TextField), '100');
    await tester.pump();
    expect(find.text('212'), findsOneWidget); // °C -> °F
    expect(tester.takeException(), isNull);
  });

  testWidgets('bill split shows the share per person', (tester) async {
    await tester.pumpWidget(_app(const BillSplitPage()));
    await tester.enterText(find.byType(TextField), '300');
    await tester.pump();
    expect(find.text('165.00'), findsOneWidget); // 300 + 10% / 2
    await tester.tap(find.byIcon(Icons.add_circle_outline));
    await tester.pump();
    expect(find.text('110.00'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('password generator, random picker and tally counter render', (tester) async {
    final storage = InMemoryAppStorageService();
    await tester.pumpWidget(_app(PasswordGeneratorPage(storage: storage)));
    expect(find.text('Very strong'), findsOneWidget);

    await tester.pumpWidget(_app(const RandomPickerPage()));
    await tester.tap(find.text('Roll'));
    await tester.pump();
    await tester.scrollUntilVisible(find.text('Draw'), 200, scrollable: find.byType(Scrollable).first);
    await tester.enterText(find.byType(TextField), 'Ann\nBob');
    await tester.tap(find.text('Draw'));
    await tester.pump();
    await tester.scrollUntilVisible(find.text('Winner'), 200, scrollable: find.byType(Scrollable).first);
    expect(find.text('Winner'), findsOneWidget);

    await tester.pumpWidget(_app(TallyCounterPage(storage: storage)));
    await tester.tap(find.text('+1'));
    await tester.tap(find.text('+1'));
    await tester.pump();
    expect(find.text('2'), findsOneWidget);
    expect(storage.tallyCount, 2);
    expect(tester.takeException(), isNull);
  });
}
