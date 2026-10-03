part of 'home_screen.dart';

/// JSON backup export/import and the last-backup reminder.
extension _BackupActions on _HomeScreenState {
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
        _refresh(() {});
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
      _refresh(() {});
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
}
