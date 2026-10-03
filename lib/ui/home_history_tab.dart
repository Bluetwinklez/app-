part of 'home_screen.dart';

/// History tab: opt-in scan history with search and CSV export.
extension _HistoryTab on _HomeScreenState {
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
                  _refresh(() {});
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
      if (_historyCategory != null && ContentCategories.of(entry.records) != _historyCategory) return false;
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
                        _refresh(() {
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
              _refresh(() {
                _historySearchQuery = val;
              });
            },
          ),
        ),
        Container(
          color: AppColors.surface,
          height: 46,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 6),
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 8),
                child: ChoiceChip(
                  label: Text(L10n.current.all),
                  selected: _historyCategory == null,
                  onSelected: (_) => _refresh(() => _historyCategory = null),
                ),
              ),
              for (final c in ContentCategory.values)
                if (allHistory.any((e) => ContentCategories.of(e.records) == c))
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 8),
                    child: ChoiceChip(
                      avatar: Icon(contentCategoryIcon(c), size: 16),
                      label: Text(contentCategoryLabel(c, L10n.current)),
                      selected: _historyCategory == c,
                      onSelected: (_) => _refresh(() => _historyCategory = _historyCategory == c ? null : c),
                    ),
                  ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: AppColors.subtleFill,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                query.isEmpty && _historyCategory == null
                    ? L10n.current.savedScansCount('${allHistory.length}')
                    : L10n.current.historyFoundCount('${filteredHistory.length}', '${allHistory.length}'),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              if (allHistory.isNotEmpty)
                IconButton(
                  tooltip: L10n.current.analyticsTitle,
                  icon: Icon(Icons.insights_rounded, size: 20, color: AppColors.accent),
                  onPressed: () => AnalyticsPage.open(context, _controller.storage),
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
                              _refresh(() {
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
                                _refresh(() {});
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
}
