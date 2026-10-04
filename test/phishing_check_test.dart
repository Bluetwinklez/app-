import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/domain/phishing_check.dart';

void main() {
  PhishingLevel level(String url) => PhishingCheck.evaluate(url).level;
  Set<PhishingReasonKind> kinds(String url) =>
      PhishingCheck.evaluate(url).reasons.map((r) => r.kind).toSet();

  test('official sites pass', () {
    for (final url in [
      'https://www.apple.com/tr/',
      'https://support.apple.com',
      'https://www.garantibbva.com.tr/kampanya',
      'https://www.turkiye.gov.tr/',
      'https://maps.google.com/?q=x',
      'https://pineapple.com',
      'https://example.com/apple',
    ]) {
      expect(level(url), PhishingLevel.none, reason: url);
    }
  });

  test('look-alike domains are dangerous', () {
    expect(kinds('https://paypa1.com/login'), contains(PhishingReasonKind.lookalike));
    expect(kinds('https://appie.com'), contains(PhishingReasonKind.lookalike));
    expect(kinds('https://rnicrosoft.com'), contains(PhishingReasonKind.lookalike));
    expect(level('https://instagran.com'), PhishingLevel.danger);
  });

  test('brand placed in a subdomain of another site is dangerous', () {
    final v = PhishingCheck.evaluate('https://apple.com.verify-account.xyz/');
    expect(v.level, PhishingLevel.danger);
    expect(v.reasons.map((r) => r.kind), containsAll([PhishingReasonKind.brandInSubdomain, PhishingReasonKind.riskyTld]));
  });

  test('shorteners, risky TLDs and brand-in-name are only cautions', () {
    expect(level('https://bit.ly/abc'), PhishingLevel.caution);
    expect(level('https://cafe.xyz'), PhishingLevel.caution);
    expect(kinds('https://ziraat-kampanya.com'), {PhishingReasonKind.brandInName});
    expect(level('https://ziraat-kampanya.com'), PhishingLevel.caution);
  });

  test('registrable domain handles two-level suffixes', () {
    expect(PhishingCheck.registrableDomain('a.b.isbank.com.tr'), 'isbank.com.tr');
    expect(PhishingCheck.registrableDomain('x.example.co.uk'), 'example.co.uk');
    expect(PhishingCheck.registrableDomain('www.apple.com'), 'apple.com');
  });

  test('non-web links are ignored', () {
    expect(level('tel:+90555'), PhishingLevel.none);
    expect(level('mailto:a@paypa1.com'), PhishingLevel.none);
  });
}
