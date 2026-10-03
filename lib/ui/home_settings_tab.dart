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
                    _refresh(() {});
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
                      _refresh(() {});
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
                    _refresh(() {});
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
