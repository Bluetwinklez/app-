import 'dart:io';
import 'package:flutter_test/flutter_test.dart';

/// Turn this off once every user-visible string goes through AppLocalizations.
const bool _pendingI18nWiring = false;

/// Literals that are allowed to stay Turkish: data formats and the like.
const Map<String, Set<String>> _allowed = {
  // CSV import keywords and sample CSV file payload template
  'lib/domain/csv_records.dart': {'tür', 'e-posta', 'tur', 'metin', 'telefon', 'eposta', 'konum', r'metin,Merhaba dünya\n', r'sms,+905551112233,Mesaj\n', r'telefon,+905551112233\n'},
  // Storage model serialization fallback values (file excluded from edits)
  'lib/domain/storage_models.dart': {'Bilinmiyor', 'Şablon'},
  // Turkish spellings of write-time placeholders (data, not UI text)
  'lib/domain/template_variables.dart': {'{sayaç}'},
  // Turkish character normalization mapping for search indexing
  'lib/util/text_search.dart': {'İ', 'ı'},
};

final _literal = RegExp(r"'((?:[^'\\\n]|\\.)*)'");
final _turkishLetters = RegExp('[çğıöşüÇĞİÖŞÜ]');
final _turkishWords = RegExp(
  r'\b(Etiket|etiket|Etiketi|Kayıt|kayıt|Kaydet|Sil|Tamam|Hata|Ekle|Kapat|Vazgeç|Yaz|Oku|Okunuyor|Tara|Bilinmiyor|Lütfen|bir|ve|ile|için|'
  r'Toplam|Kapasite|Bayt|bayt|Ham|bellek|Boyut|Seri|Evet|Hayır|Kimlik|Teknolojiler|Var|Yok|Dil|Kaynak|Hedef|Panoya|Kopyala|'
  r'Temizle|Geri|Besteyi|Mesaj|Yer|Konum|Metin|Kural|Hazır|Not|Mevcut|Riskli|veya|adresi|Adresi|Sitesi|Enlem|Boylam|Sunucu|'
  r'Salt|Okunur|Yinele|Bulunan|Aktar|Haritalar|telefon|Kilit|Veri|Sayfa|Kurum|sonunda|eksik|Destekleniyor|cihazda|'
  r'Ad|Soyad|Unvan|karakter|En az|Kaydedilemedi|Kaydedildi|ornek|alanadi|sirket|Interneti|Ayarlar|Araçlar|Geçmiş|Şablon|'
  r'Ara|Arama|Seç|Seçin|Başlat|Durdur|Devam|İptal|Bitti|Gönder|Paylaş|Dosya|Yedek|Uyarı|Bilgi|Başarılı|Başarısız)\b',
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
