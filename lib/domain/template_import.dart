import 'csv_records.dart';
import 'quick_links.dart';
import 'storage_models.dart';

class TemplateImportResult {
  final List<WriteTemplate> templates;

  /// "line: reason" for rows that were skipped.
  final List<String> errors;

  const TemplateImportResult(this.templates, this.errors);
}

/// Bulk-creates write templates from pasted rows:
/// `name, type, value[, extra]` (e.g. `Ofis Wi-Fi, wifi, Ofis, sifre1234`).
/// Rows with the same name are combined into one multi-record template.
class TemplateCsvImporter {
  static const int maxTemplates = 200;

  static TemplateImportResult parse(String text, {DateTime? now}) {
    now ??= DateTime.now();
    final byName = <String, List<dynamic>>{};
    final order = <String>[];
    final errors = <String>[];
    final lines = text.replaceAll('\r\n', '\n').replaceAll('\r', '\n').split('\n');
    for (int i = 0; i < lines.length; i++) {
      final line = lines[i];
      if (line.trim().isEmpty || line.trimLeft().startsWith('#')) continue;
      final cells = (line.contains('\t') ? line.split('\t') : CsvRecordImporter.splitLine(line))
          .map((c) => c.trim())
          .toList();
      if (i == 0 && cells.isNotEmpty && const {'name', 'ad', 'isim'}.contains(cells.first.toLowerCase())) continue;
      if (cells.length < 3 || cells[0].isEmpty || cells[2].isEmpty) {
        errors.add('${i + 1}');
        continue;
      }
      try {
        final record = CsvRecordImporter.buildRecord(cells[1], cells[2], cells.length > 3 ? cells[3] : '');
        final name = cells[0];
        if (!byName.containsKey(name)) {
          if (order.length >= maxTemplates) break;
          order.add(name);
          byName[name] = [];
        }
        byName[name]!.add(record);
      } on FormatException catch (e) {
        errors.add('${i + 1}: ${e.message}');
      } on QuickLinkException catch (e) {
        errors.add('${i + 1}: ${e.message}');
      }
    }
    return TemplateImportResult([
      for (int k = 0; k < order.length; k++)
        WriteTemplate(
          id: 'tplcsv_${now.microsecondsSinceEpoch}_$k',
          name: order[k],
          createdAt: now,
          records: List.from(byName[order[k]]!),
        ),
    ], errors);
  }
}
