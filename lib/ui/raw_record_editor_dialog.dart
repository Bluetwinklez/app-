import 'dart:typed_data';
import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../domain/ndef_record.dart';
import '../l10n/l10n.dart';
import 'app_theme.dart';

/// Modal dialog for editing raw NDEF records (TNF, Type, ID, Payload in Hex)
/// or viewing read-only record explanation without silently discarding fields.
class RawRecordEditorDialog extends StatefulWidget {
  final NdefRecordModel initialRecord;
  final ValueChanged<NdefRecordModel> onSave;
  final String? readOnlyReason;

  const RawRecordEditorDialog({
    super.key,
    required this.initialRecord,
    required this.onSave,
    this.readOnlyReason,
  });

  static Future<void> show(
    BuildContext context, {
    required NdefRecordModel record,
    required ValueChanged<NdefRecordModel> onSave,
    String? readOnlyReason,
  }) {
    return showDialog(
      context: context,
      builder: (ctx) => RawRecordEditorDialog(
        initialRecord: record,
        onSave: onSave,
        readOnlyReason: readOnlyReason,
      ),
    );
  }

  @override
  State<RawRecordEditorDialog> createState() => _RawRecordEditorDialogState();
}

class _RawRecordEditorDialogState extends State<RawRecordEditorDialog> {
  late NdefTnf _selectedTnf;
  late final TextEditingController _typeHexController;
  late final TextEditingController _idHexController;
  late final TextEditingController _payloadHexController;

  String? _typeError;
  String? _idError;
  String? _payloadError;

  bool get _isReadOnly => widget.readOnlyReason != null;

  @override
  void initState() {
    super.initState();
    _selectedTnf = widget.initialRecord.tnf;
    _typeHexController = TextEditingController(text: _bytesToHex(widget.initialRecord.type));
    _idHexController = TextEditingController(text: _bytesToHex(widget.initialRecord.id));
    _payloadHexController = TextEditingController(text: _bytesToHex(widget.initialRecord.payload));
  }

  @override
  void dispose() {
    _typeHexController.dispose();
    _idHexController.dispose();
    _payloadHexController.dispose();
    super.dispose();
  }

  static String _bytesToHex(Uint8List bytes) {
    return bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join(' ').toUpperCase();
  }

  static Uint8List? _hexToBytes(String hex) {
    final clean = hex.replaceAll(RegExp(r'[\s,:\-]'), '');
    if (clean.isEmpty) return Uint8List(0);
    if (clean.length.isOdd || !RegExp(r'^[0-9a-fA-F]+$').hasMatch(clean)) {
      return null;
    }
    final list = <int>[];
    for (int i = 0; i < clean.length; i += 2) {
      list.add(int.parse(clean.substring(i, i + 2), radix: 16));
    }
    return Uint8List.fromList(list);
  }

  void _handleSave() {
    setState(() {
      _typeError = null;
      _idError = null;
      _payloadError = null;
    });

    final loc = AppLocalizations.of(context) ?? L10n.current;
    final typeBytes = _hexToBytes(_typeHexController.text.trim());
    if (typeBytes == null) {
      setState(() => _typeError = loc.invalidHexType);
      return;
    }
    if (typeBytes.length > 255) {
      setState(() => _typeError = loc.typeTooLarge);
      return;
    }

    final idBytes = _hexToBytes(_idHexController.text.trim());
    if (idBytes == null) {
      setState(() => _idError = loc.invalidHexId);
      return;
    }
    if (idBytes.length > 255) {
      setState(() => _idError = loc.idTooLarge);
      return;
    }

    final payloadBytes = _hexToBytes(_payloadHexController.text.trim());
    if (payloadBytes == null) {
      setState(() => _payloadError = loc.invalidHexPayload);
      return;
    }

    final updated = NdefRecordModel(
      tnf: _selectedTnf,
      type: typeBytes,
      id: idBytes,
      payload: payloadBytes,
    );

    widget.onSave(updated);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    return AlertDialog(
      title: Row(
        children: [
          Icon(
            _isReadOnly ? Icons.info_outline : Icons.tune,
            color: AppColors.accent,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              _isReadOnly ? loc.rawRecordDetailsTitle : loc.rawRecordEditorTitle,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.readOnlyReason != null)
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.warningSoft,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.warning),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.warning_amber_rounded, color: AppColors.warning, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        widget.readOnlyReason!,
                        style: const TextStyle(fontSize: 12, color: Colors.brown, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            const Text(
              'TNF (Type Name Format):',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            const SizedBox(height: 4),
            if (_isReadOnly)
              Text(_selectedTnf.name, style: const TextStyle(fontSize: 14))
            else
              DropdownButton<NdefTnf>(
                value: _selectedTnf,
                isExpanded: true,
                items: NdefTnf.values.map((tnf) {
                  return DropdownMenuItem<NdefTnf>(
                    value: tnf,
                    child: Text('${tnf.index} - ${tnf.name}'),
                  );
                }).toList(),
                onChanged: (val) {
                  if (val != null) setState(() => _selectedTnf = val);
                },
              ),
            const SizedBox(height: 12),
            TextField(
              controller: _typeHexController,
              enabled: !_isReadOnly,
              style: const TextStyle(fontFamily: 'monospace', fontSize: 13),
              decoration: InputDecoration(
                labelText: loc.rawTypeHexLabel,
                hintText: loc.rawTypeHexHint,
                errorText: _typeError,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _idHexController,
              enabled: !_isReadOnly,
              style: const TextStyle(fontFamily: 'monospace', fontSize: 13),
              decoration: InputDecoration(
                labelText: loc.rawIdHexLabel,
                hintText: loc.rawOptionalHexHint,
                errorText: _idError,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _payloadHexController,
              enabled: !_isReadOnly,
              maxLines: 5,
              style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
              decoration: InputDecoration(
                labelText: loc.rawPayloadHexLabel,
                hintText: '02 74 72 48 65 6C 6C 6F',
                errorText: _payloadError,
                border: const OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(_isReadOnly ? loc.close : loc.dismiss),
        ),
        if (!_isReadOnly)
          ElevatedButton.icon(
            icon: const Icon(Icons.check),
            label: Text(loc.saveChanges),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.accent,
              foregroundColor: Colors.white,
            ),
            onPressed: _handleSave,
          ),
      ],
    );
  }
}
