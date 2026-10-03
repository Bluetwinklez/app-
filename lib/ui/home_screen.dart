import 'dart:convert';
import 'dart:math';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import '../domain/ndef_record.dart';
import '../domain/nfc_tag_info.dart';
import '../domain/storage_models.dart';
import '../domain/nfc_workflow_models.dart';
import '../domain/composer_history.dart';
import '../controllers/nfc_controller.dart';
import '../services/nfc_service.dart';
import '../services/backup_codec.dart';
import '../services/backup_crypto.dart';
import 'compose_record_sheet.dart';
import 'raw_record_editor_dialog.dart';
import 'qr_preview_dialog.dart';
import 'tag_rules_manager_sheet.dart';
import 'app_theme.dart';
import 'tools_tab.dart';
import 'phishing_banner.dart';
import 'nfc_chips_page.dart';
import '../app_info.dart';
import 'tap_preview_card.dart';
import 'onboarding_page.dart';
import 'template_gallery_page.dart';
import 'tag_library_page.dart';
import 'shortcuts_guide_sheet.dart';
import '../services/launch_action_service.dart';
import '../domain/tag_identity.dart';
import '../domain/capacity.dart';
import '../domain/csv_export.dart';
import '../domain/tag_library.dart';
import '../util/text_search.dart';
import 'dart:async';
import 'qr_scan_page.dart';
import 'package:intl/intl.dart';
import '../l10n/app_localizations.dart';
import '../l10n/l10n.dart';
import '../domain/csv_records.dart';
import '../domain/serial_plan.dart';
import '../domain/template_variables.dart';

part 'home_clipboard_flows.dart';
part 'home_batch_flow.dart';
part 'home_composer_helpers.dart';
part 'home_templates_rules.dart';
part 'home_backup.dart';
part 'home_read_tab.dart';
part 'home_write_tab.dart';
part 'home_history_tab.dart';
part 'home_settings_tab.dart';

class HomeScreen extends StatefulWidget {
  final NfcStateController? controller;

  const HomeScreen({super.key, this.controller});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  late final NfcStateController _controller;
  late final TabController _tabController;

  // Staged records for writing
  final List<NdefRecordModel> _recordsToWrite = [];

  // Bounded Undo/Redo history for composer changes
  final ComposerHistory _composerHistory = ComposerHistory(maxSnapshots: 30);

  // Expanded records for Advanced Record Inspector
  final Set<int> _expandedReadIndices = <int>{};
  final Set<int> _expandedComposerIndices = <int>{};

  // State for Rewrite flow (staged for rewrite)
  List<NdefRecordModel>? _rewriteStagedRecords;
  String? _rewriteSourceUid;

  // State for Batch Write flow
  int _batchTargetCount = 5;
  int _batchCurrentIndex = 0; // 0-based
  bool _batchActive = false;
  final List<BatchTagAttempt> _batchAttempts = [];
  List<NdefRecordModel> Function(int index)? _batchRecordsFor;
  String Function(int index)? _batchLabelFor;

  // State for History search & filter
  final TextEditingController _historySearchController =
      TextEditingController();
  String _historySearchQuery = '';

  // Continuous scanning (inventory)
  bool _continuousScan = false;
  final List<ScanLogEntry> _scanLog = [];

  final LaunchActionService _launchActions = LaunchActionService();
  StreamSubscription<LaunchAction>? _launchSubscription;
  bool _showOnboarding = false;

  @override
  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? NfcStateController();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(_onControllerUpdate);
    _controller.addListener(_onControllerUpdate);
    WidgetsBinding.instance.addObserver(this);
    _showOnboarding = !_controller.onboardingDone;
    _controller.init();
    _launchSubscription = _launchActions.actions.listen(_handleLaunchAction);
    _launchActions.start();
  }

  /// Opens the screen requested by a Siri shortcut or an nfctagmaster:// link.
  void _handleLaunchAction(LaunchAction action) {
    if (!mounted) return;
    if (_showOnboarding) setState(() => _showOnboarding = false);
    switch (action) {
      case LaunchAction.scan:
        _tabController.animateTo(0);
        if (!_controller.isBusy) _controller.scanTag();
        break;
      case LaunchAction.write:
        _tabController.animateTo(1);
        break;
      case LaunchAction.tools:
        _tabController.animateTo(2);
        break;
      case LaunchAction.history:
        _tabController.animateTo(3);
        break;
      case LaunchAction.settings:
        _tabController.animateTo(4);
        break;
    }
  }

  Future<void> _runContinuousScan() async {
    setState(() => _continuousScan = true);
    while (_continuousScan && mounted) {
      await _controller.scanTag();
      final tag = _controller.lastScannedTag;
      if (!mounted || tag == null || tag.error != null) break;
      final duplicate = _scanLog.isNotEmpty &&
          _scanLog.first.uid == tag.identifier &&
          DateTime.now().difference(_scanLog.first.time).inSeconds < 3;
      if (!duplicate) {
        setState(() => _scanLog.insert(0, ScanLogEntry(DateTime.now(), tag.identifier, List.of(tag.records))));
      }
      await Future<void>.delayed(const Duration(milliseconds: 700));
    }
    if (mounted) setState(() => _continuousScan = false);
  }

  Future<void> _shareCsv(String csv, String baseName) async {
    final name = '${baseName}_${DateTime.now().toIso8601String().substring(0, 10)}.csv';
    await SharePlus.instance.share(ShareParams(
      files: [XFile.fromData(Uint8List.fromList(utf8.encode(csv)), mimeType: 'text/csv', name: name)],
      fileNameOverrides: [name],
    ));
  }

  Future<void> _exportScanLog() async {
    final csv = CsvExport.scans(_scanLog, header: [
      L10n.current.csvColumnTime,
      'UID',
      L10n.current.csvColumnRecords,
      L10n.current.csvColumnContent,
    ]);
    final name = 'nfc_scans_${DateTime.now().toIso8601String().substring(0, 10)}.csv';
    await SharePlus.instance.share(ShareParams(
      files: [XFile.fromData(Uint8List.fromList(utf8.encode(csv)), mimeType: 'text/csv', name: name)],
      fileNameOverrides: [name],
    ));
  }

  Widget _buildContinuousScanCard() {
    return SoftCard(
      padding: const EdgeInsets.fromLTRB(16, 8, 8, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            secondary: Icon(Icons.all_inclusive_rounded, color: AppColors.accent),
            title: Text(L10n.current.continuousScanTitle,
                style: const TextStyle(fontWeight: FontWeight.w600)),
            subtitle: Text(L10n.current.continuousScanSubtitle),
            value: _continuousScan,
            onChanged: _controller.isBusy && !_continuousScan
                ? null
                : (on) {
                    if (on) {
                      _runContinuousScan();
                    } else {
                      setState(() => _continuousScan = false);
                      _controller.cancelSession();
                    }
                  },
          ),
          if (_scanLog.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 8, bottom: 4),
              child: Row(
                children: [
                  Expanded(
                    child: Builder(builder: (context) {
                      final report = ScanReport.of(_scanLog);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(L10n.current.continuousScanCount('${_scanLog.length}'),
                              style: const TextStyle(fontWeight: FontWeight.w600)),
                          Text(
                            L10n.current.scanReportLine(
                                '${report.unique}', '${report.duplicates}', '${report.empty}'),
                            style: TextStyle(fontSize: 12, color: AppColors.secondary),
                          ),
                        ],
                      );
                    }),
                  ),
                  IconButton(
                    tooltip: L10n.current.exportCsv,
                    icon: Icon(Icons.ios_share_rounded, color: AppColors.accent),
                    onPressed: _exportScanLog,
                  ),
                  IconButton(
                    tooltip: L10n.current.clearList,
                    icon: Icon(Icons.delete_outline, color: AppColors.danger),
                    onPressed: () => setState(_scanLog.clear),
                  ),
                ],
              ),
            ),
            for (final e in _scanLog.take(20))
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 8, bottom: 4),
                child: Row(
                  children: [
                    Text(e.time.toLocal().toIso8601String().substring(11, 19),
                        style: TextStyle(fontSize: 12, color: AppColors.secondary)),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        e.records.isEmpty
                            ? e.uid
                            : '${e.uid} · ${NdefCodec.parseRecord(e.records.first).content}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ],
      ),
    );
  }

  void _finishOnboarding() {
    _controller.setOnboardingDone(true);
    setState(() => _showOnboarding = false);
  }

  void _openTemplateGallery() {
    TemplateGalleryPage.open(
      context,
      onRecordsCreated: (records, title) => _appendImportedRecords(records, title),
      storage: _controller.storage,
    );
  }

  void _openTagLibrary({bool saveLastScan = false}) {
    final tag = _controller.lastScannedTag;
    final hasScan = tag != null && tag.error == null;
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => TagLibraryPage(
        storage: _controller.storage,
        lastScanRecords: hasScan ? List<NdefRecordModel>.from(tag.records) : const [],
        lastScanUid: hasScan ? tag.identifier : null,
        composerRecords: List<NdefRecordModel>.from(_recordsToWrite),
        onUseRecords: (records, name) => _appendImportedRecords(List<NdefRecordModel>.from(records), name),
        onWriteRecords: (records, name) => _controller.writeRecords(
          List<NdefRecordModel>.from(records),
          promptMessage: L10n.current.libraryWritePrompt(name),
        ),
        startWithLastScan: saveLastScan,
      ),
    )).then((_) {
      if (mounted) setState(() {});
    });
  }

  void _openShortcutsGuide() {
    ShortcutsGuideSheet.show(
      context,
      onAddRecord: (record, title) => _appendImportedRecords([record], title),
    );
  }

  Widget _buildCapacityChips() {
    final fits = CapacityCheck.fitsFor(_recordsToWrite);
    final lastCapacity = _controller.lastScannedTag?.maxByteCapacity ?? 0;
    final messageBytes = _stagedBytesTotal;
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Wrap(
        spacing: 6,
        runSpacing: 6,
        children: [
          for (final fit in fits)
            _infoChip(
              fit.fits ? Icons.check_circle_outline : Icons.block,
              fit.chip,
              fit.fits ? AppColors.success : AppColors.danger,
            ),
          if (lastCapacity > 0)
            _infoChip(
              messageBytes <= lastCapacity ? Icons.nfc_rounded : Icons.warning_amber_rounded,
              L10n.current.lastTagCapacityFit('$messageBytes', '$lastCapacity'),
              messageBytes <= lastCapacity ? AppColors.accent : AppColors.warning,
            ),
          if (fits.every((f) => !f.fits))
            Text(L10n.current.contentTooLargeForChips,
                style: TextStyle(color: AppColors.danger, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildPreferencesCard() {
    final mode = _controller.themeMode;
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Row(
                children: [
                  Icon(Icons.palette_outlined, color: AppColors.accent),
                  const SizedBox(width: 10),
                  Text(L10n.current.appearanceTitle,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SegmentedButton<ThemeMode>(
                segments: [
                  ButtonSegment(value: ThemeMode.system, label: Text(L10n.current.themeSystem),
                      icon: const Icon(Icons.brightness_auto_outlined)),
                  ButtonSegment(value: ThemeMode.light, label: Text(L10n.current.themeLight),
                      icon: const Icon(Icons.light_mode_outlined)),
                  ButtonSegment(value: ThemeMode.dark, label: Text(L10n.current.themeDark),
                      icon: const Icon(Icons.dark_mode_outlined)),
                ],
                selected: {mode},
                showSelectedIcon: false,
                onSelectionChanged: (value) => _controller.setThemeMode(value.first),
              ),
            ),
            const SizedBox(height: 8),
            SwitchListTile(
              secondary: Icon(Icons.vibration_rounded, color: AppColors.accent),
              title: Text(L10n.current.hapticsToggle),
              subtitle: Text(L10n.current.hapticsToggleSubtitle),
              value: _controller.hapticsEnabled,
              onChanged: (v) => _controller.setHapticsEnabled(v),
            ),
            SwitchListTile(
              secondary: Icon(Icons.volume_up_outlined, color: AppColors.accent),
              title: Text(L10n.current.soundsToggle),
              subtitle: Text(L10n.current.soundsToggleSubtitle),
              value: _controller.soundsEnabled,
              onChanged: (v) => _controller.setSoundsEnabled(v),
            ),            const Divider(height: 24),
            ListTile(
              leading: Icon(Icons.collections_bookmark_outlined, color: AppColors.accent),
              title: Text(L10n.current.tagLibraryTitle),
              subtitle: Text(L10n.current.settingsLibrarySubtitle),
              trailing: const Icon(Icons.chevron_right),
              onTap: _openTagLibrary,
            ),
            ListTile(
              leading: Icon(Icons.auto_awesome_rounded, color: AppColors.accent),
              title: Text(L10n.current.readyTemplates),
              subtitle: Text(L10n.current.quickGallerySubtitle),
              trailing: const Icon(Icons.chevron_right),
              onTap: _openTemplateGallery,
            ),
            ListTile(
              leading: Icon(Icons.mic_none_rounded, color: AppColors.accent),
              title: Text(L10n.current.shortcutsGuideTitle),
              subtitle: Text(L10n.current.shortcutsGuideSubtitle),
              trailing: const Icon(Icons.chevron_right),
              onTap: _openShortcutsGuide,
            ),
            ListTile(
              leading: Icon(Icons.school_outlined, color: AppColors.accent),
              title: Text(L10n.current.showOnboardingAgain),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => setState(() => _showOnboarding = true),
            ),
            ListTile(
              leading: Icon(Icons.memory_rounded, color: AppColors.accent),
              title: Text(L10n.current.chipsTitle),
              subtitle: Text(L10n.current.chipsSubtitle),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => NfcChipsPage.open(context),
            ),
            ListTile(
              leading: Icon(Icons.star_rate_rounded, color: AppColors.accent),
              title: Text(L10n.current.rateApp),
              trailing: const Icon(Icons.chevron_right),
              onTap: () async {
                final shown = await LaunchActionService.requestReview();
                if (!shown && mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(L10n.current.rateAppUnavailable)),
                  );
                }
              },
            ),
            const Divider(height: 24),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Row(
                children: [
                  Icon(Icons.tune_rounded, color: AppColors.accent),
                  const SizedBox(width: 10),
                  Text(L10n.current.modeTitle,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SegmentedButton<bool>(
                segments: [
                  ButtonSegment(value: false, label: Text(L10n.current.modeNormal)),
                  ButtonSegment(value: true, label: Text(L10n.current.modeCompat)),
                ],
                selected: {_controller.storage.compatibilityMode},
                onSelectionChanged: (v) async {
                  await _controller.storage.setCompatibilityMode(v.first);
                  if (mounted) setState(() {});
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Text(
                _controller.storage.compatibilityMode
                    ? L10n.current.modeCompatDesc
                    : L10n.current.modeNormalDesc,
                style: TextStyle(fontSize: 12.5, color: AppColors.secondary),
              ),
            ),
            const Divider(height: 24),
            SwitchListTile.adaptive(
              secondary: Icon(Icons.lock_outline_rounded, color: AppColors.accent),
              title: Text(L10n.current.appLockTitle),
              subtitle: Text(L10n.current.appLockSubtitle),
              value: _controller.storage.appLockEnabled,
              onChanged: (on) async {
                if (on) {
                  // Prove it works before turning it on.
                  final ok = await LaunchActionService.authenticate(
                      reason: L10n.current.appLockReason, title: L10n.current.appTitle);
                  if (!mounted) return;
                  if (ok == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(L10n.current.appLockUnavailable)),
                    );
                    return;
                  }
                  if (ok != true) return;
                }
                await _controller.storage.setAppLockEnabled(on);
                if (mounted) setState(() {});
              },
            ),
            ListTile(
              leading: Icon(Icons.info_outline_rounded, color: AppColors.accent),
              title: Text(L10n.current.aboutTitle),
              subtitle: Text(L10n.current.aboutVersion(AppInfo.version)),
              trailing: const Icon(Icons.chevron_right),
              onTap: _showAbout,
            ),
          ],
        ),
      ),
    );
  }

  void _showAbout() {
    final loc = L10n.current;
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      gradient: AppColors.heroGradient,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(Icons.nfc_rounded, color: Colors.white),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(loc.appTitle,
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                        Text(loc.aboutVersion(AppInfo.version),
                            style: TextStyle(color: AppColors.secondary)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.lock_outline_rounded, size: 18, color: AppColors.success),
                  const SizedBox(width: 8),
                  Expanded(child: Text(loc.privacySummary, style: const TextStyle(height: 1.4))),
                ],
              ),
              SectionHeader(title: loc.whatsNewTitle),
              Text(loc.whatsNew110, style: const TextStyle(height: 1.6)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTagIdentityChips(NfcTagInfo tag) {
    final identity = TagIdentity.of(tag);
    final match = _libraryMatchFor(tag.identifier);
    final chips = <Widget>[
      if (match != null)
        _infoChip(Icons.collections_bookmark_outlined, L10n.current.libraryMatch(match.name), AppColors.success),
      if (identity.chipGuess != null)
        _infoChip(Icons.memory_rounded, L10n.current.tagChipLabel(identity.chipGuess!), AppColors.accent),
      if (identity.manufacturer != null)
        _infoChip(Icons.factory_outlined, L10n.current.tagManufacturerLabel(identity.manufacturer!), AppColors.secondary),
    ];
    final inventory = match == null ||
            (match.locationNote.isEmpty && match.note.isEmpty && match.labels.isEmpty)
        ? null
        : Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.successSoft,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(L10n.current.inventoryCardTitle,
                    style: TextStyle(fontSize: 12, color: AppColors.success, fontWeight: FontWeight.w600)),
                const SizedBox(height: 2),
                Text(match.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                if (match.locationNote.isNotEmpty)
                  Row(children: [
                    Icon(Icons.place_outlined, size: 15, color: AppColors.secondary),
                    const SizedBox(width: 4),
                    Expanded(child: Text(match.locationNote)),
                  ]),
                if (match.note.isNotEmpty)
                  Text(match.note, style: TextStyle(color: AppColors.secondary)),
                if (match.labels.isNotEmpty)
                  Text(match.labels.map((l) => '#$l').join(' '),
                      style: TextStyle(fontSize: 12, color: AppColors.accent)),
              ],
            ),
          );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      Wrap(
        spacing: 6,
        runSpacing: 6,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          ...chips,
          if (tag.error == null && tag.records.isNotEmpty)
            ActionChip(
              avatar: Icon(Icons.ios_share_rounded, size: 16, color: AppColors.accent),
              label: Text(L10n.current.shareTag),
              onPressed: () => _shareScannedTag(tag),
            ),
          if (tag.error == null && match == null)
            ActionChip(
              avatar: Icon(Icons.bookmark_add_outlined, size: 16, color: AppColors.accent),
              label: Text(L10n.current.saveToLibrary),
              onPressed: () => _openTagLibrary(saveLastScan: tag.records.isNotEmpty),
            ),
        ],
      ),
      if (inventory != null) inventory,
      if (tag.error == null) ...[
        if (PhishingBanner.forRecords(tag.records) case final banner?) banner,
      ],
        ],
      ),
    );
  }

  Future<void> _shareScannedTag(NfcTagInfo tag) async {
    final choice = await showModalBottomSheet<String>(
      context: context,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.notes_rounded),
              title: Text(L10n.current.shareAsText),
              onTap: () => Navigator.of(ctx).pop('text'),
            ),
            ListTile(
              leading: const Icon(Icons.data_object_rounded),
              title: Text(L10n.current.shareAsFile),
              subtitle: Text(L10n.current.shareAsFileSubtitle),
              onTap: () => Navigator.of(ctx).pop('json'),
            ),
          ],
        ),
      ),
    );
    if (choice == null || !mounted) return;
    final lines = <String>[
      '${L10n.current.serialUidLabel} ${tag.identifier}',
      for (final r in tag.records) () {
        final p = NdefCodec.parseRecord(r);
        return '• ${p.title}: ${p.content}';
      }(),
    ];
    if (choice == 'text') {
      await SharePlus.instance.share(ShareParams(text: lines.join('\n')));
      return;
    }
    final json = const JsonEncoder.withIndent('  ').convert({
      'app': 'nfc_tag_master',
      'uid': tag.identifier,
      'records': tag.records.map((r) => r.toJsonMap()).toList(),
    });
    final name = 'nfc_tag_${tag.identifier.replaceAll(':', '')}.json';
    await SharePlus.instance.share(ShareParams(
      files: [XFile.fromData(Uint8List.fromList(utf8.encode(json)), mimeType: 'application/json', name: name)],
      fileNameOverrides: [name],
    ));
  }

  Widget _infoChip(IconData icon, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 5),
          Flexible(child: Text(label, style: TextStyle(fontSize: 12, color: color, fontWeight: FontWeight.w600))),
        ],
      ),
    );
  }

  /// Library entry whose UID matches the last scan, if any.
  TagLibraryEntry? _libraryMatchFor(String uid) {
    if (uid.isEmpty) return null;
    for (final entry in _controller.storage.getLibrary()) {
      if (entry.uid != null && entry.uid!.toUpperCase() == uid.toUpperCase()) return entry;
    }
    return null;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _controller.refreshAvailability();
    }
  }

  void _onControllerUpdate() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _launchSubscription?.cancel();
    _launchActions.dispose();
    WidgetsBinding.instance.removeObserver(this);
    _tabController.dispose();
    _historySearchController.dispose();
    _controller.removeListener(_onControllerUpdate);
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _undoComposer() {
    if (!_composerHistory.canUndo) return;
    setState(() {
      final restored = _composerHistory.undo(_recordsToWrite);
      if (restored != null) {
        _recordsToWrite
          ..clear()
          ..addAll(restored);
        _expandedComposerIndices.clear();
      }
    });
    final loc = AppLocalizations.of(context) ?? L10n.current;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(loc.composerUndoSnack),
        backgroundColor: AppColors.accent,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _redoComposer() {
    if (!_composerHistory.canRedo) return;
    setState(() {
      final restored = _composerHistory.redo(_recordsToWrite);
      if (restored != null) {
        _recordsToWrite
          ..clear()
          ..addAll(restored);
        _expandedComposerIndices.clear();
      }
    });
    final loc = AppLocalizations.of(context) ?? L10n.current;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(loc.composerRedoSnack),
        backgroundColor: AppColors.accent,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _openComposeSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => ComposeRecordSheet(
        onRecordCreated: (rec) {
          setState(() {
            _composerHistory.push(_recordsToWrite);
            _recordsToWrite.add(rec);
          });
        },
      ),
    );
  }

  void _editComposerRecord(int index) {
    if (index < 0 || index >= _recordsToWrite.length) return;
    final current = _recordsToWrite[index];
    final parsed = NdefCodec.parseRecord(current);

    // Can this record safely round-trip through ComposeRecordSheet?
    // Check if high-level parsed type can roundtrip without losing fields.
    bool canRoundTrip = false;

    switch (parsed.type) {
      case ParsedRecordType.text:
      case ParsedRecordType.url:
      case ParsedRecordType.email:
      case ParsedRecordType.phone:
      case ParsedRecordType.sms:
      case ParsedRecordType.location:
      case ParsedRecordType.customMime:
        canRoundTrip = true;
        break;
      case ParsedRecordType.vcard:
      case ParsedRecordType.calendar:
        // Imported cards/events may carry fields the simplified form does not expose.
        canRoundTrip = false;
        break;
      case ParsedRecordType.smartPoster:
        canRoundTrip = false;
        break;
      case ParsedRecordType.wifi:
        // WSC may contain extra TLV attributes not represented by the form.
        canRoundTrip = false;
        break;
      case ParsedRecordType.unknown:
        canRoundTrip = false;
        break;
    }

    // The form creates a new NDEF record and cannot retain a custom record ID.
    if (current.id.isNotEmpty) canRoundTrip = false;
    // Text form encodes UTF-8 with its default language, so preserve other metadata.
    if (parsed.type == ParsedRecordType.text &&
        (current.payload.isEmpty ||
            current.payload.first != 2 ||
            current.payload.length < 3 ||
            current.payload[1] != 0x74 ||
            current.payload[2] != 0x72)) {
      canRoundTrip = false;
    }

    if (canRoundTrip) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (ctx) => ComposeRecordSheet(
          initialRecord: current,
          onRecordCreated: (updatedRec) {
            setState(() {
              _composerHistory.push(_recordsToWrite);
              _recordsToWrite[index] = updatedRec;
            });
          },
        ),
      );
    } else {
      // Preserve all original metadata and unexposed fields in the raw editor.
      RawRecordEditorDialog.show(
        context,
        record: current,
        onSave: (updatedRec) {
          setState(() {
            _composerHistory.push(_recordsToWrite);
            _recordsToWrite[index] = updatedRec;
          });
        },
      );
    }
  }

  /// setState for the tab/flow extensions in the part files.
  void _refresh(VoidCallback fn) => setState(fn);

  int get _stagedBytesTotal {
    return encodeNdefMessage(_recordsToWrite).length;
  }


  List<_NavDestination> _getDestinations(BuildContext context) {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    return [
      _NavDestination(loc.navRead, loc.navReadTitle, Icons.nfc_rounded),
      _NavDestination(loc.navWrite, loc.navWriteTitle, Icons.edit_note_rounded),
      _NavDestination(loc.navTools, loc.navToolsTitle, Icons.handyman_outlined),
      _NavDestination(loc.navHistory, loc.navHistoryTitle, Icons.history_rounded),
      _NavDestination(loc.navSettings, loc.navSettingsTitle, Icons.tune_rounded),
    ];
  }

  String _todayLabel(BuildContext context) {
    final localeName = Localizations.localeOf(context).toString();
    return DateFormat.yMMMMd(localeName).format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    if (_showOnboarding) {
      return OnboardingPage(onFinished: _finishOnboarding);
    }
    final destinations = _getDestinations(context);
    final current = destinations[_tabController.index];
    return DecoratedBox(
      decoration: BoxDecoration(gradient: AppColors.canvasGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              _buildHeader(current.title, context),
              _buildClipboardBanner(),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildReadTab(),
                    _buildWriteTab(),
                    ToolsTab(
                      controller: _controller,
                      onClearTag: _confirmClearTag,
                      onLockTag: _confirmLockTag,
                      onCloneTag: _cloneTagWizard,
                    ),
                    _buildHistoryTab(),
                    _buildTemplatesAndSettingsTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildFloatingNav(destinations),
      ),
    );
  }

  Widget _buildHeader(String title, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  gradient: AppColors.heroGradient,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.surface, width: 3),
                  boxShadow: AppColors.softShadow,
                ),
                child: const Icon(Icons.nfc_rounded, color: Colors.white, size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _todayLabel(context),
                      style: TextStyle(fontSize: 13, color: AppColors.secondary),
                    ),
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.6,
                      ),
                    ),
                  ],
                ),
              ),
              _buildHardwareStatusBanner(),
            ],
          ),
          const SizedBox(height: 10),
          _buildStatusLine(),
        ],
      ),
    );
  }

  Widget _buildStatusLine() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: Row(
        key: ValueKey('${_controller.isBusy}-${_controller.statusMessage}'),
        children: [
          if (_controller.isBusy)
            const SizedBox(
              width: 14,
              height: 14,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          else
            Icon(Icons.info_outline_rounded, size: 16, color: AppColors.secondary),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              _controller.statusMessage,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 13, color: AppColors.secondary),
            ),
          ),
          if (_controller.isBusy)
            TextButton(
              onPressed: () => _controller.cancelSession(),
              child: Text(AppLocalizations.of(context)?.cancel ?? L10n.current.cancel),
            ),
        ],
      ),
    );
  }

  Widget _buildFloatingNav(List<_NavDestination> destinations) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 6, 14, 10),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 66,
                padding: const EdgeInsets.symmetric(horizontal: 6),
                decoration: BoxDecoration(
                  color: AppColors.surface.withValues(alpha: 0.92),
                  borderRadius: BorderRadius.circular(33),
                  border: Border.all(color: AppColors.surface),
                  boxShadow: AppColors.softShadow,
                ),
                child: Row(
                  children: [
                    for (int i = 0; i < destinations.length; i++)
                      Expanded(child: _buildNavItem(i, destinations[i])),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            _buildScanFab(),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, _NavDestination destination) {
    final selected = _tabController.index == index;
    final color = selected ? AppColors.ink : AppColors.secondary.withValues(alpha: 0.8);
    return Semantics(
      selected: selected,
      button: true,
      label: destination.title,
      child: InkResponse(
        key: ValueKey('nav-$index'),
        onTap: () => _tabController.animateTo(index),
        radius: 32,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(destination.icon, color: color, size: 24),
            const SizedBox(height: 2),
            Text(
              destination.label,
              maxLines: 1,
              style: TextStyle(
                fontSize: 11,
                color: color,
                fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
            const SizedBox(height: 3),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: selected ? 5 : 0,
              height: 5,
              decoration: BoxDecoration(color: AppColors.ink, shape: BoxShape.circle),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScanFab() {
    return Semantics(
      button: true,
      label: AppLocalizations.of(context)?.scanFabLabel ?? L10n.current.scanFabLabel,
      child: GestureDetector(
        onTap: _controller.isBusy
            ? null
            : () {
                _tabController.animateTo(0);
                _controller.scanTag();
              },
        child: Container(
          width: 66,
          height: 66,
          decoration: BoxDecoration(
            gradient: AppColors.heroGradient,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.surface, width: 3),
            boxShadow: [
              BoxShadow(
                color: AppColors.accent.withValues(alpha: 0.35),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: const Icon(Icons.sensors_rounded, color: Colors.white, size: 30),
        ),
      ),
    );
  }

  Widget _buildHardwareStatusBanner() {
    final Color color;
    final String label;
    final String tooltip;
    switch (_controller.availability) {
      case NfcAvailability.available:
        color = AppColors.success;
        label = L10n.current.nfcReadyStatus;
        tooltip = L10n.current.nfcReadyDesc;
        break;
      case NfcAvailability.disabled:
        color = AppColors.warning;
        label = L10n.current.nfcDisabledStatus;
        tooltip = L10n.current.nfcDisabledDesc;
        break;
      case NfcAvailability.notSupported:
        color = AppColors.danger;
        label = L10n.current.nfcMissingShort;
        tooltip = L10n.current.nfcUnsupportedDesc;
        break;
    }

    return Tooltip(
      message: tooltip,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => _controller.init(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(20),
            boxShadow: AppColors.softShadow,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
              const SizedBox(width: 6),
              Text(label, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildClipboardBanner() {
    final clip = _controller.clipboardSnapshot;
    if (clip == null) return const SizedBox.shrink();

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.accentSoft,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(Icons.inventory_2_outlined, color: AppColors.accent, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              L10n.current.clipboardBannerText('${clip.recordCount}', '${clip.byteSize}', clip.sourceDescription),
              style: TextStyle(
                  color: AppColors.ink,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: _pasteFromClipboard,
            child: Text(L10n.current.paste,
                style:
                    TextStyle(color: AppColors.accent, fontWeight: FontWeight.bold)),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: Icon(Icons.close, size: 16, color: AppColors.secondary),
            tooltip: L10n.current.clearClipboard,
            onPressed: () => _controller.clearClipboard(),
          ),
        ],
      ),
    );
  }

}

class _NavDestination {
  final String label;
  final String title;
  final IconData icon;

  const _NavDestination(this.label, this.title, this.icon);
}
