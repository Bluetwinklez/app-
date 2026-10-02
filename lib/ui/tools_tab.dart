import 'dart:convert';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import '../controllers/nfc_controller.dart';
import '../domain/ntag_tools.dart';
import 'app_theme.dart';

/// "Araçlar" screen: chip-level tools for NTAG / MIFARE Ultralight tags.
class ToolsTab extends StatelessWidget {
  final NfcStateController controller;
  final VoidCallback onClearTag;
  final VoidCallback onLockTag;

  const ToolsTab({
    super.key,
    required this.controller,
    required this.onClearTag,
    required this.onLockTag,
  });

  bool get _idle => !controller.isBusy;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
      children: [
        const SectionHeader(title: 'Etiket'),
        ToolTile(
          icon: Icons.delete_sweep_outlined,
          title: 'Etiketi Sil',
          subtitle: 'Tüm kayıtları silip boş NDEF yazar',
          color: AppColors.danger,
          onTap: _idle ? onClearTag : null,
        ),
        ToolTile(
          icon: Icons.lock_outline,
          title: 'Etiketi Kilitle',
          subtitle: 'Kalıcı olarak salt okunur yapar (geri alınamaz)',
          color: AppColors.warning,
          onTap: _idle ? onLockTag : null,
        ),
        const SectionHeader(title: 'Bellek'),
        ToolTile(
          icon: Icons.layers_outlined,
          title: 'Belleği Oku',
          subtitle: 'Sayfa sayfa ham bellek; kopyala veya .bin olarak kaydet',
          onTap: _idle ? () => _readMemory(context) : null,
        ),
        ToolTile(
          icon: Icons.storage_outlined,
          title: 'Belleği Biçimlendir',
          subtitle: 'NDEF için hazırlar (boş veya bozuk etiketler)',
          onTap: _idle ? () => _formatMemory(context) : null,
        ),
        ToolTile(
          icon: Icons.file_download_outlined,
          title: 'Dump Yaz (.bin)',
          subtitle: 'Kayıtlı bellek dosyasını etikete yazar',
          onTap: _idle ? () => _writeDump(context) : null,
        ),
        const SectionHeader(title: 'Güvenlik'),
        ToolTile(
          icon: Icons.key_outlined,
          title: 'Şifre Belirle',
          subtitle: 'Etiket içeriğini yazmaya karşı şifreyle korur',
          onTap: _idle ? () => _setPassword(context) : null,
        ),
        ToolTile(
          icon: Icons.key_off_outlined,
          title: 'Şifreyi Kaldır',
          subtitle: 'Bilinen şifreyle korumayı kaldırır',
          onTap: _idle ? () => _removePassword(context) : null,
        ),
        const SectionHeader(title: 'Uzman'),
        ToolTile(
          icon: Icons.memory_outlined,
          title: 'Gelişmiş NFC Komutları',
          subtitle: 'Etikete ham onaltılık (hex) komut gönderir',
          color: AppColors.ink,
          onTap: _idle ? () => _advancedCommands(context) : null,
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(4, 8, 4, 0),
          child: Text(
            'Bellek, şifre ve komut araçları NTAG213/215/216 ve MIFARE Ultralight EV1 etiketlerde çalışır. '
            'Etiketi işlem bitene kadar telefona yakın tutun.',
            style: TextStyle(fontSize: 12, color: AppColors.secondary, height: 1.4),
          ),
        ),
      ],
    );
  }

  void _snack(BuildContext context, String message, {bool error = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: error ? AppColors.danger : AppColors.ink),
    );
  }

  Future<bool> _confirm(
    BuildContext context, {
    required String title,
    required String message,
    required String action,
    bool destructive = false,
  }) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(onPressed: () => Navigator.of(ctx).pop(false), child: const Text('Vazgeç')),
          ElevatedButton(
            style: destructive ? ElevatedButton.styleFrom(backgroundColor: AppColors.danger) : null,
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(action),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  Future<void> _readMemory(BuildContext context) async {
    final dump = await controller.runRawTask<NtagMemoryDump>(
      promptMessage: 'Belleği okunacak etiketi yaklaştırın',
      busyMessage: 'Bellek okunuyor... Etiketi yakın tutun.',
      task: NtagTools.readMemory,
      successMessage: (d) => '${d.chipName}: ${d.pageCount} sayfa okundu',
    );
    if (!context.mounted) return;
    if (dump == null) {
      _snack(context, controller.statusMessage, error: true);
      return;
    }
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => _MemoryViewer(dump: dump),
    );
  }

  Future<void> _formatMemory(BuildContext context) async {
    final ok = await _confirm(
      context,
      title: 'Belleği Biçimlendir',
      message: 'Etiketteki veriler silinir ve etiket boş bir NDEF etiketi olarak hazırlanır. Devam edilsin mi?',
      action: 'Biçimlendir',
      destructive: true,
    );
    if (!ok || !context.mounted) return;
    final chip = await controller.runRawTask<NtagChip>(
      promptMessage: 'Biçimlendirilecek etiketi yaklaştırın',
      busyMessage: 'Biçimlendiriliyor...',
      task: NtagTools.formatNdef,
      successMessage: (c) => '${c.name} biçimlendirildi',
    );
    if (context.mounted) _snack(context, controller.statusMessage, error: chip == null);
  }

  Future<void> _writeDump(BuildContext context) async {
    XFile? file;
    try {
      file = await openFile();
    } catch (e) {
      if (context.mounted) _snack(context, 'Dosya seçici açılamadı: $e', error: true);
      return;
    }
    if (file == null || !context.mounted) return;
    final bytes = await file.readAsBytes();
    if (!context.mounted) return;
    if (bytes.length < 32 || bytes.length > 1024 || bytes.length % 4 != 0) {
      _snack(context, 'Geçersiz dump dosyası (4 baytın katı, 32–1024 bayt olmalı).', error: true);
      return;
    }
    final ok = await _confirm(
      context,
      title: 'Dump Yaz',
      message: '"${file.name}" (${bytes.length} bayt) etiketin kullanıcı belleğine yazılacak. '
          'UID, kilit ve ayar sayfalarına dokunulmaz. Etiketteki mevcut veri silinir.',
      action: 'Yaz',
      destructive: true,
    );
    if (!ok || !context.mounted) return;
    final pages = await controller.runRawTask<int>(
      promptMessage: 'Dump yazılacak etiketi yaklaştırın',
      busyMessage: 'Dump yazılıyor... Etiketi yakın tutun.',
      task: (t) => NtagTools.writeDump(t, bytes),
      successMessage: (n) => '$n sayfa yazıldı',
    );
    if (context.mounted) _snack(context, controller.statusMessage, error: pages == null);
  }

  Future<void> _setPassword(BuildContext context) async {
    final password = await showDialog<Uint8List>(
      context: context,
      builder: (ctx) => const _PasswordDialog(
        title: 'Şifre Belirle',
        warning: 'Şifreyi unutursanız etiketin içeriğini bir daha değiştiremezsiniz. Okuma herkese açık kalır.',
        action: 'Şifreyi Ayarla',
      ),
    );
    if (password == null || !context.mounted) return;
    final chip = await controller.runRawTask<NtagChip>(
      promptMessage: 'Şifre koyulacak etiketi yaklaştırın',
      busyMessage: 'Şifre ayarlanıyor...',
      task: (t) => NtagTools.setPassword(t, password: password, pack: Uint8List.fromList([0x00, 0x00])),
      successMessage: (c) => '${c.name}: şifre koruması etkin',
    );
    if (context.mounted) _snack(context, controller.statusMessage, error: chip == null);
  }

  Future<void> _removePassword(BuildContext context) async {
    final password = await showDialog<Uint8List>(
      context: context,
      builder: (ctx) => const _PasswordDialog(
        title: 'Şifreyi Kaldır',
        warning: 'Etikete daha önce koyduğunuz şifreyi girin.',
        action: 'Kaldır',
      ),
    );
    if (password == null || !context.mounted) return;
    final chip = await controller.runRawTask<NtagChip>(
      promptMessage: 'Şifresi kaldırılacak etiketi yaklaştırın',
      busyMessage: 'Şifre kaldırılıyor...',
      task: (t) => NtagTools.removePassword(t, password: password),
      successMessage: (c) => '${c.name}: şifre kaldırıldı',
    );
    if (context.mounted) _snack(context, controller.statusMessage, error: chip == null);
  }

  Future<void> _advancedCommands(BuildContext context) async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => _AdvancedCommandsSheet(controller: controller),
    );
  }
}

/// Accepts a 4-character password or 8 hex digits.
class _PasswordDialog extends StatefulWidget {
  final String title;
  final String warning;
  final String action;

  const _PasswordDialog({required this.title, required this.warning, required this.action});

  @override
  State<_PasswordDialog> createState() => _PasswordDialogState();
}

class _PasswordDialogState extends State<_PasswordDialog> {
  final _controller = TextEditingController();
  String? _error;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  static Uint8List? parse(String input) {
    final value = input.trim();
    if (RegExp(r'^[0-9A-Fa-f]{8}$').hasMatch(value)) {
      return NtagTools.parseHex(value);
    }
    final bytes = utf8.encode(value);
    return bytes.length == 4 ? Uint8List.fromList(bytes) : null;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.warning, style: const TextStyle(color: AppColors.secondary)),
          const SizedBox(height: 14),
          TextField(
            controller: _controller,
            autofocus: true,
            autocorrect: false,
            decoration: InputDecoration(
              labelText: 'Şifre',
              hintText: '4 karakter (Örn: 1234) veya 8 hex',
              errorText: _error,
            ),
          ),
        ],
      ),
      actions: [
        TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Vazgeç')),
        ElevatedButton(
          onPressed: () {
            final bytes = parse(_controller.text);
            if (bytes == null) {
              setState(() => _error = 'Tam 4 karakter veya 8 hex rakam giriniz.');
              return;
            }
            Navigator.of(context).pop(bytes);
          },
          child: Text(widget.action),
        ),
      ],
    );
  }
}

class _MemoryViewer extends StatelessWidget {
  final NtagMemoryDump dump;

  const _MemoryViewer({required this.dump});

  @override
  Widget build(BuildContext context) {
    final lines = dump.formatPages();
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(dump.chipName, style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 4),
                  Text(
                    '${dump.pageCount} sayfa · ${dump.bytes.length} bayt',
                    style: const TextStyle(color: AppColors.secondary),
                  ),
                  if (dump.warning != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(dump.warning!, style: const TextStyle(color: AppColors.warning)),
                    ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: AppColors.canvas,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: lines.length,
                  itemBuilder: (_, i) => Text(
                    lines[i],
                    style: const TextStyle(fontFamily: 'Courier', fontSize: 12.5, height: 1.5),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      icon: const Icon(Icons.copy, size: 18),
                      label: const Text('Kopyala'),
                      onPressed: () async {
                        await Clipboard.setData(ClipboardData(text: lines.join('\n')));
                        if (context.mounted) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(content: Text('Bellek dökümü kopyalandı')));
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.ios_share, size: 18),
                      label: const Text('.bin Kaydet'),
                      onPressed: () {
                        final name = 'nfc_dump_${DateTime.now().millisecondsSinceEpoch}.bin';
                        SharePlus.instance.share(ShareParams(
                          files: [XFile.fromData(dump.bytes, mimeType: 'application/octet-stream', name: name)],
                          fileNameOverrides: [name],
                        ));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AdvancedCommandsSheet extends StatefulWidget {
  final NfcStateController controller;

  const _AdvancedCommandsSheet({required this.controller});

  @override
  State<_AdvancedCommandsSheet> createState() => _AdvancedCommandsSheetState();
}

class _AdvancedCommandsSheetState extends State<_AdvancedCommandsSheet> {
  final _input = TextEditingController(text: '60\n30 00');
  String? _error;
  String _log = '';

  @override
  void dispose() {
    _input.dispose();
    super.dispose();
  }

  Future<void> _run() async {
    final commands = <Uint8List>[];
    try {
      for (final line in _input.text.split('\n')) {
        if (line.trim().isEmpty) continue;
        commands.add(NtagTools.parseHex(line));
      }
    } on NtagException catch (e) {
      setState(() => _error = e.message);
      return;
    }
    if (commands.isEmpty) {
      setState(() => _error = 'En az bir komut giriniz.');
      return;
    }
    setState(() => _error = null);

    final buffer = StringBuffer();
    await widget.controller.runRawTask<void>(
      promptMessage: 'Komut gönderilecek etiketi yaklaştırın',
      busyMessage: 'Komutlar gönderiliyor...',
      task: (transceive) async {
        for (final cmd in commands) {
          buffer.writeln('> ${NtagTools.toHex(cmd)}');
          try {
            final response = await transceive(cmd);
            buffer.writeln('< ${response.isEmpty ? '(boş yanıt)' : NtagTools.toHex(response)}');
          } catch (e) {
            buffer.writeln('! $e');
            break;
          }
        }
      },
      successMessage: (_) => '${commands.length} komut gönderildi',
    );
    if (!mounted) return;
    setState(() => _log = buffer.isEmpty ? widget.controller.statusMessage : buffer.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, MediaQuery.of(context).viewInsets.bottom + 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Gelişmiş NFC Komutları', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 6),
            const Text(
              'Her satıra bir komut yazın (hex). Örn: 60 = GET_VERSION, 30 04 = sayfa 4\'ten oku. '
              'Yanlış yazma komutları etiketi kalıcı olarak bozabilir.',
              style: TextStyle(color: AppColors.secondary, height: 1.4),
            ),
            const SizedBox(height: 14),
            TextField(
              controller: _input,
              maxLines: 5,
              autocorrect: false,
              style: const TextStyle(fontFamily: 'Courier'),
              decoration: InputDecoration(labelText: 'Komutlar', errorText: _error),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: widget.controller.isBusy ? null : _run,
              icon: const Icon(Icons.send, size: 18),
              label: const Text('Gönder'),
            ),
            if (_log.isNotEmpty) ...[
              const SizedBox(height: 14),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: AppColors.canvas, borderRadius: BorderRadius.circular(14)),
                child: SelectableText(
                  _log,
                  style: const TextStyle(fontFamily: 'Courier', fontSize: 12.5, height: 1.5),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
