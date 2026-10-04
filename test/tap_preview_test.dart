import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/domain/ndef_record.dart';
import 'package:nfc_tag_master/domain/tap_preview.dart';

void main() {
  test('empty tag does nothing', () {
    expect(TapPreview.of(const []).action, TapAction.none);
  });

  test('first record decides, later ones are counted as ignored', () {
    final p = TapPreview.of([
      NdefCodec.encodeUri('https://example.com'),
      NdefCodec.encodeText('not used'),
    ]);
    expect(p.action, TapAction.openUrl);
    expect(p.target, 'https://example.com');
    expect(p.ignoredRecords, 1);
  });

  test('maps URI schemes to system actions', () {
    expect(TapPreview.of([NdefCodec.encodePhone('+905551112233')]).action, TapAction.call);
    expect(TapPreview.of([NdefCodec.encodeSms(phoneNumber: '+1555', message: 'hi')]).target, '+1555');
    expect(TapPreview.of([NdefCodec.encodeEmail(recipient: 'a@b.co')]).action, TapAction.email);
    expect(TapPreview.of([NdefCodec.encodeLocation(latitude: 41, longitude: 29)]).action, TapAction.map);
    final app = TapPreview.of([NdefCodec.encodeUri('shortcuts://run-shortcut?name=X')]);
    expect(app.action, TapAction.openApp);
    expect(app.target, 'shortcuts');
  });

  test('content the system does not act on', () {
    expect(TapPreview.of([NdefCodec.encodeText('hi')]).action, TapAction.text);
    expect(TapPreview.of([NdefCodec.encodeVCard(formattedName: 'A')]).action, TapAction.contact);
    expect(
      TapPreview.of([NdefCodec.encodeSmartPoster(uri: 'https://x.io', title: 'X')]).action,
      TapAction.openUrl,
    );
  });
}
