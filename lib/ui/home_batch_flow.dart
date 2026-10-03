part of 'home_screen.dart';

/// Batch writing: setup dialog, serial numbers, CSV rows, cloning, progress sheet.
extension _BatchWriteFlow on _HomeScreenState {
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
    _refresh(() {
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
                              _refresh(() {
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
    _refresh(() {});
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
              _refresh(() {
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
}
