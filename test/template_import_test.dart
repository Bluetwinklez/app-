import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/domain/ndef_record.dart';
import 'package:nfc_tag_master/domain/template_import.dart';

void main() {
  test('rows become templates; same name rows are merged', () {
    final r = TemplateCsvImporter.parse(
      'ad,tür,değer,ek\n'
      'Ofis,url,https://example.com\n'
      'Ofis,text,"Hoş geldiniz, misafir"\n'
      'Misafir Wi-Fi\twifi\tGuest\tsifre1234\n'
      'Bozuk,url\n'
      'Hatalı,bilinmez,x\n',
    );
    expect(r.templates.map((t) => t.name), ['Ofis', 'Misafir Wi-Fi']);
    expect(r.templates.first.records, hasLength(2));
    expect(NdefCodec.parseRecord(r.templates.first.records[1]).content, 'Hoş geldiniz, misafir');
    expect(r.errors, hasLength(2));
    expect(r.templates.map((t) => t.id).toSet(), hasLength(2));
  });
}
