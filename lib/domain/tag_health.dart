import 'ndef_record.dart';
import 'nfc_tag_info.dart';
import 'phishing_check.dart';
import 'tag_signature.dart';

enum HealthLevel { good, info, warning, problem }

/// One finding of the tag health check.
enum HealthFinding {
  notNdef,
  empty,
  readOnly,
  writable,
  nearlyFull,
  roomLeft,
  riskyLink,
  suspiciousLink,
  signedValid,
  signedInvalid,
  possibleClone,
  inLibrary,
}

class HealthItem {
  final HealthFinding finding;
  final HealthLevel level;

  /// Numbers the message needs (bytes, percent).
  final Map<String, String> values;

  const HealthItem(this.finding, this.level, [this.values = const {}]);
}

class HealthReport {
  final int score;
  final List<HealthItem> items;

  const HealthReport(this.score, this.items);

  HealthLevel get overall => score >= 85
      ? HealthLevel.good
      : score >= 60
          ? HealthLevel.warning
          : HealthLevel.problem;
}

/// Scores a scanned tag from what a normal read reveals: format, free
/// space, lock state, links, signature and whether it looks cloned.
class TagHealth {
  static const int nearlyFullPercent = 90;

  static HealthReport check(
    NfcTagInfo info, {
    List<int>? signingKey,
    bool inLibrary = false,
    bool possibleClone = false,
  }) {
    final items = <HealthItem>[];
    var score = 100;

    if (!info.isNdefSupported) {
      items.add(const HealthItem(HealthFinding.notNdef, HealthLevel.problem));
      score -= 40;
    }

    if (info.records.isEmpty) {
      items.add(const HealthItem(HealthFinding.empty, HealthLevel.info));
    }

    if (info.isWritable) {
      items.add(const HealthItem(HealthFinding.writable, HealthLevel.good));
    } else {
      items.add(const HealthItem(HealthFinding.readOnly, HealthLevel.info));
    }

    if (info.maxByteCapacity > 0) {
      final percent = (info.currentBytesUsed * 100 / info.maxByteCapacity).round().clamp(0, 100);
      final free = (info.maxByteCapacity - info.currentBytesUsed).clamp(0, info.maxByteCapacity);
      final values = {'percent': '$percent', 'free': '$free', 'total': '${info.maxByteCapacity}'};
      if (percent >= nearlyFullPercent && info.isWritable) {
        items.add(HealthItem(HealthFinding.nearlyFull, HealthLevel.warning, values));
        score -= 10;
      } else {
        items.add(HealthItem(HealthFinding.roomLeft, HealthLevel.good, values));
      }
    }

    var worstLink = PhishingLevel.none;
    for (final r in info.records) {
      final uri = NdefCodec.decodeUri(r);
      if (uri == null) continue;
      final level = PhishingCheck.evaluate(uri).level;
      if (level.index > worstLink.index) worstLink = level;
    }
    if (worstLink == PhishingLevel.danger) {
      items.add(const HealthItem(HealthFinding.riskyLink, HealthLevel.problem));
      score -= 40;
    } else if (worstLink == PhishingLevel.caution) {
      items.add(const HealthItem(HealthFinding.suspiciousLink, HealthLevel.warning));
      score -= 15;
    }

    final sig = TagSignature.verify(info.records, signingKey);
    if (sig == SignatureStatus.valid) {
      items.add(const HealthItem(HealthFinding.signedValid, HealthLevel.good));
    } else if (sig == SignatureStatus.invalid) {
      items.add(const HealthItem(HealthFinding.signedInvalid, HealthLevel.problem));
      score -= 40;
    }

    if (possibleClone) {
      items.add(const HealthItem(HealthFinding.possibleClone, HealthLevel.warning));
      score -= 20;
    }
    if (inLibrary) {
      items.add(const HealthItem(HealthFinding.inLibrary, HealthLevel.good));
    }

    items.sort((a, b) => b.level.index.compareTo(a.level.index));
    return HealthReport(score.clamp(0, 100), items);
  }
}
