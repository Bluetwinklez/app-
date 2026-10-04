import 'ndef_record.dart';

/// How an NDEF message fits on common tags.
class ChipFit {
  final String chip;
  final int capacityBytes;
  final int requiredBytes;

  const ChipFit(this.chip, this.capacityBytes, this.requiredBytes);

  bool get fits => requiredBytes <= capacityBytes;
}

class CapacityCheck {
  /// User memory available for the NDEF TLV on common NTAG chips.
  static const Map<String, int> commonChips = {
    'NTAG213': 144,
    'NTAG215': 504,
    'NTAG216': 888,
  };

  /// Bytes the message occupies on a Type 2 tag: TLV header (2 or 4 bytes),
  /// the message and the terminator TLV.
  static int tlvSize(int messageLength) {
    if (messageLength == 0) return 3;
    return messageLength + (messageLength < 0xFF ? 2 : 4) + 1;
  }

  static List<ChipFit> fitsFor(List<NdefRecordModel> records) {
    final required = records.isEmpty ? 0 : tlvSize(encodeNdefMessage(records).length);
    return [
      for (final e in commonChips.entries) ChipFit(e.key, e.value, required),
    ];
  }

  /// Smallest common chip the records fit on, or null when none.
  static String? smallestFittingChip(List<NdefRecordModel> records) {
    for (final fit in fitsFor(records)) {
      if (fit.fits) return fit.chip;
    }
    return null;
  }
}
