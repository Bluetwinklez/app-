import 'ndef_record.dart';
import 'quick_links.dart';
import 'storage_models.dart';

/// Coarse grouping of tag contents for filters and statistics.
enum ContentCategory { webText, contact, network, social, empty, other }

class ContentCategories {
  static final _socialHosts = {
    for (final s in SocialNetwork.values) Uri.parse(s.baseUrl).host.replaceFirst('www.', ''),
    'instagram.com', 'facebook.com', 'fb.com', 'linkedin.com', 'youtube.com', 'youtu.be', 'wa.me',
    'tiktok.com', 'x.com', 'twitter.com', 't.me', 'threads.net', 'snapchat.com', 'twitch.tv', 'github.com',
  };

  /// Category of the first meaningful record.
  static ContentCategory of(List<NdefRecordModel> records) {
    if (records.isEmpty) return ContentCategory.empty;
    final p = NdefCodec.parseRecord(records.first);
    switch (p.type) {
      case ParsedRecordType.url:
      case ParsedRecordType.smartPoster:
        final url = (p.extra['url'] ?? p.extra['uri'] ?? p.content).toString();
        final host = (Uri.tryParse(url)?.host ?? '').toLowerCase().replaceFirst('www.', '');
        if (_socialHosts.any((h) => host == h || host.endsWith('.$h'))) return ContentCategory.social;
        return ContentCategory.webText;
      case ParsedRecordType.text:
        return ContentCategory.webText;
      case ParsedRecordType.phone:
      case ParsedRecordType.sms:
      case ParsedRecordType.email:
      case ParsedRecordType.vcard:
        return ContentCategory.contact;
      case ParsedRecordType.wifi:
      case ParsedRecordType.location:
        return ContentCategory.network;
      default:
        return ContentCategory.other;
    }
  }
}

/// Numbers for the analytics page, computed from scan history.
class ScanStats {
  final int total;
  final int uniqueTags;

  /// Scans per day, oldest first, for the last [days] days (today last).
  final List<int> perDay;

  /// (identifier, count), most scanned first.
  final List<(String, int)> topTags;
  final Map<ContentCategory, int> byCategory;

  const ScanStats(this.total, this.uniqueTags, this.perDay, this.topTags, this.byCategory);

  static ScanStats from(List<ScanHistoryEntry> history, {DateTime? now, int days = 14, int top = 5}) {
    now ??= DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final perDay = List<int>.filled(days, 0);
    final counts = <String, int>{};
    final byCategory = <ContentCategory, int>{};
    for (final h in history) {
      final t = h.timestamp.toLocal();
      final d = DateTime(t.year, t.month, t.day);
      final ago = DateTime.utc(today.year, today.month, today.day)
          .difference(DateTime.utc(d.year, d.month, d.day))
          .inDays;
      if (ago >= 0 && ago < days) perDay[days - 1 - ago]++;
      if (h.identifier.isNotEmpty) counts[h.identifier] = (counts[h.identifier] ?? 0) + 1;
      final c = ContentCategories.of(h.records);
      byCategory[c] = (byCategory[c] ?? 0) + 1;
    }
    final sorted = counts.entries.toList()..sort((a, b) => b.value.compareTo(a.value));
    return ScanStats(
      history.length,
      counts.length,
      perDay,
      [for (final e in sorted.take(top)) (e.key, e.value)],
      byCategory,
    );
  }
}
