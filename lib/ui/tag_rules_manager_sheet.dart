import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../domain/tag_rule.dart';
import '../l10n/l10n.dart';
import '../services/app_storage_service.dart';
import 'app_theme.dart';

/// Modal sheet or dialog to view and manage all in-app tag rules.
class TagRulesManagerSheet extends StatefulWidget {
  final AppStorageService storage;
  final VoidCallback onRulesChanged;

  const TagRulesManagerSheet({
    super.key,
    required this.storage,
    required this.onRulesChanged,
  });

  static void show(BuildContext context, {required AppStorageService storage, required VoidCallback onRulesChanged}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => TagRulesManagerSheet(
        storage: storage,
        onRulesChanged: onRulesChanged,
      ),
    );
  }

  @override
  State<TagRulesManagerSheet> createState() => _TagRulesManagerSheetState();
}

class _TagRulesManagerSheetState extends State<TagRulesManagerSheet> {
  late List<TagRule> _rules;

  @override
  void initState() {
    super.initState();
    _refreshRules();
  }

  void _refreshRules() {
    setState(() {
      _rules = List<TagRule>.from(widget.storage.getTagRules());
    });
  }

  void _editRule(TagRule rule) {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    final noteController = TextEditingController(text: rule.note);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(loc.tagNoteEditTitle),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'NDEF SHA-256:\n${rule.ndefSha256}',
              style: const TextStyle(fontSize: 10, fontFamily: 'monospace', color: Colors.blueGrey),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: noteController,
              autofocus: true,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: loc.tagNoteInputLabel,
                hintText: loc.tagNoteInputHint,
                border: const OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(loc.dismiss),
          ),
          ElevatedButton(
            onPressed: () async {
              final newNote = noteController.text.trim();
              if (newNote.isNotEmpty) {
                final updated = rule.copyWith(note: newNote, updatedAt: DateTime.now());
                await widget.storage.saveTagRule(updated);
                widget.onRulesChanged();
                _refreshRules();
                if (ctx.mounted) Navigator.of(ctx).pop();
              }
            },
            child: Text(loc.save),
          ),
        ],
      ),
    );
  }

  void _deleteRule(TagRule rule) {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(loc.tagNoteDeleteTitle),
        content: Text(loc.ruleDeleteConfirm(rule.note)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(loc.dismiss),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () async {
              await widget.storage.deleteTagRule(rule.ndefSha256);
              widget.onRulesChanged();
              _refreshRules();
              if (ctx.mounted) Navigator.of(ctx).pop();
            },
            child: Text(loc.delete, style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _confirmClearAllRules() {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(loc.clearAllTagRulesTitle),
        content: Text(loc.clearAllTagRulesConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(loc.dismiss),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () async {
              await widget.storage.clearTagRules();
              widget.onRulesChanged();
              _refreshRules();
              if (ctx.mounted) Navigator.of(ctx).pop();
            },
            child: Text(loc.deleteAll, style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    return SafeArea(
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8,
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.rule_folder_outlined, color: AppColors.accent),
                    const SizedBox(width: 8),
                    Text(
                      loc.inAppTagRules,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade50,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                loc.tagRulesExplanation,
                style: const TextStyle(fontSize: 11, color: Colors.blueGrey),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  loc.tagRulesCount(_rules.length),
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
                if (_rules.isNotEmpty)
                  TextButton.icon(
                    onPressed: _confirmClearAllRules,
                    icon: const Icon(Icons.delete_sweep, size: 16, color: Colors.red),
                    label: Text(loc.clearAllButton, style: const TextStyle(color: Colors.red, fontSize: 12)),
                  ),
              ],
            ),
            const Divider(),
            Expanded(
              child: _rules.isEmpty
                  ? Center(
                      child: Text(
                        loc.noTagRulesDefined,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _rules.length,
                      itemBuilder: (ctx, index) {
                        final rule = _rules[index];
                        final shortSha = rule.ndefSha256.length > 16
                            ? '${rule.ndefSha256.substring(0, 16)}...'
                            : rule.ndefSha256;
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.amber.shade100,
                              child: const Icon(Icons.sticky_note_2, color: Colors.brown),
                            ),
                            title: Text(rule.note, style: const TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 2),
                                Text('SHA-256: $shortSha', style: const TextStyle(fontSize: 10, fontFamily: 'monospace')),
                                Text(loc.lastUpdated(rule.updatedAt.toLocal().toString().substring(0, 16)), style: const TextStyle(fontSize: 10)),
                              ],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit, size: 20, color: AppColors.accent),
                                  tooltip: loc.edit,
                                  onPressed: () => _editRule(rule),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete_outline, size: 20, color: Colors.red),
                                  tooltip: loc.delete,
                                  onPressed: () => _deleteRule(rule),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
