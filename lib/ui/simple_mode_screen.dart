import 'package:flutter/material.dart';

import '../controllers/nfc_controller.dart';
import '../domain/ndef_record.dart';
import '../domain/quick_links.dart';
import '../domain/tag_library.dart';
import '../l10n/app_localizations.dart';
import '../l10n/l10n.dart';
import '../services/launch_action_service.dart';
import '../services/speech_service.dart';
import 'app_theme.dart';

/// One big button to read a tag and one big action for what it holds.
/// Meant for children and older people; leaving it needs a long press.
class SimpleModeScreen extends StatelessWidget {
  final NfcStateController controller;
  final VoidCallback onExit;

  const SimpleModeScreen({super.key, required this.controller, required this.onExit});

  List<TagLibraryEntry> get _saved =>
      controller.storage.getLibrary().where((e) => e.records.isNotEmpty).take(8).toList();

  Future<void> _write(BuildContext context, List<NdefRecordModel> records) async {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    final ok = await controller.writeRecords(records);
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(ok ? loc.simpleWritten : controller.statusMessage, style: const TextStyle(fontSize: 18)),
      backgroundColor: ok ? AppColors.success : AppColors.danger,
    ));
  }

  Future<void> _openWriter(BuildContext context) async {
    final records = await showModalBottomSheet<List<NdefRecordModel>>(
      context: context,
      isScrollControlled: true,
      builder: (_) => const _SimpleWriter(),
    );
    if (records != null && context.mounted) await _write(context, records);
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    return DecoratedBox(
      decoration: BoxDecoration(gradient: AppColors.canvasGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: ListenableBuilder(
            listenable: controller,
            builder: (context, _) {
              final tag = controller.lastScannedTag;
              return ListView(
                padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
                children: [
                  Text(loc.appTitle,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w800)),
                  const SizedBox(height: 32),
                  Center(
                    child: SizedBox(
                      width: 220,
                      height: 220,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: AppColors.accent,
                          foregroundColor: Colors.white,
                          elevation: 6,
                        ),
                        onPressed: controller.isBusy ? null : controller.scanTag,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.nfc_rounded, size: 72),
                            const SizedBox(height: 8),
                            Text(loc.simpleScan,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(loc.simpleHint,
                      textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color: AppColors.secondary)),
                  const SizedBox(height: 28),
                  if (tag != null && tag.error == null) _Result(records: tag.records),
                  const SizedBox(height: 28),
                  SizedBox(
                    height: 72,
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: AppColors.accent, width: 2),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                      onPressed: controller.isBusy ? null : () => _openWriter(context),
                      icon: const Icon(Icons.edit_rounded, size: 30),
                      label: Text(loc.simpleWrite, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
                    ),
                  ),
                  if (_saved.isNotEmpty) ...[
                    const SizedBox(height: 28),
                    Text(loc.simpleSaved, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                    Text(loc.simpleSavedHint, style: TextStyle(fontSize: 15, color: AppColors.secondary)),
                    const SizedBox(height: 8),
                    for (final e in _saved)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: SoftCard(
                          onTap: controller.isBusy ? null : () => _write(context, e.records),
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Icon(Icons.nfc_rounded, size: 30, color: AppColors.accent),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Text(e.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                  const SizedBox(height: 40),
                  GestureDetector(
                    onLongPress: onExit,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(loc.simpleExit,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 13, color: AppColors.secondary)),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _Result extends StatelessWidget {
  final List<NdefRecordModel> records;

  const _Result({required this.records});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    if (records.isEmpty) {
      return Text(loc.simpleNothing, textAlign: TextAlign.center, style: const TextStyle(fontSize: 20));
    }
    final p = NdefCodec.parseRecord(records.first);
    final (IconData? icon, String? label, String? url) = switch (p.type) {
      ParsedRecordType.phone => (Icons.call_rounded, loc.simpleCall, 'tel:${p.content}'),
      ParsedRecordType.sms => (Icons.sms_rounded, loc.simpleMessage, 'sms:${p.content}'),
      ParsedRecordType.email => (Icons.email_rounded, loc.simpleEmail, 'mailto:${p.content}'),
      ParsedRecordType.location => (Icons.map_rounded, loc.simpleMap,
          'https://maps.apple.com/?ll=${p.extra['latitude']},${p.extra['longitude']}'),
      ParsedRecordType.url => (Icons.open_in_new_rounded, loc.simpleOpen, p.extra['url'] as String? ?? p.content),
      ParsedRecordType.smartPoster => (Icons.open_in_new_rounded, loc.simpleOpen, p.extra['uri'] as String?),
      ParsedRecordType.vcard => (Icons.call_rounded, loc.simpleCall,
          (p.extra['tel'] as String?) == null ? null : 'tel:${p.extra['tel']}'),
      _ => (null, null, null),
    };
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SoftCard(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                p.content,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600, height: 1.3),
              ),
              TextButton.icon(
                onPressed: () => SpeechService.speak(SpeechService.describe(records),
                    languageCode: Localizations.localeOf(context).languageCode),
                icon: const Icon(Icons.volume_up_rounded, size: 28),
                label: Text(loc.speakTag, style: const TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
        if (url != null && label != null) ...[
          const SizedBox(height: 16),
          SizedBox(
            height: 72,
            child: FilledButton.icon(
              style: FilledButton.styleFrom(backgroundColor: AppColors.success),
              onPressed: () => LaunchActionService.openUrl(url),
              icon: Icon(icon, size: 32),
              label: Text(label, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
            ),
          ),
        ],
      ],
    );
  }
}

enum _Kind { text, phone, link }

/// Big, three-choice writer: text, phone number or link.
class _SimpleWriter extends StatefulWidget {
  const _SimpleWriter();

  @override
  State<_SimpleWriter> createState() => _SimpleWriterState();
}

class _SimpleWriterState extends State<_SimpleWriter> {
  final _value = TextEditingController();
  _Kind _kind = _Kind.text;
  String? _error;

  @override
  void dispose() {
    _value.dispose();
    super.dispose();
  }

  void _submit() {
    final v = _value.text.trim();
    if (v.isEmpty) return;
    try {
      final record = switch (_kind) {
        _Kind.text => NdefCodec.encodeText(v),
        _Kind.phone => NdefCodec.encodePhone(v.replaceAll(RegExp(r'[^\d+]'), '')),
        _Kind.link => NdefCodec.encodeUri(QuickLinkBuilder.httpsUrl(v, emptyMessage: v)),
      };
      Navigator.of(context).pop([record]);
    } on QuickLinkException catch (e) {
      setState(() => _error = e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, MediaQuery.of(context).viewInsets.bottom + 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(loc.simpleWriteWhat, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
          const SizedBox(height: 16),
          SegmentedButton<_Kind>(
            style: const ButtonStyle(
              visualDensity: VisualDensity(vertical: 2),
              textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
            ),
            segments: [
              ButtonSegment(value: _Kind.text, label: Text(loc.simpleKindText), icon: const Icon(Icons.notes_rounded)),
              ButtonSegment(value: _Kind.phone, label: Text(loc.simpleKindPhone), icon: const Icon(Icons.call_rounded)),
              ButtonSegment(value: _Kind.link, label: Text(loc.simpleKindLink), icon: const Icon(Icons.link_rounded)),
            ],
            selected: {_kind},
            showSelectedIcon: false,
            onSelectionChanged: (v) => setState(() {
              _kind = v.first;
              _error = null;
            }),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _value,
            autofocus: true,
            style: const TextStyle(fontSize: 22),
            minLines: 1,
            maxLines: _kind == _Kind.text ? 4 : 1,
            keyboardType: switch (_kind) {
              _Kind.phone => TextInputType.phone,
              _Kind.link => TextInputType.url,
              _Kind.text => TextInputType.multiline,
            },
            decoration: InputDecoration(errorText: _error),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 68,
            child: FilledButton.icon(
              onPressed: _submit,
              icon: const Icon(Icons.nfc_rounded, size: 30),
              label: Text(loc.simpleWriteNow, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
            ),
          ),
        ],
      ),
    );
  }
}
