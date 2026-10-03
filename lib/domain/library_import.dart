import 'csv_records.dart';
import 'ndef_record.dart';
import 'quick_links.dart';
import 'tag_library.dart';
import '../util/text_search.dart';

enum LibraryColumn { name, content, location, labels, note, uid, category }

class LibraryImportResult {
  final List<TagLibraryEntry> entries;

  /// Rows skipped because their UID is already in the library.
  final int duplicates;

  /// 1-based line numbers without a name.
  final List<int> invalidRows;

  const LibraryImportResult(this.entries, this.duplicates, this.invalidRows);
}

/// Bulk-creates library entries from a spreadsheet pasted as CSV.
///
/// With a header row, columns are matched by name (English/Turkish keys or
/// the app's own export headers passed in [headerAliases]); without one the
/// order is `name, content, location, labels, note, uid`.
class LibraryCsvImporter {
  static const int maxRows = 500;

  static const Map<String, LibraryColumn> _builtIn = {
    'name': LibraryColumn.name, 'ad': LibraryColumn.name, 'isim': LibraryColumn.name,
    'content': LibraryColumn.content, 'icerik': LibraryColumn.content, 'url': LibraryColumn.content,
    'link': LibraryColumn.content, 'text': LibraryColumn.content, 'metin': LibraryColumn.content,
    'location': LibraryColumn.location, 'konum': LibraryColumn.location, 'yer': LibraryColumn.location,
    'labels': LibraryColumn.labels, 'etiketler': LibraryColumn.labels, 'tags': LibraryColumn.labels,
    'note': LibraryColumn.note, 'not': LibraryColumn.note, 'notes': LibraryColumn.note,
    'uid': LibraryColumn.uid, 'id': LibraryColumn.uid,
    'category': LibraryColumn.category, 'kategori': LibraryColumn.category,
  };

  static const List<LibraryColumn> _defaultOrder = [
    LibraryColumn.name, LibraryColumn.content, LibraryColumn.location,
    LibraryColumn.labels, LibraryColumn.note, LibraryColumn.uid,
  ];

  static LibraryImportResult parse(
    String text, {
    required Iterable<TagLibraryEntry> existing,
    Map<String, LibraryColumn> headerAliases = const {},
    DateTime? now,
  }) {
    now ??= DateTime.now();
    final aliases = {
      ..._builtIn,
      for (final e in headerAliases.entries) TextSearch.fold(e.key.trim()): e.value,
    };
    final known = {
      for (final e in existing)
        if ((e.uid ?? '').isNotEmpty) e.uid!.toUpperCase(),
    };
    final lines = text.replaceAll('\r\n', '\n').replaceAll('\r', '\n').split('\n');
    List<LibraryColumn?> columns = _defaultOrder;
    final entries = <TagLibraryEntry>[];
    final invalid = <int>[];
    var duplicates = 0;
    var first = true;
    for (int i = 0; i < lines.length; i++) {
      final line = lines[i];
      if (line.trim().isEmpty || line.trimLeft().startsWith('#')) continue;
      // Spreadsheets copy cells tab-separated; then commas stay inside cells.
      final cells = (line.contains('\t') ? line.split('\t') : CsvRecordImporter.splitLine(line))
          .map((c) => c.trim())
          .toList();
      if (first) {
        first = false;
        final mapped = [for (final c in cells) aliases[TextSearch.fold(c)]];
        if (mapped.whereType<LibraryColumn>().contains(LibraryColumn.name)) {
          // Unknown header cells stay null so they never land in a column.
          columns = mapped;
          continue;
        }
      }
      if (entries.length >= maxRows) break;
      String cell(LibraryColumn col) {
        final idx = columns.indexOf(col);
        return idx >= 0 && idx < cells.length ? cells[idx] : '';
      }

      final name = cell(LibraryColumn.name);
      if (name.isEmpty) {
        invalid.add(i + 1);
        continue;
      }
      final uid = cell(LibraryColumn.uid).toUpperCase();
      if (uid.isNotEmpty && !known.add(uid)) {
        duplicates++;
        continue;
      }
      final content = cell(LibraryColumn.content);
      final category = TagCategory.values.where((c) => c.name == cell(LibraryColumn.category).toLowerCase());
      entries.add(TagLibraryEntry(
        id: '${now.microsecondsSinceEpoch}_${entries.length}',
        name: name,
        locationNote: cell(LibraryColumn.location),
        labels: TagLibraryEntry.parseLabels(cell(LibraryColumn.labels)),
        note: cell(LibraryColumn.note),
        uid: uid.isEmpty ? null : uid,
        category: category.isEmpty ? TagCategory.other : category.first,
        records: content.isEmpty ? const [] : [recordFor(content)],
        createdAt: now,
        updatedAt: now,
      ));
    }
    return LibraryImportResult(entries, duplicates, invalid);
  }

  /// A link (with scheme) becomes a URI record, anything else text.
  static NdefRecordModel recordFor(String content) {
    final looksLikeLink = RegExp(r'^[a-zA-Z][a-zA-Z0-9+.-]*:').hasMatch(content) &&
        !content.contains(' ') &&
        QuickLinkBuilder.isValidUri(content);
    return looksLikeLink ? NdefCodec.encodeUri(content) : NdefCodec.encodeText(content);
  }
}
