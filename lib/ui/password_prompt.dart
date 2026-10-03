import 'package:flutter/material.dart';

import '../l10n/l10n.dart';
import '../services/backup_crypto.dart';
import 'app_theme.dart';

/// Asks for the password of an encrypted backup or team pack and returns the
/// decrypted text, or null when cancelled.
Future<String?> askPasswordAndDecrypt(BuildContext context, String content) async {
  final field = TextEditingController();
  String? error;
  String? result;
  await showDialog<void>(
    context: context,
    builder: (ctx) => StatefulBuilder(
      builder: (ctx, setDlg) => AlertDialog(
        title: Row(children: [
          Icon(Icons.lock_outline_rounded, color: AppColors.accent),
          const SizedBox(width: 8),
          Expanded(child: Text(L10n.current.backupPassword)),
        ]),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(L10n.current.backupEncryptedPrompt),
            TextField(
              controller: field,
              obscureText: true,
              autofocus: true,
              decoration: InputDecoration(labelText: L10n.current.backupPassword, errorText: error),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(ctx).pop(), child: Text(L10n.current.cancel)),
          ElevatedButton(
            onPressed: () async {
              try {
                result = await BackupCrypto.decrypt(content, field.text);
                if (ctx.mounted) Navigator.of(ctx).pop();
              } on BackupDecryptException catch (e) {
                setDlg(() => error =
                    e.wrongPassword ? L10n.current.backupWrongPassword : L10n.current.backupDecryptFailed);
              }
            },
            child: Text(L10n.current.ok),
          ),
        ],
      ),
    ),
  );
  field.dispose();
  return result;
}
