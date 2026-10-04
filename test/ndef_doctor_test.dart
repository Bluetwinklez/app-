import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/domain/ndef_doctor.dart';
import 'package:nfc_tag_master/domain/ndef_record.dart';
import 'package:nfc_tag_master/domain/ntag_tools.dart';

void main() {
  /// NTAG213-like dump: 4 header pages, CC, then [data] padded to 180 bytes.
  Uint8List dump(List<int> data, {List<int> cc = const [0xE1, 0x10, 0x12, 0x00]}) {
    final b = Uint8List(180);
    b.setRange(12, 16, cc);
    b.setRange(16, 16 + data.length, data);
    return b;
  }

  List<DoctorFinding> findings(Uint8List mem) => NdefDoctor.diagnose(mem).map((r) => r.finding).toList();

  final message = encodeNdefMessage([NdefCodec.encodeUri('https://example.com'), NdefCodec.encodeText('hi')]);

  test('a correctly written tag is healthy with its record count', () {
    final r = NdefDoctor.diagnose(dump(NtagTools.ndefTlvPages(message)));
    expect(r.single.finding, DoctorFinding.healthy);
    expect(r.single.value, 2);
  });

  test('blank tag without capability container', () {
    expect(findings(dump([], cc: [0, 0, 0, 0])), [DoctorFinding.noCapabilityContainer]);
    expect(findings(Uint8List(8)), [DoctorFinding.tooShort]);
  });

  test('read-only tag is reported but still healthy', () {
    final f = findings(dump(NtagTools.ndefTlvPages(message), cc: [0xE1, 0x10, 0x12, 0x0F]));
    expect(f, [DoctorFinding.readOnly, DoctorFinding.healthy]);
  });

  test('formatted but empty tag', () {
    expect(findings(dump([0x03, 0x00, 0xFE])), [DoctorFinding.emptyMessage]);
  });

  test('missing NDEF TLV and missing terminator', () {
    expect(findings(dump([0xFE])), [DoctorFinding.noNdefTlv]);
    final noTerm = [0x03, message.length, ...message, 0xAB];
    expect(findings(dump(noTerm)), contains(DoctorFinding.unknownTlv));
  });

  test('length running past the memory is caught', () {
    expect(findings(dump([0x03, 0xFF, 0x10, 0x00])), [DoctorFinding.lengthOverflow]);
  });

  test('broken record flags are caught', () {
    final broken = Uint8List.fromList(message);
    broken[0] &= ~0x80; // clear MB on the first record
    final r = NdefDoctor.diagnose(dump([0x03, broken.length, ...broken, 0xFE]));
    expect(r.map((x) => x.finding), [DoctorFinding.badRecordStructure]);
    expect(r.single.value, 0);
  });

  test('message larger than the capability container size', () {
    final f = findings(dump([0x03, message.length, ...message, 0xFE], cc: [0xE1, 0x10, 0x01, 0x00]));
    expect(f, [DoctorFinding.exceedsCapacity]);
  });
}
