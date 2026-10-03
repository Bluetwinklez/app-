part of 'home_screen.dart';

/// Read tab: last scan, identity chips, record inspector.
extension _ReadTab on _HomeScreenState {
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
                          _refresh(() {
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
}
