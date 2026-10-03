import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/domain/ndef_record.dart';
import 'package:nfc_tag_master/domain/template_variables.dart';

void main() {
  final now = DateTime(2026, 3, 7, 9, 5);

  test('fills date, time and counter in Turkish and English spellings', () {
    final out = TemplateVariables.apply([
      NdefCodec.encodeText('Kontrol {tarih} {saat} #{sayac}'),
      NdefCodec.encodeUri('https://x.io/log?d={date}&n={counter}'),
    ], now: now, counterValue: 12);
    expect(NdefCodec.decodeText(out[0]), 'Kontrol 2026-03-07 09:05 #12');
    expect(NdefCodec.decodeUri(out[1]), 'https://x.io/log?d=2026-03-07&n=12');
  });

  test('detects variables and the counter separately', () {
    expect(TemplateVariables.hasAny([NdefCodec.encodeText('plain')]), isFalse);
    final timeOnly = [NdefCodec.encodeText('{time}')];
    expect(TemplateVariables.hasAny(timeOnly), isTrue);
    expect(TemplateVariables.usesCounter(timeOnly), isFalse);
    expect(TemplateVariables.usesCounter([NdefCodec.encodeText('{sayaç}')]), isTrue);
  });

  test('records without variables are returned unchanged', () {
    final r = NdefCodec.encodePhone('+90555');
    expect(identical(TemplateVariables.apply([r], now: now, counterValue: 1).single, r), isTrue);
  });
}
