part of 'home_screen.dart';

/// iCloud backup and the Apple Watch link (iPhone only).
extension _CompanionActions on _HomeScreenState {
  static const String _watchLabel = 'Apple Watch';

  bool get _companionSupported => !kIsWeb && Platform.isIOS;

  void _startCompanion() {
    if (!_companionSupported) return;
    _signalSubscription = _launchActions.signals.listen((signal) {
      if (signal == 'watchEventsAvailable') _takeWatchEvents();
      if (signal == 'iCloudBackupChanged') _loadICloudDate();
    });
    _takeWatchEvents();
    _scheduleWatchSync();
    CompanionService.iCloudSupported().then((supported) {
      if (!supported || !mounted) return;
      _refresh(() => _iCloudSupported = true);
      _loadICloudDate();
    });
  }

  Future<void> _loadICloudDate() async {
    final backup = await CompanionService.iCloudLoad();
    if (!mounted) return;
    _refresh(() => _iCloudSavedAt = backup?.savedAt);
  }

  /// Sends recent scans and logbooks to the watch once things settle.
  void _scheduleWatchSync() {
    if (!_companionSupported) return;
    _watchTimer?.cancel();
    _watchTimer = Timer(const Duration(seconds: 2), () {
      final context = WatchSync.context(
        history: _controller.storage.getHistory(),
        books: _controller.storage.getLogBooks(),
      );
      final json = jsonEncode(context);
      if (json == _lastWatchJson) return;
      _lastWatchJson = json;
      CompanionService.updateWatch(context);
    });
  }

  Future<void> _takeWatchEvents() async {
    final events = await CompanionService.takeWatchEvents();
    if (events.isEmpty) return;
    final changed = WatchSync.applyEvents(events, _controller.storage.getLogBooks(), label: _watchLabel);
    for (final book in changed) {
      await _controller.storage.saveLogBook(book);
    }
    if (!mounted) return;
    _refresh(() {});
    _scheduleWatchSync();
  }

  String _iCloudBackupJson() => BackupCodec.encodeBackup(
        templates: _controller.storage.getTemplates(),
        history: null,
        tagRules: _controller.storage.getTagRules(),
        tagLibrary: _controller.storage.getLibrary(),
        clientAppVersion: AppInfo.version,
      );

  /// Automatic backup when the app goes to the background.
  Future<void> _autoICloudBackup() async {
    if (!_iCloudSupported || !_controller.storage.iCloudBackupEnabled) return;
    try {
      await CompanionService.iCloudSave(_iCloudBackupJson());
      _iCloudSavedAt = DateTime.now();
    } on ICloudException {
      // Shown when backing up by hand; the automatic run stays silent.
    }
  }

  Future<void> _backupToICloud() async {
    final loc = L10n.current;
    String message;
    var ok = false;
    try {
      await CompanionService.iCloudSave(_iCloudBackupJson());
      ok = true;
      message = loc.iCloudBackedUp;
    } on ICloudException catch (e) {
      message = switch (e.error) {
        ICloudError.noAccount => loc.iCloudNoAccount,
        ICloudError.tooLarge => loc.iCloudTooLarge,
        ICloudError.failed => loc.iCloudFailed,
      };
    }
    if (!mounted) return;
    if (ok) _refresh(() => _iCloudSavedAt = DateTime.now());
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: ok ? AppColors.accent : AppColors.danger,
    ));
  }

  Future<void> _restoreFromICloud() async {
    final loc = L10n.current;
    final backup = await CompanionService.iCloudLoad();
    if (!mounted) return;
    if (backup == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(loc.iCloudNoBackup)));
      return;
    }
    try {
      final payload = BackupCodec.decodeAndValidate(backup.json);
      final result = await _controller.storage.mergeBackup(payload);
      if (!mounted) return;
      _refresh(() {});
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(loc.importSucceeded(result.toSummaryMessage())),
        backgroundColor: AppColors.accent,
      ));
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(loc.backupValidationError('$e')),
        backgroundColor: AppColors.danger,
      ));
    }
  }

  Widget _buildICloudCard() {
    final loc = L10n.current;
    final savedAt = _iCloudSavedAt;
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.cloud_outlined, color: AppColors.accent),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(loc.iCloudTitle, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(loc.iCloudSubtitle, style: TextStyle(fontSize: 12, color: AppColors.secondary)),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(loc.iCloudAuto),
              subtitle: Text(loc.iCloudAutoHint),
              value: _controller.storage.iCloudBackupEnabled,
              onChanged: (v) async {
                await _controller.storage.setICloudBackupEnabled(v);
                _refresh(() {});
                if (v) await _backupToICloud();
              },
            ),
            Text(
              savedAt == null || savedAt.millisecondsSinceEpoch == 0
                  ? loc.iCloudNoBackup
                  : loc.iCloudLastBackup(DateFormat.yMMMd(loc.localeName).add_Hm().format(savedAt)),
              style: TextStyle(fontSize: 12, color: AppColors.secondary),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.cloud_upload_outlined),
                    label: Text(loc.iCloudBackupNow),
                    onPressed: _backupToICloud,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.cloud_download_outlined),
                    label: Text(loc.iCloudRestore),
                    onPressed: _restoreFromICloud,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
