import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/services/print_sheet.dart';
import 'package:pdf/widgets.dart' as pw;

void main() {
  test('builds a multi-page PDF with Turkish text and QR codes', () async {
    final font = pw.Font.ttf(File('assets/fonts/NotoSans-Regular.ttf').readAsBytesSync().buffer.asByteData());
    final labels = [
      for (int i = 0; i < 25; i++)
        PrintLabel(title: 'Şarj ünitesi $i', subtitle: 'Depo · Raf ğüı', qrData: 'https://example.com/$i'),
      const PrintLabel(title: 'QR yok'),
    ];
    final bytes = await PrintSheet.build(labels, font: font, heading: 'Etiketler');
    expect(String.fromCharCodes(bytes.take(5)), '%PDF-');
    expect(bytes.length, greaterThan(10000));
  });
}
