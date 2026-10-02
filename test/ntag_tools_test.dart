import 'dart:typed_data';
import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/controllers/nfc_controller.dart';
import 'package:nfc_tag_master/domain/ntag_tools.dart';

/// Minimal in-memory NTAG213 that understands GET_VERSION, READ, WRITE and PWD_AUTH.
class FakeNtag213 {
  final Uint8List memory = Uint8List(45 * 4);
  bool supportsVersion = true;

  FakeNtag213() {
    memory.setRange(0, 4, [0x04, 0xA1, 0xB2, 0x9F]);
    memory.setRange(41 * 4, 42 * 4, [0x04, 0x00, 0x00, 0xFF]); // CFG0, AUTH0 = FF
    memory.setRange(43 * 4, 44 * 4, [0xFF, 0xFF, 0xFF, 0xFF]); // PWD
  }

  Uint8List page(int p) => memory.sublist(p * 4, p * 4 + 4);

  Future<Uint8List> transceive(Uint8List cmd) async {
    switch (cmd[0]) {
      case NtagTools.cmdGetVersion:
        if (!supportsVersion) throw Exception('NAK');
        return Uint8List.fromList([0x00, 0x04, 0x04, 0x02, 0x01, 0x00, 0x0F, 0x03]);
      case NtagTools.cmdRead:
        final out = Uint8List(16);
        for (int i = 0; i < 16; i++) {
          final addr = (cmd[1] * 4 + i) % memory.length;
          // PWD and PACK always read back as zeros
          out[i] = (addr >= 43 * 4) ? 0 : memory[addr];
        }
        return out;
      case NtagTools.cmdWrite:
        memory.setRange(cmd[1] * 4, cmd[1] * 4 + 4, cmd.sublist(2, 6));
        return Uint8List.fromList([0x0A]);
      case NtagTools.cmdPwdAuth:
        if (!_eq(cmd.sublist(1, 5), page(43))) throw Exception('NAK');
        return page(44).sublist(0, 2);
    }
    throw Exception('unknown command');
  }

  static bool _eq(List<int> a, List<int> b) {
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return a.length == b.length;
  }
}

void main() {
  group('NtagChip', () {
    test('identifies chips from GET_VERSION', () {
      expect(NtagChip.fromVersion(Uint8List.fromList([0, 4, 4, 2, 1, 0, 0x11, 3]))?.name, 'NTAG215');
      expect(NtagChip.fromVersion(Uint8List.fromList([0, 4, 3, 1, 1, 0, 0x0B, 3]))?.totalPages, 20);
      expect(NtagChip.fromVersion(Uint8List.fromList([0, 4, 9, 9, 1, 0, 0x0F, 3])), isNull);
      expect(NtagChip.fromVersion(null), isNull);
    });
  });

  group('NtagTools', () {
    test('reads the full NTAG213 memory and labels pages', () async {
      final tag = FakeNtag213();
      final dump = await NtagTools.readMemory(tag.transceive);
      expect(dump.chip, NtagChip.ntag213);
      expect(dump.pageCount, 45);
      expect(dump.bytes.sublist(0, 3), [0x04, 0xA1, 0xB2]);
      final lines = dump.formatPages();
      expect(lines.first, startsWith('Sayfa 000  04 A1 B2 9F'));
      expect(lines[41], endsWith('CFG0'));
    });

    test('falls back to 16 pages when the chip is unknown', () async {
      final tag = FakeNtag213()..supportsVersion = false;
      final dump = await NtagTools.readMemory(tag.transceive);
      expect(dump.chip, isNull);
      expect(dump.pageCount, 16);
    });

    test('sets AUTH0 only after password and PACK are written', () async {
      final tag = FakeNtag213();
      await NtagTools.setPassword(
        tag.transceive,
        password: Uint8List.fromList([1, 2, 3, 4]),
        pack: Uint8List.fromList([0xAB, 0xCD]),
      );
      expect(tag.page(43), [1, 2, 3, 4]);
      expect(tag.page(44), [0xAB, 0xCD, 0, 0]);
      expect(tag.page(41), [0x04, 0x00, 0x00, 0x04]);
      expect(tag.page(42)[0] & 0x80, 0, reason: 'reads stay open');
    });

    test('removes the password only with the right password', () async {
      final tag = FakeNtag213();
      await NtagTools.setPassword(
        tag.transceive,
        password: Uint8List.fromList([1, 2, 3, 4]),
        pack: Uint8List.fromList([0, 0]),
      );
      expect(
        () => NtagTools.removePassword(tag.transceive, password: Uint8List.fromList([9, 9, 9, 9])),
        throwsA(isA<NtagException>()),
      );
      await NtagTools.removePassword(tag.transceive, password: Uint8List.fromList([1, 2, 3, 4]));
      expect(tag.page(41)[3], 0xFF);
      expect(tag.page(43), [0xFF, 0xFF, 0xFF, 0xFF]);
    });

    test('formats a blank tag with CC and an empty NDEF TLV', () async {
      final tag = FakeNtag213();
      await NtagTools.formatNdef(tag.transceive);
      expect(tag.page(3), [0xE1, 0x10, 0x12, 0x00]);
      expect(tag.page(4), [0x03, 0x00, 0xFE, 0x00]);
    });

    test('dump write touches user pages only', () async {
      final tag = FakeNtag213();
      final dump = Uint8List(45 * 4);
      for (int i = 0; i < dump.length; i++) {
        dump[i] = 0x77;
      }
      final written = await NtagTools.writeDump(tag.transceive, dump);
      expect(written, 36);
      expect(tag.page(0), [0x04, 0xA1, 0xB2, 0x9F], reason: 'UID untouched');
      expect(tag.page(3), [0, 0, 0, 0], reason: 'CC untouched');
      expect(tag.page(4), [0x77, 0x77, 0x77, 0x77]);
      expect(tag.page(39), [0x77, 0x77, 0x77, 0x77]);
      expect(tag.page(41), [0x04, 0x00, 0x00, 0xFF], reason: 'config untouched');
    });

    test('parses hex input', () {
      expect(NtagTools.parseHex('30 04'), [0x30, 0x04]);
      expect(NtagTools.parseHex('a1:B2'), [0xA1, 0xB2]);
      expect(() => NtagTools.parseHex('123'), throwsA(isA<NtagException>()));
      expect(NtagTools.toHex([0x0A, 0xFF]), '0A FF');
    });
  });

  test('NfcStateController.computeRecordsSha256 is still empty for no records', () {
    expect(NfcStateController.computeRecordsSha256(const []), '');
  });
}
