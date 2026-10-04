import 'dart:typed_data';
import 'ndef_record.dart';
import 'nfc_tag_info.dart';

enum RecordDiffStatus { same, changed, onlyFirst, onlySecond }

class RecordDiff {
  final int index;
  final RecordDiffStatus status;
  final NdefRecordModel? first;
  final NdefRecordModel? second;

  const RecordDiff(this.index, this.status, this.first, this.second);
}

/// Record-by-record comparison of two scanned tags.
class TagComparison {
  final NfcTagInfo first;
  final NfcTagInfo second;
  final List<RecordDiff> records;

  const TagComparison._(this.first, this.second, this.records);

  bool get contentIdentical => records.every((d) => d.status == RecordDiffStatus.same);
  bool get sameUid => first.identifier.toUpperCase() == second.identifier.toUpperCase();

  static TagComparison compare(NfcTagInfo first, NfcTagInfo second) {
    final count = first.records.length > second.records.length ? first.records.length : second.records.length;
    final diffs = <RecordDiff>[];
    for (int i = 0; i < count; i++) {
      final a = i < first.records.length ? first.records[i] : null;
      final b = i < second.records.length ? second.records[i] : null;
      final RecordDiffStatus status;
      if (a == null) {
        status = RecordDiffStatus.onlySecond;
      } else if (b == null) {
        status = RecordDiffStatus.onlyFirst;
      } else {
        status = _sameRecord(a, b) ? RecordDiffStatus.same : RecordDiffStatus.changed;
      }
      diffs.add(RecordDiff(i, status, a, b));
    }
    return TagComparison._(first, second, diffs);
  }

  static bool _sameRecord(NdefRecordModel a, NdefRecordModel b) {
    return a.tnf == b.tnf && _eq(a.type, b.type) && _eq(a.id, b.id) && _eq(a.payload, b.payload);
  }

  static bool _eq(Uint8List a, Uint8List b) {
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}
