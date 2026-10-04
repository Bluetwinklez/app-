import 'dart:typed_data';

enum DoctorSeverity { ok, info, warning, error }

enum DoctorFinding {
  /// Fewer than 4 pages were read.
  tooShort,

  /// Page 3 is not an NDEF capability container (blank or non-NDEF tag).
  noCapabilityContainer,
  unsupportedVersion,
  readRestricted,
  readOnly,
  noNdefTlv,
  emptyMessage,
  lengthOverflow,
  exceedsCapacity,
  missingTerminator,
  unknownTlv,
  badRecordStructure,

  /// Everything checked out; `value` is the record count.
  healthy,
}

class DoctorResult {
  final DoctorFinding finding;

  /// Extra number for the message (byte count, record count, offset…).
  final int value;

  const DoctorResult(this.finding, [this.value = 0]);

  DoctorSeverity get severity => switch (finding) {
        DoctorFinding.healthy => DoctorSeverity.ok,
        DoctorFinding.readOnly || DoctorFinding.emptyMessage => DoctorSeverity.info,
        DoctorFinding.missingTerminator ||
        DoctorFinding.unknownTlv ||
        DoctorFinding.readRestricted ||
        DoctorFinding.unsupportedVersion =>
          DoctorSeverity.warning,
        _ => DoctorSeverity.error,
      };

  @override
  String toString() => '$finding($value)';
}

/// Checks a Type 2 tag memory dump (starting at page 0) for the mistakes that
/// make phones refuse a tag: missing capability container, broken TLV, wrong
/// lengths, malformed NDEF records.
class NdefDoctor {
  static List<DoctorResult> diagnose(Uint8List mem) {
    if (mem.length < 16) return const [DoctorResult(DoctorFinding.tooShort)];
    final out = <DoctorResult>[];
    if (mem[12] != 0xE1) return const [DoctorResult(DoctorFinding.noCapabilityContainer)];
    if (mem[13] >> 4 != 1) out.add(DoctorResult(DoctorFinding.unsupportedVersion, mem[13]));
    final dataSize = mem[14] * 8;
    if (mem[15] >> 4 != 0) out.add(DoctorResult(DoctorFinding.readRestricted, mem[15]));
    if (mem[15] & 0x0F == 0x0F) out.add(const DoctorResult(DoctorFinding.readOnly));

    int i = 16;
    int? ndefStart;
    int ndefLength = 0;
    bool terminated = false;
    while (i < mem.length) {
      final t = mem[i];
      if (t == 0x00) {
        i++;
        continue;
      }
      if (t == 0xFE) {
        terminated = true;
        break;
      }
      if (i + 1 >= mem.length) {
        out.add(DoctorResult(DoctorFinding.lengthOverflow, i));
        return out;
      }
      int len = mem[i + 1];
      int header = 2;
      if (len == 0xFF) {
        if (i + 3 >= mem.length) {
          out.add(DoctorResult(DoctorFinding.lengthOverflow, i));
          return out;
        }
        len = (mem[i + 2] << 8) | mem[i + 3];
        header = 4;
      }
      final start = i + header;
      if (start + len > mem.length) {
        out.add(DoctorResult(DoctorFinding.lengthOverflow, len));
        return out;
      }
      if (t == 0x03 && ndefStart == null) {
        ndefStart = start;
        ndefLength = len;
      } else if (t != 0x01 && t != 0x02 && t != 0xFD && t != 0x03) {
        out.add(DoctorResult(DoctorFinding.unknownTlv, t));
      }
      i = start + len;
    }

    if (ndefStart == null) {
      out.add(const DoctorResult(DoctorFinding.noNdefTlv));
      return out;
    }
    if (dataSize > 0 && ndefLength > dataSize) {
      out.add(DoctorResult(DoctorFinding.exceedsCapacity, ndefLength));
    }
    if (!terminated) out.add(const DoctorResult(DoctorFinding.missingTerminator));
    if (ndefLength == 0) {
      out.add(const DoctorResult(DoctorFinding.emptyMessage));
      return out;
    }
    final records = _countRecords(mem, ndefStart, ndefLength);
    if (records < 0) {
      out.add(DoctorResult(DoctorFinding.badRecordStructure, -records - 1));
      return out;
    }
    if (!out.any((r) => r.severity == DoctorSeverity.error)) {
      out.add(DoctorResult(DoctorFinding.healthy, records));
    }
    return out;
  }

  /// Number of records, or `-(index + 1)` of the first malformed record.
  static int _countRecords(Uint8List mem, int start, int length) {
    final end = start + length;
    int p = start;
    int index = 0;
    bool ended = false;
    while (p < end) {
      if (ended) return -(index + 1);
      final h = mem[p];
      final mb = h & 0x80 != 0, me = h & 0x40 != 0, sr = h & 0x10 != 0, il = h & 0x08 != 0;
      if (mb != (index == 0)) return -(index + 1);
      int q = p + 1;
      if (q >= end) return -(index + 1);
      final typeLen = mem[q++];
      int payloadLen;
      if (sr) {
        if (q >= end) return -(index + 1);
        payloadLen = mem[q++];
      } else {
        if (q + 4 > end) return -(index + 1);
        payloadLen = (mem[q] << 24) | (mem[q + 1] << 16) | (mem[q + 2] << 8) | mem[q + 3];
        q += 4;
      }
      int idLen = 0;
      if (il) {
        if (q >= end) return -(index + 1);
        idLen = mem[q++];
      }
      q += typeLen + idLen + payloadLen;
      if (q > end) return -(index + 1);
      p = q;
      index++;
      ended = me;
    }
    return ended ? index : -index;
  }
}
