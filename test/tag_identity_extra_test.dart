import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/domain/tag_identity.dart';

void main() {
  test('chip family from technology names', () {
    expect(TagIdentity.familyFromTechnologies(['NfcA', 'MifareClassic:1024', 'NdefFormatable']), 'MIFARE Classic 1K');
    expect(TagIdentity.familyFromTechnologies(['MifareClassic:4096']), 'MIFARE Classic 4K');
    expect(TagIdentity.familyFromTechnologies(['MifareClassic']), 'MIFARE Classic');
    expect(TagIdentity.familyFromTechnologies(['NfcV', 'Ndef']), 'ISO 15693 (NFC-V)');
    expect(TagIdentity.familyFromTechnologies(['MifareDesfire', 'Ndef']), 'MIFARE DESFire');
    expect(TagIdentity.familyFromTechnologies(['NfcA', 'Ndef']), isNull);
  });
}
