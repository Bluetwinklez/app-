import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../domain/ndef_record.dart';
import '../l10n/app_localizations.dart';
import 'app_theme.dart';

/// Modal dialog displaying a QR code preview strictly for readable Text and Web URL records.
/// Never displays Wi-Fi credentials or passwords automatically.
/// Includes error and overflow guards.
class QrPreviewDialog extends StatelessWidget {
  final ParsedRecordType type;
  final String title;
  final String contentToEncode;

  const QrPreviewDialog({
    super.key,
    required this.type,
    required this.title,
    required this.contentToEncode,
  });

  /// Displays the QR preview dialog if the record is readable Text or Web URL.
  /// If not supported (e.g. Wi-Fi, custom binary, vCard), displays a warning notice instead.
  static void show(
    BuildContext context, {
    required ParsedRecordType type,
    required String title,
    required String contentToEncode,
  }) {
    showDialog(
      context: context,
      builder: (ctx) => QrPreviewDialog(
        type: type,
        title: title,
        contentToEncode: contentToEncode,
      ),
    );
  }

  /// Only readable plain text and web URL records are permitted for QR generation.
  static bool isQrSupported(ParsedRecordType type) {
    return type == ParsedRecordType.text || type == ParsedRecordType.url;
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final bool supported = isQrSupported(type);
    final isContentEmpty = contentToEncode.trim().isEmpty;
    // Standard QR code capacity guard (~2953 bytes in binary, but keeping under 2048 chars for UI safety)
    final isContentTooLarge = contentToEncode.length > 2048;

    return AlertDialog(
      title: Row(
        children: [
          Icon(Icons.qr_code_2, color: AppColors.accent),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              loc.qrPreviewTitle(title),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!supported)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.warningSoft,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.warning),
                ),
                child: Column(
                  children: [
                    Icon(Icons.security, color: AppColors.warning, size: 36),
                    const SizedBox(height: 8),
                    Text(
                      loc.securityRestriction,
                      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      loc.qrSecurityNote,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, color: AppColors.ink),
                    ),
                  ],
                ),
              )
            else if (isContentEmpty)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  loc.qrContentEmpty,
                  style: TextStyle(color: AppColors.secondary),
                ),
              )
            else if (isContentTooLarge)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.dangerSoft,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.danger),
                ),
                child: Text(
                  loc.qrContentTooLarge(contentToEncode.length),
                  style: TextStyle(color: AppColors.danger, fontSize: 13),
                ),
              )
            else ...[
              Container(
                width: 220,
                height: 220,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.border),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: QrImageView(
                  data: contentToEncode,
                  version: QrVersions.auto,
                  size: 200.0,
                  gapless: true,
                  errorCorrectionLevel: QrErrorCorrectLevel.M,
                  errorStateBuilder: (cxt, err) {
                    return Container(
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.center,
                      child: Text(
                        loc.qrGenerationFailed(err.toString()),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColors.danger, fontSize: 11),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.subtleFill,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      loc.qrContentChars(contentToEncode.length),
                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.secondary),
                    ),
                    const SizedBox(height: 4),
                    SelectableText(
                      contentToEncode,
                      maxLines: 4,
                      style: const TextStyle(fontSize: 11, fontFamily: 'monospace'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              Text(
                loc.qrUserOnlyNote,
                style: TextStyle(fontSize: 10, color: AppColors.secondary),
              ),
            ],
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(loc.close),
        ),
      ],
    );
  }
}
