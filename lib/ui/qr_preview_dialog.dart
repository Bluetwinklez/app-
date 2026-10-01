import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../domain/ndef_record.dart';

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
    final bool supported = isQrSupported(type);
    final isContentEmpty = contentToEncode.trim().isEmpty;
    // Standard QR code capacity guard (~2953 bytes in binary, but keeping under 2048 chars for UI safety)
    final isContentTooLarge = contentToEncode.length > 2048;

    return AlertDialog(
      title: Row(
        children: [
          const Icon(Icons.qr_code_2, color: Colors.indigo),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'QR Kod Önizleme: $title',
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
                  color: Colors.amber.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.amber.shade400),
                ),
                child: const Column(
                  children: [
                    Icon(Icons.security, color: Colors.orange, size: 36),
                    SizedBox(height: 8),
                    Text(
                      'Güvenlik Kısıtlaması',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'QR kod önizlemesi yalnızca okunabilir Düz Metin (Text) ve Web URL kayıtları için desteklenir.\n\n'
                      'Wi-Fi parolaları, vCard veya ikili yükler gizlilik ve güvenlik nedeniyle otomatik olarak QR koduna dönüştürülmez.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, color: Colors.black87),
                    ),
                  ],
                ),
              )
            else if (isContentEmpty)
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'QR koda dönüştürülecek içerik boş.',
                  style: TextStyle(color: Colors.grey),
                ),
              )
            else if (isContentTooLarge)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.red.shade300),
                ),
                child: Text(
                  'İçerik boyutu QR kod için çok büyük (${contentToEncode.length} karakter, maksimum 2048 karakter desteklenir).',
                  style: const TextStyle(color: Colors.red, fontSize: 13),
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
                  border: Border.all(color: Colors.grey.shade300),
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
                        'QR kod oluşturulamadı: $err',
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.red, fontSize: 11),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'İçerik (${contentToEncode.length} Karakter):',
                      style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black54),
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
              const Text(
                'Sadece kullanıcı isteğiyle açılır. Otomatik işlem yürütülmez.',
                style: TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ],
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Kapat'),
        ),
      ],
    );
  }
}
