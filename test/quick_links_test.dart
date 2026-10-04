import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/domain/ndef_record.dart';
import 'package:nfc_tag_master/domain/quick_links.dart';

void main() {
  group('QuickLinkBuilder', () {
    test('accepts custom schemes and rejects bare text', () {
      expect(QuickLinkBuilder.isValidUri('spotify:track:abc'), isTrue);
      expect(QuickLinkBuilder.isValidUri('myapp://page'), isTrue);
      expect(QuickLinkBuilder.isValidUri('https://example.com'), isTrue);
      expect(QuickLinkBuilder.isValidUri('https://'), isFalse);
      expect(QuickLinkBuilder.isValidUri('merhaba dünya'), isFalse);
    });

    test('builds social profile links', () {
      expect(QuickLinkBuilder.socialUrl(SocialNetwork.instagram, '@ali'),
          'https://www.instagram.com/ali');
      expect(QuickLinkBuilder.socialUrl(SocialNetwork.tiktok, 'ali'),
          'https://www.tiktok.com/@ali');
      expect(QuickLinkBuilder.socialUrl(SocialNetwork.whatsapp, '+90 555 111 22 33'),
          'https://wa.me/905551112233');
      expect(() => QuickLinkBuilder.socialUrl(SocialNetwork.x, ''),
          throwsA(isA<QuickLinkException>()));
      expect(() => QuickLinkBuilder.socialUrl(SocialNetwork.x, 'a b'),
          throwsA(isA<QuickLinkException>()));
    });

    test('builds video, search, address and FaceTime links', () {
      expect(QuickLinkBuilder.videoUrl('dQw4w9WgXcQ'),
          'https://www.youtube.com/watch?v=dQw4w9WgXcQ');
      expect(QuickLinkBuilder.videoUrl('https://vimeo.com/1'), 'https://vimeo.com/1');
      expect(QuickLinkBuilder.searchUrl(SearchEngine.google, 'hava durumu'),
          'https://www.google.com/search?q=hava+durumu');
      expect(QuickLinkBuilder.addressUrl(MapProvider.apple, 'Kadıköy'),
          startsWith('https://maps.apple.com/?q=Kad'));
      expect(QuickLinkBuilder.facetimeUri('+90 555 111 2233', audioOnly: false),
          'facetime:+905551112233');
      expect(QuickLinkBuilder.facetimeUri('ad@icloud.com', audioOnly: true),
          'facetime-audio:ad@icloud.com');
      expect(() => QuickLinkBuilder.facetimeUri('abc', audioOnly: false),
          throwsA(isA<QuickLinkException>()));
    });

    test('adds https to file and payment links', () {
      expect(QuickLinkBuilder.httpsUrl('paypal.me/ali', emptyMessage: 'x'),
          'https://paypal.me/ali');
      expect(() => QuickLinkBuilder.httpsUrl('https://', emptyMessage: 'x'),
          throwsA(isA<QuickLinkException>()));
      expect(() => QuickLinkBuilder.httpsUrl('ftp://a.com/f', emptyMessage: 'x'),
          throwsA(isA<QuickLinkException>()));
    });

    test('custom URI round-trips through the URI record codec', () {
      final record = NdefCodec.encodeUri('facetime-audio:ad@icloud.com');
      expect(NdefCodec.decodeUri(record), 'facetime-audio:ad@icloud.com');
    });

    test('encodes Android Application Record', () {
      final record = QuickLinkBuilder.androidAppRecord('com.whatsapp');
      expect(record.tnf, NdefTnf.external);
      expect(ascii.decode(record.type), 'android.com:pkg');
      expect(ascii.decode(record.payload), 'com.whatsapp');
      expect(() => QuickLinkBuilder.androidAppRecord('whatsapp'),
          throwsA(isA<QuickLinkException>()));
    });

    test('encodes Bluetooth OOB record with little-endian address', () {
      final record = QuickLinkBuilder.bluetoothRecord('00:11:22:AA:BB:CC', deviceName: 'Hp');
      expect(record.tnf, NdefTnf.media);
      expect(ascii.decode(record.type), QuickLinkBuilder.bluetoothOobMime);
      final p = record.payload;
      expect(p[0] | (p[1] << 8), p.length);
      expect(p.sublist(2, 8), [0xCC, 0xBB, 0xAA, 0x22, 0x11, 0x00]);
      expect(p.sublist(8), [3, 0x09, 0x48, 0x70]);
      expect(() => QuickLinkBuilder.bluetoothRecord('00:11'),
          throwsA(isA<QuickLinkException>()));
    });
  });
}
