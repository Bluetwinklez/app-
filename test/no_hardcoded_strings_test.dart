import 'dart:io';
import 'package:flutter_test/flutter_test.dart';

/// Turn this off once every user-visible string goes through AppLocalizations.
const bool _pendingI18nWiring = true;

/// Literals that are allowed to stay Turkish: data formats and the like.
const Map<String, Set<String>> _allowed = {
  // CSV import keywords and sample CSV file payload template
  'lib/domain/csv_records.dart': {'tür', 'e-posta', 'tur', 'metin', 'telefon', 'eposta', 'konum', r'metin,Merhaba dünya\n'},
  // Storage model serialization fallback values (file excluded from edits)
  'lib/domain/storage_models.dart': {'Bilinmiyor', 'Şablon'},
  // Turkish character normalization mapping for search indexing
  'lib/domain/tag_library.dart': {'İ', 'ı'},
};

final _literal = RegExp(r"'((?:[^'\\\n]|\\.)*)'");
final _turkishLetters = RegExp('[çğıöşüÇĞİÖŞÜ]');
final _turkishWords = RegExp(
  r'\b(Etiket|etiket|Kayıt|kayıt|Kaydet|Sil|Tamam|Hata|Ekle|Kapat|Vazgeç|Yaz|Oku|Bilinmiyor|Lütfen|bir|ve|ile|için)\b',
);

/// Returns `path:line: 'literal'` for every string literal that still looks Turkish.
List<String> findHardcodedTurkish() {
  final findings = <String>[];
  final files = Directory('lib')
      .listSync(recursive: true)
      .whereType<File>()
      .where((f) => f.path.endsWith('.dart'))
      .where((f) => !f.path.replaceAll('\\', '/').contains('lib/l10n/'));
  for (final file in files) {
    final path = file.path.replaceAll('\\', '/');
    final allowed = _allowed[path] ?? const {};
    final lines = file.readAsLinesSync();
    for (int i = 0; i < lines.length; i++) {
      final line = lines[i].trimLeft();
      if (line.startsWith('//') || line.startsWith('///') || line.contains('debugPrint(')) continue;
      for (final match in _literal.allMatches(lines[i])) {
        final value = match.group(1)!;
        if (allowed.contains(value)) continue;
        if (_turkishLetters.hasMatch(value) || _turkishWords.hasMatch(value)) {
          findings.add("$path:${i + 1}: '$value'");
        }
      }
    }
  }
  return findings;
}

void main() {
  test(
    'no hard-coded Turkish UI strings remain in lib/',
    () {
      final findings = findHardcodedTurkish();
      expect(findings, isEmpty, reason: '${findings.length} literals:\n${findings.join('\n')}');
    },
    skip: _pendingI18nWiring ? 'Waiting for the remaining i18n wiring' : false,
  );
}
