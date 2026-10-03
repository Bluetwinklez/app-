import 'package:flutter/material.dart';

import '../domain/ndef_record.dart';
import '../domain/phishing_check.dart';
import '../l10n/app_localizations.dart';
import '../l10n/l10n.dart';
import 'app_theme.dart';

/// Red/orange box explaining why a link on a tag looks suspicious.
/// Renders nothing for links that pass the offline checks.
class PhishingBanner extends StatelessWidget {
  final String url;

  const PhishingBanner({super.key, required this.url});

  /// First web link among [records], if any.
  static String? firstUrl(List<NdefRecordModel> records) {
    for (final r in records) {
      final p = NdefCodec.parseRecord(r);
      final url = p.type == ParsedRecordType.url
          ? (p.extra['url'] as String? ?? p.content)
          : p.type == ParsedRecordType.smartPoster
              ? p.extra['uri'] as String?
              : null;
      if (url != null && url.isNotEmpty) return url;
    }
    return null;
  }

  static Widget? forRecords(List<NdefRecordModel> records) {
    final url = firstUrl(records);
    if (url == null || PhishingCheck.evaluate(url).level == PhishingLevel.none) return null;
    return PhishingBanner(url: url);
  }

  @override
  Widget build(BuildContext context) {
    final verdict = PhishingCheck.evaluate(url);
    if (verdict.level == PhishingLevel.none) return const SizedBox.shrink();
    final loc = AppLocalizations.of(context) ?? L10n.current;
    final danger = verdict.level == PhishingLevel.danger;
    final color = danger ? AppColors.danger : AppColors.warning;
    String reason(PhishingReason r) => switch (r.kind) {
          PhishingReasonKind.lookalike => loc.phishLookalike(r.subject),
          PhishingReasonKind.brandInSubdomain => loc.phishBrandInSubdomain(r.subject),
          PhishingReasonKind.brandInName => loc.phishBrandInName(r.subject),
          PhishingReasonKind.shortener => loc.phishShortener(r.subject),
          PhishingReasonKind.riskyTld => loc.phishRiskyTld(r.subject),
        };
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: danger ? AppColors.dangerSoft : AppColors.warningSoft,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(danger ? Icons.gpp_bad_outlined : Icons.report_gmailerrorred_outlined, color: color),
              const SizedBox(width: 8),
              Expanded(
                child: Text(danger ? loc.phishDangerTitle : loc.phishCautionTitle,
                    style: TextStyle(fontWeight: FontWeight.w700, color: color)),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(url, style: const TextStyle(fontSize: 12.5, fontFamily: 'monospace')),
          for (final r in verdict.reasons)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text('• ${reason(r)}', style: const TextStyle(fontSize: 13, height: 1.3)),
            ),
          const SizedBox(height: 4),
          Text(loc.phishDisclaimer, style: TextStyle(fontSize: 11, color: AppColors.secondary)),
        ],
      ),
    );
  }
}
