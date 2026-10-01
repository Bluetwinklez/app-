import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/domain/ndef_record.dart';
import 'package:nfc_tag_master/ui/compose_record_sheet.dart';
import 'package:nfc_tag_master/ui/raw_record_editor_dialog.dart';

void main() {
  group('ComposeRecordSheet Edit Tests', () {
    testWidgets('Initializes sheet with text record and updates on save',
        (WidgetTester tester) async {
      final initialRec = NdefCodec.encodeText('Eski Metin');
      NdefRecordModel? result;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ComposeRecordSheet(
              initialRecord: initialRec,
              onRecordCreated: (rec) {
                result = rec;
              },
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Check title indicates editing
      expect(find.text('NDEF Kaydını Düzenle'), findsOneWidget);
      expect(find.text('Kaydı Güncelle'), findsOneWidget);

      // Verify text field contains initial text
      expect(find.text('Eski Metin'), findsOneWidget);

      // Enter new text and submit
      await tester.enterText(find.byType(TextField), 'Yeni Güncel Metin');
      await tester.tap(find.text('Kaydı Güncelle'));
      await tester.pumpAndSettle();

      expect(result, isNotNull);
      expect(NdefCodec.decodeText(result!), equals('Yeni Güncel Metin'));
    });

    testWidgets('Initializes sheet with url record and updates on save',
        (WidgetTester tester) async {
      final initialRec = NdefCodec.encodeUri('https://example.com');
      NdefRecordModel? result;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ComposeRecordSheet(
              initialRecord: initialRec,
              onRecordCreated: (rec) {
                result = rec;
              },
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('NDEF Kaydını Düzenle'), findsOneWidget);
      expect(find.text('https://example.com'), findsWidgets);

      await tester.enterText(
          find.byType(TextField), 'https://antigravity.google');
      await tester.tap(find.text('Kaydı Güncelle'));
      await tester.pumpAndSettle();

      expect(result, isNotNull);
      expect(
          NdefCodec.decodeUri(result!), equals('https://antigravity.google'));
    });
  });

  group('RawRecordEditorDialog Tests', () {
    testWidgets('Allows editing TNF, type, id, and payload in hex',
        (WidgetTester tester) async {
      final initialRec = NdefRecordModel(
        tnf: NdefTnf.unknown,
        type: Uint8List.fromList([0xAA]),
        id: Uint8List(0),
        payload: Uint8List.fromList([0x10, 0x20]),
      );

      NdefRecordModel? saved;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  RawRecordEditorDialog.show(
                    context,
                    record: initialRec,
                    onSave: (rec) => saved = rec,
                  );
                },
                child: const Text('Aç'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Aç'));
      await tester.pumpAndSettle();

      expect(find.text('Ham NDEF Kaydı Düzenle'), findsOneWidget);
      expect(find.text('Değişikliği Kaydet'), findsOneWidget);

      // Verify fields exist
      expect(find.byType(TextField), findsNWidgets(3));

      // Tap save
      await tester.tap(find.text('Değişikliği Kaydet'));
      await tester.pumpAndSettle();

      expect(saved, isNotNull);
      expect(saved!.tnf, equals(NdefTnf.unknown));
      expect(saved!.type, equals(Uint8List.fromList([0xAA])));
      expect(saved!.payload, equals(Uint8List.fromList([0x10, 0x20])));
    });

    testWidgets('Shows read-only explanation when reason is provided',
        (WidgetTester tester) async {
      final initialRec = NdefRecordModel(
        tnf: NdefTnf.wellKnown,
        type: Uint8List.fromList([0x53, 0x70]),
        id: Uint8List(0),
        payload: Uint8List.fromList([0x01, 0x02]),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  RawRecordEditorDialog.show(
                    context,
                    record: initialRec,
                    readOnlyReason:
                        'Bu kayıt karmaşık iç içe veriler içermektedir.',
                    onSave: (_) {},
                  );
                },
                child: const Text('Aç'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Aç'));
      await tester.pumpAndSettle();

      expect(find.text('Kayıt Ayrıntıları (Salt Okunur)'), findsOneWidget);
      expect(find.text('Bu kayıt karmaşık iç içe veriler içermektedir.'),
          findsOneWidget);
      expect(find.text('Kapat'), findsOneWidget);
      expect(find.text('Değişikliği Kaydet'), findsNothing);
    });
  });
}
