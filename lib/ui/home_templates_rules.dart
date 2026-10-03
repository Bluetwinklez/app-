part of 'home_screen.dart';

/// Saved templates and in-app tag notes (rules).
extension _TemplatesAndRules on _HomeScreenState {
  // -------------------------------------------------------------
  // Template & Settings Handlers
  // -------------------------------------------------------------

  void _loadTemplateToComposer(WriteTemplate template) {
    _refresh(() {
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
          backgroundColor: AppColors.warning,
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
              _refresh(() {});
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
          backgroundColor: AppColors.warning,
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
                  color: AppColors.warningSoft,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AppColors.warning),
                ),
                child: Text(
                  L10n.current.ruleNoteDigestExplanation,
                  style: const TextStyle(fontSize: 11, color: Colors.brown),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                L10n.current.ndefSha256Summary(sha),
                style: TextStyle(
                    fontSize: 9,
                    fontFamily: 'monospace',
                    color: AppColors.secondary),
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
                  _refresh(() {});
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
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.danger),
            onPressed: () async {
              await _controller.deleteRuleForRecords(records);
              if (mounted && ctx.mounted) {
                _refresh(() {});
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
        if (mounted) _refresh(() {});
      },
      lastScanRecords: _controller.lastScannedTag?.error == null
          ? (_controller.lastScannedTag?.records ?? const [])
          : const [],
      onScan: () async {
        await _controller.scanTag();
        final tag = _controller.lastScannedTag;
        if (tag == null || tag.error != null || tag.wasCancelled) return null;
        return tag.records;
      },
      onSaveRule: (records, note) => _controller.setRuleForRecords(records, note),
    );
  }
}
