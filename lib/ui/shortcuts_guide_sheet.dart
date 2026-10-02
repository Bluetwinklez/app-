import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../domain/ndef_record.dart';
import '../l10n/app_localizations.dart';
import '../services/launch_action_service.dart';
import 'app_theme.dart';

/// Explains Siri phrases, the Shortcuts "NFC" personal automation and the
/// nfctagmaster:// links that open the app on a given screen.
class ShortcutsGuideSheet extends StatelessWidget {
  /// Adds a record to the write list (used to put a deep link on a tag).
  final void Function(NdefRecordModel record, String title) onAddRecord;

  const ShortcutsGuideSheet({super.key, required this.onAddRecord});

  static Future<void> show(
    BuildContext context, {
    required void Function(NdefRecordModel record, String title) onAddRecord,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => ShortcutsGuideSheet(onAddRecord: onAddRecord),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final links = [
      (LaunchAction.scan, loc.linkScanDesc),
      (LaunchAction.write, loc.linkWriteDesc),
      (LaunchAction.tools, loc.linkToolsDesc),
      (LaunchAction.history, loc.linkHistoryDesc),
    ];
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.85,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
          children: [
            Text(loc.shortcutsGuideTitle, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 6),
            Text(
              loc.shortcutsGuideSubtitle,
              style: const TextStyle(color: AppColors.secondary, height: 1.4),
            ),
            SectionHeader(title: loc.withSiri),
            _Bullet(icon: Icons.mic_none_rounded, text: loc.siriPhraseScan),
            _Bullet(icon: Icons.mic_none_rounded, text: loc.siriPhraseWrite),
            _Bullet(
              icon: Icons.apps_rounded,
              text: loc.siriShortcutsNote,
            ),
            SectionHeader(title: loc.autoRunOnTap),
            _Step(n: 1, text: loc.shortcutStep1),
            _Step(n: 2, text: loc.shortcutStep2),
            _Step(n: 3, text: loc.shortcutStep3),
            _Step(n: 4, text: loc.shortcutStep4),
            _Step(n: 5, text: loc.shortcutStep5),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                loc.shortcutAutomationNote,
                style: const TextStyle(fontSize: 12.5, color: AppColors.secondary),
              ),
            ),
            SectionHeader(title: loc.appLinksSection),
            Text(
              loc.appLinksDesc,
              style: const TextStyle(color: AppColors.secondary, height: 1.4),
            ),
            const SizedBox(height: 10),
            for (final (action, description) in links)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: SoftCard(
                  padding: const EdgeInsetsDirectional.fromSTEB(14, 10, 6, 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              LaunchActionService.linkFor(action),
                              style: const TextStyle(fontFamily: 'Courier', fontWeight: FontWeight.w600),
                            ),
                            Text(description, style: const TextStyle(fontSize: 12.5, color: AppColors.secondary)),
                          ],
                        ),
                      ),
                      IconButton(
                        tooltip: loc.copyTagUid,
                        icon: const Icon(Icons.copy_rounded, size: 20),
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: LaunchActionService.linkFor(action)));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(loc.linkCopied)),
                          );
                        },
                      ),
                      IconButton(
                        tooltip: loc.addToWriteList,
                        icon: const Icon(Icons.add_circle_outline_rounded, size: 22, color: AppColors.accent),
                        onPressed: () {
                          onAddRecord(
                            NdefCodec.encodeUri(LaunchActionService.linkFor(action)),
                            LaunchActionService.linkFor(action),
                          );
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _Bullet extends StatelessWidget {
  final IconData icon;
  final String text;

  const _Bullet({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: AppColors.accent),
          const SizedBox(width: 10),
          Expanded(child: Text(text, style: const TextStyle(height: 1.4))),
        ],
      ),
    );
  }
}

class _Step extends StatelessWidget {
  final int n;
  final String text;

  const _Step({required this.n, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            alignment: Alignment.center,
            decoration: const BoxDecoration(color: AppColors.accent, shape: BoxShape.circle),
            child: Text('$n', style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700)),
          ),
          const SizedBox(width: 10),
          Expanded(child: Text(text, style: const TextStyle(height: 1.4))),
        ],
      ),
    );
  }
}
