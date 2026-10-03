import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../l10n/app_localizations.dart';
import 'app_theme.dart';

/// Full-screen camera that returns the first QR code's text.
class QrScanPage extends StatefulWidget {
  /// Also read barcodes (EAN, UPC, Code 128…), not only QR codes.
  final bool allFormats;

  const QrScanPage({super.key, this.allFormats = false});

  static Future<String?> scan(BuildContext context) {
    return Navigator.of(context).push<String>(
      MaterialPageRoute(builder: (_) => const QrScanPage(), fullscreenDialog: true),
    );
  }

  /// Any QR code or barcode: returns (value, format name).
  static Future<(String, String)?> scanCode(BuildContext context) async {
    final raw = await Navigator.of(context).push<String>(
      MaterialPageRoute(builder: (_) => const QrScanPage(allFormats: true), fullscreenDialog: true),
    );
    if (raw == null) return null;
    final i = raw.indexOf('\u0000');
    return i < 0 ? (raw, 'QR') : (raw.substring(i + 1), raw.substring(0, i));
  }

  @override
  State<QrScanPage> createState() => _QrScanPageState();
}

class _QrScanPageState extends State<QrScanPage> {
  late final MobileScannerController _scanner = MobileScannerController(
    formats: widget.allFormats ? const [BarcodeFormat.all] : const [BarcodeFormat.qrCode],
  );
  bool _done = false;

  @override
  void dispose() {
    _scanner.dispose();
    super.dispose();
  }

  void _onDetect(BarcodeCapture capture) {
    if (_done) return;
    for (final barcode in capture.barcodes) {
      final value = barcode.rawValue;
      if (value != null && value.trim().isNotEmpty) {
        _done = true;
        // scanCode() splits "<format>\0<value>"; scan() wants the bare value.
        Navigator.of(context).pop(widget.allFormats ? '${_formatName(barcode.format)}\u0000$value' : value);
        return;
      }
    }
  }

  static String _formatName(BarcodeFormat f) => switch (f) {
        BarcodeFormat.qrCode => 'QR',
        BarcodeFormat.ean13 => 'EAN-13',
        BarcodeFormat.ean8 => 'EAN-8',
        BarcodeFormat.upcA => 'UPC-A',
        BarcodeFormat.upcE => 'UPC-E',
        BarcodeFormat.code128 => 'Code 128',
        BarcodeFormat.code39 => 'Code 39',
        BarcodeFormat.dataMatrix => 'Data Matrix',
        BarcodeFormat.pdf417 => 'PDF417',
        BarcodeFormat.aztec => 'Aztec',
        _ => f.name.toUpperCase(),
      };

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text(loc.qrScanTitle),
        actions: [
          IconButton(
            tooltip: loc.flashlight,
            icon: const Icon(Icons.flashlight_on_outlined),
            onPressed: () => _scanner.toggleTorch(),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          MobileScanner(
            controller: _scanner,
            onDetect: _onDetect,
            errorBuilder: (context, error) => Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Text(
                  loc.cameraError(error.errorCode.name),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          IgnorePointer(
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 3),
                borderRadius: BorderRadius.circular(28),
              ),
            ),
          ),
          Positioned(
            bottom: 48,
            left: 24,
            right: 24,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.92),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                loc.qrFrameInstructions,
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.ink),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
