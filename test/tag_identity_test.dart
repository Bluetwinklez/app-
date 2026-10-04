import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/domain/nfc_tag_info.dart';
import 'package:nfc_tag_master/domain/tag_identity.dart';

void main() {
  test('manufacturer comes from the first UID byte', () {
    expect(TagIdentity.manufacturerFromUid('04:A1:B2:C3:D4:E5:F6'), 'NXP Semiconductors');
    expect(TagIdentity.manufacturerFromUid('02A1B2C3D4E5F6'), 'STMicroelectronics');
    expect(TagIdentity.manufacturerFromUid('iOS-NFC-Tag'), isNull);
    expect(TagIdentity.manufacturerFromUid('FF:00:00:00'), isNull);
  });

  test('chip is guessed from NDEF capacity', () {
    const info = NfcTagInfo(identifier: '04:11:22:33:44:55:66', maxByteCapacity: 496);
    final id = TagIdentity.of(info);
    expect(id.chipGuess, 'NTAG215');
    expect(id.manufacturer, 'NXP Semiconductors');
    expect(TagIdentity.of(const NfcTagInfo(identifier: 'x', maxByteCapacity: 1000)).chipGuess, isNull);
  });
}
