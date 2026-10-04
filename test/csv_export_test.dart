import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/domain/csv_export.dart';
import 'package:nfc_tag_master/domain/ndef_record.dart';

void main() {
  test('escapes commas, quotes and newlines', () {
    expect(CsvExport.escape('a,b'), '"a,b"');
    expect(CsvExport.escape('say "hi"'), '"say ""hi"""');
    expect(CsvExport.escape('line1\nline2'), '"line1\nline2"');
    expect(CsvExport.escape('plain'), 'plain');
  });

  test('scan log CSV has BOM, header and one row per tag', () {
    final csv = CsvExport.scans(
      [ScanLogEntry(DateTime(2026, 10, 3, 9, 30), '04:A1', [NdefCodec.encodeUri('https://a.com')])],
      header: const ['Zaman', 'UID', 'Kayıt', 'İçerik'],
    );
    expect(csv.startsWith(CsvExport.bom), isTrue);
    final lines = csv.substring(1).split('\r\n');
    expect(lines[0], 'Zaman,UID,Kayıt,İçerik');
    expect(lines[1], '2026-10-03 09:30:00,04:A1,1,https://a.com');
  });

  test('scan report counts unique, repeated and empty tags', () {
    final t = DateTime(2026);
    final r = ScanReport.of([
      ScanLogEntry(t, 'A', const []),
      ScanLogEntry(t, 'B', [NdefCodec.encodeText('x')]),
      ScanLogEntry(t, 'A', const []),
    ]);
    expect(r.total, 3);
    expect(r.unique, 2);
    expect(r.duplicates, 1);
    expect(r.empty, 1);
  });
}
