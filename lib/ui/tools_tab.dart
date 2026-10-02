import 'dart:convert';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../l10n/app_localizations.dart';
import 'package:share_plus/share_plus.dart';
import '../controllers/nfc_controller.dart';
import '../domain/ntag_tools.dart';
import '../l10n/l10n.dart';
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
    final loc = AppLocalizations.of(context) ?? L10n.current;
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
      children: [
        SectionHeader(title: loc.toolsTagSection),
        ToolTile(
          icon: Icons.delete_sweep_outlined,
          title: loc.clearTagTitle,
          subtitle: loc.clearTagSubtitle,
          color: AppColors.danger,
          onTap: _idle ? onClearTag : null,
        ),
        ToolTile(
          icon: Icons.lock_outline,
          title: loc.lockTagTitle,
          subtitle: loc.lockTagSubtitle,
          color: AppColors.warning,
          onTap: _idle ? onLockTag : null,
        ),
        SectionHeader(title: loc.toolsMemorySection),
        ToolTile(
          icon: Icons.layers_outlined,
          title: loc.readMemoryTitle,
          subtitle: loc.readMemorySubtitle,
          onTap: _idle ? () => _readMemory(context) : null,
        ),
        ToolTile(
          icon: Icons.storage_outlined,
          title: loc.formatMemoryTitle,
          subtitle: loc.formatMemorySubtitle,
          onTap: _idle ? () => _formatMemory(context) : null,
        ),
        ToolTile(
          icon: Icons.file_download_outlined,
          title: loc.writeDumpTitle,
          subtitle: loc.writeDumpSubtitle,
          onTap: _idle ? () => _writeDump(context) : null,
        ),
        SectionHeader(title: loc.toolsSecuritySection),
        ToolTile(
          icon: Icons.key_outlined,
          title: loc.setPasswordTitle,
          subtitle: loc.setPasswordSubtitle,
          onTap: _idle ? () => _setPassword(context) : null,
        ),
        ToolTile(
          icon: Icons.key_off_outlined,
          title: loc.removePasswordTitle,
          subtitle: loc.removePasswordSubtitle,
          onTap: _idle ? () => _removePassword(context) : null,
        ),
        SectionHeader(title: loc.toolsExpertSection),
        ToolTile(
          icon: Icons.memory_outlined,
          title: loc.advancedCommandsTitle,
          subtitle: loc.advancedCommandsSubtitle,
          color: AppColors.ink,
          onTap: _idle ? () => _advancedCommands(context) : null,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(4, 8, 4, 0),
          child: Text(
            loc.toolsFooterNote,
            style: const TextStyle(fontSize: 12, color: AppColors.secondary, height: 1.4),
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
    final loc = AppLocalizations.of(context) ?? L10n.current;
    final result = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(onPressed: () => Navigator.of(ctx).pop(false), child: Text(loc.dismiss)),
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
    final loc = AppLocalizations.of(context) ?? L10n.current;
    final dump = await controller.runRawTask<NtagMemoryDump>(
      promptMessage: loc.readTagMemoryPrompt,
      busyMessage: loc.readingTagMemoryStatus,
      task: NtagTools.readMemory,
      successMessage: (d) => loc.ntagPagesRead(d.chipName, d.pageCount),
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
    final loc = AppLocalizations.of(context) ?? L10n.current;
    final ok = await _confirm(
      context,
      title: loc.formatTagConfirmTitle,
      message: loc.formatTagConfirmMessage,
      action: loc.formatButton,
      destructive: true,
    );
    if (!ok || !context.mounted) return;
    final chip = await controller.runRawTask<NtagChip>(
      promptMessage: loc.formatTagPrompt,
      busyMessage: loc.formattingStatus,
      task: NtagTools.formatNdef,
      successMessage: (c) => loc.ntagFormatted(c.name),
    );
    if (context.mounted) _snack(context, controller.statusMessage, error: chip == null);
  }

  Future<void> _writeDump(BuildContext context) async {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    XFile? file;
    try {
      file = await openFile();
    } catch (e) {
      if (context.mounted) _snack(context, loc.filePickerFailed(e.toString()), error: true);
      return;
    }
    if (file == null || !context.mounted) return;
    final bytes = await file.readAsBytes();
    if (!context.mounted) return;
    if (bytes.length < 32 || bytes.length > 1024 || bytes.length % 4 != 0) {
      _snack(context, loc.ntagInvalidDumpFile, error: true);
      return;
    }
    final ok = await _confirm(
      context,
      title: loc.writeDumpTitle,
      message: loc.writeDumpConfirmMessage(bytes.length, file.name),
      action: loc.writeButton,
      destructive: true,
    );
    if (!ok || !context.mounted) return;
    final pages = await controller.runRawTask<int>(
      promptMessage: loc.writeDumpPrompt,
      busyMessage: loc.writingDumpStatus,
      task: (t) => NtagTools.writeDump(t, bytes),
      successMessage: (n) => loc.ntagPagesWritten(n),
    );
    if (context.mounted) _snack(context, controller.statusMessage, error: pages == null);
  }

  Future<void> _setPassword(BuildContext context) async {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    final password = await showDialog<Uint8List>(
      context: context,
      builder: (ctx) => _PasswordDialog(
        title: loc.setPasswordTitle,
        warning: loc.setPasswordWarning,
        action: loc.setPasswordAction,
      ),
    );
    if (password == null || !context.mounted) return;
    final chip = await controller.runRawTask<NtagChip>(
      promptMessage: loc.setPasswordPrompt,
      busyMessage: loc.settingPasswordStatus,
      task: (t) => NtagTools.setPassword(t, password: password, pack: Uint8List.fromList([0x00, 0x00])),
      successMessage: (c) => loc.ntagPasswordSet(c.name),
    );
    if (context.mounted) _snack(context, controller.statusMessage, error: chip == null);
  }

  Future<void> _removePassword(BuildContext context) async {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    final password = await showDialog<Uint8List>(
      context: context,
      builder: (ctx) => _PasswordDialog(
        title: loc.removePasswordTitle,
        warning: loc.removePasswordPromptMessage,
        action: loc.remove,
      ),
    );
    if (password == null || !context.mounted) return;
    final chip = await controller.runRawTask<NtagChip>(
      promptMessage: loc.removePasswordPrompt,
      busyMessage: loc.removingPasswordStatus,
      task: (t) => NtagTools.removePassword(t, password: password),
      successMessage: (c) => loc.ntagPasswordRemoved(c.name),
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
    final loc = AppLocalizations.of(context) ?? L10n.current;
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
              labelText: loc.passwordLabel,
              hintText: loc.passwordHint,
              errorText: _error,
            ),
          ),
        ],
      ),
      actions: [
        TextButton(onPressed: () => Navigator.of(context).pop(), child: Text(loc.dismiss)),
        ElevatedButton(
          onPressed: () {
            final bytes = parse(_controller.text);
            if (bytes == null) {
              setState(() => _error = loc.passwordError);
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
    final loc = AppLocalizations.of(context) ?? L10n.current;
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
                    loc.pagesAndBytes(dump.pageCount, dump.bytes.length),
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
                      label: Text(loc.copy),
                      onPressed: () async {
                        await Clipboard.setData(ClipboardData(text: lines.join('\n')));
                        if (context.mounted) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text(loc.memoryDumpCopied)));
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.ios_share, size: 18),
                      label: Text(loc.saveBin),
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
    final loc = AppLocalizations.of(context) ?? L10n.current;
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
      setState(() => _error = loc.commandsEmptyError);
      return;
    }
    setState(() => _error = null);

    final buffer = StringBuffer();
    await widget.controller.runRawTask<void>(
      promptMessage: loc.sendCommandsPrompt,
      busyMessage: loc.sendingCommandsStatus,
      task: (transceive) async {
        for (final cmd in commands) {
          buffer.writeln('> ${NtagTools.toHex(cmd)}');
          try {
            final response = await transceive(cmd);
            buffer.writeln('< ${response.isEmpty ? loc.emptyResponse : NtagTools.toHex(response)}');
          } catch (e) {
            buffer.writeln('! $e');
            break;
          }
        }
      },
      successMessage: (_) => loc.ntagCommandsSent(commands.length),
    );
    if (!mounted) return;
    setState(() => _log = buffer.isEmpty ? widget.controller.statusMessage : buffer.toString());
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, MediaQuery.of(context).viewInsets.bottom + 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(loc.advancedCommandsTitle, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 6),
            Text(
              loc.advancedCommandsDesc,
              style: const TextStyle(color: AppColors.secondary, height: 1.4),
            ),
            const SizedBox(height: 14),
            TextField(
              controller: _input,
              maxLines: 5,
              autocorrect: false,
              style: const TextStyle(fontFamily: 'Courier'),
              decoration: InputDecoration(labelText: loc.commandsLabel, errorText: _error),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: widget.controller.isBusy ? null : _run,
              icon: const Icon(Icons.send, size: 18),
              label: Text(loc.sendButton),
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
