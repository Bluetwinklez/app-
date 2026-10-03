import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../l10n/l10n.dart';
import 'app_theme.dart';

enum _Support { full, ndefOnly, nxpOnly, none }

class _Chip {
  final String name;
  final String family;
  final int usableBytes;
  final _Support iphone;
  final _Support android;
  final String Function(AppLocalizations) use;

  const _Chip(this.name, this.family, this.usableBytes, this.iphone, this.android, this.use);
}

/// Reference card for common NFC chips: usable NDEF bytes, phone support and
/// typical uses, so people know which tags to buy.
class NfcChipsPage extends StatelessWidget {
  const NfcChipsPage({super.key});

  static Future<void> open(BuildContext context) =>
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => const NfcChipsPage()));

  static final List<_Chip> _chips = [
    _Chip('NTAG213', 'NFC Forum Type 2', 144, _Support.full, _Support.full, (l) => l.chipUseSmall),
    _Chip('NTAG215', 'NFC Forum Type 2', 504, _Support.full, _Support.full, (l) => l.chipUseMedium),
    _Chip('NTAG216', 'NFC Forum Type 2', 888, _Support.full, _Support.full, (l) => l.chipUseLarge),
    _Chip('NTAG 424 DNA', 'NFC Forum Type 4', 256, _Support.full, _Support.full, (l) => l.chipUseSecure),
    _Chip('MIFARE Ultralight EV1', 'NFC Forum Type 2', 48, _Support.full, _Support.full, (l) => l.chipUseTicket),
    _Chip('MIFARE Ultralight C', 'NFC Forum Type 2', 144, _Support.full, _Support.full, (l) => l.chipUseTicket),
    _Chip('MIFARE DESFire EV3', 'NFC Forum Type 4', 2048, _Support.ndefOnly, _Support.ndefOnly, (l) => l.chipUseAccess),
    _Chip('MIFARE Classic 1K', 'ISO 14443-A', 716, _Support.none, _Support.nxpOnly, (l) => l.chipUseAccess),
    _Chip('ICODE SLIX2', 'NFC Forum Type 5', 316, _Support.full, _Support.full, (l) => l.chipUseIndustrial),
    _Chip('ST25TV02K', 'NFC Forum Type 5', 248, _Support.full, _Support.full, (l) => l.chipUseIndustrial),
    _Chip('FeliCa Lite-S', 'NFC Forum Type 3', 224, _Support.ndefOnly, _Support.full, (l) => l.chipUseJapan),
    _Chip('Topaz 512', 'NFC Forum Type 1', 454, _Support.none, _Support.full, (l) => l.chipUseLegacy),
  ];

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    return DecoratedBox(
      decoration: BoxDecoration(gradient: AppColors.canvasGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(title: Text(loc.chipsTitle)),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
          children: [
            Text(loc.chipsIntro, style: TextStyle(color: AppColors.secondary, height: 1.4)),
            const SizedBox(height: 12),
            for (final chip in _chips)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: SoftCard(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(chip.name,
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                          ),
                          Text(chip.family, style: TextStyle(fontSize: 12, color: AppColors.secondary)),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(loc.chipsUsable('${chip.usableBytes}'),
                          style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.accent)),
                      const SizedBox(height: 4),
                      Text(chip.use(loc), style: const TextStyle(height: 1.35)),
                      const SizedBox(height: 8),
                      _support(Icons.phone_iphone, loc.tapPreviewIphone, chip.iphone, loc),
                      const SizedBox(height: 2),
                      _support(Icons.android, loc.tapPreviewAndroid, chip.android, loc),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _support(IconData icon, String platform, _Support s, AppLocalizations loc) {
    final (text, color) = switch (s) {
      _Support.full => (loc.chipsReadWrite, AppColors.success),
      _Support.ndefOnly => (loc.chipsReadOnlyNdef, AppColors.warning),
      _Support.nxpOnly => (loc.chipsNxpOnly, AppColors.warning),
      _Support.none => (loc.chipsNotSupported, AppColors.danger),
    };
    return Row(
      children: [
        Icon(icon, size: 16, color: AppColors.secondary),
        const SizedBox(width: 6),
        Text('$platform: ', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
        Expanded(child: Text(text, style: TextStyle(fontSize: 13, color: color))),
      ],
    );
  }
}
