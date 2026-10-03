import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
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
import 'qr_scan_page.dart';
import 'package:intl/intl.dart';
import '../l10n/app_localizations.dart';
import '../l10n/l10n.dart';
import '../domain/csv_records.dart';

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

  // State for History search & filter
  final TextEditingController _historySearchController =
      TextEditingController();
  String _historySearchQuery = '';

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? NfcStateController();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(_onControllerUpdate);
    _controller.addListener(_onControllerUpdate);
    WidgetsBinding.instance.addObserver(this);
    _controller.init();
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
          backgroundColor: Colors.orange,
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

  Future<void> _importFromCsv() async {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    XFile? file;
    try {
      file = await openFile();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(loc.filePickerError(e.toString())), backgroundColor: AppColors.danger),
      );
      return;
    }
    if (file == null || !mounted) return;
    final bytes = await file.readAsBytes();
    if (!mounted) return;
    if (bytes.length > 512 * 1024) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(loc.csvFileTooLarge), backgroundColor: AppColors.danger),
      );
      return;
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
      if (!mounted) return;
    }
    _appendImportedRecords(result.records, 'CSV');
  }

  void _pasteFromClipboard() {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    final clip = _controller.clipboardSnapshot;
    if (clip == null || clip.records.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(loc.noClipboardContent),
          backgroundColor: Colors.orange,
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
                  const Icon(Icons.paste, color: AppColors.accent),
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
                style: const TextStyle(color: Colors.black87),
              ),
              const SizedBox(height: 4),
              Text(
                loc.clipboardPastePrompt,
                style: const TextStyle(color: Colors.black54, fontSize: 13),
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(Icons.find_replace, color: Colors.orange),
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
                leading: const Icon(Icons.add_to_photos, color: AppColors.accent),
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
                  backgroundColor: Colors.orange.shade800),
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
          backgroundColor: Colors.orange,
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
          backgroundColor: Colors.orange,
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
            const Icon(Icons.replay_circle_filled, color: AppColors.accent),
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
                  color: Colors.amber.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.amber.shade300),
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
                      style: const TextStyle(fontSize: 12, color: Colors.black87),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Text(L10n.current.rewriteSourceUid(_rewriteSourceUid ?? L10n.current.unknown)),
              Text(L10n.current.recordsToWriteCount('${records.length}')),
              Text('Mesaj Boyutu: $byteSize Bayt'),
              const Divider(height: 20),
              Text(
                L10n.current.rewriteInstruction,
                style: const TextStyle(fontSize: 13, color: Colors.black87),
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
            backgroundColor: Colors.red,
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
            const Icon(Icons.check_circle, color: Colors.green),
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
            Text('Bayt: ${encodeNdefMessage(writtenRecords).length} B'),
            const SizedBox(height: 12),
            Text(
              L10n.current.writeVerifiedHint,
              style: const TextStyle(fontSize: 13, color: Colors.black54),
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
                color: match ? Colors.green : Colors.orange),
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
                color: match ? Colors.green.shade900 : Colors.deepOrange,
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
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    int chosenCount = _batchTargetCount;
    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDlgState) => AlertDialog(
          title: Row(
            children: [
              const Icon(Icons.dynamic_feed, color: AppColors.accent),
              const SizedBox(width: 8),
              Text(L10n.current.batchWriteTitle),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  L10n.current.batchWriteSubtitle,
                  style: const TextStyle(fontSize: 13),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blueGrey.shade200),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        L10n.current.attention,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.blueGrey),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        L10n.current.batchNotice1 +
                        L10n.current.batchNotice2,
                        style: const TextStyle(fontSize: 12, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  L10n.current.batchTargetCount('$chosenCount'),
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
                  L10n.current.composerRecordsSummary('${_recordsToWrite.length}', '$_stagedBytesTotal'),
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
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
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accent, foregroundColor: Colors.white),
              onPressed: () {
                Navigator.of(ctx).pop();
                _initBatchWrite(chosenCount);
              },
              child: Text(L10n.current.batchStartButton),
            ),
          ],
        ),
      ),
    );
  }

  void _initBatchWrite(int totalCount) {
    setState(() {
      _batchTargetCount = totalCount;
      _batchCurrentIndex = 0;
      _batchActive = true;
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
                          const Icon(Icons.dynamic_feed, color: AppColors.accent),
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
                    style: const TextStyle(fontSize: 12, color: Colors.black54),
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
                            icon = const Icon(Icons.check_circle,
                                color: Colors.green, size: 20);
                            textColor = Colors.green.shade800;
                            statusText = L10n.current.batchAttemptOk(att.message ?? '');
                            break;
                          case BatchTagStatus.failed:
                            icon = const Icon(Icons.cancel,
                                color: Colors.red, size: 20);
                            textColor = Colors.red.shade800;
                            statusText = L10n.current.batchAttemptFailed(att.message ?? '');
                            break;
                          case BatchTagStatus.writing:
                            icon = const Icon(Icons.hourglass_top,
                                color: Colors.orange, size: 20);
                            textColor = Colors.orange.shade800;
                            statusText = L10n.current.writeHeroWriting;
                            break;
                          case BatchTagStatus.cancelled:
                            icon = const Icon(Icons.remove_circle_outline,
                                color: Colors.grey, size: 20);
                            textColor = Colors.grey;
                            statusText = L10n.current.statusCancelled;
                            break;
                          case BatchTagStatus.pending:
                            icon = const Icon(Icons.radio_button_unchecked,
                                color: Colors.blueGrey, size: 20);
                            textColor = Colors.black54;
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
    final success = await _controller.writeRecords(
      _recordsToWrite,
      promptMessage:
          L10n.current.batchPrompt('$currentNum', '$_batchTargetCount'),
    );
    if (!_batchActive || !mounted) return;

    final msg = success
        ? L10n.current.batchWrittenVerified('${_recordsToWrite.length}')
        : (_controller.lastWriteResult?.message ?? L10n.current.writeError);

    setSheetState(() {
      _batchAttempts[index] = _batchAttempts[index].copyWith(
        status: success ? BatchTagStatus.success : BatchTagStatus.failed,
        message: msg,
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
            child: const Text('Devam Et'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
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
                  backgroundColor: Colors.orange,
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
                  ? Colors.green
                  : Colors.orange.shade800,
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
                  color: Colors.grey.shade100,
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
              _buildSafetyParam('Sunucu / Host:',
                  assessment.host.isEmpty ? L10n.current.unknownParentheses : assessment.host),
              if (assessment.port != null)
                _buildSafetyParam(
                    L10n.current.urlSafetyPort, assessment.port.toString()),
              _buildSafetyParam(
                L10n.current.urlSafetyUserInfoLabel,
                assessment.hasUserInfo ? 'Mevcut (Riskli olabilir)' : 'Yok',
                highlight: assessment.hasUserInfo,
              ),
              _buildSafetyParam(
                L10n.current.urlSafetyIpLiteral,
                assessment.isIpLiteral
                    ? 'Evet (IP adresi)'
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
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
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
                  color: Colors.blueGrey.shade50,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  L10n.current.urlSafetyDisclaimer,
                  style: const TextStyle(fontSize: 11, color: Colors.blueGrey),
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
              style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500)),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: highlight ? Colors.red.shade800 : Colors.black87,
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
          backgroundColor: Colors.orange,
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
          backgroundColor: Colors.orange,
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
                  color: Colors.amber.shade50,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.amber.shade200),
                ),
                child: Text(
                  L10n.current.ruleNoteDigestExplanation,
                  style: const TextStyle(fontSize: 11, color: Colors.brown),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                L10n.current.ndefSha256Summary(sha),
                style: const TextStyle(
                    fontSize: 9,
                    fontFamily: 'monospace',
                    color: Colors.blueGrey),
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
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
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
              const Icon(Icons.file_download_outlined, color: AppColors.accent),
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
                    color: Colors.amber.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.amber.shade400),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.warning_amber_rounded,
                              color: Colors.orange, size: 20),
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
                        style: const TextStyle(fontSize: 11, color: Colors.black87),
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

  Future<void> _executeExportBackup({required bool includeHistory}) async {
    try {
      final templates = _controller.storage.getTemplates();
      final history = includeHistory ? _controller.storage.getHistory() : null;
      final rules = _controller.storage.getTagRules();

      final jsonContent = BackupCodec.encodeBackup(
        templates: templates,
        history: history,
        tagRules: rules,
        clientAppVersion: '1.0.0+1',
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

      if (!mounted) return;
      if (result.status == ShareResultStatus.success) {
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
            backgroundColor: Colors.blueGrey,
          ),
        );
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(L10n.current.exportError('$e')),
          backgroundColor: Colors.red,
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
            const Icon(Icons.file_upload_outlined, color: AppColors.accent),
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
                  color: Colors.amber.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.amber.shade400),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.warning_amber_rounded,
                            color: Colors.orange, size: 20),
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
                      style: const TextStyle(fontSize: 11, color: Colors.black87),
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
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (file == null) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(L10n.current.fileSelectionCancelled),
          backgroundColor: Colors.blueGrey,
        ),
      );
      return;
    }

    String content;
    try {
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
          backgroundColor: Colors.red,
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
          backgroundColor: Colors.red,
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
          backgroundColor: Colors.red,
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
    final destinations = _getDestinations(context);
    final current = destinations[_tabController.index];
    return DecoratedBox(
      decoration: const BoxDecoration(gradient: AppColors.canvasGradient),
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
                  border: Border.all(color: Colors.white, width: 3),
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
                      style: const TextStyle(fontSize: 13, color: AppColors.secondary),
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
            const Icon(Icons.info_outline_rounded, size: 16, color: AppColors.secondary),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              _controller.statusMessage,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 13, color: AppColors.secondary),
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
                  color: Colors.white.withValues(alpha: 0.92),
                  borderRadius: BorderRadius.circular(33),
                  border: Border.all(color: Colors.white),
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
              decoration: const BoxDecoration(color: AppColors.ink, shape: BoxShape.circle),
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
            border: Border.all(color: Colors.white, width: 3),
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
        label = 'NFC Yok';
        tooltip = 'Bu cihazda NFC desteklenmiyor';
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
            color: Colors.white,
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
          const Icon(Icons.inventory_2_outlined, color: AppColors.accent, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              L10n.current.clipboardBannerText('${clip.recordCount}', '${clip.byteSize}', clip.sourceDescription),
              style: const TextStyle(
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
                    const TextStyle(color: AppColors.accent, fontWeight: FontWeight.bold)),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: const Icon(Icons.close, size: 16, color: Colors.black54),
            tooltip: 'Panoyu Temizle',
            onPressed: () => _controller.clearClipboard(),
          ),
        ],
      ),
    );
  }

  // -------------------------------------------------------------
  // TAB 1: READ TAB (Inspector & Safety Preview & Content Copy / Rewrite)
  // -------------------------------------------------------------

  Widget _buildQuickAction(IconData icon, String title, String subtitle, int tabIndex) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: SizedBox(
        width: 136,
        child: SoftCard(
          padding: const EdgeInsets.all(14),
          onTap: () => _tabController.animateTo(tabIndex),
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
                  Text(subtitle, style: const TextStyle(fontSize: 12, color: AppColors.secondary)),
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
                  label: 'Kural',
                  value: '${_controller.storage.getTagRules().length}',
                  icon: Icons.rule_rounded,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          HeroActionCard(
            eyebrow: L10n.current.nfcScannerTitle,
            title: 'Etiketi Tara',
            subtitle: tag == null
                ? L10n.current.heroScanSubtitle
                : L10n.current.lastTagLabel(tag.identifier),
            buttonLabel: _controller.isBusy ? 'Okunuyor...' : L10n.current.readHeroButton,
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
                _buildQuickAction(Icons.edit_note_rounded, L10n.current.writeHeroTitle, L10n.current.composeRecord, 1),
                _buildQuickAction(Icons.layers_outlined, L10n.current.readMemoryTitle, 'Ham bellek', 2),
                _buildQuickAction(Icons.key_outlined, L10n.current.passwordLabel, L10n.current.protectOrRemove, 2),
                  _buildQuickAction(Icons.history_rounded, L10n.current.navHistory, L10n.current.previousScans, 3),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          if (tag?.error != null)
            Card(
              color: Colors.red.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(L10n.current.scanErrorWithMessage(tag!.error ?? '')),
              ),
            )
          else if (tag == null)
            Card(
              elevation: 0,
              color: Colors.white.withValues(alpha: 0.6),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
                child: Column(
                  children: [
                    const Icon(Icons.contactless_outlined, size: 48, color: AppColors.secondary),
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
                      style: const TextStyle(color: Colors.black54),
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
                  side: const BorderSide(color: AppColors.accentBright),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.content_copy, color: AppColors.accent),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  L10n.current.ndefCopyAndRewriteTitle,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.accent),
                                ),
                                Text(
                                  L10n.current.copyContentSummary('${tag.records.length}', '${tag.currentBytesUsed}'),
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.black87),
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
                                side: const BorderSide(color: AppColors.accent),
                              ),
                              icon: const Icon(Icons.copy, size: 16),
                              label: const Text('Panoya Kopyala',
                                  style: TextStyle(fontSize: 12)),
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
                    ? Colors.amber.shade50
                    : Colors.grey.shade50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(
                    color: _controller.matchingRuleForLastScan != null
                        ? Colors.amber.shade400
                        : Colors.grey.shade300,
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
                                ? Colors.amber.shade900
                                : Colors.blueGrey,
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
                                        : Colors.black87,
                              ),
                            ),
                          ),
                          if (_controller.matchingRuleForLastScan != null)
                            IconButton(
                              icon: const Icon(Icons.edit,
                                  size: 18, color: AppColors.accent),
                              tooltip: L10n.current.editNote,
                              onPressed: () =>
                                  _showAddOrEditTagRuleDialog(tag.records),
                            ),
                          if (_controller.matchingRuleForLastScan != null)
                            IconButton(
                              icon: const Icon(Icons.delete_outline,
                                  size: 18, color: Colors.red),
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
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.amber.shade200),
                          ),
                          child: Text(
                            _controller.matchingRuleForLastScan!.note,
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          L10n.current.tagNoteDigestNotice,
                          style: const TextStyle(fontSize: 10, color: Colors.black54),
                        ),
                      ] else ...[
                        const SizedBox(height: 4),
                        Text(
                          L10n.current.addCustomTagNotePrompt,
                          style: const TextStyle(fontSize: 12, color: Colors.black54),
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
                const Icon(Icons.tag, color: AppColors.accent),
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
                        ? Colors.green.shade50
                        : Colors.red.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        color: tag.isWritable ? Colors.green : Colors.red),
                  ),
                  child: Text(
                    tag.isWritable ? L10n.current.tagWritable : 'Salt Okunur (Kilitli)',
                    style: TextStyle(
                      color: tag.isWritable
                          ? Colors.green.shade800
                          : Colors.red.shade800,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(height: 20),
            _buildMetaRow('Seri No (UID):', tag.identifier),
            _buildMetaRow(L10n.current.ndefSupport,
                tag.isNdefSupported ? 'Destekleniyor' : 'Desteklenmiyor'),
            _buildMetaRow('Toplam Kapasite:', '${tag.maxByteCapacity} Bayt'),
            _buildMetaRow(L10n.current.usedSpace, '${tag.currentBytesUsed} Bayt'),
            _buildMetaRow(L10n.current.freeSpace, '${tag.availableBytes} Bayt'),
            if (tag.maxByteCapacity > 0) ...[
              const SizedBox(height: 6),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: (tag.currentBytesUsed / tag.maxByteCapacity)
                      .clamp(0.0, 1.0),
                  backgroundColor: Colors.grey.shade200,
                  color: tag.currentBytesUsed > tag.maxByteCapacity
                      ? Colors.red
                      : AppColors.accent,
                  minHeight: 6,
                ),
              ),
            ],
            if (tag.standardTechnologies.isNotEmpty)
              _buildMetaRow(
                  'Teknolojiler:', tag.standardTechnologies.join(', ')),
            if (tag.error != null) ...[
              const SizedBox(height: 8),
              Text(
                L10n.current.errorWithMessage(tag.error ?? ''),
                style: const TextStyle(
                    color: Colors.red, fontWeight: FontWeight.bold),
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
              style: const TextStyle(
                  color: Colors.black87, fontWeight: FontWeight.w500)),
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
              '$totalBytes Bayt ${maxCapacity > 0 ? "/ $maxCapacity Bayt" : ""}',
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54),
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
                          icon: const Icon(Icons.shield_outlined,
                              color: AppColors.accent),
                          tooltip: L10n.current.urlSafetyOfflineAnalysisTitle,
                          onPressed: () => _showUrlSafetyDialog(urlCandidate!),
                        ),
                      if (QrPreviewDialog.isQrSupported(parsed.type))
                        IconButton(
                          icon:
                              const Icon(Icons.qr_code_2, color: AppColors.accent),
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
                          style: const TextStyle(
                              fontSize: 12, color: Colors.grey)),
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
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          L10n.current.ndefRecordInspectorTitle,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: AppColors.accent),
                        ),
                        const Divider(height: 12),
                        _buildInspectorRow(
                            'TNF (Type Name Format):', inspection.tnfName),
                        _buildInspectorRow(L10n.current.inspectorType,
                            '${inspection.typeText} [Hex: ${inspection.typeHex}]'),
                        _buildInspectorRow('Kimlik (ID):',
                            '${inspection.idText} [Hex: ${inspection.idHex}]'),
                        _buildInspectorRow(L10n.current.inspectorPayloadLength,
                            '${inspection.payloadLength} Bayt'),
                        const SizedBox(height: 6),
                        Text(L10n.current.inspectorRawHexPreview,
                            style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54)),
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          padding: const EdgeInsets.all(6),
                          color: Colors.white,
                          child: SelectableText(
                            inspection.payloadHexPreview,
                            style: const TextStyle(
                                fontFamily: 'monospace', fontSize: 11),
                          ),
                        ),
                        if (inspection.isPayloadTruncated)
                          Text(
                            L10n.current.payloadTruncatedNote('${inspection.payloadLength}'),
                            style: const TextStyle(
                                fontSize: 10, color: Colors.grey),
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
              style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87)),
          const SizedBox(width: 4),
          Expanded(
            child: Text(value,
                style: const TextStyle(fontSize: 11, color: Colors.black87)),
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
                          tooltip: 'Geri Al (Undo)',
                          onPressed:
                              _composerHistory.canUndo ? _undoComposer : null,
                        ),
                        IconButton(
                          icon: const Icon(Icons.redo),
                          tooltip: 'Yinele (Redo)',
                          onPressed:
                              _composerHistory.canRedo ? _redoComposer : null,
                        ),
                        IconButton(
                          icon: const Icon(Icons.paste, color: AppColors.accent),
                          tooltip: L10n.current.pasteFromClipboardAction,
                          onPressed: _pasteFromClipboard,
                        ),
                        PopupMenuButton<String>(
                          tooltip: L10n.current.importAction,
                          icon: const Icon(Icons.download_rounded, color: AppColors.accent),
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
                            }
                          },
                          itemBuilder: (_) => [
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
                            icon: const Icon(Icons.bookmark_add,
                                color: AppColors.accent),
                            tooltip: L10n.current.saveAsTemplate,
                            onPressed: _promptSaveAsTemplate,
                          ),
                        if (_recordsToWrite.isNotEmpty)
                          IconButton(
                            icon: const Icon(Icons.delete_sweep_outlined,
                                color: Colors.red),
                            tooltip: 'Besteyi Temizle',
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
                  style: const TextStyle(color: Colors.black54, fontSize: 13),
                ),
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
                            style: const TextStyle(color: Colors.grey),
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
                      color: Colors.grey.shade50,
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
                                            : Colors.grey.shade400,
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
                                                : Colors.grey.shade400,
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
                                  icon: const Icon(Icons.edit_outlined,
                                      size: 18, color: AppColors.accent),
                                  tooltip: L10n.current.editRecordTitle,
                                  onPressed: () => _editComposerRecord(index),
                                ),
                                if (urlCandidate != null &&
                                    urlCandidate.isNotEmpty)
                                  IconButton(
                                    icon: const Icon(Icons.shield_outlined,
                                        size: 18, color: AppColors.accent),
                                    tooltip: L10n.current.urlSafetyReview,
                                    onPressed: () =>
                                        _showUrlSafetyDialog(urlCandidate!),
                                  ),
                                if (QrPreviewDialog.isQrSupported(parsed.type))
                                  IconButton(
                                    icon: const Icon(Icons.qr_code_2,
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
                                  icon: const Icon(Icons.delete_outline,
                                      color: Colors.red, size: 18),
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
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildInspectorRow(
                                      'TNF:', inspection.tnfName),
                                  _buildInspectorRow(
                                      L10n.current.typeLabel, inspection.typeText),
                                  _buildInspectorRow(L10n.current.payloadLabel,
                                      '${inspection.payloadLength} Bayt'),
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
          icon: const Icon(Icons.delete_sweep, color: Colors.red),
          label: Text(L10n.current.clearTagButtonLabel,
              style: const TextStyle(color: Colors.red)),
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 14),
            side: const BorderSide(color: Colors.red),
          ),
        ),
        if (_controller.lastWriteResult != null) ...[
          const SizedBox(height: 16),
          _buildWriteResultCard(_controller.lastWriteResult!),
        ],
      ],
    );
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
            Text('Toplam Boyut: $_stagedBytesTotal Bayt'),
            const SizedBox(height: 8),
            Text(
              L10n.current.confirmWriteMessage2,
              style: const TextStyle(fontSize: 12, color: Colors.black54),
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
              _controller.writeRecords(_recordsToWrite);
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
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.history_toggle_off,
                  size: 64, color: Colors.grey),
              const SizedBox(height: 16),
              Text(
                L10n.current.scanHistoryDisabledTitle,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                L10n.current.scanHistoryDisabledDesc,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black54),
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
    final query = _historySearchQuery.trim().toLowerCase();

    final filteredHistory = allHistory.where((entry) {
      if (query.isEmpty) return true;
      // Search in UID / identifier
      if (entry.identifier.toLowerCase().contains(query)) return true;
      // Search in records content, title, or type
      for (final rec in entry.records) {
        final parsed = NdefCodec.parseRecord(rec);
        if (parsed.title.toLowerCase().contains(query)) return true;
        if (parsed.content.toLowerCase().contains(query)) return true;
        if (parsed.type.name.toLowerCase().contains(query)) return true;
      }
      return false;
    }).toList();

    return Column(
      children: [
        // Search bar
        Container(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          color: Colors.white,
          child: TextField(
            controller: _historySearchController,
            decoration: InputDecoration(
              hintText:
                  L10n.current.historySearchHint,
              prefixIcon: const Icon(Icons.search, size: 20),
              suffixIcon: _historySearchQuery.isNotEmpty
                  ? IconButton(
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
              fillColor: Colors.grey.shade100,
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
          color: Colors.grey.shade100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                query.isEmpty
                    ? L10n.current.savedScansCount('${allHistory.length}')
                    : 'Bulunan: ${filteredHistory.length} / ${allHistory.length}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              if (allHistory.isNotEmpty)
                TextButton.icon(
                  onPressed: _confirmClearHistory,
                  icon: const Icon(Icons.delete_outline,
                      size: 18, color: Colors.red),
                  label: Text(L10n.current.clearAllButton,
                      style: const TextStyle(color: Colors.red)),
                ),
            ],
          ),
        ),
        Expanded(
          child: allHistory.isEmpty
              ? Center(
                  child: Text(
                    L10n.current.noHistoryYet,
                    style: const TextStyle(color: Colors.grey),
                  ),
                )
              : filteredHistory.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.search_off,
                              size: 48, color: Colors.grey),
                          const SizedBox(height: 12),
                          Text(
                            L10n.current.historyNoResults(_historySearchQuery),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            L10n.current.tryDifferentQuery,
                            style: const TextStyle(color: Colors.grey, fontSize: 12),
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
                            leading: const CircleAvatar(
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
                              icon: const Icon(Icons.delete_outline,
                                  color: Colors.red),
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
                                              label: const Text(
                                                  'Panoya Kopyala',
                                                  style:
                                                      TextStyle(fontSize: 11)),
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
                                              label: const Text('Besteye Aktar',
                                                  style:
                                                      TextStyle(fontSize: 11)),
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
                                                icon: const Icon(
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
                    const Icon(Icons.language, color: AppColors.accent),
                    const SizedBox(width: 8),
                    Text(
                      loc.languageTitle,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Divider(),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(loc.systemLanguage),
                  trailing: currentLocaleCode == null
                      ? const Icon(Icons.check, color: AppColors.accent)
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
                        ? const Icon(Icons.check, color: AppColors.accent)
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
                    const Icon(Icons.settings, color: AppColors.accent),
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
                        const Icon(Icons.bookmark, color: AppColors.accent),
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
                        icon: const Icon(Icons.delete_outline,
                            size: 18, color: Colors.red),
                        label: Text(L10n.current.clearAll,
                            style: const TextStyle(color: Colors.red)),
                      ),
                  ],
                ),
                Text(
                  L10n.current.writeTemplatesSubtitle,
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
                const Divider(),
                if (templates.isEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Center(
                      child: Text(
                        L10n.current.noTemplates,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  )
                else
                  ...templates.map((tpl) {
                    return Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      color: Colors.grey.shade50,
                      child: ListTile(
                        leading: const CircleAvatar(
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
                              icon: const Icon(Icons.file_upload_outlined,
                                  color: AppColors.accent),
                              tooltip: 'Yazma Bestesine Aktar',
                              onPressed: () => _loadTemplateToComposer(tpl),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete_outline,
                                  color: Colors.red),
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
                        const Icon(Icons.rule_folder_outlined, color: AppColors.accent),
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
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
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
                    const Icon(Icons.backup_outlined, color: AppColors.accent),
                    const SizedBox(width: 8),
                    Text(
                      L10n.current.backupRestoreTitle,
                      style:
                          const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  L10n.current.backupRestoreSubtitle,
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
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
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
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
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
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
      color: result.isSuccess ? Colors.green.shade50 : Colors.red.shade50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: result.isSuccess ? Colors.green : Colors.red),
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
                  color: result.isSuccess ? Colors.green : Colors.red,
                ),
                const SizedBox(width: 8),
                Text(
                  result.isSuccess ? L10n.current.writeResultSuccess : L10n.current.writeResultFailed,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: result.isSuccess
                        ? Colors.green.shade900
                        : Colors.red.shade900,
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
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              Navigator.of(ctx).pop();
              _controller.clearTag();
            },
            child: const Text('Evet, Temizle'),
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
                backgroundColor: Colors.deepOrange,
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
