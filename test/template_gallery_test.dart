import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/domain/ndef_record.dart';
import 'package:nfc_tag_master/domain/quick_links.dart';
import 'package:nfc_tag_master/domain/template_gallery.dart';

void main() {
  GalleryPreset preset(String id) => TemplateGallery.byId(id)!;

  test('preset ids are unique', () {
    final ids = TemplateGallery.presets.map((p) => p.id).toList();
    expect(ids.toSet().length, ids.length);
  });

  test('every preset builds records from its hints', () {
    for (final p in TemplateGallery.presets) {
      final values = {
        for (final f in p.fields)
          f.key: f.kind == GalleryFieldKind.password
              ? 'sifre1234'
              : f.key == 'link'
                  ? 'ChIJN1t_tDeuEmsRUsoyG83frY4'
                  : f.kind == GalleryFieldKind.url
                      ? 'https://example.com'
                      : f.hint.split(' veya ').first,
      };
      final records = p.create(values);
      expect(records, isNotEmpty, reason: p.id);
    }
  });

  test('required fields are enforced', () {
    expect(() => preset('guest_wifi').create({'ssid': ''}), throwsA(isA<QuickLinkException>()));
  });

  test('business card builds a vCard with the split name', () {
    final r = preset('business_card').create({'name': 'Ayşe Nur Yılmaz', 'phone': '+90 555'}).single;
    final card = NdefCodec.decodeVCard(r)!;
    expect(card.values.join(' '), contains('Yılmaz'));
  });

  test('guest Wi-Fi validates password length and allows open networks', () {
    expect(() => preset('guest_wifi').create({'ssid': 'Ev', 'password': '123'}),
        throwsA(isA<QuickLinkException>()));
    final open = preset('guest_wifi').create({'ssid': 'Ev', 'password': ''}).single;
    expect(NdefCodec.decodeWifiWsc(open)?.ssid, 'Ev');
  });

  test('Google review accepts a place id or a link', () {
    final fromId = preset('google_review').create({'link': 'ChIJabc'}).single;
    expect(NdefCodec.decodeUri(fromId), 'https://search.google.com/local/writereview?placeid=ChIJabc');
    final fromLink = preset('google_review').create({'link': 'g.page/r/abc/review'}).single;
    expect(NdefCodec.decodeUri(fromLink), 'https://g.page/r/abc/review');
  });

  test('WhatsApp adds the encoded message', () {
    final r = preset('whatsapp').create({'phone': '+90 555 111 22 33', 'message': 'Merhaba dünya'}).single;
    expect(NdefCodec.decodeUri(r), 'https://wa.me/905551112233?text=Merhaba+d%C3%BCnya');
  });

  test('shortcut trigger writes the app deep link', () {
    expect(NdefCodec.decodeUri(preset('shortcut_trigger').create({}).single), 'nfctagmaster://scan');
  });
}
