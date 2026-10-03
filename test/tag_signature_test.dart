import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/domain/ndef_record.dart';
import 'package:nfc_tag_master/domain/tag_signature.dart';

void main() {
  final key = TagSignature.generateKey();
  final records = [NdefCodec.encodeUri('https://example.com'), NdefCodec.encodeText('Masa 4')];

  test('signed content verifies; any change is detected', () {
    final signed = TagSignature.sign(records, key);
    expect(signed, hasLength(3));
    expect(TagSignature.verify(signed, key), SignatureStatus.valid);

    final tampered = [NdefCodec.encodeUri('https://evil.example'), ...signed.skip(1)];
    expect(TagSignature.verify(tampered, key), SignatureStatus.invalid);
    expect(TagSignature.verify(records, key), SignatureStatus.none);
  });

  test('another key is reported as such, re-signing replaces the old signature', () {
    final signed = TagSignature.sign(records, key);
    final other = TagSignature.generateKey();
    expect(TagSignature.verify(signed, other), SignatureStatus.otherKey);
    expect(TagSignature.verify(signed, null), SignatureStatus.otherKey);
    final resigned = TagSignature.sign(signed, other);
    expect(resigned.where(TagSignature.isSignatureRecord), hasLength(1));
    expect(TagSignature.verify(resigned, other), SignatureStatus.valid);
  });

  test('keys export and import as text', () {
    final text = TagSignature.exportKey(key);
    expect(text, startsWith('NTMK1:'));
    expect(TagSignature.importKey(text), key);
    expect(TagSignature.importKey('garbage'), isNull);
    expect(TagSignature.importKey('NTMK1:AAAA'), isNull);
  });

  test('signature survives an NDEF encode/parse round trip', () {
    final signed = TagSignature.sign(records, key);
    final parsed = NdefRecordModel.parseAll(encodeNdefMessage(signed));
    expect(TagSignature.verify(parsed, key), SignatureStatus.valid);
  });
}
