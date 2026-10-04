import 'dart:convert';

import 'package:flutter/material.dart';

import '../controllers/nfc_controller.dart';
import '../domain/tag_health.dart';
import '../domain/tag_library.dart';
import '../l10n/app_localizations.dart';
import '../l10n/l10n.dart';
import 'app_theme.dart';

/// Scans a tag and grades it: format, free space, lock, links, signature,
/// clone warning; each finding comes with what to do about it.
class TagHealthPage extends StatefulWidget {
  final NfcStateController controller;

  const TagHealthPage({super.key, required this.controller});

  static Future<void> open(BuildContext context, NfcStateController controller) =>
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => TagHealthPage(controller: controller)));

  @override
  State<TagHealthPage> createState() => _TagHealthPageState();
}

class _TagHealthPageState extends State<TagHealthPage> {
  HealthReport? _report;
  bool _busy = false;

  Future<void> _scan() async {
    setState(() => _busy = true);
    await widget.controller.scanTag(autoLog: false);
    if (!mounted) return;
    final tag = widget.controller.lastScannedTag;
    HealthReport? report;
    if (tag != null && tag.error == null && !tag.wasCancelled) {
      final storage = widget.controller.storage;
      final library = storage.getLibrary();
      final key = storage.signingKey;
      report = TagHealth.check(
        tag,
        signingKey: key == null ? null : base64Decode(key),
        inLibrary: library.any((e) => (e.uid ?? '').toUpperCase() == tag.identifier.toUpperCase()),
        possibleClone: TagLibraryEntry.cloneSuspect(library, tag.identifier, tag.records) != null,
      );
    }
    setState(() {
      _busy = false;
      if (report != null) _report = report;
    });
  }

  static Color _color(HealthLevel level) => switch (level) {
        HealthLevel.good => AppColors.success,
        HealthLevel.info => AppColors.accent,
        HealthLevel.warning => AppColors.warning,
        HealthLevel.problem => AppColors.danger,
      };

  static IconData _icon(HealthLevel level) => switch (level) {
        HealthLevel.good => Icons.check_circle_rounded,
        HealthLevel.info => Icons.info_rounded,
        HealthLevel.warning => Icons.warning_amber_rounded,
        HealthLevel.problem => Icons.error_rounded,
      };

  static (String, String) _texts(HealthItem item, AppLocalizations loc) {
    final v = item.values;
    return switch (item.finding) {
      HealthFinding.notNdef => (loc.healthNotNdef, loc.healthNotNdefTip),
      HealthFinding.empty => (loc.healthEmpty, loc.healthEmptyTip),
      HealthFinding.readOnly => (loc.healthReadOnly, loc.healthReadOnlyTip),
      HealthFinding.writable => (loc.healthWritable, loc.healthWritableTip),
      HealthFinding.nearlyFull => (loc.healthNearlyFull(v['percent'] ?? ''), loc.healthNearlyFullTip),
      HealthFinding.roomLeft => (loc.healthRoomLeft(v['free'] ?? '', v['total'] ?? ''), loc.healthRoomLeftTip),
      HealthFinding.riskyLink => (loc.healthRiskyLink, loc.healthRiskyLinkTip),
      HealthFinding.suspiciousLink => (loc.healthSuspiciousLink, loc.healthSuspiciousLinkTip),
      HealthFinding.signedValid => (loc.healthSignedValid, loc.healthSignedValidTip),
      HealthFinding.signedInvalid => (loc.healthSignedInvalid, loc.healthSignedInvalidTip),
      HealthFinding.possibleClone => (loc.healthPossibleClone, loc.healthPossibleCloneTip),
      HealthFinding.inLibrary => (loc.healthInLibrary, loc.healthInLibraryTip),
    };
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    final report = _report;
    return DecoratedBox(
      decoration: BoxDecoration(gradient: AppColors.canvasGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(title: Text(loc.healthTitle)),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
          children: [
            if (report == null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Text(loc.healthIntro,
                    textAlign: TextAlign.center, style: TextStyle(color: AppColors.secondary, height: 1.4)),
              )
            else ...[
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 84,
                        height: 84,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox.expand(
                              child: CircularProgressIndicator(
                                value: report.score / 100,
                                strokeWidth: 8,
                                color: _color(report.overall),
                                backgroundColor: AppColors.subtleFill,
                              ),
                            ),
                            Text('${report.score}',
                                style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w800)),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          switch (report.overall) {
                            HealthLevel.good || HealthLevel.info => loc.healthOverallGood,
                            HealthLevel.warning => loc.healthOverallWarning,
                            HealthLevel.problem => loc.healthOverallProblem,
                          },
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, height: 1.3),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              for (final item in report.items)
                Card(
                  child: ListTile(
                    leading: Icon(_icon(item.level), color: _color(item.level)),
                    title: Text(_texts(item, loc).$1, style: const TextStyle(fontWeight: FontWeight.w600)),
                    subtitle: Text(_texts(item, loc).$2),
                  ),
                ),
            ],
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: _busy
                  ? const SizedBox(
                      width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                  : const Icon(Icons.nfc_rounded),
              label: Text(report == null ? loc.healthScan : loc.healthScanAnother),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accent,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(52),
              ),
              onPressed: _busy ? null : _scan,
            ),
          ],
        ),
      ),
    );
  }
}
