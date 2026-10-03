import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../domain/tag_signature.dart';
import '../l10n/app_localizations.dart';
import '../l10n/l10n.dart';
import '../services/app_storage_service.dart';
import 'app_theme.dart';

/// Create, share or import the signing key and toggle signing on write.
class SignedTagsPage extends StatefulWidget {
  final AppStorageService storage;

  const SignedTagsPage({super.key, required this.storage});

  static Future<void> open(BuildContext context, AppStorageService storage) =>
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => SignedTagsPage(storage: storage)));

  @override
  State<SignedTagsPage> createState() => _SignedTagsPageState();
}

class _SignedTagsPageState extends State<SignedTagsPage> {
  List<int>? get _key {
    final k = widget.storage.signingKey;
    return k == null ? null : base64Decode(k);
  }

  String _keyId(List<int> key) =>
      TagSignature.keyId(key).map((b) => b.toRadixString(16).padLeft(2, '0')).join().toUpperCase();

  Future<bool> _confirmReplace() async {
    if (_key == null) return true;
    final loc = AppLocalizations.of(context) ?? L10n.current;
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        content: Text(loc.sigReplaceKeyConfirm),
        actions: [
          TextButton(onPressed: () => Navigator.of(ctx).pop(false), child: Text(loc.cancel)),
          ElevatedButton(onPressed: () => Navigator.of(ctx).pop(true), child: Text(loc.ok)),
        ],
      ),
    );
    return ok == true;
  }

  Future<void> _create() async {
    if (!await _confirmReplace()) return;
    await widget.storage.setSigningKey(base64Encode(TagSignature.generateKey()));
    if (mounted) setState(() {});
  }

  Future<void> _import() async {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    final data = await Clipboard.getData(Clipboard.kTextPlain);
    final key = TagSignature.importKey(data?.text ?? '');
    if (!mounted) return;
    if (key == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(loc.sigImportInvalid)));
      return;
    }
    if (!await _confirmReplace()) return;
    await widget.storage.setSigningKey(base64Encode(key));
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    final key = _key;
    return DecoratedBox(
      decoration: BoxDecoration(gradient: AppColors.canvasGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(title: Text(loc.sigTitle)),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
          children: [
            Text(loc.sigExplain, style: TextStyle(color: AppColors.secondary, height: 1.45)),
            const SizedBox(height: 16),
            SoftCard(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  if (key != null)
                    ListTile(
                      leading: Icon(Icons.key_rounded, color: AppColors.success),
                      title: Text(loc.sigKeyReady(_keyId(key))),
                    ),
                  SwitchListTile.adaptive(
                    title: Text(loc.sigSignOnWrite),
                    value: key != null && widget.storage.signOnWrite,
                    onChanged: key == null
                        ? null
                        : (v) async {
                            await widget.storage.setSignOnWrite(v);
                            if (mounted) setState(() {});
                          },
                  ),
                  ListTile(
                    leading: Icon(Icons.add_moderator_outlined, color: AppColors.accent),
                    title: Text(loc.sigCreateKey),
                    onTap: _create,
                  ),
                  if (key != null)
                    ListTile(
                      leading: Icon(Icons.copy_rounded, color: AppColors.accent),
                      title: Text(loc.sigCopyKey),
                      onTap: () {
                        Clipboard.setData(ClipboardData(text: TagSignature.exportKey(key)));
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(loc.linkCopied)));
                      },
                    ),
                  ListTile(
                    leading: Icon(Icons.content_paste_rounded, color: AppColors.accent),
                    title: Text(loc.sigImportKey),
                    onTap: _import,
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
