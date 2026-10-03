import 'dart:typed_data';
import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/domain/amiibo.dart';
import 'package:nfc_tag_master/domain/ntag_tools.dart';

import 'ntag_tools_test.dart' show FakeNtag213;

void main() {
  test('parses the identification block', () {
    // Mario (Super Smash Bros. series), figure
    final info = AmiiboInfo.parse([0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02])!;
    expect(info.idHex, '0000000000000002');
    expect(info.seriesName, 'Super Smash Bros.');
    expect(info.figureType, 0);
    expect(info.lookupUrl, contains('id=0000000000000002'));
    final card = AmiiboInfo.parse([0x01, 0x80, 0x00, 0x01, 0x01, 0x23, 0x05, 0x02])!;
    expect(card.characterId, 0x0180);
    expect(card.figureType, 1);
    expect(card.modelNumber, 0x0123);
    expect(card.seriesName, 'Animal Crossing');
  });

  test('non-amiibo data is rejected', () {
    expect(AmiiboInfo.parse([0, 0, 0, 0, 0, 0, 0, 0]), isNull);
    expect(AmiiboInfo.parse([1, 2, 3]), isNull);
  });

  test('readAmiiboId refuses chips other than NTAG215', () async {
    final tag = FakeNtag213();
    expect(() => NtagTools.readAmiiboId(tag.transceive), throwsA(isA<NtagException>()));
    expect(Uint8List(0), isEmpty);
  });
}
