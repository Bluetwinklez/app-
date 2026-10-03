/// Text helpers for case-insensitive search that respect Turkish letters.
class TextSearch {
  /// Lowercases and treats Turkish I/ı/İ/i as the same letter, so "KAPI"
  /// finds "kapı" and "istanbul" finds "İstanbul".
  static String fold(String value) {
    return value
        .replaceAll('İ', 'i')
        .replaceAll('I', 'i')
        .toLowerCase()
        .replaceAll('ı', 'i')
        .replaceAll('i̇', 'i');
  }

  /// True when [haystack] contains [query] after folding both.
  static bool contains(String haystack, String query) => fold(haystack).contains(fold(query));
}
