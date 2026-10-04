import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../domain/ndef_record.dart';
import '../l10n/app_localizations.dart';
import '../l10n/l10n.dart';
import '../services/launch_action_service.dart';
import 'app_theme.dart';

/// A scanned vCard shown as a business card with one-tap actions.
class BusinessCardView extends StatelessWidget {
  final NdefRecordModel record;

  const BusinessCardView({super.key, required this.record});

  /// The first vCard among [records], if any.
  static NdefRecordModel? find(List<NdefRecordModel> records) {
    for (final r in records) {
      if (NdefCodec.decodeVCard(r) != null) return r;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    final v = NdefCodec.decodeVCard(record) ?? const {};
    final name = (v['fn'] ?? '${v['firstName'] ?? ''} ${v['lastName'] ?? ''}').trim();
    final initials = name
        .split(RegExp(r'\s+'))
        .where((p) => p.isNotEmpty)
        .take(2)
        .map((p) => p.characters.first.toUpperCase())
        .join();
    final subtitle = [v['title'], v['org']].where((s) => (s ?? '').isNotEmpty).join(' · ');
    final tel = v['tel'] ?? '', email = v['email'] ?? '', url = v['url'] ?? '';

    Widget action(IconData icon, String label, VoidCallback onTap) => Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: FilledButton.tonal(
              style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 10)),
              onPressed: onTap,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [Icon(icon, size: 20), const SizedBox(height: 2), Text(label, style: const TextStyle(fontSize: 12))],
              ),
            ),
          ),
        );

    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.surface,
        boxShadow: AppColors.softShadow,
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
            decoration: BoxDecoration(gradient: AppColors.heroGradient),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.white,
                  child: Text(initials.isEmpty ? '?' : initials,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: AppColors.accent)),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(loc.cardTitle.toUpperCase(),
                          style: const TextStyle(fontSize: 10.5, letterSpacing: 0.8, color: Colors.white70)),
                      Text(name.isEmpty ? loc.recordTypeVCard : name,
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white)),
                      if (subtitle.isNotEmpty)
                        Text(subtitle, style: const TextStyle(color: Colors.white, fontSize: 13)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 12, 10, 12),
            child: Row(
              children: [
                if (tel.isNotEmpty) action(Icons.call_rounded, loc.cardCall, () => LaunchActionService.openUrl('tel:$tel')),
                if (email.isNotEmpty)
                  action(Icons.mail_rounded, loc.cardEmail, () => LaunchActionService.openUrl('mailto:$email')),
                if (url.isNotEmpty) action(Icons.language_rounded, loc.cardWeb, () => LaunchActionService.openUrl(url)),
                action(Icons.person_add_alt_1_rounded, loc.cardAddContact, () {
                  final file = '${name.isEmpty ? 'contact' : name.replaceAll(RegExp(r'[^\w]+'), '_')}.vcf';
                  SharePlus.instance.share(ShareParams(
                    files: [XFile.fromData(Uint8List.fromList(record.payload), mimeType: 'text/vcard', name: file)],
                    fileNameOverrides: [file],
                  ));
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
