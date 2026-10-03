import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/domain/capacity.dart';
import 'package:nfc_tag_master/domain/ndef_record.dart';

void main() {
  test('TLV overhead uses the short or long length form', () {
    expect(CapacityCheck.tlvSize(10), 13);
    expect(CapacityCheck.tlvSize(254), 257);
    expect(CapacityCheck.tlvSize(255), 260);
  });

  test('a short URL fits NTAG213, a long text needs a bigger chip', () {
    final small = [NdefCodec.encodeUri('https://example.com')];
    expect(CapacityCheck.smallestFittingChip(small), 'NTAG213');

    final big = [NdefCodec.encodeText('x' * 300)];
    expect(CapacityCheck.smallestFittingChip(big), 'NTAG215');
    expect(CapacityCheck.fitsFor(big).first.fits, isFalse);

    final huge = [NdefCodec.encodeText('x' * 1000)];
    expect(CapacityCheck.smallestFittingChip(huge), isNull);
  });
}
