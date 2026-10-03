import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/domain/tag_library.dart';
import 'package:nfc_tag_master/l10n/app_localizations.dart';
import 'package:nfc_tag_master/ui/tag_map_page.dart';

void main() {
  Widget app(List<TagLibraryEntry> entries) => MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: TagMapPage(entries: entries),
      );

  testWidgets('shows a hint when no tag has a position', (tester) async {
    final now = DateTime(2026);
    await tester.pumpWidget(app([TagLibraryEntry(id: '1', name: 'x', createdAt: now, updatedAt: now)]));
    await tester.pump();
    expect(find.textContaining('Add current location'), findsOneWidget);
  });

  testWidgets('places a marker per positioned tag', (tester) async {
    final now = DateTime(2026);
    await tester.pumpWidget(app([
      TagLibraryEntry(id: '1', name: 'Door', latitude: 41.0, longitude: 29.0, createdAt: now, updatedAt: now),
      TagLibraryEntry(id: '2', name: 'Desk', latitude: 41.001, longitude: 29.001, createdAt: now, updatedAt: now),
    ]));
    await tester.pump();
    expect(find.byIcon(Icons.location_on), findsNWidgets(2));
  });
}
