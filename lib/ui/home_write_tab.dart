part of 'home_screen.dart';

/// Write tab: composer, capacity, tap preview, write actions.
extension _WriteTab on _HomeScreenState {
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
                              _refresh(() {
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
                                    _refresh(() {
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
                                    _refresh(() {
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
}
