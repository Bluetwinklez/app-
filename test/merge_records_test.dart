import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/domain/ndef_record.dart';
import 'package:nfc_tag_master/l10n/app_localizations.dart';
import 'package:nfc_tag_master/ui/merge_records_page.dart';

void main() {
  testWidgets('records are returned in the order they were picked', (tester) async {
    List<NdefRecordModel>? result;
    await tester.pumpWidget(MaterialApp(
      locale: const Locale('en'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Builder(
        builder: (context) => TextButton(
          onPressed: () async => result = await MergeRecordsPage.open(context, [
            ('Door', [NdefCodec.encodeUri('https://a.com'), NdefCodec.encodeText('first')]),
            ('Wi-Fi', [NdefCodec.encodePhone('+90555')]),
          ]),
          child: const Text('go'),
        ),
      ),
    ));
    await tester.tap(find.text('go'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('+90555'));
    await tester.tap(find.text('https://a.com'));
    await tester.pump();
    await tester.tap(find.text('Merge (2)'));
    await tester.pumpAndSettle();
    expect(result!.map((r) => NdefCodec.parseRecord(r).content), ['+90555', 'https://a.com']);
  });
}
