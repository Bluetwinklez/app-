import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/domain/content_category.dart';
import 'package:nfc_tag_master/domain/ndef_record.dart';
import 'package:nfc_tag_master/domain/storage_models.dart';

void main() {
  test('categories by first record', () {
    ContentCategory c(NdefRecordModel r) => ContentCategories.of([r]);
    expect(c(NdefCodec.encodeUri('https://www.instagram.com/x')), ContentCategory.social);
    expect(c(NdefCodec.encodeUri('https://example.com')), ContentCategory.webText);
    expect(c(NdefCodec.encodeText('hi')), ContentCategory.webText);
    expect(c(NdefCodec.encodePhone('+90555')), ContentCategory.contact);
    expect(c(NdefCodec.encodeLocation(latitude: 1, longitude: 2)), ContentCategory.network);
    expect(ContentCategories.of(const []), ContentCategory.empty);
  });

  test('scan stats per day, top tags and categories', () {
    final now = DateTime(2026, 6, 10, 12);
    ScanHistoryEntry h(String uid, int daysAgo, NdefRecordModel r) => ScanHistoryEntry(
          id: '$uid$daysAgo',
          timestamp: now.subtract(Duration(days: daysAgo)),
          identifier: uid,
          standardTechnologies: const [],
          isNdefSupported: true,
          isWritable: true,
          maxByteCapacity: 0,
          currentBytesUsed: 0,
          records: [r],
        );
    final s = ScanStats.from([
      h('A', 0, NdefCodec.encodeText('x')),
      h('A', 0, NdefCodec.encodeText('x')),
      h('B', 1, NdefCodec.encodePhone('1')),
      h('A', 20, NdefCodec.encodeText('x')),
    ], now: now);
    expect(s.total, 4);
    expect(s.uniqueTags, 2);
    expect(s.perDay.last, 2);
    expect(s.perDay[s.perDay.length - 2], 1);
    expect(s.perDay.reduce((a, b) => a + b), 3, reason: 'the 20-day-old scan is outside the window');
    expect(s.topTags.first, ('A', 3));
    expect(s.byCategory[ContentCategory.contact], 1);
  });
}
