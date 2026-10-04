import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/domain/ndef_record.dart';
import 'package:nfc_tag_master/domain/nfc_tag_info.dart';
import 'package:nfc_tag_master/domain/tag_compare.dart';

void main() {
  NfcTagInfo tag(String uid, List<NdefRecordModel> records) => NfcTagInfo(identifier: uid, records: records);

  test('identical content on different tags', () {
    final r = [NdefCodec.encodeUri('https://a.com'), NdefCodec.encodeText('Merhaba')];
    final c = TagComparison.compare(tag('04:01', r), tag('04:02', List.of(r)));
    expect(c.contentIdentical, isTrue);
    expect(c.sameUid, isFalse);
  });

  test('changed, missing and extra records are reported', () {
    final c = TagComparison.compare(
      tag('04:01', [NdefCodec.encodeUri('https://a.com'), NdefCodec.encodeText('x')]),
      tag('04:01', [NdefCodec.encodeUri('https://b.com')]),
    );
    expect(c.contentIdentical, isFalse);
    expect(c.sameUid, isTrue);
    expect(c.records.map((d) => d.status), [RecordDiffStatus.changed, RecordDiffStatus.onlyFirst]);

    final extra = TagComparison.compare(tag('a', const []), tag('b', [NdefCodec.encodeText('y')]));
    expect(extra.records.single.status, RecordDiffStatus.onlySecond);
  });
}
