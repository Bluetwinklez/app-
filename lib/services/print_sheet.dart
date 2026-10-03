import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

/// One printable label: a QR code (optional), a title and a short line.
class PrintLabel {
  final String title;
  final String subtitle;
  final String? qrData;

  const PrintLabel({required this.title, this.subtitle = '', this.qrData});
}

/// Builds an A4 sheet of cut-out labels, three per row, so tags can be
/// marked with a matching sticker or a QR fallback for phones without NFC.
class PrintSheet {
  static const int columns = 3;
  static const int maxQrLength = 600;

  static Future<Uint8List> build(
    List<PrintLabel> labels, {
    required pw.Font font,
    String? heading,
  }) async {
    final doc = pw.Document();
    final theme = pw.ThemeData.withFont(base: font, bold: font);
    final cells = [
      for (final l in labels)
        pw.Container(
          height: 150,
          padding: const pw.EdgeInsets.all(8),
          decoration: pw.BoxDecoration(
            border: pw.Border.all(color: PdfColors.grey400, width: 0.5, style: pw.BorderStyle.dashed),
          ),
          child: pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              if (l.qrData != null && l.qrData!.isNotEmpty && l.qrData!.length <= maxQrLength)
                pw.BarcodeWidget(
                  barcode: pw.Barcode.qrCode(),
                  data: l.qrData!,
                  width: 80,
                  height: 80,
                  drawText: false,
                ),
              pw.SizedBox(height: 6),
              pw.Text(l.title,
                  maxLines: 2,
                  textAlign: pw.TextAlign.center,
                  style: const pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold)),
              if (l.subtitle.isNotEmpty)
                pw.Text(l.subtitle,
                    maxLines: 2,
                    textAlign: pw.TextAlign.center,
                    style: const pw.TextStyle(fontSize: 7, color: PdfColors.grey700)),
            ],
          ),
        ),
    ];
    final rows = <pw.TableRow>[];
    for (int i = 0; i < cells.length; i += columns) {
      final row = cells.sublist(i, (i + columns).clamp(0, cells.length));
      while (row.length < columns) {
        row.add(pw.Container());
      }
      rows.add(pw.TableRow(children: row));
    }
    doc.addPage(pw.MultiPage(
      theme: theme,
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.all(24),
      header: heading == null
          ? null
          : (_) => pw.Padding(
                padding: const pw.EdgeInsets.only(bottom: 8),
                child: pw.Text(heading, style: const pw.TextStyle(fontSize: 12)),
              ),
      build: (_) => [pw.Table(children: rows)],
    ));
    return doc.save();
  }
}
