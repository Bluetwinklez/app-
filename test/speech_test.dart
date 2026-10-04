import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/domain/ndef_record.dart';
import 'package:nfc_tag_master/services/speech_service.dart';

void main() {
  test('links are spoken as their host, empty records skipped', () {
    final text = SpeechService.describe([
      NdefCodec.encodeUri('https://www.example.com/a/very/long/path?x=1'),
      NdefCodec.encodeText('Merhaba'),
      NdefCodec.encodeText(''),
    ]);
    expect(text, contains('example.com'));
    expect(text, isNot(contains('path')));
    expect(text, contains('Merhaba'));
  });
}
