part of 'home_screen.dart';

/// Settings tab: preferences, language, templates, backups.
extension _SettingsTab on _HomeScreenState {
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
        // Language: one row; the full list opens in a sheet.
        Card(
          elevation: 1,
          child: ListTile(
            leading: Icon(Icons.language, color: AppColors.accent),
            title: Text(loc.languageTitle, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(currentLocaleCode == null
                ? loc.systemLanguage
                : languages.firstWhere((l) => l.$1 == currentLocaleCode, orElse: () => (currentLocaleCode, currentLocaleCode)).$2),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _pickLanguage(languages, currentLocaleCode),
          ),
        ),
        const SizedBox(height: 16),
        _buildSecurityCard(isHistoryEnabled),
        const SizedBox(height: 16),
        _buildPreferencesCard(),
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
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: TextButton.icon(
                    onPressed: _importTemplatesCsv,
                    icon: const Icon(Icons.table_view_outlined, size: 18),
                    label: Text(L10n.current.templateImportTitle),
                  ),
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
                                _refresh(() {});
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

  Future<void> _importTemplatesCsv() async {
    final loc = L10n.current;
    final text = TextEditingController();
    final result = await showDialog<TemplateImportResult>(
      context: context,
      builder: (ctx) => StatefulBuilder(builder: (ctx, setDlg) {
        final r = TemplateCsvImporter.parse(text.text);
        return AlertDialog(
          title: Text(loc.templateImportTitle),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(loc.templateImportHint, style: TextStyle(fontSize: 13, color: AppColors.secondary, height: 1.35)),
                const SizedBox(height: 10),
                TextField(
                  controller: text,
                  minLines: 4,
                  maxLines: 8,
                  style: const TextStyle(fontFamily: 'monospace', fontSize: 12.5),
                  onChanged: (_) => setDlg(() {}),
                ),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: TextButton.icon(
                    icon: const Icon(Icons.content_paste_rounded, size: 18),
                    label: Text(loc.libraryImportPaste),
                    onPressed: () async {
                      final data = await Clipboard.getData(Clipboard.kTextPlain);
                      if (data?.text != null) setDlg(() => text.text = data!.text!);
                    },
                  ),
                ),
                if (text.text.trim().isNotEmpty) ...[
                  Text(loc.templateImportPreview('${r.templates.length}'),
                      style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.accent)),
                  if (r.errors.isNotEmpty)
                    Text(loc.templateImportSkipped(r.errors.join(', ')),
                        style: TextStyle(fontSize: 12.5, color: AppColors.warning)),
                ],
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.of(ctx).pop(), child: Text(loc.cancel)),
            ElevatedButton(
              onPressed: r.templates.isEmpty ? null : () => Navigator.of(ctx).pop(r),
              child: Text(loc.libraryImportAdd),
            ),
          ],
        );
      }),
    );
    text.dispose();
    if (result == null) return;
    for (final t in result.templates) {
      await _controller.storage.saveTemplate(t);
    }
    if (!mounted) return;
    _refresh(() {});
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(loc.templateImportDone('${result.templates.length}')),
      backgroundColor: AppColors.success,
    ));
  }

  Future<void> _pickLanguage(List<(String, String)> languages, String? current) async {
    final loc = L10n.current;
    final picked = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => SafeArea(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(ctx).size.height * 0.75),
          child: ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                title: Text(loc.systemLanguage),
                trailing: current == null ? Icon(Icons.check, color: AppColors.accent) : null,
                onTap: () => Navigator.of(ctx).pop(''),
              ),
              for (final (code, name) in languages)
                ListTile(
                  title: Text(name),
                  trailing: current == code ? Icon(Icons.check, color: AppColors.accent) : null,
                  onTap: () => Navigator.of(ctx).pop(code),
                ),
            ],
          ),
        ),
      ),
    );
    if (picked == null) return;
    await _controller.setLocaleCode(picked.isEmpty ? null : picked);
    _refresh(() {});
  }

  Widget _buildSecurityCard(bool isHistoryEnabled) {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    final storage = _controller.storage;
    final lastBackup = storage.lastBackupAt;
    final checks = <(bool, String)>[
      (storage.appLockEnabled, loc.appLockTitle),
      (storage.hideInSwitcher, loc.hideInSwitcherTitle),
      (storage.clearClipboardAfterCopy, loc.clearClipboardTitle),
      (lastBackup != null && DateTime.now().difference(lastBackup).inDays <= 30, loc.secCheckBackup),
    ];
    final ok = checks.where((c) => c.$1).length;
    String delayLabel(int s) => s == 0
        ? loc.lockImmediately
        : s < 60
            ? loc.lockAfterSecondsLabel('$s')
            : loc.lockAfterMinutesLabel('${s ~/ 60}');
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
              child: Row(
                children: [
                  Icon(Icons.shield_outlined, color: AppColors.accent),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(loc.securityTitle,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(16, 6, 16, 6),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: (ok == checks.length ? AppColors.success : AppColors.warning).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${loc.secCheckTitle}: ${loc.secCheckScore('$ok', '${checks.length}')}',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: ok == checks.length ? AppColors.success : AppColors.warning)),
                  const SizedBox(height: 6),
                  for (final (done, label) in checks)
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Row(
                        children: [
                          Icon(done ? Icons.check_circle : Icons.radio_button_unchecked,
                              size: 16, color: done ? AppColors.success : AppColors.secondary),
                          const SizedBox(width: 6),
                          Expanded(child: Text(label, style: const TextStyle(fontSize: 13))),
                        ],
                      ),
                    ),
                  const SizedBox(height: 6),
                  Text(loc.secCheckEncryptedNote,
                      style: TextStyle(fontSize: 12, color: AppColors.secondary, height: 1.35)),
                ],
              ),
            ),
            SwitchListTile.adaptive(
              secondary: Icon(Icons.lock_outline_rounded, color: AppColors.accent),
              title: Text(loc.appLockTitle),
              subtitle: Text(loc.appLockSubtitle),
              value: storage.appLockEnabled,
              onChanged: (on) async {
                // Turning it on proves it works; turning it off needs the owner.
                final ok = await LaunchActionService.authenticate(reason: loc.appLockReason, title: loc.appTitle);
                if (!mounted) return;
                if (ok == null && on) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(loc.appLockUnavailable)),
                  );
                  return;
                }
                if (ok == false) return;
                await storage.setAppLockEnabled(on);
                _refresh(() {});
              },
            ),
            if (storage.appLockEnabled)
              ListTile(
                leading: Icon(Icons.timer_outlined, color: AppColors.accent),
                title: Text(loc.lockAfterTitle),
                trailing: DropdownButton<int>(
                  value: SecurityService.lockDelays.contains(storage.lockAfterSeconds)
                      ? storage.lockAfterSeconds
                      : 60,
                  underline: const SizedBox.shrink(),
                  items: [
                    for (final s in SecurityService.lockDelays)
                      DropdownMenuItem(value: s, child: Text(delayLabel(s))),
                  ],
                  onChanged: (v) async {
                    if (v == null) return;
                    await storage.setLockAfterSeconds(v);
                    _refresh(() {});
                  },
                ),
              ),
            SwitchListTile.adaptive(
              secondary: Icon(Icons.blur_on_rounded, color: AppColors.accent),
              title: Text(loc.hideInSwitcherTitle),
              subtitle: Text(loc.hideInSwitcherSubtitle),
              value: storage.hideInSwitcher,
              onChanged: (on) async {
                await storage.setHideInSwitcher(on);
                await LaunchActionService.setPrivacyCover(on);
                _refresh(() {});
              },
            ),
            SwitchListTile.adaptive(
              secondary: Icon(Icons.content_paste_off_rounded, color: AppColors.accent),
              title: Text(loc.clearClipboardTitle),
              subtitle: Text(loc.clearClipboardSubtitle),
              value: storage.clearClipboardAfterCopy,
              onChanged: (on) async {
                await storage.setClearClipboardAfterCopy(on);
                _refresh(() {});
              },
            ),
            SwitchListTile.adaptive(
              secondary: Icon(Icons.history_rounded, color: AppColors.accent),
              title: Text(loc.saveLocalHistory),
              subtitle: Text(loc.saveLocalHistorySubtitle),
              value: isHistoryEnabled,
              onChanged: (val) async {
                await storage.setHistoryEnabled(val);
                _refresh(() {});
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
              child: Text(
                loc.dataSummary(
                  '${storage.getHistory().length}',
                  '${storage.getLibrary().length}',
                  '${storage.getLogBooks().length}',
                  '${storage.getTemplates().length}',
                ),
                style: TextStyle(fontSize: 12.5, color: AppColors.secondary),
              ),
            ),
            ListTile(
              leading: Icon(Icons.delete_forever_outlined, color: AppColors.danger),
              title: Text(loc.wipeTitle, style: TextStyle(color: AppColors.danger, fontWeight: FontWeight.w600)),
              subtitle: Text(loc.wipeSubtitle),
              onTap: _confirmWipe,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _confirmWipe() async {
    final loc = L10n.current;
    final sure = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(loc.wipeTitle),
        content: Text(loc.wipeConfirm),
        actions: [
          TextButton(onPressed: () => Navigator.of(ctx).pop(false), child: Text(loc.cancel)),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.danger, foregroundColor: Colors.white),
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(loc.delete),
          ),
        ],
      ),
    );
    if (sure != true || !mounted) return;
    final allowed = await SecurityService.confirmSensitive(_controller.storage,
        reason: loc.securityConfirmReason, title: loc.wipeTitle);
    if (!allowed || !mounted) return;
    await SecurityService.wipeAllData(_controller.storage);
    try {
      final docs = await getApplicationDocumentsDirectory();
      final photos = Directory('${docs.path}/tag_photos');
      if (await photos.exists()) await photos.delete(recursive: true);
    } catch (_) {
      // Photos are best effort; the data itself is gone.
    }
    await _controller.setThemeMode(ThemeMode.system);
    await _controller.setLocaleCode(null);
    await _controller.setHapticsEnabled(true);
    await _controller.setSoundsEnabled(false);
    await LaunchActionService.setPrivacyCover(true);
    if (!mounted) return;
    _refresh(() => _showOnboarding = true);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(loc.wipeDone)));
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
                _refresh(() {});
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
                _refresh(() {});
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
