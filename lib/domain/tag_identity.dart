import 'nfc_tag_info.dart';

/// Human-readable facts about a scanned tag derived without extra NFC
/// commands: the manufacturer from the UID and the likely chip from capacity.
class TagIdentity {
  final String? manufacturer;
  final String? chipGuess;

  const TagIdentity({this.manufacturer, this.chipGuess});

  /// ISO/IEC 7816-6 manufacturer codes (first UID byte) for common tag makers.
  static const Map<int, String> _manufacturers = {
    0x02: 'STMicroelectronics',
    0x04: 'NXP Semiconductors',
    0x05: 'Infineon',
    0x07: 'Texas Instruments',
    0x16: 'EM Microelectronic',
    0x1F: 'Melexis',
    0x28: 'Fudan Microelectronics',
    0x33: 'AMIC',
    0x39: 'Silicon Craft',
    0x44: 'Gentag',
    0x88: 'Infineon',
  };

  /// NDEF capacity (bytes) reported for common NTAG / Ultralight chips.
  static const Map<int, String> _chipsByCapacity = {
    46: 'MIFARE Ultralight',
    48: 'MIFARE Ultralight EV1',
    128: 'MIFARE Ultralight EV1 (128)',
    137: 'NTAG213',
    142: 'NTAG213',
    144: 'NTAG213',
    492: 'NTAG215',
    496: 'NTAG215',
    504: 'NTAG215',
    868: 'NTAG216',
    872: 'NTAG216',
    888: 'NTAG216',
  };

  static TagIdentity of(NfcTagInfo info) {
    return TagIdentity(
      manufacturer: manufacturerFromUid(info.identifier),
      chipGuess: _chipsByCapacity[info.maxByteCapacity] ?? familyFromTechnologies(info.standardTechnologies),
    );
  }

  /// Chip family from the technology list both platforms report
  /// (Android tech class names; iOS sends the same names).
  static String? familyFromTechnologies(List<String> techs) {
    for (final t in techs) {
      if (t.startsWith('MifareClassic')) {
        final size = int.tryParse(t.split(':').last);
        return switch (size) {
          320 => 'MIFARE Classic Mini',
          1024 => 'MIFARE Classic 1K',
          2048 => 'MIFARE Classic 2K',
          4096 => 'MIFARE Classic 4K',
          _ => 'MIFARE Classic',
        };
      }
    }
    if (techs.contains('MifareDesfire')) return 'MIFARE DESFire';
    if (techs.contains('MifarePlus')) return 'MIFARE Plus';
    if (techs.contains('NfcV')) return 'ISO 15693 (NFC-V)';
    if (techs.contains('NfcF')) return 'FeliCa (NFC-F)';
    if (techs.contains('NfcB')) return 'ISO 14443-B';
    if (techs.contains('IsoDep')) return 'ISO 14443-4';
    if (techs.contains('MifareUltralight')) return 'MIFARE Ultralight / NTAG';
    return null;
  }

  /// Accepts UIDs like `04:A1:B2:...` or `04A1B2...`.
  static String? manufacturerFromUid(String uid) {
    final hex = uid.replaceAll(RegExp(r'[^0-9A-Fa-f]'), '');
    if (hex.length < 8) return null;
    return _manufacturers[int.parse(hex.substring(0, 2), radix: 16)];
  }
}
