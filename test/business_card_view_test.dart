import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/domain/ndef_record.dart';
import 'package:nfc_tag_master/l10n/app_localizations.dart';
import 'package:nfc_tag_master/ui/business_card_view.dart';

void main() {
  testWidgets('vCard shows name, role and actions', (tester) async {
    final card = NdefCodec.encodeVCard(
      formattedName: 'Ayşe Yılmaz',
      firstName: 'Ayşe',
      lastName: 'Yılmaz',
      phone: '+905551112233',
      email: 'a@b.com',
      organization: 'NFC Ltd',
      title: 'Product Manager',
    );
    expect(BusinessCardView.find([NdefCodec.encodeText('x'), card]), same(card));
    await tester.pumpWidget(MaterialApp(
      locale: const Locale('en'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(body: BusinessCardView(record: card)),
    ));
    expect(find.textContaining('Ayşe'), findsOneWidget);
    expect(find.text('AY'), findsOneWidget);
    expect(find.text('Product Manager · NFC Ltd'), findsOneWidget);
    expect(find.text('Call'), findsOneWidget);
    expect(find.text('Add to contacts'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
