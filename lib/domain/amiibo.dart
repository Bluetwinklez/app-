import 'dart:typed_data';

/// Identification block of a Nintendo amiibo (NTAG215 pages 21–22).
/// Read-only information; nothing is decrypted or copied.
class AmiiboInfo {
  final Uint8List idBytes;

  const AmiiboInfo(this.idBytes);

  static const Map<int, String> seriesNames = {
    0x00: 'Super Smash Bros.',
    0x01: 'Super Mario Bros.',
    0x02: 'Chibi-Robo!',
    0x03: "Yoshi's Woolly World",
    0x04: 'Splatoon',
    0x05: 'Animal Crossing',
    0x06: '8-bit Mario',
    0x07: 'Skylanders',
    0x09: 'The Legend of Zelda',
    0x0A: 'Shovel Knight',
    0x0C: 'Kirby',
    0x0D: 'Pokémon',
    0x0E: 'Mario Sports Superstars',
    0x0F: 'Monster Hunter',
    0x10: 'BoxBoy!',
    0x11: 'Pikmin',
    0x12: 'Fire Emblem',
    0x13: 'Metroid',
    0x14: 'Others',
    0x15: 'Mega Man',
    0x16: 'Diablo',
    0x17: 'Power Pros',
    0x18: 'Monster Hunter Rise',
    0x19: 'Yu-Gi-Oh!',
    0xFF: 'Super Nintendo World',
  };

  /// Amiibo data ends its ID block with 0x02.
  static AmiiboInfo? parse(List<int> pages21and22) {
    if (pages21and22.length < 8 || pages21and22[7] != 0x02) return null;
    return AmiiboInfo(Uint8List.fromList(pages21and22.sublist(0, 8)));
  }

  /// 16 hex digits, the form used by amiibo databases.
  String get idHex => idBytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();

  int get characterId => (idBytes[0] << 8) | idBytes[1];
  int get variant => idBytes[2];

  /// 0 figure, 1 card, 2 yarn, 3 band.
  int get figureType => idBytes[3];
  int get modelNumber => (idBytes[4] << 8) | idBytes[5];
  int get seriesId => idBytes[6];
  String get seriesName => seriesNames[seriesId] ?? '0x${seriesId.toRadixString(16).padLeft(2, '0')}';

  String get lookupUrl => 'https://www.amiiboapi.com/api/amiibo/?id=$idHex';
}
