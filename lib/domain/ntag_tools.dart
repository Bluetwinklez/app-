import 'dart:typed_data';

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

  const NtagChip({
    required this.name,
    required this.totalPages,
    required this.userStartPage,
    required this.userEndPage,
    required this.cfg0Page,
    required this.ccSizeByte,
  });

  int get cfg1Page => cfg0Page + 1;
  int get pwdPage => cfg0Page + 2;
  int get packPage => cfg0Page + 3;
  int get userBytes => (userEndPage - userStartPage + 1) * 4;

  static const ntag213 = NtagChip(
      name: 'NTAG213', totalPages: 45, userStartPage: 4, userEndPage: 39, cfg0Page: 41, ccSizeByte: 0x12);
  static const ntag215 = NtagChip(
      name: 'NTAG215', totalPages: 135, userStartPage: 4, userEndPage: 129, cfg0Page: 131, ccSizeByte: 0x3E);
  static const ntag216 = NtagChip(
      name: 'NTAG216', totalPages: 231, userStartPage: 4, userEndPage: 225, cfg0Page: 227, ccSizeByte: 0x6D);
  static const ultralightEv1Small = NtagChip(
      name: 'MIFARE Ultralight EV1 (48 bayt)',
      totalPages: 20,
      userStartPage: 4,
      userEndPage: 15,
      cfg0Page: 16,
      ccSizeByte: 0x06);
  static const ultralightEv1Large = NtagChip(
      name: 'MIFARE Ultralight EV1 (128 bayt)',
      totalPages: 41,
      userStartPage: 4,
      userEndPage: 35,
      cfg0Page: 37,
      ccSizeByte: 0x10);

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
    if (page == 2) return 'UID / Kilit';
    if (page == 3) return 'CC';
    if (page >= userStartPage && page <= userEndPage) return 'Veri';
    if (page == cfg0Page) return 'CFG0';
    if (page == cfg1Page) return 'CFG1';
    if (page == pwdPage) return 'PWD';
    if (page == packPage) return 'PACK';
    return 'Kilit';
  }
}

class NtagMemoryDump {
  final NtagChip? chip;
  final Uint8List bytes;

  /// Set when reading stopped early (e.g. a password-protected area).
  final String? warning;

  const NtagMemoryDump({required this.chip, required this.bytes, this.warning});

  int get pageCount => bytes.length ~/ 4;

  String get chipName => chip?.name ?? 'Bilinmeyen çip (ilk 16 sayfa)';

  /// One line per page: `Sayfa 004  E1 10 12 00  ....  Veri`
  List<String> formatPages() {
    final lines = <String>[];
    for (int page = 0; page < pageCount; page++) {
      final chunk = bytes.sublist(page * 4, page * 4 + 4);
      final hex = chunk.map((b) => b.toRadixString(16).padLeft(2, '0').toUpperCase()).join(' ');
      final ascii = String.fromCharCodes(chunk.map((b) => (b >= 0x20 && b < 0x7F) ? b : 0x2E));
      final label = chip?.pageLabel(page) ?? '';
      lines.add('Sayfa ${page.toString().padLeft(3, '0')}  $hex  $ascii  $label'.trimRight());
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
      throw const NtagException(
          'Bu işlem yalnızca NTAG213/215/216 ve MIFARE Ultralight EV1 etiketlerde destekleniyor.');
    }
    return chip;
  }

  /// READ returns 16 bytes (4 pages) starting at [page].
  static Future<Uint8List> readPages(RawTransceive transceive, int page) async {
    final response = await transceive(Uint8List.fromList([cmdRead, page & 0xFF]));
    if (response.length < 16) {
      throw NtagException('Sayfa $page okunamadı (etiket yanıt vermedi veya alan korumalı).');
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
      throw NtagException('Sayfa $page yazılamadı: $e');
    }
    // Some platforms surface an empty response for ACK; a NAK is 0x0-0x5 or an error.
    if (response.isNotEmpty && (response[0] & 0x0F) != ack) {
      throw NtagException('Sayfa $page yazılamadı (etiket reddetti; kilitli veya şifreli olabilir).');
    }
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
        warning = 'Sayfa $page sonrası okunamadı; bu alan şifre ile korunuyor olabilir.';
        break;
      }
    }
    return NtagMemoryDump(chip: chip, bytes: builder.toBytes(), warning: warning);
  }

  /// Protects the user memory against writes with a 4-byte password.
  static Future<NtagChip> setPassword(
    RawTransceive transceive, {
    required Uint8List password,
    required Uint8List pack,
  }) async {
    if (password.length != 4 || pack.length != 2) {
      throw const NtagException('Şifre 4 bayt, PACK 2 bayt olmalıdır.');
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
      throw const NtagException('Şifre 4 bayt olmalıdır.');
    }
    final chip = await requireChip(transceive);
    final Uint8List response;
    try {
      response = await transceive(Uint8List.fromList([cmdPwdAuth, ...password]));
    } catch (_) {
      throw const NtagException('Şifre yanlış veya etiket şifre doğrulamasını reddetti.');
    }
    if (response.length < 2) {
      throw const NtagException('Şifre yanlış.');
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
      throw const NtagException(
          'Etiketin CC alanı NDEF dışı bir değerle yazılmış; bu alan tek seferlik olduğu için biçimlendirilemez.');
    }
    await writePage(transceive, chip.userStartPage, [0x03, 0x00, 0xFE, 0x00]);
    return chip;
  }

  /// Writes the user memory pages from a full memory dump (.bin). UID, lock,
  /// CC and configuration pages are never written.
  static Future<int> writeDump(RawTransceive transceive, Uint8List dump) async {
    final chip = await requireChip(transceive);
    final userStartByte = chip.userStartPage * 4;
    if (dump.length < userStartByte + 4) {
      throw const NtagException('Dump dosyası çok kısa; kullanıcı verisi içermiyor.');
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
      throw const NtagException('Geçerli bir onaltılık (hex) değer giriniz (Örn: 30 04).');
    }
    return Uint8List.fromList([
      for (int i = 0; i < clean.length; i += 2) int.parse(clean.substring(i, i + 2), radix: 16),
    ]);
  }

  static String toHex(List<int> bytes) =>
      bytes.map((b) => b.toRadixString(16).padLeft(2, '0').toUpperCase()).join(' ');
}
