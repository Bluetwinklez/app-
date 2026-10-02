import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/l10n/app_localizations.dart';
import 'package:nfc_tag_master/domain/ndef_record.dart';
import 'package:nfc_tag_master/ui/compose_record_sheet.dart';

Future<void> tapAdd(WidgetTester tester) async {
  await tester.ensureVisible(find.text('Listeye Ekle'));
  await tester.pumpAndSettle();
  await tester.tap(find.text('Listeye Ekle'));
}

void main() {
  testWidgets('ComposeRecordSheet displays validation errors on invalid inputs', (WidgetTester tester) async {
    NdefRecordModel? createdRecord;

    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('tr'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: ComposeRecordSheet(
            onRecordCreated: (rec) => createdRecord = rec,
          ),
        ),
      ),
    );

    // 1. Text Record - Empty error
    await tapAdd(tester);
    await tester.pumpAndSettle();
    expect(find.text('Metin içeriği boş bırakılamaz.'), findsOneWidget);
    expect(createdRecord, isNull);

    // Enter valid text and add
    await tester.enterText(find.byType(TextField), 'Test Metni');
    await tapAdd(tester);
    await tester.pumpAndSettle();
    expect(createdRecord, isNotNull);
    expect(NdefCodec.decodeText(createdRecord!), equals('Test Metni'));
  });

  testWidgets('ComposeRecordSheet validates URL format', (WidgetTester tester) async {
    NdefRecordModel? createdRecord;

    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('tr'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: ComposeRecordSheet(
            onRecordCreated: (rec) => createdRecord = rec,
          ),
        ),
      ),
    );

    // Switch to URL
    await tester.tap(find.text('Web URL'));
    await tester.pumpAndSettle();

    // Enter invalid URL
    await tester.enterText(find.byType(TextField), 'invalid-url');
    await tapAdd(tester);
    await tester.pumpAndSettle();
    expect(find.text('Geçerli bir adres giriniz (Örn: https://example.com veya uygulama:// bağlantısı).'), findsOneWidget);
    expect(createdRecord, isNull);

    // Enter valid URL
    await tester.enterText(find.byType(TextField), 'https://antigravity.test');
    await tapAdd(tester);
    await tester.pumpAndSettle();
    expect(createdRecord, isNotNull);
    expect(NdefCodec.decodeUri(createdRecord!), equals('https://antigravity.test'));
  });

  testWidgets('ComposeRecordSheet shows Wi-Fi security disclosure and validates WPA2 password', (WidgetTester tester) async {
    NdefRecordModel? createdRecord;

    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('tr'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: ComposeRecordSheet(
            onRecordCreated: (rec) => createdRecord = rec,
          ),
        ),
      ),
    );

    // Switch to Wi-Fi
    await tester.tap(find.text('Wi-Fi'));
    await tester.pumpAndSettle();

    // Verify presence of security disclosure notice
    expect(find.textContaining('Etikete yazılan Wi-Fi parolası şifresiz/düz metin olarak saklanır'), findsOneWidget);
    expect(find.textContaining('iPhone veya Android cihazların etikete dokunulduğunda ağa otomatik olarak katılması garanti edilmez'), findsOneWidget);

    // Try submit without SSID
    await tapAdd(tester);
    await tester.pumpAndSettle();
    expect(find.text('Ağ adı (SSID) boş bırakılamaz.'), findsOneWidget);

    // Fill SSID but invalid short password (< 8 chars)
    final textFields = find.byType(TextField);
    await tester.enterText(textFields.at(0), 'MyHomeWifi');
    await tester.enterText(textFields.at(1), '123'); // short pass
    await tapAdd(tester);
    await tester.pumpAndSettle();
    expect(find.text('WPA/WPA2 şifresi 8 ile 63 karakter arasında olmalıdır.'), findsOneWidget);
    expect(createdRecord, isNull);

    // Fill valid password (>= 8 chars)
    await tester.enterText(textFields.at(1), 'ValidPassword123');
    await tapAdd(tester);
    await tester.pumpAndSettle();

    expect(createdRecord, isNotNull);
    expect(ascii.decode(createdRecord!.type), equals('application/vnd.wfa.wsc'));
    final wifi = NdefCodec.decodeWifiWsc(createdRecord!);
    expect(wifi?.ssid, equals('MyHomeWifi'));
    expect(wifi?.password, equals('ValidPassword123'));
  });

  testWidgets('ComposeRecordSheet validates custom MIME and hex data', (WidgetTester tester) async {
    NdefRecordModel? createdRecord;

    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('tr'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: ComposeRecordSheet(
            onRecordCreated: (rec) => createdRecord = rec,
          ),
        ),
      ),
    );

    // Switch to Custom MIME
    await tester.tap(find.text('Özel MIME'));
    await tester.pumpAndSettle();

    // Select Hex mode
    await tester.ensureVisible(find.text('Hex (Onaltılık)'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Hex (Onaltılık)'));
    await tester.pumpAndSettle();

    // Enter invalid odd hex
    final textFields = find.byType(TextField);
    await tester.enterText(textFields.at(1), '123'); // Odd length hex
    await tapAdd(tester);
    await tester.pumpAndSettle();
    expect(find.text('Geçerli bir onaltılık (hex) dize giriniz (çift sayıda hex karakter).'), findsOneWidget);

    // Enter valid hex
    await tester.enterText(textFields.at(1), '01020A');
    await tapAdd(tester);
    await tester.pumpAndSettle();

    expect(createdRecord, isNotNull);
    expect(createdRecord?.payload, equals(Uint8List.fromList([0x01, 0x02, 0x0A])));
  });
}
