import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/domain/ndef_record.dart';
import 'package:nfc_tag_master/domain/template_share_code.dart';

void main() {
  test('round trip and rejection of foreign codes', () {
    final code = TemplateShareCode.encode('Ofis kapısı', [
      NdefCodec.encodeUri('https://example.com'),
      NdefCodec.encodeText('Hoş geldiniz'),
    ]);
    expect(TemplateShareCode.isCode(code), isTrue);
    final (name, records) = TemplateShareCode.decode(code)!;
    expect(name, 'Ofis kapısı');
    expect(records.map((r) => NdefCodec.parseRecord(r).content), ['https://example.com', 'Hoş geldiniz']);
    expect(TemplateShareCode.decode('https://example.com'), isNull);
    expect(TemplateShareCode.decode('nfctm1:not-base64!!'), isNull);
  });
}
