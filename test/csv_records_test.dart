import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/domain/csv_records.dart';
import 'package:nfc_tag_master/domain/ndef_record.dart';

void main() {
  group('CsvRecordImporter', () {
    test('imports the documented sample', () {
      final result = CsvRecordImporter.parse(CsvRecordImporter.sample);
      expect(result.errors, isEmpty);
      expect(result.records.length, 7);
      expect(NdefCodec.decodeUri(result.records[0]), 'https://example.com');
      expect(NdefCodec.decodeText(result.records[1]), 'Merhaba dünya');
      expect(NdefCodec.parseRecord(result.records[6]).type, ParsedRecordType.wifi);
    });

    test('reports bad rows with line numbers and keeps good ones', () {
      final result = CsvRecordImporter.parse('url,https://a.com\nfoo,bar\nkonum,abc,1\nmetin,');
      expect(result.records.length, 1);
      expect(result.errors.length, 3);
      expect(result.errors.first, startsWith('Satır 2'));
    });

    test('handles quoted cells and semicolons', () {
      expect(CsvRecordImporter.splitLine('metin,"a, ""b"""'), ['metin', 'a, "b"']);
      expect(CsvRecordImporter.splitLine('url;https://x.com'), ['url', 'https://x.com']);
    });
  });

  group('QrRecordImporter', () {
    test('maps Wi-Fi, URL and text QR codes', () {
      final wifi = QrRecordImporter.fromQr(r'WIFI:T:WPA;S:Ev\;Ağı;P:sifre1234;;');
      final parsed = NdefCodec.decodeWifiWsc(wifi);
      expect(parsed?.ssid, 'Ev;Ağı');
      expect(parsed?.password, 'sifre1234');
      expect(NdefCodec.decodeUri(QrRecordImporter.fromQr('https://example.com')), 'https://example.com');
      expect(NdefCodec.decodeText(QrRecordImporter.fromQr('Merhaba dünya')), 'Merhaba dünya');
    });
  });
}
