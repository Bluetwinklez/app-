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
import 'compose_record_sheet.dart';
import 'raw_record_editor_dialog.dart';
import 'qr_preview_dialog.dart';
import 'tag_rules_manager_sheet.dart';
import 'app_theme.dart';
import 'tools_tab.dart';
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
                    child: Text(L10n.current.continuousScanCount('${_scanLog.length}'),
                        style: const TextStyle(fontWeight: FontWeight.w600)),
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Wrap(
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

  int get _stagedBytesTotal {
    return encodeNdefMessage(_recordsToWrite).length;
  }

  // -------------------------------------------------------------
  // Workflow 1: NDEF Content Clipboard with Replace / Append & Confirmation
  // -------------------------------------------------------------

  /// Copies full NDEF records from source into the in-memory clipboard snapshot
  void _copyToClipboard(List<NdefRecordModel> records,
      {String? source}) {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    final resolvedSource = source ?? loc.scannedTag;
    if (records.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(loc.noRecordsToCopy),
          backgroundColor: AppColors.warning,
        ),
      );
      return;
    }

    _controller.copyToClipboard(records, sourceDescription: resolvedSource);
    final count = records.length;
    final bytes = encodeNdefMessage(records).length;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          loc.recordsCopiedToClipboardDetails(count, bytes),
        ),
        backgroundColor: AppColors.accent,
        duration: const Duration(seconds: 4),
      ),
    );
  }

  /// Pastes clipboard records into the composer with Replace or Append choice
  void _appendImportedRecords(List<NdefRecordModel> records, String source) {
    if (records.isEmpty) return;
    final loc = AppLocalizations.of(context) ?? L10n.current;
    setState(() {
      _composerHistory.push(_recordsToWrite);
      _recordsToWrite.addAll(records);
    });
    _tabController.animateTo(1);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(loc.recordsAddedFromSource(source, records.length))),
    );
  }

  Future<void> _importFromTag() async {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    await _controller.scanTag();
    if (!mounted) return;
    final tag = _controller.lastScannedTag;
    if (tag == null || tag.error != null) return;
    if (tag.records.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(loc.tagEmptyNoRecordsToImport)),
      );
      return;
    }
    _appendImportedRecords(List<NdefRecordModel>.from(tag.records), loc.sourceTag);
  }

  Future<void> _importFromQr() async {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    final value = await QrScanPage.scan(context);
    if (!mounted || value == null) return;
    _appendImportedRecords([QrRecordImporter.fromQr(value)], loc.sourceQr);
  }

  Future<void> _importFromJsonFile() async {
    XFile? file;
    try {
      file = await openFile();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(L10n.current.filePickerError('$e')), backgroundColor: AppColors.danger),
      );
      return;
    }
    if (file == null || !mounted) return;
    try {
      if (await file.length() > 512 * 1024) throw const FormatException('size');
      final bytes = await file.readAsBytes();
      final data = jsonDecode(utf8.decode(bytes));
      final raw = data is Map ? data['records'] : data;
      if (raw is! List || raw.isEmpty || raw.length > 100) throw const FormatException('records');
      final records = [
        for (final r in raw) NdefRecordModel.fromJsonMap(Map<String, dynamic>.from(r as Map)),
      ];
      if (!mounted) return;
      _appendImportedRecords(records, file.name);
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(L10n.current.invalidTagFile), backgroundColor: AppColors.danger),
      );
    }
  }

  Future<void> _importFromCsv() async {
    final result = await _pickCsvRecords();
    if (result == null || result.records.isEmpty || !mounted) return;
    _appendImportedRecords(result.records, 'CSV');
  }

  /// Lets the user pick a CSV file; shows skipped rows. Null when cancelled.
  Future<CsvImportResult?> _pickCsvRecords() async {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    XFile? file;
    try {
      file = await openFile();
    } catch (e) {
      if (!mounted) return null;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(loc.filePickerError(e.toString())), backgroundColor: AppColors.danger),
      );
      return null;
    }
    if (file == null || !mounted) return null;
    if (await file.length() > 512 * 1024) {
      if (!mounted) return null;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(loc.csvFileTooLarge), backgroundColor: AppColors.danger),
      );
      return null;
    }
    final bytes = await file.readAsBytes();
    if (!mounted) return null;
    if (bytes.length > 512 * 1024) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(loc.csvFileTooLarge), backgroundColor: AppColors.danger),
      );
      return null;
    }
    final result = CsvRecordImporter.parse(utf8.decode(bytes, allowMalformed: true));
    if (result.errors.isNotEmpty || result.records.isEmpty) {
      await showDialog<void>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(result.records.isEmpty ? loc.noRecordsFound : loc.someRowsSkipped),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                for (final e in result.errors.take(20)) Text('• $e'),
                const SizedBox(height: 12),
                Text(loc.expectedFormat, style: const TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                const Text(
                  CsvRecordImporter.sample,
                  style: TextStyle(fontFamily: 'Courier', fontSize: 12),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.of(ctx).pop(), child: Text(loc.ok)),
          ],
        ),
      );
      if (!mounted) return null;
    }
    return result;
  }

  void _pasteFromClipboard() {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    final clip = _controller.clipboardSnapshot;
    if (clip == null || clip.records.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(loc.noClipboardContent),
          backgroundColor: AppColors.warning,
        ),
      );
      return;
    }

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.paste, color: AppColors.accent),
                  const SizedBox(width: 8),
                  Text(
                    loc.pasteFromClipboardTitle,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                loc.clipboardDataSummary(clip.recordCount, clip.byteSize, clip.sourceDescription),
                style: TextStyle(color: AppColors.ink),
              ),
              const SizedBox(height: 4),
              Text(
                loc.clipboardPastePrompt,
                style: TextStyle(color: AppColors.secondary, fontSize: 13),
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: Icon(Icons.find_replace, color: AppColors.warning),
                title: Text(loc.pasteOverwriteOption),
                subtitle: Text(_recordsToWrite.isNotEmpty
                    ? loc.pasteOverwriteSubtitle(_recordsToWrite.length)
                    : loc.pasteEmptySubtitle),
                onTap: () {
                  Navigator.of(ctx).pop();
                  _handlePasteReplace(clip.records);
                },
              ),
              ListTile(
                leading: Icon(Icons.add_to_photos, color: AppColors.accent),
                title: Text(loc.pasteAppendOption),
                subtitle: Text(
                    loc.pasteAppendSubtitle),
                onTap: () {
                  Navigator.of(ctx).pop();
                  _handlePasteAppend(clip.records);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handlePasteAppend(List<NdefRecordModel> records) {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    setState(() {
      _composerHistory.push(_recordsToWrite);
      _recordsToWrite.addAll(records);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(loc.recordsAddedToComposer(records.length)),
        backgroundColor: AppColors.accent,
      ),
    );
  }

  void _handlePasteReplace(List<NdefRecordModel> records) {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    if (_recordsToWrite.isNotEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(loc.confirmOverwriteTitle),
          content: Text(
            loc.confirmOverwriteMessage(_recordsToWrite.length, records.length),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: Text(loc.dismiss),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.warning),
              onPressed: () {
                Navigator.of(ctx).pop();
                setState(() {
                  _composerHistory.push(_recordsToWrite);
                  _recordsToWrite.clear();
                  _recordsToWrite.addAll(records);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        loc.recordsReplacedInComposer(records.length)),
                    backgroundColor: AppColors.accent,
                  ),
                );
              },
              child: Text(loc.yesReplace,
                  style: const TextStyle(color: Colors.white)),
            ),
          ],
        ),
      );
    } else {
      setState(() {
        _composerHistory.push(_recordsToWrite);
        _recordsToWrite.clear();
        _recordsToWrite.addAll(records);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(loc.recordsImportedToComposer(records.length)),
          backgroundColor: AppColors.accent,
        ),
      );
    }
  }

  /// Copies full NDEF records from scanned tag into write composer (Backward-compatible method)
  void _copyScannedContentToComposer(List<NdefRecordModel> records) {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    if (records.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(loc.noContentToCopy),
          backgroundColor: AppColors.warning,
        ),
      );
      return;
    }

    _controller.copyToClipboard(records, sourceDescription: loc.scannedTag);

    if (_recordsToWrite.isNotEmpty) {
      // Prompt Replace vs Append for consistency with new clipboard semantics
      _pasteFromClipboard();
      _tabController.animateTo(1);
    } else {
      setState(() {
        _composerHistory.push(_recordsToWrite);
        _recordsToWrite.addAll(records);
      });
      _tabController.animateTo(1);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            loc.recordsCopiedAndStaged(records.length),
          ),
          backgroundColor: AppColors.accent,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  // -------------------------------------------------------------
  // Workflow 2: Rewrite Flow (Stage -> Tap target tag -> Verify -> Compare)
  // -------------------------------------------------------------

  void _startRewriteFlow(
      List<NdefRecordModel> sourceRecords, String sourceUid) {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    if (sourceRecords.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(loc.noContentToRewrite),
          backgroundColor: AppColors.warning,
        ),
      );
      return;
    }

    setState(() {
      _rewriteStagedRecords = List<NdefRecordModel>.from(sourceRecords);
      _rewriteSourceUid = sourceUid;
    });

    _showRewriteConfirmationDialog();
  }

  void _showRewriteConfirmationDialog() {
    final records = _rewriteStagedRecords;
    if (records == null || records.isEmpty) return;
    final byteSize = encodeNdefMessage(records).length;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.replay_circle_filled, color: AppColors.accent),
            const SizedBox(width: 8),
            Text(L10n.current.rewriteTagTitle),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.warningSoft,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.warning),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      L10n.current.importantNotice,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
                          fontSize: 13),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      L10n.current.rewriteNotice1 +
                      L10n.current.rewriteNotice2 +
                      L10n.current.rewriteNotice3,
                      style: TextStyle(fontSize: 12, color: AppColors.ink),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Text(L10n.current.rewriteSourceUid(_rewriteSourceUid ?? L10n.current.unknown)),
              Text(L10n.current.recordsToWriteCount('${records.length}')),
              Text(L10n.current.messageSizeBytes('$byteSize')),
              const Divider(height: 20),
              Text(
                L10n.current.rewriteInstruction,
                style: TextStyle(fontSize: 13, color: AppColors.ink),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              setState(() {
                _rewriteStagedRecords = null;
                _rewriteSourceUid = null;
              });
            },
            child: Text(L10n.current.cancel),
          ),
          TextButton.icon(
            icon: const Icon(Icons.edit_outlined),
            label: Text(L10n.current.edit),
            onPressed: () {
              Navigator.of(ctx).pop();
              setState(() {
                _composerHistory.push(_recordsToWrite);
                _recordsToWrite
                  ..clear()
                  ..addAll(records);
                _rewriteStagedRecords = null;
                _rewriteSourceUid = null;
              });
              _tabController.animateTo(1);
            },
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.nfc),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.accent,
              foregroundColor: Colors.white,
            ),
            label: Text(L10n.current.tapAndWrite),
            onPressed: () async {
              Navigator.of(ctx).pop();
              await _executeRewrite();
            },
          ),
        ],
      ),
    );
  }

  Future<void> _executeRewrite() async {
    final records = _rewriteStagedRecords;
    if (records == null || records.isEmpty) return;

    final success = await _controller.writeRecords(
      records,
      promptMessage:
          L10n.current.rewritePromptMessage,
    );

    if (mounted) {
      if (success) {
        _showRewriteSuccessAndCompareDialog(records);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                L10n.current.rewriteFailed(_controller.lastWriteResult?.message ?? L10n.current.error)),
            backgroundColor: AppColors.danger,
          ),
        );
      }
    }
  }

  void _showRewriteSuccessAndCompareDialog(
      List<NdefRecordModel> writtenRecords) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.check_circle, color: AppColors.success),
            const SizedBox(width: 8),
            Text(L10n.current.writeVerifiedTitle),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              L10n.current.writeVerifiedDesc,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(L10n.current.writtenRecordsCount('${writtenRecords.length}')),
            Text(L10n.current.bytesShort('${encodeNdefMessage(writtenRecords).length}')),
            const SizedBox(height: 12),
            Text(
              L10n.current.writeVerifiedHint,
              style: TextStyle(fontSize: 13, color: AppColors.secondary),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(L10n.current.close),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accent, foregroundColor: Colors.white),
            icon: const Icon(Icons.document_scanner),
            label: Text(L10n.current.scanAndCompareNow),
            onPressed: () async {
              Navigator.of(ctx).pop();
              _tabController.animateTo(0);
              await _controller.scanTag();
              if (mounted) {
                _compareWrittenWithLastScan(writtenRecords);
              }
            },
          ),
        ],
      ),
    );
  }

  void _compareWrittenWithLastScan(List<NdefRecordModel> written) {
    final scannedTag = _controller.lastScannedTag;
    if (scannedTag == null || scannedTag.error != null) return;

    final scanned = scannedTag.records;
    final writtenBytes = encodeNdefMessage(written);
    final scannedBytes = encodeNdefMessage(scanned);

    bool match = (writtenBytes.length == scannedBytes.length);
    if (match) {
      for (int i = 0; i < writtenBytes.length; i++) {
        if (writtenBytes[i] != scannedBytes[i]) {
          match = false;
          break;
        }
      }
    }

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Row(
          children: [
            Icon(match ? Icons.verified : Icons.warning,
                color: match ? AppColors.success : AppColors.warning),
            const SizedBox(width: 8),
            Text(
                match ? L10n.current.contentMatchesExactly : L10n.current.differenceDetected),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(L10n.current.scannedTagUid(scannedTag.identifier)),
            const Divider(height: 16),
            Text(
                L10n.current.writtenDataSummary('${written.length}', '${writtenBytes.length}')),
            Text(
                L10n.current.scannedDataSummary('${scanned.length}', '${scannedBytes.length}')),
            const SizedBox(height: 8),
            Text(
              match
                  ? L10n.current.compareMatchDesc
                  : L10n.current.compareDiffDesc,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: match ? AppColors.success : AppColors.warning,
              ),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(L10n.current.ok),
          ),
        ],
      ),
    );
  }

  // -------------------------------------------------------------
  // Workflow 3: Batch Write Flow (2..100 tags, manual trigger, progress)
  // -------------------------------------------------------------

  void _openBatchWriteModal() {
    if (_recordsToWrite.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              L10n.current.batchEmptyComposerError),
          backgroundColor: AppColors.warning,
        ),
      );
      return;
    }
    _showBatchSetupDialog(
      records: List<NdefRecordModel>.from(_recordsToWrite),
      allowCsv: true,
    );
  }

  /// Count + optional serial numbering for writing [records] to many tags.
  void _showBatchSetupDialog({
    required List<NdefRecordModel> records,
    bool allowCsv = false,
    String? intro,
  }) {
    final loc = L10n.current;
    int chosenCount = _batchTargetCount;
    bool serial = false;
    int digits = 3;
    final prefixCtrl = TextEditingController();
    final startCtrl = TextEditingController(text: '1');
    final bytes = encodeNdefMessage(records).length;

    SerialPlan plan() => SerialPlan(
          prefix: prefixCtrl.text.trim(),
          start: int.tryParse(startCtrl.text.trim())?.clamp(0, 99999999) ?? 1,
          padding: digits,
        );

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDlgState) => AlertDialog(
          title: Row(
            children: [
              Icon(Icons.dynamic_feed, color: AppColors.accent),
              const SizedBox(width: 8),
              Expanded(child: Text(loc.batchWriteTitle)),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  intro ?? loc.batchWriteSubtitle,
                  style: const TextStyle(fontSize: 13),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.neutralSoft,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        loc.attention,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: AppColors.secondary),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        loc.batchNotice1 + loc.batchNotice2,
                        style: TextStyle(fontSize: 12, color: AppColors.ink),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  loc.batchTargetCount('$chosenCount'),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Slider(
                  value: chosenCount.toDouble(),
                  min: 2,
                  max: 100,
                  divisions: 98,
                  label: '$chosenCount',
                  onChanged: (val) {
                    setDlgState(() {
                      chosenCount = val.toInt();
                    });
                  },
                ),
                Text(
                  loc.composerRecordsSummary('${records.length}', '$bytes'),
                  style: TextStyle(fontSize: 12, color: AppColors.secondary),
                ),
                const SizedBox(height: 8),
                SwitchListTile.adaptive(
                  contentPadding: EdgeInsets.zero,
                  value: serial,
                  onChanged: (v) => setDlgState(() => serial = v),
                  title: Text(loc.batchSerialToggle,
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                ),
                if (serial) ...[
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: TextField(
                          controller: prefixCtrl,
                          maxLength: 24,
                          decoration: InputDecoration(
                            labelText: loc.batchSerialPrefix,
                            hintText: 'A-',
                            counterText: '',
                          ),
                          onChanged: (_) => setDlgState(() {}),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        flex: 2,
                        child: TextField(
                          controller: startCtrl,
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          maxLength: 8,
                          decoration: InputDecoration(
                            labelText: loc.batchSerialStart,
                            counterText: '',
                          ),
                          onChanged: (_) => setDlgState(() {}),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        flex: 2,
                        child: DropdownButtonFormField<int>(
                          initialValue: digits,
                          decoration: InputDecoration(labelText: loc.batchSerialDigits),
                          items: [
                            for (int d = 1; d <= 6; d++)
                              DropdownMenuItem(value: d, child: Text('$d')),
                          ],
                          onChanged: (v) => setDlgState(() => digits = v ?? 3),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    loc.batchSerialPreview(
                        plan().valueAt(0), plan().valueAt(chosenCount - 1)),
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.accent),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    loc.batchSerialHint(SerialPlan.placeholder),
                    style: TextStyle(fontSize: 12, color: AppColors.secondary),
                  ),
                ],
                if (allowCsv) ...[
                  const Divider(height: 24),
                  OutlinedButton.icon(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                      _startCsvBatch();
                    },
                    icon: const Icon(Icons.table_rows_outlined),
                    label: Text(loc.batchFromCsvButton),
                  ),
                ],
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: Text(loc.dismiss),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accent, foregroundColor: Colors.white),
              onPressed: () {
                Navigator.of(ctx).pop();
                if (serial) {
                  final p = plan();
                  _initBatchWrite(
                    chosenCount,
                    recordsFor: (i) => p.apply(records, i),
                    labelFor: p.valueAt,
                  );
                } else {
                  _initBatchWrite(chosenCount, recordsFor: (_) => records);
                }
              },
              child: Text(loc.batchStartButton),
            ),
          ],
        ),
      ),
    ).whenComplete(() {
      prefixCtrl.dispose();
      startCtrl.dispose();
    });
  }

  /// Batch where every CSV row becomes the content of one tag.
  Future<void> _startCsvBatch() async {
    final result = await _pickCsvRecords();
    if (result == null || result.records.isEmpty || !mounted) return;
    final loc = L10n.current;
    final rows = result.records.take(_maxBatchCount).toList();
    final go = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(loc.batchCsvTitle),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(loc.batchCsvSummary('${rows.length}')),
            if (result.records.length > rows.length) ...[
              const SizedBox(height: 8),
              Text(loc.batchCsvTruncated('$_maxBatchCount'),
                  style: TextStyle(color: AppColors.warning, fontSize: 12)),
            ],
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(ctx).pop(false), child: Text(loc.dismiss)),
          ElevatedButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(loc.batchStartButton),
          ),
        ],
      ),
    );
    if (go != true || !mounted) return;
    _initBatchWrite(rows.length, recordsFor: (i) => [rows[i]]);
  }

  /// Reads a tag and offers to write its NDEF content to many tags.
  Future<void> _cloneTagWizard() async {
    final loc = L10n.current;
    final go = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(loc.cloneTagTitle),
        content: Text(loc.cloneSourceStep),
        actions: [
          TextButton(onPressed: () => Navigator.of(ctx).pop(false), child: Text(loc.cancel)),
          ElevatedButton(onPressed: () => Navigator.of(ctx).pop(true), child: Text(loc.readHeroButton)),
        ],
      ),
    );
    if (go != true || !mounted) return;
    await _controller.scanTag();
    if (!mounted) return;
    final tag = _controller.lastScannedTag;
    if (tag == null || tag.error != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_controller.statusMessage), backgroundColor: AppColors.danger),
      );
      return;
    }
    if (tag.records.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(loc.cloneSourceEmpty), backgroundColor: AppColors.warning),
      );
      return;
    }
    final records = List<NdefRecordModel>.from(tag.records);
    final bytes = encodeNdefMessage(records).length;
    final next = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(loc.cloneReadyTitle),
        content: Text(loc.cloneReadySummary('${records.length}', '$bytes')),
        actions: [
          TextButton(onPressed: () => Navigator.of(ctx).pop(), child: Text(loc.cancel)),
          TextButton(onPressed: () => Navigator.of(ctx).pop('edit'), child: Text(loc.cloneEditFirst)),
          ElevatedButton(onPressed: () => Navigator.of(ctx).pop('batch'), child: Text(loc.batchStartButton)),
        ],
      ),
    );
    if (!mounted || next == null) return;
    if (next == 'edit') {
      _appendImportedRecords(records, loc.tagSourceLabel(tag.identifier));
      return;
    }
    _showBatchSetupDialog(
      records: records,
      intro: loc.cloneTagSubtitle,
    );
  }

  static const int _maxBatchCount = 100;

  void _initBatchWrite(
    int totalCount, {
    required List<NdefRecordModel> Function(int index) recordsFor,
    String Function(int index)? labelFor,
  }) {
    setState(() {
      _batchTargetCount = totalCount;
      _batchCurrentIndex = 0;
      _batchActive = true;
      _batchRecordsFor = recordsFor;
      _batchLabelFor = labelFor;
      _batchAttempts.clear();
      for (int i = 0; i < totalCount; i++) {
        _batchAttempts.add(BatchTagAttempt(index: i));
      }
    });

    _showBatchControlSheet();
  }

  void _showBatchControlSheet() {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      enableDrag: false,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (sheetCtx) => StatefulBuilder(
        builder: (ctx, setSheetState) {
          final successCount = _batchAttempts
              .where((a) => a.status == BatchTagStatus.success)
              .length;
          final failCount = _batchAttempts
              .where((a) => a.status == BatchTagStatus.failed)
              .length;
          final isCompleted = _batchCurrentIndex >= _batchTargetCount;
          final currentAttemptNum =
              min(_batchCurrentIndex + 1, _batchTargetCount);

          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.dynamic_feed, color: AppColors.accent),
                          const SizedBox(width: 8),
                          Text(
                            L10n.current.batchControlPanelTitle,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        tooltip: L10n.current.batchCancelOrClose,
                        onPressed: () => _confirmCancelBatch(sheetCtx),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  LinearProgressIndicator(
                    value: _batchTargetCount > 0
                        ? (_batchCurrentIndex / _batchTargetCount)
                        : 0,
                    color: AppColors.accent,
                    backgroundColor: AppColors.accentSoft,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    isCompleted
                        ? L10n.current.batchAllCompleted
                        : L10n.current.batchNext('$currentAttemptNum', '$_batchTargetCount'),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Text(
                    L10n.current.batchStats('$successCount', '$failCount', '${_batchTargetCount - _batchCurrentIndex}'),
                    style: TextStyle(fontSize: 12, color: AppColors.secondary),
                  ),
                  const Divider(height: 20),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      itemCount: _batchAttempts.length,
                      itemBuilder: (c, idx) {
                        final att = _batchAttempts[idx];
                        Icon icon;
                        Color? textColor;
                        String statusText;
                        switch (att.status) {
                          case BatchTagStatus.success:
                            icon = Icon(Icons.check_circle,
                                color: AppColors.success, size: 20);
                            textColor = AppColors.success;
                            statusText = L10n.current.batchAttemptOk(att.message ?? '');
                            break;
                          case BatchTagStatus.failed:
                            icon = Icon(Icons.cancel,
                                color: AppColors.danger, size: 20);
                            textColor = AppColors.danger;
                            statusText = L10n.current.batchAttemptFailed(att.message ?? '');
                            break;
                          case BatchTagStatus.writing:
                            icon = Icon(Icons.hourglass_top,
                                color: AppColors.warning, size: 20);
                            textColor = AppColors.warning;
                            statusText = L10n.current.writeHeroWriting;
                            break;
                          case BatchTagStatus.cancelled:
                            icon = Icon(Icons.remove_circle_outline,
                                color: AppColors.secondary, size: 20);
                            textColor = AppColors.secondary;
                            statusText = L10n.current.statusCancelled;
                            break;
                          case BatchTagStatus.pending:
                            icon = Icon(Icons.radio_button_unchecked,
                                color: AppColors.secondary, size: 20);
                            textColor = AppColors.secondary;
                            statusText = 'Bekliyor';
                            break;
                        }

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3.0),
                          child: Row(
                            children: [
                              icon,
                              const SizedBox(width: 8),
                              Text(L10n.current.batchAttemptLabel('${idx + 1}'),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              Expanded(
                                child: Text(
                                  statusText,
                                  style:
                                      TextStyle(color: textColor, fontSize: 12),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const Divider(height: 20),
                  if (!isCompleted)
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.accent,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                            icon: const Icon(Icons.nfc),
                            label: Text(
                              _controller.isBusy
                                  ? L10n.current.waitingForTag
                                  : L10n.current.batchTapToWrite('$currentAttemptNum'),
                            ),
                            onPressed: _controller.isBusy
                                ? null
                                : () async {
                                    await _executeNextBatchItem(setSheetState);
                                  },
                          ),
                        ),
                      ],
                    )
                  else
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.accent,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                            onPressed: () {
                              Navigator.of(sheetCtx).pop();
                              setState(() {
                                _batchActive = false;
                              });
                            },
                            child: Text(L10n.current.batchFinishButton),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _executeNextBatchItem(
      void Function(void Function()) setSheetState) async {
    if (!_batchActive || _batchCurrentIndex >= _batchTargetCount) return;
    final index = _batchCurrentIndex;

    setSheetState(() {
      _batchAttempts[index] =
          _batchAttempts[index].copyWith(status: BatchTagStatus.writing);
    });

    final currentNum = index + 1;
    final records = _batchRecordsFor?.call(index) ?? _recordsToWrite;
    final label = _batchLabelFor?.call(index);
    final success = await _controller.writeRecords(
      records,
      promptMessage:
          L10n.current.batchPrompt('$currentNum', '$_batchTargetCount'),
    );
    if (!_batchActive || !mounted) return;

    final msg = success
        ? L10n.current.batchWrittenVerified('${records.length}')
        : (_controller.lastWriteResult?.message ?? L10n.current.writeError);
    final labelled = label == null ? msg : '$label · $msg';

    setSheetState(() {
      _batchAttempts[index] = _batchAttempts[index].copyWith(
        status: success ? BatchTagStatus.success : BatchTagStatus.failed,
        message: labelled,
        completedAt: DateTime.now(),
      );
      _batchCurrentIndex++;
    });
    setState(() {});
  }

  void _confirmCancelBatch(BuildContext sheetCtx) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(L10n.current.batchConfirmCancelTitle),
        content: Text(
          L10n.current.batchConfirmCancelMessage,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(L10n.current.onboardingContinue),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.danger),
            onPressed: () async {
              Navigator.of(ctx).pop();
              Navigator.of(sheetCtx).pop();
              setState(() {
                for (int i = _batchCurrentIndex; i < _batchTargetCount; i++) {
                  _batchAttempts[i] = _batchAttempts[i].copyWith(
                    status: BatchTagStatus.cancelled,
                    message: L10n.current.cancelled,
                  );
                }
                _batchActive = false;
              });
              await _controller.cancelSession();
              if (!mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      L10n.current.batchCancelledSnack),
                  backgroundColor: AppColors.warning,
                ),
              );
            },
            child: Text(L10n.current.cancelAndClose,
                style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  // -------------------------------------------------------------
  // Workflow 4: Composer Record Reordering
  // -------------------------------------------------------------

  void _moveComposerRecordUp(int index) {
    if (index <= 0) return;
    setState(() {
      _composerHistory.push(_recordsToWrite);
      final item = _recordsToWrite.removeAt(index);
      _recordsToWrite.insert(index - 1, item);
    });
  }

  void _moveComposerRecordDown(int index) {
    if (index >= _recordsToWrite.length - 1) return;
    setState(() {
      _composerHistory.push(_recordsToWrite);
      final item = _recordsToWrite.removeAt(index);
      _recordsToWrite.insert(index + 1, item);
    });
  }

  // -------------------------------------------------------------
  // Workflow 5: Offline URL Safety Dialog
  // -------------------------------------------------------------

  void _showUrlSafetyDialog(String rawUrl) {
    final assessment = UrlSafetyAssessment.evaluate(rawUrl);

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Row(
          children: [
            Icon(
              assessment.warnings.isEmpty
                  ? Icons.security
                  : Icons.warning_amber_rounded,
              color: assessment.warnings.isEmpty
                  ? AppColors.success
                  : AppColors.warning,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(L10n.current.urlSafetyOfflineAnalysisTitle,
                  style: const TextStyle(fontSize: 16)),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.subtleFill,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SelectableText(
                  assessment.rawUrl,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 13),
                ),
              ),
              const SizedBox(height: 12),
              _buildSafetyParam(L10n.current.urlSafetyScheme,
                  assessment.scheme.isEmpty ? '(Eksik)' : assessment.scheme),
              _buildSafetyParam(L10n.current.hostLabel,
                  assessment.host.isEmpty ? L10n.current.unknownParentheses : assessment.host),
              if (assessment.port != null)
                _buildSafetyParam(
                    L10n.current.urlSafetyPort, assessment.port.toString()),
              _buildSafetyParam(
                L10n.current.urlSafetyUserInfoLabel,
                assessment.hasUserInfo ? L10n.current.valuePresentRisky : L10n.current.valueNone,
                highlight: assessment.hasUserInfo,
              ),
              _buildSafetyParam(
                L10n.current.urlSafetyIpLiteral,
                assessment.isIpLiteral
                    ? L10n.current.valueYesIp
                    : L10n.current.urlSafetyDomain,
                highlight: assessment.isIpLiteral,
              ),
              _buildSafetyParam(
                L10n.current.urlSafetyPunycodeLabel,
                assessment.isPunycode ? L10n.current.urlSafetyHomoglyphRisk : L10n.current.no,
                highlight: assessment.isPunycode,
              ),
              const Divider(height: 20),
              if (assessment.warnings.isNotEmpty) ...[
                Text(
                  L10n.current.urlSafetyWarningsHeader,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.warning,
                      fontSize: 13),
                ),
                const SizedBox(height: 4),
                ...assessment.warnings.map(
                  (w) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('⚠️ ', style: TextStyle(fontSize: 12)),
                        Expanded(
                          child: Text(w,
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.brown)),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
              ],
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.neutralSoft,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  L10n.current.urlSafetyDisclaimer,
                  style: TextStyle(fontSize: 11, color: AppColors.secondary),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(L10n.current.close),
          ),
        ],
      ),
    );
  }

  Widget _buildSafetyParam(String label, String value,
      {bool highlight = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: TextStyle(
                  fontSize: 12,
                  color: AppColors.ink,
                  fontWeight: FontWeight.w500)),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: highlight ? AppColors.danger : AppColors.ink,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // -------------------------------------------------------------
  // Template & Settings Handlers
  // -------------------------------------------------------------

  void _loadTemplateToComposer(WriteTemplate template) {
    setState(() {
      _composerHistory.push(_recordsToWrite);
      _recordsToWrite.addAll(template.records);
    });
    _tabController.animateTo(1);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            L10n.current.templateLoaded(template.name)),
        backgroundColor: AppColors.accent,
      ),
    );
  }

  void _promptSaveAsTemplate() {
    if (_recordsToWrite.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(L10n.current.templateSaveEmptyError),
          backgroundColor: AppColors.warning,
        ),
      );
      return;
    }

    final nameController = TextEditingController(
        text: L10n.current.templateDefaultName('${_controller.storage.getTemplates().length + 1}'));
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(L10n.current.saveAsTemplate),
        content: TextField(
          controller: nameController,
          autofocus: true,
          decoration: InputDecoration(
            labelText: L10n.current.templateNameHint,
            hintText: L10n.current.templateNameSample,
            border: const OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(L10n.current.dismiss),
          ),
          ElevatedButton(
            onPressed: () async {
              final name = nameController.text.trim();
              if (name.isEmpty) return;
              await _controller.storage.saveTemplate(
                WriteTemplate(
                  id: DateTime.now().microsecondsSinceEpoch.toString(),
                  name: name,
                  createdAt: DateTime.now(),
                  records: List<NdefRecordModel>.from(_recordsToWrite),
                ),
              );
              if (!mounted || !ctx.mounted) return;
              Navigator.of(ctx).pop();
              setState(() {});
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(L10n.current.templateSavedSnack)),
              );
            },
            child: Text(L10n.current.save),
          ),
        ],
      ),
    );
  }

  // -------------------------------------------------------------
  // Tag Rules (In-App Notes keyed by SHA-256 of exact NDEF bytes)
  // -------------------------------------------------------------

  void _showAddOrEditTagRuleDialog(List<NdefRecordModel> records) {
    if (records.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              L10n.current.ruleNoteRequiresNdef),
          backgroundColor: AppColors.warning,
        ),
      );
      return;
    }

    final sha = NfcStateController.computeRecordsSha256(records);
    final existingRule = _controller.storage.getTagRuleBySha256(sha);
    final noteController =
        TextEditingController(text: existingRule?.note ?? '');

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(existingRule != null
            ? L10n.current.ruleNoteDialogTitle
            : L10n.current.ruleNoteAddTitle),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.warningSoft,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AppColors.warning),
                ),
                child: Text(
                  L10n.current.ruleNoteDigestExplanation,
                  style: const TextStyle(fontSize: 11, color: Colors.brown),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                L10n.current.ndefSha256Summary(sha),
                style: TextStyle(
                    fontSize: 9,
                    fontFamily: 'monospace',
                    color: AppColors.secondary),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: noteController,
                autofocus: true,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: L10n.current.ruleNoteLabel,
                  hintText: L10n.current.tagNoteInputHint,
                  border: const OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(L10n.current.dismiss),
          ),
          ElevatedButton(
            onPressed: () async {
              final note = noteController.text.trim();
              if (note.isNotEmpty) {
                await _controller.setRuleForRecords(records, note);
                if (mounted && ctx.mounted) {
                  setState(() {});
                  Navigator.of(ctx).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(L10n.current.ruleNoteSavedSnack),
                      backgroundColor: AppColors.accent,
                    ),
                  );
                }
              }
            },
            child: Text(L10n.current.save),
          ),
        ],
      ),
    );
  }

  void _confirmDeleteTagRule(List<NdefRecordModel> records) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(L10n.current.tagNoteDeleteTitle),
        content: Text(
            L10n.current.ruleNoteDeleteConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(L10n.current.dismiss),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.danger),
            onPressed: () async {
              await _controller.deleteRuleForRecords(records);
              if (mounted && ctx.mounted) {
                setState(() {});
                Navigator.of(ctx).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(L10n.current.ruleNoteDeletedSnack),
                    backgroundColor: AppColors.accent,
                  ),
                );
              }
            },
            child: Text(L10n.current.delete, style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _openTagRulesManager() {
    TagRulesManagerSheet.show(
      context,
      storage: _controller.storage,
      onRulesChanged: () {
        if (mounted) setState(() {});
      },
    );
  }

  // -------------------------------------------------------------
  // JSON Backup: Export & Import with Sensitive Data Warnings
  // -------------------------------------------------------------

  void _promptExportBackup() {
    final templates = _controller.storage.getTemplates();
    final history = _controller.storage.getHistory();
    final rules = _controller.storage.getTagRules();
    final isHistoryEnabled = _controller.storage.isHistoryEnabled;

    bool includeHistory = isHistoryEnabled && history.isNotEmpty;

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDlgState) => AlertDialog(
          title: Row(
            children: [
              Icon(Icons.file_download_outlined, color: AppColors.accent),
              const SizedBox(width: 8),
              Text(L10n.current.backupExportTitle),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.warningSoft,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.warning),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.warning_amber_rounded,
                              color: AppColors.warning, size: 20),
                          const SizedBox(width: 6),
                          Text(L10n.current.backupExportWarningTitle,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.brown)),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        L10n.current.backupExportWarningBody,
                        style: TextStyle(fontSize: 11, color: AppColors.ink),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Text(L10n.current.backupIncludedItems,
                    style:
                        const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                Text(L10n.current.backupTemplatesCount('${templates.length}')),
                Text(
                    L10n.current.backupRulesCount('${rules.length}')),
                Text(L10n.current.backupLibraryCount('${_controller.storage.getLibrary().length}')),
                const SizedBox(height: 8),
                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  title: Text(L10n.current.backupIncludeHistoryOptional),
                  subtitle: Text(
                    isHistoryEnabled
                        ? L10n.current.backupHistoryCount('${history.length}')
                        : L10n.current.backupHistoryDisabled,
                    style: const TextStyle(fontSize: 11),
                  ),
                  value: includeHistory,
                  onChanged: isHistoryEnabled && history.isNotEmpty
                      ? (val) {
                          setDlgState(() {
                            includeHistory = val ?? false;
                          });
                        }
                      : null,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: Text(L10n.current.dismiss),
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.share),
              label: Text(L10n.current.backupExportAndShare),
              onPressed: () async {
                Navigator.of(ctx).pop();
                await _executeExportBackup(includeHistory: includeHistory);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLastBackupInfo() {
    final storage = _controller.storage;
    final last = storage.lastBackupAt;
    final hasData = storage.getLibrary().isNotEmpty || storage.getTemplates().isNotEmpty;
    final stale = hasData &&
        (last == null || DateTime.now().difference(last) > const Duration(days: 30));
    final localeName = Localizations.localeOf(context).toLanguageTag();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          last == null
              ? L10n.current.noBackupYet
              : L10n.current.lastBackupAt(DateFormat.yMMMd(localeName).add_Hm().format(last)),
          style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.w600, color: AppColors.ink),
        ),
        if (stale && last != null)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(L10n.current.backupStale,
                style: TextStyle(fontSize: 12, color: AppColors.warning)),
          ),
        if (Theme.of(context).platform == TargetPlatform.iOS)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(L10n.current.backupICloudTip,
                style: TextStyle(fontSize: 12, color: AppColors.secondary)),
          ),
      ],
    );
  }

  Future<void> _executeExportBackup({required bool includeHistory}) async {
    try {
      final templates = _controller.storage.getTemplates();
      final history = includeHistory ? _controller.storage.getHistory() : null;
      final rules = _controller.storage.getTagRules();

      final jsonContent = BackupCodec.encodeBackup(
        templates: templates,
        history: history,
        tagRules: rules,
        tagLibrary: _controller.storage.getLibrary(),
        clientAppVersion: AppInfo.version,
      );

      final dateStr = DateTime.now().toIso8601String().substring(0, 10);
      final fileName = 'nfc_tag_master_backup_$dateStr.json';
      final bytes = Uint8List.fromList(utf8.encode(jsonContent));

      final xfile = XFile.fromData(
        bytes,
        mimeType: 'application/json',
        name: fileName,
      );

      final result = await SharePlus.instance.share(
        ShareParams(
          files: [xfile],
          fileNameOverrides: [fileName],
          subject: L10n.current.backupFileNameLabel,
          text: L10n.current.backupFileShareSubject,
        ),
      );

      if (result.status == ShareResultStatus.success) {
        await _controller.storage.setLastBackupAt(DateTime.now());
      }
      if (!mounted) return;
      if (result.status == ShareResultStatus.success) {
        setState(() {});
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text(L10n.current.backupExportSuccessSnack),
            backgroundColor: AppColors.accent,
          ),
        );
      } else if (result.status == ShareResultStatus.dismissed) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(L10n.current.backupExportCancelled),
            backgroundColor: AppColors.secondary,
          ),
        );
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(L10n.current.exportError('$e')),
          backgroundColor: AppColors.danger,
        ),
      );
    }
  }

  void _promptImportBackup() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.file_upload_outlined, color: AppColors.accent),
            const SizedBox(width: 8),
            Text(L10n.current.backupImportTitle),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.warningSoft,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.warning),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.warning_amber_rounded,
                            color: AppColors.warning, size: 20),
                        const SizedBox(width: 6),
                        Text(L10n.current.backupMergeRuleTitle,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.brown)),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      L10n.current.backupMergeRule1 +
                      L10n.current.backupMergeRule2 +
                      L10n.current.backupMergeRule3,
                      style: TextStyle(fontSize: 11, color: AppColors.ink),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Text(
                L10n.current.backupSelectFilePrompt,
                style: const TextStyle(fontSize: 13),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(L10n.current.dismiss),
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.folder_open),
            label: Text(L10n.current.selectFileButton),
            onPressed: () async {
              Navigator.of(ctx).pop();
              await _executeImportBackup();
            },
          ),
        ],
      ),
    );
  }

  Future<void> _executeImportBackup() async {
    XFile? file;
    try {
      file = await openFile();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(L10n.current.filePickerError('$e')),
          backgroundColor: AppColors.danger,
        ),
      );
      return;
    }

    if (file == null) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(L10n.current.fileSelectionCancelled),
          backgroundColor: AppColors.secondary,
        ),
      );
      return;
    }

    String content;
    try {
      if (await file.length() > BackupCodec.maxByteSize) {
        throw BackupValidationException(L10n.current.backupFileExceedsLimit);
      }
      final bytes = await file.readAsBytes();
      if (bytes.length > BackupCodec.maxByteSize) {
        throw BackupValidationException(
          L10n.current.backupFileExceedsLimit,
        );
      }
      content = utf8.decode(bytes);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(L10n.current.fileReadError('$e')),
          backgroundColor: AppColors.danger,
        ),
      );
      return;
    }

    BackupPayload payload;
    try {
      payload = BackupCodec.decodeAndValidate(content);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(L10n.current.backupValidationError('$e')),
          backgroundColor: AppColors.danger,
          duration: const Duration(seconds: 5),
        ),
      );
      return;
    }

    // Check if backup contains history and local history is disabled
    final isLocalHistoryEnabled = _controller.storage.isHistoryEnabled;
    bool enableHistoryIfDisabled = false;

    if (payload.hasHistory && !isLocalHistoryEnabled) {
      if (!mounted) return;
      final bool? proceedWithHistory = await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (ctx) => AlertDialog(
          title: Text(L10n.current.backupHistoryDetectedTitle),
          content: Text(
            L10n.current.backupHistoryDetected('${payload.history!.length}', L10n.current.backupHistoryDetectedPrompt),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(false),
              child:
                  Text(L10n.current.backupSkipHistoryOption),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(ctx).pop(true),
              child: Text(L10n.current.backupEnableHistoryOption),
            ),
          ],
        ),
      );

      if (proceedWithHistory == null) return;
      enableHistoryIfDisabled = proceedWithHistory;
    }

    try {
      final result = await _controller.storage.mergeBackup(
        payload,
        enableHistoryIfDisabled: enableHistoryIfDisabled,
      );

      if (!mounted) return;
      setState(() {});
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(L10n.current.importSucceeded(result.toSummaryMessage())),
          backgroundColor: AppColors.accent,
          duration: const Duration(seconds: 5),
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(L10n.current.mergeError('$e')),
          backgroundColor: AppColors.danger,
        ),
      );
    }
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

  // -------------------------------------------------------------
  // TAB 1: READ TAB (Inspector & Safety Preview & Content Copy / Rewrite)
  // -------------------------------------------------------------

  Widget _buildQuickAction(IconData icon, String title, String subtitle, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: SizedBox(
        width: 136,
        child: SoftCard(
          padding: const EdgeInsets.all(14),
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: AppColors.accentSoft,
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Icon(icon, size: 19, color: AppColors.accent),
              ),
              const SizedBox(height: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
                  Text(subtitle, style: TextStyle(fontSize: 12, color: AppColors.secondary)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReadTab() {
    final tag = _controller.lastScannedTag;

    return RefreshIndicator(
      onRefresh: () => _controller.scanTag(),
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
        children: [
          Row(
            children: [
              Expanded(
                child: StatTile(
                  label: L10n.current.navHistory,
                  value: '${_controller.storage.getHistory().length}',
                  icon: Icons.history_rounded,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: StatTile(
                  label: L10n.current.template,
                  value: '${_controller.storage.getTemplates().length}',
                  icon: Icons.bookmark_border_rounded,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: StatTile(
                  label: L10n.current.statLibrary,
                  value: '${_controller.storage.getLibrary().length}',
                  icon: Icons.collections_bookmark_outlined,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          HeroActionCard(
            eyebrow: L10n.current.nfcScannerTitle,
            title: L10n.current.scanTagTitle,
            subtitle: tag == null
                ? L10n.current.heroScanSubtitle
                : L10n.current.lastTagLabel(tag.identifier),
            buttonLabel: _controller.isBusy ? L10n.current.readingInProgress : L10n.current.readHeroButton,
            icon: Icons.sensors_rounded,
            busy: _controller.isBusy,
            onPressed: _controller.isBusy ? null : () => _controller.scanTag(),
          ),
          const SizedBox(height: 18),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildQuickAction(Icons.auto_awesome_rounded, L10n.current.readyTemplates,
                      L10n.current.quickGallerySubtitle, _openTemplateGallery),
                  _buildQuickAction(Icons.collections_bookmark_outlined, L10n.current.quickLibraryTitle,
                      L10n.current.quickLibrarySubtitle, _openTagLibrary),
                  _buildQuickAction(Icons.edit_note_rounded, L10n.current.writeHeroTitle,
                      L10n.current.composeRecord, () => _tabController.animateTo(1)),
                  _buildQuickAction(Icons.layers_outlined, L10n.current.readMemoryTitle,
                      L10n.current.rawMemorySubtitle, () => _tabController.animateTo(2)),
                  _buildQuickAction(Icons.key_outlined, L10n.current.passwordLabel,
                      L10n.current.protectOrRemove, () => _tabController.animateTo(2)),
                  _buildQuickAction(Icons.history_rounded, L10n.current.navHistory,
                      L10n.current.previousScans, () => _tabController.animateTo(3)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          _buildContinuousScanCard(),
          const SizedBox(height: 16),
          if (tag?.error != null)
            Card(
              color: AppColors.dangerSoft,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(L10n.current.scanErrorWithMessage(tag!.error ?? '')),
              ),
            )
          else if (tag == null)
            Card(
              elevation: 0,
              color: AppColors.surface.withValues(alpha: 0.6),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
                child: Column(
                  children: [
                    Icon(Icons.contactless_outlined, size: 48, color: AppColors.secondary),
                    const SizedBox(height: 12),
                    Text(
                      L10n.current.noScannedTagYet,
                      style:
                          const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      L10n.current.tapScanPrompt,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: AppColors.secondary),
                    ),
                  ],
                ),
              ),
            )
          else ...[
            _buildTagMetaCard(tag),
            const SizedBox(height: 12),
            if (tag.records.isNotEmpty)
              Card(
                color: AppColors.accentSoft,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: AppColors.accentBright),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.content_copy, color: AppColors.accent),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  L10n.current.ndefCopyAndRewriteTitle,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.accent),
                                ),
                                Text(
                                  L10n.current.copyContentSummary('${tag.records.length}', '${tag.currentBytesUsed}'),
                                  style: TextStyle(
                                      fontSize: 12, color: AppColors.ink),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                foregroundColor: AppColors.accent,
                                side: BorderSide(color: AppColors.accent),
                              ),
                              icon: const Icon(Icons.copy, size: 16),
                              label: Text(L10n.current.copyToClipboard,
                                  style: const TextStyle(fontSize: 12)),
                              onPressed: () => _copyToClipboard(tag.records,
                                  source: L10n.current.tagSourceLabel(tag.identifier)),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.accent,
                                foregroundColor: Colors.white,
                              ),
                              icon: const Icon(Icons.replay, size: 16),
                              label: Text(L10n.current.rewriteTag,
                                  style: const TextStyle(fontSize: 12)),
                              onPressed: () => _startRewriteFlow(
                                  tag.records, tag.identifier),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 12),
            // In-app Tag Rule / Note banner
            if (tag.records.isNotEmpty)
              Card(
                color: _controller.matchingRuleForLastScan != null
                    ? AppColors.warningSoft
                    : AppColors.subtleFill,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(
                    color: _controller.matchingRuleForLastScan != null
                        ? AppColors.warning
                        : AppColors.border,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            _controller.matchingRuleForLastScan != null
                                ? Icons.sticky_note_2
                                : Icons.note_add_outlined,
                            color: _controller.matchingRuleForLastScan != null
                                ? AppColors.warning
                                : AppColors.secondary,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              _controller.matchingRuleForLastScan != null
                                  ? L10n.current.savedTagNoteHeader
                                  : L10n.current.tagNoteOrRule,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color:
                                    _controller.matchingRuleForLastScan != null
                                        ? Colors.brown.shade900
                                        : AppColors.ink,
                              ),
                            ),
                          ),
                          if (_controller.matchingRuleForLastScan != null)
                            IconButton(
                              icon: Icon(Icons.edit,
                                  size: 18, color: AppColors.accent),
                              tooltip: L10n.current.editNote,
                              onPressed: () =>
                                  _showAddOrEditTagRuleDialog(tag.records),
                            ),
                          if (_controller.matchingRuleForLastScan != null)
                            IconButton(
                              icon: Icon(Icons.delete_outline,
                                  size: 18, color: AppColors.danger),
                              tooltip: L10n.current.deleteNote,
                              onPressed: () =>
                                  _confirmDeleteTagRule(tag.records),
                            ),
                        ],
                      ),
                      if (_controller.matchingRuleForLastScan != null) ...[
                        const SizedBox(height: 6),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.warning),
                          ),
                          child: Text(
                            _controller.matchingRuleForLastScan!.note,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.ink),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          L10n.current.tagNoteDigestNotice,
                          style: TextStyle(fontSize: 10, color: AppColors.secondary),
                        ),
                      ] else ...[
                        const SizedBox(height: 4),
                        Text(
                          L10n.current.addCustomTagNotePrompt,
                          style: TextStyle(fontSize: 12, color: AppColors.secondary),
                        ),
                        const SizedBox(height: 8),
                        OutlinedButton.icon(
                          icon:
                              const Icon(Icons.add_comment_outlined, size: 16),
                          label: Text(L10n.current.addNoteToThisTag,
                              style: const TextStyle(fontSize: 12)),
                          onPressed: () =>
                              _showAddOrEditTagRuleDialog(tag.records),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 16),
            _buildRecordsList(tag.records,
                isReadTab: true, maxCapacity: tag.maxByteCapacity),
          ],
        ],
      ),
    );
  }

  Widget _buildTagMetaCard(NfcTagInfo tag) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.tag, color: AppColors.accent),
                const SizedBox(width: 8),
                Text(
                  L10n.current.tagInfoTitle,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: tag.isWritable
                        ? AppColors.successSoft
                        : AppColors.dangerSoft,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        color: tag.isWritable ? AppColors.success : AppColors.danger),
                  ),
                  child: Text(
                    tag.isWritable ? L10n.current.tagWritable : L10n.current.readOnlyLocked,
                    style: TextStyle(
                      color: tag.isWritable
                          ? AppColors.success
                          : AppColors.danger,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(height: 20),
            _buildMetaRow(L10n.current.serialUidLabel, tag.identifier),
            _buildTagIdentityChips(tag),
            _buildMetaRow(L10n.current.ndefSupport,
                tag.isNdefSupported ? L10n.current.supportedValue : L10n.current.notSupportedValue),
            _buildMetaRow(L10n.current.totalCapacityLabel, L10n.current.bytesValue('${tag.maxByteCapacity}')),
            _buildMetaRow(L10n.current.usedSpace, L10n.current.bytesValue('${tag.currentBytesUsed}')),
            _buildMetaRow(L10n.current.freeSpace, L10n.current.bytesValue('${tag.availableBytes}')),
            if (tag.maxByteCapacity > 0) ...[
              const SizedBox(height: 6),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: (tag.currentBytesUsed / tag.maxByteCapacity)
                      .clamp(0.0, 1.0),
                  backgroundColor: AppColors.border,
                  color: tag.currentBytesUsed > tag.maxByteCapacity
                      ? AppColors.danger
                      : AppColors.accent,
                  minHeight: 6,
                ),
              ),
            ],
            if (tag.standardTechnologies.isNotEmpty)
              _buildMetaRow(
                  L10n.current.technologiesLabel, tag.standardTechnologies.join(', ')),
            if (tag.error != null) ...[
              const SizedBox(height: 8),
              Text(
                L10n.current.errorWithMessage(tag.error ?? ''),
                style: TextStyle(
                    color: AppColors.danger, fontWeight: FontWeight.bold),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildMetaRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                  color: AppColors.ink, fontWeight: FontWeight.w500)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  // -------------------------------------------------------------
  // Advanced Record Inspector & Bounded Hex Preview
  // -------------------------------------------------------------

  Widget _buildRecordsList(List<NdefRecordModel> records,
      {required bool isReadTab, int maxCapacity = 0}) {
    if (records.isEmpty) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(L10n.current.noNdefMessageOnTag),
        ),
      );
    }

    final totalBytes = encodeNdefMessage(records).length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              isReadTab
                  ? L10n.current.readRecordsHeader('${records.length}')
                  : L10n.current.composedRecordsHeader('${records.length}'),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              maxCapacity > 0 ? L10n.current.bytesOfCapacity('$totalBytes', '$maxCapacity') : L10n.current.bytesValue('$totalBytes'),
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.secondary),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ...records.asMap().entries.map((entry) {
          final idx = entry.key;
          final rec = entry.value;
          final parsed = NdefCodec.parseRecord(rec);
          final inspection = RecordInspectionData.inspect(rec, index: idx);
          final isExpanded = isReadTab
              ? _expandedReadIndices.contains(idx)
              : _expandedComposerIndices.contains(idx);

          // Determine if record is a URL or SmartPoster containing URL
          String? urlCandidate;
          if (parsed.type == ParsedRecordType.url) {
            urlCandidate = parsed.extra['url'] as String? ?? parsed.content;
          } else if (parsed.type == ParsedRecordType.smartPoster) {
            urlCandidate = parsed.extra['uri'] as String?;
          }

          IconData icon;
          switch (parsed.type) {
            case ParsedRecordType.text:
              icon = Icons.text_snippet;
              break;
            case ParsedRecordType.url:
              icon = Icons.link;
              break;
            case ParsedRecordType.email:
              icon = Icons.email;
              break;
            case ParsedRecordType.phone:
              icon = Icons.phone;
              break;
            case ParsedRecordType.sms:
              icon = Icons.sms;
              break;
            case ParsedRecordType.location:
              icon = Icons.location_on;
              break;
            case ParsedRecordType.vcard:
              icon = Icons.contact_page;
              break;
            case ParsedRecordType.calendar:
              icon = Icons.calendar_month;
              break;
            case ParsedRecordType.smartPoster:
              icon = Icons.web_stories;
              break;
            case ParsedRecordType.wifi:
              icon = Icons.wifi;
              break;
            case ParsedRecordType.customMime:
              icon = Icons.data_object;
              break;
            default:
              icon = Icons.help_outline;
          }

          return Card(
            margin: const EdgeInsets.only(bottom: 8),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: AppColors.accentSoft,
                    child: Icon(icon, color: AppColors.accent),
                  ),
                  title: Text('${idx + 1}. ${parsed.title}',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(
                    parsed.content,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (urlCandidate != null && urlCandidate.isNotEmpty)
                        IconButton(
                          icon: Icon(Icons.shield_outlined,
                              color: AppColors.accent),
                          tooltip: L10n.current.urlSafetyOfflineAnalysisTitle,
                          onPressed: () => _showUrlSafetyDialog(urlCandidate!),
                        ),
                      if (QrPreviewDialog.isQrSupported(parsed.type))
                        IconButton(
                          icon:
                              Icon(Icons.qr_code_2, color: AppColors.accent),
                          tooltip: L10n.current.qrPreviewTooltip,
                          onPressed: () {
                            final qrContent =
                                parsed.type == ParsedRecordType.url
                                    ? (parsed.extra['url'] as String? ??
                                        parsed.content)
                                    : parsed.content;
                            QrPreviewDialog.show(
                              context,
                              type: parsed.type,
                              title: parsed.title,
                              contentToEncode: qrContent,
                            );
                          },
                        ),
                      Text('${rec.payload.length}B',
                          style: TextStyle(
                              fontSize: 12, color: AppColors.secondary)),
                      IconButton(
                        icon: Icon(
                            isExpanded ? Icons.expand_less : Icons.expand_more),
                        tooltip: isExpanded
                            ? L10n.current.hideDetails
                            : L10n.current.advancedRecordInspector,
                        onPressed: () {
                          setState(() {
                            if (isReadTab) {
                              if (isExpanded) {
                                _expandedReadIndices.remove(idx);
                              } else {
                                _expandedReadIndices.add(idx);
                              }
                            } else {
                              if (isExpanded) {
                                _expandedComposerIndices.remove(idx);
                              } else {
                                _expandedComposerIndices.add(idx);
                              }
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
                if (isExpanded)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                    decoration: BoxDecoration(
                      color: AppColors.subtleFill,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          L10n.current.ndefRecordInspectorTitle,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: AppColors.accent),
                        ),
                        const Divider(height: 12),
                        _buildInspectorRow(
                            'TNF (Type Name Format):', inspection.tnfName),
                        _buildInspectorRow(L10n.current.inspectorType,
                            '${inspection.typeText} [Hex: ${inspection.typeHex}]'),
                        _buildInspectorRow(L10n.current.idLabel,
                            '${inspection.idText} [Hex: ${inspection.idHex}]'),
                        _buildInspectorRow(L10n.current.inspectorPayloadLength,
                            L10n.current.bytesValue('${inspection.payloadLength}')),
                        const SizedBox(height: 6),
                        Text(L10n.current.inspectorRawHexPreview,
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: AppColors.secondary)),
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          padding: const EdgeInsets.all(6),
                          color: AppColors.surface,
                          child: SelectableText(
                            inspection.payloadHexPreview,
                            style: const TextStyle(
                                fontFamily: 'monospace', fontSize: 11),
                          ),
                        ),
                        if (inspection.isPayloadTruncated)
                          Text(
                            L10n.current.payloadTruncatedNote('${inspection.payloadLength}'),
                            style: TextStyle(
                                fontSize: 10, color: AppColors.secondary),
                          ),
                      ],
                    ),
                  ),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _buildInspectorRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: AppColors.ink)),
          const SizedBox(width: 4),
          Expanded(
            child: Text(value,
                style: TextStyle(fontSize: 11, color: AppColors.ink)),
          ),
        ],
      ),
    );
  }

  // -------------------------------------------------------------
  // TAB 2: WRITE TAB (Composer, Reorder, Batch Write, Single Write)
  // -------------------------------------------------------------

  Widget _buildWriteTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      L10n.current.ndefRecordsToWriteTitle,
                      style:
                          const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Wrap(
                      spacing: 4,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.undo),
                          tooltip: L10n.current.undoTooltip,
                          onPressed:
                              _composerHistory.canUndo ? _undoComposer : null,
                        ),
                        IconButton(
                          icon: const Icon(Icons.redo),
                          tooltip: L10n.current.redoTooltip,
                          onPressed:
                              _composerHistory.canRedo ? _redoComposer : null,
                        ),
                        IconButton(
                          icon: Icon(Icons.paste, color: AppColors.accent),
                          tooltip: L10n.current.pasteFromClipboardAction,
                          onPressed: _pasteFromClipboard,
                        ),
                        PopupMenuButton<String>(
                          tooltip: L10n.current.importAction,
                          icon: Icon(Icons.download_rounded, color: AppColors.accent),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          onSelected: (value) {
                            switch (value) {
                              case 'tag':
                                _importFromTag();
                                break;
                              case 'csv':
                                _importFromCsv();
                                break;
                              case 'qr':
                                _importFromQr();
                                break;
                              case 'gallery':
                                _openTemplateGallery();
                                break;
                              case 'json':
                                _importFromJsonFile();
                                break;
                            }
                          },
                          itemBuilder: (_) => [
                            PopupMenuItem(
                              value: 'json',
                              child: ListTile(
                                leading: const Icon(Icons.data_object_rounded),
                                title: Text(L10n.current.importFromJsonFile),
                              ),
                            ),
                            PopupMenuItem(
                              value: 'gallery',
                              child: ListTile(
                                leading: const Icon(Icons.auto_awesome_rounded),
                                title: Text(L10n.current.importFromGallery),
                              ),
                            ),
                            PopupMenuItem(
                              value: 'tag',
                              child: ListTile(
                                leading: const Icon(Icons.nfc_rounded),
                                title: Text(L10n.current.importFromTagAction),
                              ),
                            ),
                            PopupMenuItem(
                              value: 'qr',
                              child: ListTile(
                                leading: const Icon(Icons.qr_code_scanner_rounded),
                                title: Text(L10n.current.importFromQrAction),
                              ),
                            ),
                            PopupMenuItem(
                              value: 'csv',
                              child: ListTile(
                                leading: const Icon(Icons.table_chart_outlined),
                                title: Text(L10n.current.importFromCsvAction),
                              ),
                            ),
                          ],
                        ),
                        if (_recordsToWrite.isNotEmpty)
                          IconButton(
                            icon: Icon(Icons.bookmark_add,
                                color: AppColors.accent),
                            tooltip: L10n.current.saveAsTemplate,
                            onPressed: _promptSaveAsTemplate,
                          ),
                        if (_recordsToWrite.isNotEmpty)
                          IconButton(
                            icon: Icon(Icons.delete_sweep_outlined,
                                color: AppColors.danger),
                            tooltip: L10n.current.clearComposer,
                            onPressed: () {
                              setState(() {
                                _composerHistory.push(_recordsToWrite);
                                _recordsToWrite.clear();
                              });
                            },
                          ),
                        TextButton.icon(
                          onPressed: _openComposeSheet,
                          icon: const Icon(Icons.add),
                          label: Text(L10n.current.addRecord),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  L10n.current.composerTotals('$_stagedBytesTotal', '${_recordsToWrite.length}'),
                  style: TextStyle(color: AppColors.secondary, fontSize: 13),
                ),
                if (_recordsToWrite.isNotEmpty) _buildCapacityChips(),
                if (_recordsToWrite.isNotEmpty) TapPreviewCard(records: _recordsToWrite),
                const Divider(),
                if (_recordsToWrite.isEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            L10n.current.composerEmptyDescription,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: AppColors.secondary),
                          ),
                          const SizedBox(height: 16),
                          FilledButton.icon(
                            onPressed: _openComposeSheet,
                            icon: const Icon(Icons.add),
                            label: Text(L10n.current.addRecord),
                          ),
                        ],
                      ),
                    ),
                  )
                else
                  ..._recordsToWrite.asMap().entries.map((entry) {
                    final index = entry.key;
                    final rec = entry.value;
                    final parsed = NdefCodec.parseRecord(rec);
                    final isExpanded = _expandedComposerIndices.contains(index);
                    final inspection =
                        RecordInspectionData.inspect(rec, index: index);

                    String? urlCandidate;
                    if (parsed.type == ParsedRecordType.url) {
                      urlCandidate =
                          parsed.extra['url'] as String? ?? parsed.content;
                    } else if (parsed.type == ParsedRecordType.smartPoster) {
                      urlCandidate = parsed.extra['uri'] as String?;
                    }

                    return Card(
                      margin: const EdgeInsets.only(bottom: 6),
                      color: AppColors.subtleFill,
                      child: Column(
                        children: [
                          ListTile(
                            dense: true,
                            leading: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('#${index + 1}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(width: 4),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: index > 0
                                          ? () => _moveComposerRecordUp(index)
                                          : null,
                                      child: Icon(
                                        Icons.arrow_drop_up,
                                        size: 20,
                                        color: index > 0
                                            ? AppColors.accent
                                            : AppColors.secondary,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: index < _recordsToWrite.length - 1
                                          ? () => _moveComposerRecordDown(index)
                                          : null,
                                      child: Icon(
                                        Icons.arrow_drop_down,
                                        size: 20,
                                        color:
                                            index < _recordsToWrite.length - 1
                                                ? AppColors.accent
                                                : AppColors.secondary,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            title: Text(parsed.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            subtitle: Text(parsed.content,
                                maxLines: 1, overflow: TextOverflow.ellipsis),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.edit_outlined,
                                      size: 18, color: AppColors.accent),
                                  tooltip: L10n.current.editRecordTitle,
                                  onPressed: () => _editComposerRecord(index),
                                ),
                                if (urlCandidate != null &&
                                    urlCandidate.isNotEmpty)
                                  IconButton(
                                    icon: Icon(Icons.shield_outlined,
                                        size: 18, color: AppColors.accent),
                                    tooltip: L10n.current.urlSafetyReview,
                                    onPressed: () =>
                                        _showUrlSafetyDialog(urlCandidate!),
                                  ),
                                if (QrPreviewDialog.isQrSupported(parsed.type))
                                  IconButton(
                                    icon: Icon(Icons.qr_code_2,
                                        size: 18, color: AppColors.accent),
                                    tooltip: L10n.current.qrPreviewTooltip,
                                    onPressed: () {
                                      final qrContent = parsed.type ==
                                              ParsedRecordType.url
                                          ? (parsed.extra['url'] as String? ??
                                              parsed.content)
                                          : parsed.content;
                                      QrPreviewDialog.show(
                                        context,
                                        type: parsed.type,
                                        title: parsed.title,
                                        contentToEncode: qrContent,
                                      );
                                    },
                                  ),
                                IconButton(
                                  icon: Icon(
                                      isExpanded
                                          ? Icons.expand_less
                                          : Icons.expand_more,
                                      size: 18),
                                  tooltip: L10n.current.inspector,
                                  onPressed: () {
                                    setState(() {
                                      if (isExpanded) {
                                        _expandedComposerIndices.remove(index);
                                      } else {
                                        _expandedComposerIndices.add(index);
                                      }
                                    });
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete_outline,
                                      color: AppColors.danger, size: 18),
                                  tooltip: L10n.current.delete,
                                  onPressed: () {
                                    setState(() {
                                      _composerHistory.push(_recordsToWrite);
                                      _recordsToWrite.removeAt(index);
                                      _expandedComposerIndices.remove(index);
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          if (isExpanded)
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                              decoration: BoxDecoration(
                                color: AppColors.surface,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: AppColors.border),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildInspectorRow(
                                      'TNF:', inspection.tnfName),
                                  _buildInspectorRow(
                                      L10n.current.typeLabel, inspection.typeText),
                                  _buildInspectorRow(L10n.current.payloadLabel,
                                      L10n.current.bytesValue('${inspection.payloadLength}')),
                                  const SizedBox(height: 4),
                                  SelectableText(
                                    'Hex: ${inspection.payloadHexPreview}',
                                    style: const TextStyle(
                                        fontFamily: 'monospace', fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    );
                  }),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton.icon(
          onPressed: (_recordsToWrite.isEmpty || _controller.isBusy)
              ? null
              : () => _confirmAndWriteSingleTag(),
          icon: const Icon(Icons.save),
          label: Text(_recordsToWrite.isEmpty
              ? L10n.current.writeAndVerify
              : L10n.current.writeAndVerifyWithSize('$_stagedBytesTotal')),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: AppColors.accent,
            foregroundColor: Colors.white,
            textStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 12),
        ElevatedButton.icon(
          onPressed: (_recordsToWrite.isEmpty || _controller.isBusy)
              ? null
              : _openBatchWriteModal,
          icon: const Icon(Icons.dynamic_feed),
          label: Text(L10n.current.batchWriteButtonLabel),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 14),
            backgroundColor: AppColors.accent,
            foregroundColor: Colors.white,
            textStyle:
                const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 12),
        OutlinedButton.icon(
          onPressed: _controller.isBusy ? null : () => _confirmClearTag(),
          icon: Icon(Icons.delete_sweep, color: AppColors.danger),
          label: Text(L10n.current.clearTagButtonLabel,
              style: TextStyle(color: AppColors.danger)),
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 14),
            side: BorderSide(color: AppColors.danger),
          ),
        ),
        if (_controller.lastWriteResult != null) ...[
          const SizedBox(height: 16),
          _buildWriteResultCard(_controller.lastWriteResult!),
        ],
      ],
    );
  }

  /// Writes the list; if the tag is blank and not yet NDEF formatted, offers
  /// to prepare it and write in a single tap.
  Future<void> _writeWithSmartFormat() async {
    final ok = await _controller.writeRecords(_recordsToWrite);
    if (ok || !mounted) return;
    final result = _controller.lastWriteResult;
    if (result == null || !result.needsFormatting) return;
    final prepare = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(L10n.current.blankTagTitle),
        content: Text(L10n.current.blankTagBody),
        actions: [
          TextButton(onPressed: () => Navigator.of(ctx).pop(false), child: Text(L10n.current.cancel)),
          ElevatedButton(onPressed: () => Navigator.of(ctx).pop(true), child: Text(L10n.current.blankTagAction)),
        ],
      ),
    );
    if (prepare == true && mounted) {
      await _controller.formatAndWriteRecords(_recordsToWrite);
    }
  }

  void _confirmAndWriteSingleTag() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(L10n.current.confirmWriteTitle),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              L10n.current.confirmWriteMessage1,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(L10n.current.recordsToWriteCount('${_recordsToWrite.length}')),
            Text(L10n.current.composerTotalSize('$_stagedBytesTotal')),
            const SizedBox(height: 8),
            Text(
              L10n.current.confirmWriteMessage2,
              style: TextStyle(fontSize: 12, color: AppColors.secondary),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(L10n.current.dismiss),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.accent),
            onPressed: () {
              Navigator.of(ctx).pop();
              _writeWithSmartFormat();
            },
            child:
                Text(L10n.current.yesWrite, style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  // -------------------------------------------------------------
  // TAB 3: HISTORY TAB
  // -------------------------------------------------------------

  Widget _buildHistoryTab() {
    final isEnabled = _controller.storage.isHistoryEnabled;

    if (!isEnabled) {
      return Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.history_toggle_off,
                  size: 64, color: AppColors.secondary),
              const SizedBox(height: 16),
              Text(
                L10n.current.scanHistoryDisabledTitle,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                L10n.current.scanHistoryDisabledDesc,
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.secondary),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () async {
                  await _controller.storage.setHistoryEnabled(true);
                  setState(() {});
                },
                icon: const Icon(Icons.check),
                label: Text(L10n.current.enableHistory),
              ),
            ],
          ),
        ),
      );
    }

    final allHistory = _controller.storage.getHistory();
    final query = TextSearch.fold(_historySearchQuery.trim());

    final filteredHistory = allHistory.where((entry) {
      if (query.isEmpty) return true;
      // Search in UID / identifier
      if (TextSearch.fold(entry.identifier).contains(query)) return true;
      // Search in records content, title, or type
      for (final rec in entry.records) {
        final parsed = NdefCodec.parseRecord(rec);
        if (TextSearch.fold(parsed.title).contains(query)) return true;
        if (TextSearch.fold(parsed.content).contains(query)) return true;
        if (TextSearch.fold(parsed.type.name).contains(query)) return true;
      }
      return false;
    }).toList();

    return Column(
      children: [
        // Search bar
        Container(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          color: AppColors.surface,
          child: TextField(
            controller: _historySearchController,
            decoration: InputDecoration(
              hintText:
                  L10n.current.historySearchHint,
              prefixIcon: const Icon(Icons.search, size: 20),
              suffixIcon: _historySearchQuery.isNotEmpty
                  ? IconButton(
                          tooltip: L10n.current.clearSearch,
                          icon: const Icon(Icons.clear, size: 18),
                      onPressed: () {
                        setState(() {
                          _historySearchController.clear();
                          _historySearchQuery = '';
                        });
                      },
                    )
                  : null,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              filled: true,
              fillColor: AppColors.subtleFill,
            ),
            onChanged: (val) {
              setState(() {
                _historySearchQuery = val;
              });
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: AppColors.subtleFill,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                query.isEmpty
                    ? L10n.current.savedScansCount('${allHistory.length}')
                    : L10n.current.historyFoundCount('${filteredHistory.length}', '${allHistory.length}'),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              if (allHistory.isNotEmpty)
                IconButton(
                  tooltip: L10n.current.exportCsv,
                  icon: Icon(Icons.ios_share_rounded, size: 20, color: AppColors.accent),
                  onPressed: () => _shareCsv(
                    CsvExport.history(filteredHistory, header: [
                      L10n.current.csvColumnTime,
                      'UID',
                      L10n.current.csvColumnCapacity,
                      L10n.current.csvColumnUsed,
                      L10n.current.csvColumnContent,
                    ]),
                    'nfc_history',
                  ),
                ),
              if (allHistory.isNotEmpty)
                TextButton.icon(
                  onPressed: _confirmClearHistory,
                  icon: Icon(Icons.delete_outline,
                      size: 18, color: AppColors.danger),
                  label: Text(L10n.current.clearAllButton,
                      style: TextStyle(color: AppColors.danger)),
                ),
            ],
          ),
        ),
        Expanded(
          child: allHistory.isEmpty
              ? Center(
                  child: Text(
                    L10n.current.noHistoryYet,
                    style: TextStyle(color: AppColors.secondary),
                  ),
                )
              : filteredHistory.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search_off,
                              size: 48, color: AppColors.secondary),
                          const SizedBox(height: 12),
                          Text(
                            L10n.current.historyNoResults(_historySearchQuery),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            L10n.current.tryDifferentQuery,
                            style: TextStyle(color: AppColors.secondary, fontSize: 12),
                          ),
                          const SizedBox(height: 12),
                          OutlinedButton(
                            onPressed: () {
                              setState(() {
                                _historySearchController.clear();
                                _historySearchQuery = '';
                              });
                            },
                            child: Text(L10n.current.clearSearch),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(12),
                      itemCount: filteredHistory.length,
                      itemBuilder: (ctx, index) {
                        final item = filteredHistory[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: ExpansionTile(
                            leading: CircleAvatar(
                              backgroundColor: AppColors.accentSoft,
                              child:
                                  Icon(Icons.nfc, color: AppColors.accent),
                            ),
                            title: Text(
                              'UID: ${item.identifier}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              L10n.current.historyItemMeta(item.timestamp.toLocal().toString().substring(0, 16), '${item.records.length}'),
                              style: const TextStyle(fontSize: 12),
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.delete_outline,
                                  color: AppColors.danger),
                              tooltip: L10n.current.deleteThisRecord,
                              onPressed: () async {
                                await _controller.storage
                                    .deleteHistoryEntry(item.id);
                                setState(() {});
                              },
                            ),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            L10n.current.historyCapacity('${item.maxByteCapacity}', '${item.currentBytesUsed}')),
                                        Wrap(
                                          spacing: 4,
                                          children: [
                                            OutlinedButton.icon(
                                              style: OutlinedButton.styleFrom(
                                                foregroundColor: AppColors.accent,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8,
                                                        vertical: 4),
                                                minimumSize: Size.zero,
                                              ),
                                              onPressed: () => _copyToClipboard(
                                                item.records,
                                                source:
                                                    L10n.current.historySourceLabel(item.identifier),
                                              ),
                                              icon: const Icon(Icons.copy,
                                                  size: 14),
                                              label: Text(
                                                  L10n.current.copyToClipboard,
                                                  style:
                                                      const TextStyle(fontSize: 11)),
                                            ),
                                            ElevatedButton.icon(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: AppColors.accent,
                                                foregroundColor: Colors.white,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8,
                                                        vertical: 4),
                                                minimumSize: Size.zero,
                                              ),
                                              onPressed: () =>
                                                  _copyScannedContentToComposer(
                                                      item.records),
                                              icon: const Icon(
                                                  Icons.content_copy,
                                                  size: 14),
                                              label: Text(L10n.current.addToWriteListShort,
                                                  style:
                                                      const TextStyle(fontSize: 11)),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Divider(),
                                    ...item.records.map((r) {
                                      final p = NdefCodec.parseRecord(r);
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                  '• ${p.title}: ${p.content}',
                                                  style: const TextStyle(
                                                      fontSize: 13)),
                                            ),
                                            if (QrPreviewDialog.isQrSupported(
                                                p.type))
                                              IconButton(
                                                icon: Icon(
                                                    Icons.qr_code_2,
                                                    size: 16,
                                                    color: AppColors.accent),
                                                tooltip: L10n.current.qrPreview,
                                                padding: EdgeInsets.zero,
                                                constraints:
                                                    const BoxConstraints(),
                                                onPressed: () {
                                                  final qrContent = p.type ==
                                                          ParsedRecordType.url
                                                      ? (p.extra['url']
                                                              as String? ??
                                                          p.content)
                                                      : p.content;
                                                  QrPreviewDialog.show(
                                                    context,
                                                    type: p.type,
                                                    title: p.title,
                                                    contentToEncode: qrContent,
                                                  );
                                                },
                                              ),
                                          ],
                                        ),
                                      );
                                    }),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
        ),
      ],
    );
  }

  // -------------------------------------------------------------
  // TAB 4: TEMPLATES & SETTINGS TAB
  // -------------------------------------------------------------

  Widget _buildTemplatesAndSettingsTab() {
    final templates = _controller.storage.getTemplates();
    final isHistoryEnabled = _controller.storage.isHistoryEnabled;

    final loc = AppLocalizations.of(context) ?? L10n.current;
    final languages = [
      ('tr', L10n.current.langTr),
      ('en', 'English'),
      ('de', 'Deutsch'),
      ('fr', L10n.current.langFr),
      ('es', 'Español'),
      ('it', 'Italiano'),
      ('pt', 'Português'),
      ('ru', 'Русский'),
      ('ar', 'العربية'),
      ('ja', '日本語'),
      ('zh', '中文'),
      ('ko', '한국어'),
      ('nl', 'Nederlands'),
      ('uk', 'Українська'),
    ];
    final currentLocaleCode = _controller.locale?.languageCode;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Language Picker Section
        Card(
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.language, color: AppColors.accent),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        loc.languageTitle,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const Divider(),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(loc.systemLanguage),
                  trailing: currentLocaleCode == null
                      ? Icon(Icons.check, color: AppColors.accent)
                      : null,
                  onTap: () async {
                    await _controller.setLocaleCode(null);
                    setState(() {});
                  },
                ),
                for (final (code, name) in languages)
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(name),
                    trailing: currentLocaleCode == code
                        ? Icon(Icons.check, color: AppColors.accent)
                        : null,
                    onTap: () async {
                      await _controller.setLocaleCode(code);
                      setState(() {});
                    },
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        _buildPreferencesCard(),
        const SizedBox(height: 16),

        // Settings Section
        Card(
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.settings, color: AppColors.accent),
                    const SizedBox(width: 8),
                    Text(
                      loc.appSettings,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Divider(),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(loc.saveLocalHistory),
                  subtitle: Text(loc.saveLocalHistorySubtitle),
                  value: isHistoryEnabled,
                  onChanged: (val) async {
                    await _controller.storage.setHistoryEnabled(val);
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Reusable Write Templates Section
        Card(
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.bookmark, color: AppColors.accent),
                        const SizedBox(width: 8),
                        Text(
                          L10n.current.writeTemplates,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    if (templates.isNotEmpty)
                      TextButton.icon(
                        onPressed: _confirmClearTemplates,
                        icon: Icon(Icons.delete_outline,
                            size: 18, color: AppColors.danger),
                        label: Text(L10n.current.clearAll,
                            style: TextStyle(color: AppColors.danger)),
                      ),
                  ],
                ),
                Text(
                  L10n.current.writeTemplatesSubtitle,
                  style: TextStyle(fontSize: 12, color: AppColors.secondary),
                ),
                const Divider(),
                if (templates.isEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Center(
                      child: Text(
                        L10n.current.noTemplates,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColors.secondary),
                      ),
                    ),
                  )
                else
                  ...templates.map((tpl) {
                    return Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      color: AppColors.subtleFill,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: AppColors.accentSoft,
                          child: Icon(Icons.note_alt_outlined,
                              color: AppColors.accent),
                        ),
                        title: Text(tpl.name,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(
                          L10n.current.templateMeta('${tpl.records.length}', tpl.createdAt.toLocal().toString().substring(0, 10)),
                          style: const TextStyle(fontSize: 12),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.file_upload_outlined,
                                  color: AppColors.accent),
                              tooltip: L10n.current.addToWriteListShort,
                              onPressed: () => _loadTemplateToComposer(tpl),
                            ),
                            IconButton(
                              icon: Icon(Icons.delete_outline,
                                  color: AppColors.danger),
                              tooltip: L10n.current.deleteTemplateTooltip,
                              onPressed: () async {
                                await _controller.storage
                                    .deleteTemplate(tpl.id);
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // In-App Tag Rules Section
        Card(
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.rule_folder_outlined, color: AppColors.accent),
                        const SizedBox(width: 8),
                        Text(
                          L10n.current.inAppTagRules,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    TextButton.icon(
                      onPressed: _openTagRulesManager,
                      icon: const Icon(Icons.tune, size: 18),
                      label: Text(L10n.current.manage),
                    ),
                  ],
                ),
                Text(
                  L10n.current.rulesCountLabel('${_controller.storage.getTagRules().length}'),
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 4),
                Text(
                  L10n.current.tagRulesSubtitle,
                  style: TextStyle(fontSize: 12, color: AppColors.secondary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Backup and Restore Section
        Card(
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.backup_outlined, color: AppColors.accent),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        L10n.current.backupRestoreTitle,
                        style:
                            const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  L10n.current.backupRestoreSubtitle,
                  style: TextStyle(fontSize: 12, color: AppColors.secondary),
                ),
                const SizedBox(height: 8),
                _buildLastBackupInfo(),
                const Divider(),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        icon: const Icon(Icons.file_download_outlined),
                        label: Text(L10n.current.exportBackup),
                        onPressed: _promptExportBackup,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.file_upload_outlined),
                        label: Text(L10n.current.importBackup),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.accent,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: _promptImportBackup,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _confirmClearHistory() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(L10n.current.confirmClearHistoryTitle),
        content: Text(
            L10n.current.confirmClearHistoryContent),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(L10n.current.dismiss),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.danger),
            onPressed: () async {
              await _controller.storage.clearHistory();
              if (mounted && ctx.mounted) {
                setState(() {});
                Navigator.of(ctx).pop();
              }
            },
            child: Text(L10n.current.delete),
          ),
        ],
      ),
    );
  }

  void _confirmClearTemplates() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(L10n.current.confirmClearTemplatesTitle),
        content: Text(
            L10n.current.confirmClearTemplatesContent),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(L10n.current.dismiss),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.danger),
            onPressed: () async {
              await _controller.storage.clearTemplates();
              if (mounted && ctx.mounted) {
                setState(() {});
                Navigator.of(ctx).pop();
              }
            },
            child: Text(L10n.current.delete),
          ),
        ],
      ),
    );
  }

  Widget _buildWriteResultCard(NfcWriteResult result) {
    return Card(
      color: result.isSuccess ? AppColors.successSoft : AppColors.dangerSoft,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: result.isSuccess ? AppColors.success : AppColors.danger),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  result.isSuccess ? Icons.check_circle : Icons.error,
                  color: result.isSuccess ? AppColors.success : AppColors.danger,
                ),
                const SizedBox(width: 8),
                Text(
                  result.isSuccess ? L10n.current.writeResultSuccess : L10n.current.writeResultFailed,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: result.isSuccess
                        ? AppColors.success
                        : AppColors.danger,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(result.message),
            if (result.isSuccess && result.bytesWritten > 0) ...[
              const SizedBox(height: 4),
              Text(
                L10n.current.writeResultDetails('${result.bytesWritten}', result.verificationPassed ? L10n.current.verificationPassed : L10n.current.verificationNotChecked),
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _confirmClearTag() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(L10n.current.clearConfirmTitle),
        content: Text(
          L10n.current.clearConfirmMessage,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(L10n.current.dismiss),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.danger),
            onPressed: () {
              Navigator.of(ctx).pop();
              _controller.clearTag();
            },
            child: Text(L10n.current.yesClear),
          ),
        ],
      ),
    );
  }

  void _confirmLockTag() {
    bool understood = false;
    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          title: Text(L10n.current.lockTagConfirmTitle),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                L10n.current.lockTagWarningFull(L10n.current.lockTagWarning2),
              ),
              const SizedBox(height: 12),
              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                value: understood,
                onChanged: (v) => setDialogState(() => understood = v ?? false),
                title: Text(L10n.current.lockAcknowledge),
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: Text(L10n.current.dismiss),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.warning,
                foregroundColor: Colors.white,
              ),
              onPressed: understood
                  ? () {
                      Navigator.of(ctx).pop();
                      _controller.lockTag();
                    }
                  : null,
              child: const Text('Kilitle'),
            ),
          ],
        ),
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
