import 'dart:typed_data';
import '../l10n/l10n.dart';

/// Sends one raw NFC-A command to the connected tag and returns its response.
typedef RawTransceive = Future<Uint8List> Function(Uint8List command);

/// Thrown when a raw tag operation cannot be completed.
class NtagException implements Exception {
  final String message;
  const NtagException(this.message);

  @override
  String toString() => message;
}

/// Memory layout of a supported NTAG / MIFARE Ultralight EV1 chip.
class NtagChip {
  final String name;
  final int totalPages;
  final int userStartPage;
  final int userEndPage;
  final int cfg0Page;
  final int ccSizeByte;

  /// Page holding the dynamic lock bytes, or null when the chip has none.
  final int? dynamicLockPage;

  const NtagChip({
    required this.name,
    required this.totalPages,
    required this.userStartPage,
    required this.userEndPage,
    required this.cfg0Page,
    required this.ccSizeByte,
    this.dynamicLockPage,
  });

  int get cfg1Page => cfg0Page + 1;
  int get pwdPage => cfg0Page + 2;
  int get packPage => cfg0Page + 3;
  int get userBytes => (userEndPage - userStartPage + 1) * 4;

  static const ntag213 = NtagChip(
      name: 'NTAG213', totalPages: 45, userStartPage: 4, userEndPage: 39, cfg0Page: 41, ccSizeByte: 0x12, dynamicLockPage: 40);
  static const ntag215 = NtagChip(
      name: 'NTAG215', totalPages: 135, userStartPage: 4, userEndPage: 129, cfg0Page: 131, ccSizeByte: 0x3E, dynamicLockPage: 130);
  static const ntag216 = NtagChip(
      name: 'NTAG216', totalPages: 231, userStartPage: 4, userEndPage: 225, cfg0Page: 227, ccSizeByte: 0x6D, dynamicLockPage: 226);
  static const ultralightEv1Small = NtagChip(
      name: 'MIFARE Ultralight EV1 (48 B)',
      totalPages: 20,
      userStartPage: 4,
      userEndPage: 15,
      cfg0Page: 16,
      ccSizeByte: 0x06);
  static const ultralightEv1Large = NtagChip(
      name: 'MIFARE Ultralight EV1 (128 B)',
      totalPages: 41,
      userStartPage: 4,
      userEndPage: 35,
      cfg0Page: 37,
      ccSizeByte: 0x10,
      dynamicLockPage: 36);

  /// Identifies the chip from an 8-byte GET_VERSION response.
  static NtagChip? fromVersion(Uint8List? version) {
    if (version == null || version.length < 8) return null;
    final productType = version[2];
    final storageSize = version[6];
    if (productType == 0x04) {
      switch (storageSize) {
        case 0x0F:
          return ntag213;
        case 0x11:
          return ntag215;
        case 0x13:
          return ntag216;
      }
    } else if (productType == 0x03) {
      switch (storageSize) {
        case 0x0B:
          return ultralightEv1Small;
        case 0x0E:
          return ultralightEv1Large;
      }
    }
    return null;
  }

  /// Short role label for a page, used in the memory viewer.
  String pageLabel(int page) {
    if (page <= 1) return 'UID';
    if (page == 2) return L10n.current.pageUidLock;
    if (page == 3) return 'CC';
    if (page >= userStartPage && page <= userEndPage) return L10n.current.pageData;
    if (page == cfg0Page) return 'CFG0';
    if (page == cfg1Page) return 'CFG1';
    if (page == pwdPage) return 'PWD';
    if (page == packPage) return 'PACK';
    return L10n.current.pageLock;
  }
}

/// Summary of a tag's protection and NDEF state from one raw session.
class TagHealth {
  final NtagChip? chip;
  final String uidHex;

  /// Capability container says NDEF (0xE1 magic).
  final bool ndefFormatted;

  /// CC access byte allows writing (0x00).
  final bool ccWritable;
  final bool staticLockBitsSet;

  /// Null when the chip has no dynamic lock bytes or they could not be read.
  final bool? dynamicLockBitsSet;

  /// Null when the configuration pages could not be read.
  final bool? passwordProtected;
  final bool? readProtected;
  final int? ndefMessageLength;

  const TagHealth({
    required this.chip,
    required this.uidHex,
    required this.ndefFormatted,
    required this.ccWritable,
    required this.staticLockBitsSet,
    this.dynamicLockBitsSet,
    this.passwordProtected,
    this.readProtected,
    this.ndefMessageLength,
  });

  /// Writable for normal NDEF writes (no CC, static or dynamic locks, no password).
  bool get writable =>
      ccWritable && !staticLockBitsSet && dynamicLockBitsSet != true && passwordProtected != true;

  int? get userCapacity => chip?.userBytes;
}

class NtagMemoryDump {
  final NtagChip? chip;
  final Uint8List bytes;

  /// Set when reading stopped early (e.g. a password-protected area).
  final String? warning;

  const NtagMemoryDump({required this.chip, required this.bytes, this.warning});

  int get pageCount => bytes.length ~/ 4;

  String get chipName => chip?.name ?? L10n.current.unknownChip16Pages;

  /// One line per page: `Sayfa 004  E1 10 12 00  ....  Veri`
  List<String> formatPages() {
    final lines = <String>[];
    for (int page = 0; page < pageCount; page++) {
      final chunk = bytes.sublist(page * 4, page * 4 + 4);
      final hex = chunk.map((b) => b.toRadixString(16).padLeft(2, '0').toUpperCase()).join(' ');
      final ascii = String.fromCharCodes(chunk.map((b) => (b >= 0x20 && b < 0x7F) ? b : 0x2E));
      final label = chip?.pageLabel(page) ?? '';
      lines.add('${L10n.current.memoryPageLine(page.toString().padLeft(3, '0'))}  $hex  $ascii  $label'.trimRight());
    }
    return lines;
  }
}

class NtagTools {
  static const int cmdGetVersion = 0x60;
  static const int cmdRead = 0x30;
  static const int cmdWrite = 0xA2;
  static const int cmdPwdAuth = 0x1B;
  static const int ack = 0x0A;

  static Future<Uint8List?> getVersion(RawTransceive transceive) async {
    try {
      final response = await transceive(Uint8List.fromList([cmdGetVersion]));
      return response.length >= 8 ? response : null;
    } catch (_) {
      return null;
    }
  }

  static Future<NtagChip> requireChip(RawTransceive transceive) async {
    final chip = NtagChip.fromVersion(await getVersion(transceive));
    if (chip == null) {
      throw NtagException(L10n.current.ntagUnsupportedChip);
    }
    return chip;
  }

  /// READ returns 16 bytes (4 pages) starting at [page].
  static Future<Uint8List> readPages(RawTransceive transceive, int page) async {
    final response = await transceive(Uint8List.fromList([cmdRead, page & 0xFF]));
    if (response.length < 16) {
      throw NtagException(L10n.current.ntagPageReadFailed(page.toString()));
    }
    return Uint8List.fromList(response.sublist(0, 16));
  }

  static Future<void> writePage(RawTransceive transceive, int page, List<int> data) async {
    if (data.length != 4) {
      throw ArgumentError('A page is exactly 4 bytes');
    }
    final Uint8List response;
    try {
      response = await transceive(Uint8List.fromList([cmdWrite, page & 0xFF, ...data]));
    } catch (e) {
      throw NtagException(L10n.current.ntagPageWriteFailedError(page.toString(), e.toString()));
    }
    // Some platforms surface an empty response for ACK; a NAK is 0x0-0x5 or an error.
    if (response.isNotEmpty && (response[0] & 0x0F) != ack) {
      throw NtagException(L10n.current.ntagPageWriteFailed(page.toString()));
    }
  }

  /// Pages 21–22 of an NTAG215 (the amiibo identification block).
  static Future<Uint8List> readAmiiboId(RawTransceive transceive) async {
    final chip = await requireChip(transceive);
    if (chip.name != NtagChip.ntag215.name) {
      throw NtagException(L10n.current.amiiboNotNtag215(chip.name));
    }
    return Uint8List.fromList((await readPages(transceive, 21)).sublist(0, 8));
  }

  static Future<NtagMemoryDump> readMemory(RawTransceive transceive) async {
    final chip = NtagChip.fromVersion(await getVersion(transceive));
    final totalPages = chip?.totalPages ?? 16;
    final builder = BytesBuilder();
    String? warning;
    for (int page = 0; page < totalPages; page += 4) {
      try {
        final chunk = await readPages(transceive, page);
        final remaining = (totalPages - page) * 4;
        builder.add(chunk.sublist(0, remaining < 16 ? remaining : 16));
      } on NtagException {
        if (page == 0) rethrow;
        warning = L10n.current.ntagProtectedArea(page.toString());
        break;
      }
    }
    return NtagMemoryDump(chip: chip, bytes: builder.toBytes(), warning: warning);
  }

  /// Reads UID, lock bytes, capability container, configuration and the NDEF
  /// TLV header in one session.
  static Future<TagHealth> healthReport(RawTransceive transceive) async {
    final chip = NtagChip.fromVersion(await getVersion(transceive));
    final head = await readPages(transceive, 0); // pages 0-3
    final uid = [...head.sublist(0, 3), ...head.sublist(4, 8)];
    final cc = head.sublist(12, 16);

    bool? dynamicLocked;
    bool? passwordProtected;
    bool? readProtected;
    int? ndefLength;

    if (chip != null) {
      final dynPage = chip.dynamicLockPage;
      if (dynPage != null) {
        try {
          final dyn = await readPages(transceive, dynPage);
          dynamicLocked = dyn[0] != 0 || dyn[1] != 0 || dyn[2] != 0;
        } on NtagException {
          dynamicLocked = null;
        }
      }
      try {
        final cfg = await readPages(transceive, chip.cfg0Page);
        final auth0 = cfg[3];
        passwordProtected = auth0 <= chip.cfg0Page + 3;
        readProtected = passwordProtected && (cfg[4] & 0x80) != 0;
      } on NtagException {
        passwordProtected = true;
        readProtected = true;
      }
    }

    try {
      final first = await readPages(transceive, chip?.userStartPage ?? 4);
      if (first[0] == 0x03) {
        ndefLength = first[1] == 0xFF ? (first[2] << 8) | first[3] : first[1];
      }
    } on NtagException {
      ndefLength = null;
    }

    return TagHealth(
      chip: chip,
      uidHex: toHex(uid).replaceAll(' ', ':'),
      ndefFormatted: cc[0] == 0xE1,
      ccWritable: (cc[3] & 0x0F) == 0x00,
      staticLockBitsSet: head[10] != 0 || head[11] != 0,
      dynamicLockBitsSet: dynamicLocked,
      passwordProtected: passwordProtected,
      readProtected: readProtected,
      ndefMessageLength: ndefLength,
    );
  }

  /// Protects the user memory against writes with a 4-byte password.
  static Future<NtagChip> setPassword(
    RawTransceive transceive, {
    required Uint8List password,
    required Uint8List pack,
  }) async {
    if (password.length != 4 || pack.length != 2) {
      throw NtagException(L10n.current.ntagPasswordPackSize);
    }
    final chip = await requireChip(transceive);
    final cfg = await readPages(transceive, chip.cfg0Page);
    await writePage(transceive, chip.pwdPage, password);
    await writePage(transceive, chip.packPage, [pack[0], pack[1], 0, 0]);
    // CFG1 bit 7 (PROT) = 0 keeps reads open and only protects writes
    await writePage(transceive, chip.cfg1Page, [cfg[4] & 0x7F, cfg[5], cfg[6], cfg[7]]);
    // AUTH0 last, so a failure above never leaves the tag locked with an unknown password
    await writePage(transceive, chip.cfg0Page, [cfg[0], cfg[1], cfg[2], chip.userStartPage]);
    return chip;
  }

  static Future<NtagChip> removePassword(
    RawTransceive transceive, {
    required Uint8List password,
  }) async {
    if (password.length != 4) {
      throw NtagException(L10n.current.ntagPasswordSize);
    }
    final chip = await requireChip(transceive);
    final Uint8List response;
    try {
      response = await transceive(Uint8List.fromList([cmdPwdAuth, ...password]));
    } catch (_) {
      throw NtagException(L10n.current.ntagPasswordWrongOrAuthFailed);
    }
    if (response.length < 2) {
      throw NtagException(L10n.current.ntagPasswordWrong);
    }
    final cfg = await readPages(transceive, chip.cfg0Page);
    await writePage(transceive, chip.cfg0Page, [cfg[0], cfg[1], cfg[2], 0xFF]);
    await writePage(transceive, chip.pwdPage, [0xFF, 0xFF, 0xFF, 0xFF]);
    await writePage(transceive, chip.packPage, [0, 0, 0, 0]);
    return chip;
  }

  /// Writes the NDEF capability container (if blank) and an empty NDEF message.
  static Future<NtagChip> formatNdef(RawTransceive transceive) async {
    final chip = await requireChip(transceive);
    final page3 = await readPages(transceive, 3);
    final cc = page3.sublist(0, 4);
    if (cc.every((b) => b == 0)) {
      await writePage(transceive, 3, [0xE1, 0x10, chip.ccSizeByte, 0x00]);
    } else if (cc[0] != 0xE1) {
      throw NtagException(L10n.current.ntagCcInvalid);
    }
    await writePage(transceive, chip.userStartPage, [0x03, 0x00, 0xFE, 0x00]);
    return chip;
  }

  /// Builds the NDEF TLV (03 len msg FE) padded to whole pages.
  static Uint8List ndefTlvPages(Uint8List message) {
    final b = BytesBuilder();
    b.addByte(0x03);
    if (message.length < 0xFF) {
      b.addByte(message.length);
    } else {
      b
        ..addByte(0xFF)
        ..addByte((message.length >> 8) & 0xFF)
        ..addByte(message.length & 0xFF);
    }
    b
      ..add(message)
      ..addByte(0xFE);
    while (b.length % 4 != 0) {
      b.addByte(0x00);
    }
    return b.toBytes();
  }

  /// Prepares a blank tag (capability container) and writes [message] as an
  /// NDEF TLV in the same session, then reads it back to verify.
  static Future<NtagChip> formatAndWriteNdef(RawTransceive transceive, Uint8List message) async {
    final chip = await formatNdef(transceive);
    final tlv = ndefTlvPages(message);
    if (tlv.length > chip.userBytes) {
      throw NtagException(L10n.current.capacityExceededShort('${tlv.length}', '${chip.userBytes}'));
    }
    final pages = tlv.length ~/ 4;
    for (int i = 0; i < pages; i++) {
      await writePage(transceive, chip.userStartPage + i, tlv.sublist(i * 4, i * 4 + 4));
    }
    for (int i = 0; i < pages; i += 4) {
      final chunk = await readPages(transceive, chip.userStartPage + i);
      for (int j = 0; j < 16 && (i * 4 + j) < tlv.length; j++) {
        if (chunk[j] != tlv[i * 4 + j]) {
          throw NtagException(L10n.current.verifyFailedAfterWrite);
        }
      }
    }
    return chip;
  }

  /// Writes the user memory pages from a full memory dump (.bin). UID, lock,
  /// CC and configuration pages are never written.
  static Future<int> writeDump(RawTransceive transceive, Uint8List dump) async {
    final chip = await requireChip(transceive);
    final userStartByte = chip.userStartPage * 4;
    if (dump.length < userStartByte + 4) {
      throw NtagException(L10n.current.ntagDumpTooShort);
    }
    final lastPage = ((dump.length ~/ 4) - 1).clamp(0, chip.userEndPage);
    int written = 0;
    for (int page = chip.userStartPage; page <= lastPage; page++) {
      await writePage(transceive, page, dump.sublist(page * 4, page * 4 + 4));
      written++;
    }
    return written;
  }

  /// Parses `A1B2 C3D4`, `a1:b2:c3:d4` etc. into bytes.
  static Uint8List parseHex(String input) {
    final clean = input.replaceAll(RegExp(r'[\s:,\-]'), '');
    if (clean.isEmpty || clean.length.isOdd || !RegExp(r'^[0-9A-Fa-f]+$').hasMatch(clean)) {
      throw NtagException(L10n.current.ntagInvalidHex);
    }
    return Uint8List.fromList([
      for (int i = 0; i < clean.length; i += 2) int.parse(clean.substring(i, i + 2), radix: 16),
    ]);
  }

  static String toHex(List<int> bytes) =>
      bytes.map((b) => b.toRadixString(16).padLeft(2, '0').toUpperCase()).join(' ');
}
