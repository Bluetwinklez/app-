/// Offline look-alike / phishing heuristics for links found on tags.
/// It cannot prove a site is safe; it only flags common tricks.
enum PhishingLevel { none, caution, danger }

enum PhishingReasonKind { lookalike, brandInSubdomain, brandInName, shortener, riskyTld }

class PhishingReason {
  final PhishingReasonKind kind;

  /// Brand, shortener host or TLD the reason is about.
  final String subject;

  const PhishingReason(this.kind, this.subject);
}

class PhishingVerdict {
  final PhishingLevel level;
  final List<PhishingReason> reasons;

  const PhishingVerdict(this.level, this.reasons);

  static const safe = PhishingVerdict(PhishingLevel.none, []);
}

class PhishingCheck {
  /// Brand keyword → domains that legitimately use it.
  static const Map<String, List<String>> brands = {
    'apple': ['apple.com', 'icloud.com'],
    'icloud': ['icloud.com', 'apple.com'],
    'google': ['google.com', 'google.com.tr', 'goo.gl', 'youtube.com', 'g.page'],
    'microsoft': ['microsoft.com', 'live.com', 'office.com'],
    'paypal': ['paypal.com'],
    'amazon': ['amazon.com', 'amazon.com.tr', 'amazon.de', 'amazon.co.uk'],
    'netflix': ['netflix.com'],
    'instagram': ['instagram.com'],
    'facebook': ['facebook.com', 'fb.com'],
    'whatsapp': ['whatsapp.com', 'wa.me'],
    'binance': ['binance.com'],
    'garanti': ['garantibbva.com.tr'],
    'akbank': ['akbank.com'],
    'ziraat': ['ziraatbank.com.tr'],
    'isbank': ['isbank.com.tr'],
    'yapikredi': ['yapikredi.com.tr'],
    'enpara': ['enpara.com'],
    'edevlet': ['turkiye.gov.tr'],
    'ptt': ['ptt.gov.tr'],
    'trendyol': ['trendyol.com'],
    'hepsiburada': ['hepsiburada.com'],
    'getir': ['getir.com'],
  };

  static const shorteners = {
    'bit.ly', 'tinyurl.com', 't.co', 'goo.gl', 'is.gd', 'cutt.ly', 'ow.ly',
    'rebrand.ly', 'shorturl.at', 'tiny.cc', 'buff.ly', 'rb.gy', 't.ly',
  };

  static const riskyTlds = {
    'zip', 'mov', 'xyz', 'top', 'click', 'tk', 'ml', 'ga', 'cf', 'gq', 'work',
    'support', 'rest', 'cam', 'country', 'icu', 'buzz',
  };

  /// Second-level public suffixes common enough to matter here.
  static const _twoLevelSuffixes = {
    'com.tr', 'gov.tr', 'org.tr', 'edu.tr', 'net.tr', 'gen.tr', 'bel.tr', 'k12.tr',
    'co.uk', 'org.uk', 'ac.uk', 'com.br', 'com.au', 'co.jp', 'co.kr', 'com.cn', 'com.mx',
  };

  /// `login.apple.com.tr` → `apple.com.tr`.
  static String registrableDomain(String host) {
    final labels = host.toLowerCase().split('.').where((l) => l.isNotEmpty).toList();
    if (labels.length <= 2) return labels.join('.');
    final lastTwo = labels.sublist(labels.length - 2).join('.');
    final take = _twoLevelSuffixes.contains(lastTwo) ? 3 : 2;
    return labels.sublist(labels.length - take).join('.');
  }

  static PhishingVerdict evaluate(String url) {
    final uri = Uri.tryParse(url.trim());
    final host = uri?.host.toLowerCase() ?? '';
    if (host.isEmpty || !(uri!.scheme == 'http' || uri.scheme == 'https')) return PhishingVerdict.safe;

    final reasons = <PhishingReason>[];
    final registrable = registrableDomain(host);
    final sld = registrable.split('.').first;
    final tld = host.split('.').last;

    bool official(String brand) =>
        brands[brand]!.any((d) => registrable == d || host == d || host.endsWith('.$d'));

    final folded = _fold(sld);
    final subLabels = host.split('.');
    subLabels.removeRange(subLabels.length - registrable.split('.').length, subLabels.length);
    final nameParts = sld.split('-');
    for (final brand in brands.keys) {
      if (official(brand)) continue;
      final maxEdits = brand.length >= 8 ? 2 : (brand.length >= 5 ? 1 : 0);
      if (folded != brand && maxEdits > 0 && _distance(folded, brand) <= maxEdits) {
        reasons.add(PhishingReason(PhishingReasonKind.lookalike, brand));
      } else if (folded == brand && sld != brand) {
        // e.g. "app1e" or "paypa1": digits/letters swapped to look identical.
        reasons.add(PhishingReason(PhishingReasonKind.lookalike, brand));
      } else if (subLabels.contains(brand)) {
        // apple.com.secure-login.xyz
        reasons.add(PhishingReason(PhishingReasonKind.brandInSubdomain, brand));
      } else if (nameParts.length > 1 && nameParts.contains(brand)) {
        reasons.add(PhishingReason(PhishingReasonKind.brandInName, brand));
      }
    }
    if (shorteners.contains(host) || shorteners.contains(registrable)) {
      reasons.add(PhishingReason(PhishingReasonKind.shortener, host));
    }
    if (riskyTlds.contains(tld)) {
      reasons.add(PhishingReason(PhishingReasonKind.riskyTld, tld));
    }

    if (reasons.isEmpty) return PhishingVerdict.safe;
    final danger = reasons.any((r) =>
        r.kind == PhishingReasonKind.lookalike || r.kind == PhishingReasonKind.brandInSubdomain);
    return PhishingVerdict(danger ? PhishingLevel.danger : PhishingLevel.caution, reasons);
  }

  /// Undo common character swaps used in fake domains.
  static String _fold(String s) => s
      .replaceAll('rn', 'm')
      .replaceAll('vv', 'w')
      .replaceAll('0', 'o')
      .replaceAll('1', 'l')
      .replaceAll('3', 'e')
      .replaceAll('5', 's')
      .replaceAll('-', '');

  static int _distance(String a, String b) {
    if ((a.length - b.length).abs() > 2) return 3;
    var prev = List<int>.generate(b.length + 1, (i) => i);
    for (int i = 1; i <= a.length; i++) {
      final cur = List<int>.filled(b.length + 1, 0)..[0] = i;
      for (int j = 1; j <= b.length; j++) {
        final cost = a[i - 1] == b[j - 1] ? 0 : 1;
        cur[j] = [prev[j] + 1, cur[j - 1] + 1, prev[j - 1] + cost].reduce((x, y) => x < y ? x : y);
      }
      prev = cur;
    }
    return prev[b.length];
  }
}
