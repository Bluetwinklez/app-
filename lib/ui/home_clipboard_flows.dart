part of 'home_screen.dart';

/// Clipboard paste and the rewrite-to-another-tag flow.
extension _ClipboardAndRewriteFlows on _HomeScreenState {
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
    _refresh(() {
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
    _refresh(() {
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
                _refresh(() {
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
      _refresh(() {
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
      _refresh(() {
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

    _refresh(() {
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
              _refresh(() {
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
              _refresh(() {
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
}
