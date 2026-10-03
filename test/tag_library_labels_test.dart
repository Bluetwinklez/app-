import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/domain/csv_export.dart';
import 'package:nfc_tag_master/domain/tag_library.dart';

void main() {
  TagLibraryEntry entry(String name, List<String> labels) => TagLibraryEntry(
        id: name,
        name: name,
        labels: labels,
        createdAt: DateTime(2026),
        updatedAt: DateTime(2026),
      );

  test('parseLabels trims, de-duplicates ignoring case and caps', () {
    expect(TagLibraryEntry.parseLabels(' Ofis , 2. kat,ofis,, İç  mekan '),
        ['Ofis', '2. kat', 'İç mekan']);
    final many = List.generate(20, (i) => 'l$i').join(',');
    expect(TagLibraryEntry.parseLabels(many), hasLength(TagLibraryEntry.maxLabels));
    expect(TagLibraryEntry.parseLabels('x' * 50).single.length, TagLibraryEntry.maxLabelLength);
  });

  test('labels survive JSON and are searchable', () {
    final e = entry('Kapı', ['Ev', 'Giriş']);
    final back = TagLibraryEntry.fromJsonMap(e.toJsonMap());
    expect(back.labels, ['Ev', 'Giriş']);
    expect(back.matches('giriş'), isTrue);
    expect(back.hasLabel('EV'), isTrue);
    expect(TagLibraryEntry.fromJsonMap(entry('a', []).toJsonMap()).labels, isEmpty);
  });

  test('allLabels merges entries case-insensitively', () {
    expect(
      TagLibraryEntry.allLabels([entry('a', ['Work', 'home']), entry('b', ['work'])]),
      ['home', 'Work'],
    );
  });

  test('library CSV includes labels', () {
    final csv = CsvExport.library([entry('a', ['x', 'y'])], header: ['n', 'c', 'l', 'lb', 'no', 'u', 'ct', 't']);
    expect(csv, contains('"x, y"'));
  });
}
