import 'package:flutter/material.dart';

import '../controllers/nfc_controller.dart';
import '../domain/ndef_record.dart';
import '../l10n/app_localizations.dart';
import '../l10n/l10n.dart';
import '../services/launch_action_service.dart';
import 'app_theme.dart';

/// One big button to read a tag and one big action for what it holds.
/// Meant for children and older people; leaving it needs a long press.
class SimpleModeScreen extends StatelessWidget {
  final NfcStateController controller;
  final VoidCallback onExit;

  const SimpleModeScreen({super.key, required this.controller, required this.onExit});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    return DecoratedBox(
      decoration: BoxDecoration(gradient: AppColors.canvasGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: ListenableBuilder(
            listenable: controller,
            builder: (context, _) {
              final tag = controller.lastScannedTag;
              return ListView(
                padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
                children: [
                  Text(loc.appTitle,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w800)),
                  const SizedBox(height: 32),
                  Center(
                    child: SizedBox(
                      width: 220,
                      height: 220,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: AppColors.accent,
                          foregroundColor: Colors.white,
                          elevation: 6,
                        ),
                        onPressed: controller.isBusy ? null : controller.scanTag,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.nfc_rounded, size: 72),
                            const SizedBox(height: 8),
                            Text(loc.simpleScan,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(loc.simpleHint,
                      textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color: AppColors.secondary)),
                  const SizedBox(height: 28),
                  if (tag != null && tag.error == null) _Result(records: tag.records),
                  const SizedBox(height: 40),
                  GestureDetector(
                    onLongPress: onExit,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(loc.simpleExit,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 13, color: AppColors.secondary)),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _Result extends StatelessWidget {
  final List<NdefRecordModel> records;

  const _Result({required this.records});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    if (records.isEmpty) {
      return Text(loc.simpleNothing, textAlign: TextAlign.center, style: const TextStyle(fontSize: 20));
    }
    final p = NdefCodec.parseRecord(records.first);
    final (IconData? icon, String? label, String? url) = switch (p.type) {
      ParsedRecordType.phone => (Icons.call_rounded, loc.simpleCall, 'tel:${p.content}'),
      ParsedRecordType.sms => (Icons.sms_rounded, loc.simpleMessage, 'sms:${p.content}'),
      ParsedRecordType.email => (Icons.email_rounded, loc.simpleEmail, 'mailto:${p.content}'),
      ParsedRecordType.location => (Icons.map_rounded, loc.simpleMap,
          'https://maps.apple.com/?ll=${p.extra['latitude']},${p.extra['longitude']}'),
      ParsedRecordType.url => (Icons.open_in_new_rounded, loc.simpleOpen, p.extra['url'] as String? ?? p.content),
      ParsedRecordType.smartPoster => (Icons.open_in_new_rounded, loc.simpleOpen, p.extra['uri'] as String?),
      ParsedRecordType.vcard => (Icons.call_rounded, loc.simpleCall,
          (p.extra['tel'] as String?) == null ? null : 'tel:${p.extra['tel']}'),
      _ => (null, null, null),
    };
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SoftCard(
          padding: const EdgeInsets.all(20),
          child: Text(
            p.content,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600, height: 1.3),
          ),
        ),
        if (url != null && label != null) ...[
          const SizedBox(height: 16),
          SizedBox(
            height: 72,
            child: FilledButton.icon(
              style: FilledButton.styleFrom(backgroundColor: AppColors.success),
              onPressed: () => LaunchActionService.openUrl(url),
              icon: Icon(icon, size: 32),
              label: Text(label, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
            ),
          ),
        ],
      ],
    );
  }
}
