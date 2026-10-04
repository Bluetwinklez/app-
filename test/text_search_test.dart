import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/util/text_search.dart';

void main() {
  test('Turkish I variants match each other', () {
    expect(TextSearch.contains('Kapının yanında', 'KAPI'), isTrue);
    expect(TextSearch.contains('İstanbul ofisi', 'istanbul'), isTrue);
    expect(TextSearch.contains('ISPARTA', 'ısparta'), isTrue);
    expect(TextSearch.contains('Mutfak', 'araba'), isFalse);
  });
}
