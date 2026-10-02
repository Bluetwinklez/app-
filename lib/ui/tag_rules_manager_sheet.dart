import 'package:flutter/material.dart';
import '../domain/tag_rule.dart';
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
    final noteController = TextEditingController(text: rule.note);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Etiket Notunu Düzenle'),
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
              decoration: const InputDecoration(
                labelText: 'Uygulama İçi Not / Açıklama',
                hintText: 'Örn: Depo Rafı #4 veya Toplantı Odası',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Vazgeç'),
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
            child: const Text('Kaydet'),
          ),
        ],
      ),
    );
  }

  void _deleteRule(TagRule rule) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Etiket Notunu Sil'),
        content: Text('"${rule.note}" açıklamalı etiket kuralı silinecektir. Devam edilsin mi?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Vazgeç'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () async {
              await widget.storage.deleteTagRule(rule.ndefSha256);
              widget.onRulesChanged();
              _refreshRules();
              if (ctx.mounted) Navigator.of(ctx).pop();
            },
            child: const Text('Sil', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _confirmClearAllRules() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Tüm Etiket Kurallarını Temizle'),
        content: const Text('Kayıtlı tüm uygulama içi etiket notları silinecektir. Onaylıyor musunuz?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Vazgeç'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () async {
              await widget.storage.clearTagRules();
              widget.onRulesChanged();
              _refreshRules();
              if (ctx.mounted) Navigator.of(ctx).pop();
            },
            child: const Text('Tümünü Sil', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                const Row(
                  children: [
                    Icon(Icons.rule_folder_outlined, color: AppColors.accent),
                    SizedBox(width: 8),
                    Text(
                      'Uygulama İçi Etiket Kuralları',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
              child: const Text(
                'Bu kurallar etiketin tam NDEF içerik SHA-256 özetine bağlıdır (iOS UID yerine). Eşleşen etiket tarandığında sadece kayıtlı not gösterilir; harici eylem başlatmaz veya sistem ayarlarını değiştirmez.',
                style: TextStyle(fontSize: 11, color: Colors.blueGrey),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tanımlı Kural Sayısı: ${_rules.length}',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
                if (_rules.isNotEmpty)
                  TextButton.icon(
                    onPressed: _confirmClearAllRules,
                    icon: const Icon(Icons.delete_sweep, size: 16, color: Colors.red),
                    label: const Text('Tümünü Temizle', style: TextStyle(color: Colors.red, fontSize: 12)),
                  ),
              ],
            ),
            const Divider(),
            Expanded(
              child: _rules.isEmpty
                  ? const Center(
                      child: Text(
                        'Henüz tanımlanmış bir etiket kuralı bulunmuyor.\nBir etiket taradıktan sonra "Etiket Notu Ekle" seçeneği ile kural oluşturabilirsiniz.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
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
                                Text('Son Güncelleme: ${rule.updatedAt.toLocal().toString().substring(0, 16)}', style: const TextStyle(fontSize: 10)),
                              ],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit, size: 20, color: AppColors.accent),
                                  tooltip: 'Düzenle',
                                  onPressed: () => _editRule(rule),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete_outline, size: 20, color: Colors.red),
                                  tooltip: 'Sil',
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
