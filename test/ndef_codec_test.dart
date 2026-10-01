import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/domain/ndef_record.dart';

void main() {
  group('NDEF Text Record Encoding/Decoding Tests', () {
    test('Encodes and decodes standard Turkish text record', () {
      const originalText = 'Merhaba Dünya! NFC Test Mesajı: çğıöşü ÇĞİÖŞÜ';
      final record = NdefCodec.encodeText(originalText, langCode: 'tr');

      expect(record.tnf, equals(NdefTnf.wellKnown));
      expect(record.type, equals(NdefCodec.rtdText));

      final decoded = NdefCodec.decodeText(record);
      expect(decoded, equals(originalText));
    });

    test('Encodes and decodes empty text', () {
      final record = NdefCodec.encodeText('', langCode: 'tr');
      final decoded = NdefCodec.decodeText(record);
      expect(decoded, equals(''));
    });
  });

  group('NDEF URI Record Encoding/Decoding Tests', () {
    test('Encodes https:// with standard prefix compression', () {
      const url = 'https://antigravity.google.com/test';
      final record = NdefCodec.encodeUri(url);

      expect(record.tnf, equals(NdefTnf.wellKnown));
      expect(record.type, equals(NdefCodec.rtdUri));
      // In NFC Forum RTD URI, 'https://' corresponds to prefix code 0x04
      expect(record.payload[0], equals(0x04));

      final decoded = NdefCodec.decodeUri(record);
      expect(decoded, equals(url));
    });

    test('Encodes https://www. with prefix code 0x02', () {
      const url = 'https://www.flutter.dev';
      final record = NdefCodec.encodeUri(url);

      expect(record.payload[0], equals(0x02));
      final decoded = NdefCodec.decodeUri(record);
      expect(decoded, equals(url));
    });

    test('Encodes and parses email (mailto:)', () {
      final record = NdefCodec.encodeEmail(
        recipient: 'destek@sirket.com',
        subject: 'NFC Bilgi',
        body: 'Merhaba yetkili',
      );

      final parsed = NdefCodec.parseRecord(record);
      expect(parsed.type, equals(ParsedRecordType.email));
      expect(parsed.content, equals('destek@sirket.com'));
      expect(parsed.extra['subject'], equals('NFC Bilgi'));
      expect(parsed.extra['body'], equals('Merhaba yetkili'));
    });

    test('Encodes and parses phone number (tel:)', () {
      final record = NdefCodec.encodePhone('+90 555 123 4567');
      final parsed = NdefCodec.parseRecord(record);

      expect(parsed.type, equals(ParsedRecordType.phone));
      expect(parsed.content, equals('+905551234567'));
    });

    test('Encodes and parses SMS (sms:)', () {
      final record = NdefCodec.encodeSms(
        phoneNumber: '+90 532 999 8877',
        message: 'Geliyorum',
      );
      final parsed = NdefCodec.parseRecord(record);

      expect(parsed.type, equals(ParsedRecordType.sms));
      expect(parsed.content, equals('+905329998877'));
      expect(parsed.extra['message'], equals('Geliyorum'));
    });

    test('Encodes and parses Location (geo:)', () {
      final record = NdefCodec.encodeLocation(latitude: 41.0082, longitude: 28.9784);
      final parsed = NdefCodec.parseRecord(record);

      expect(parsed.type, equals(ParsedRecordType.location));
      expect(parsed.extra['latitude'], equals('41.0082'));
      expect(parsed.extra['longitude'], equals('28.9784'));
    });
  });

  group('NDEF Binary Serialization and Deserialization', () {
    test('Serializes and deserializes a single short record', () {
      final textRecord = NdefCodec.encodeText('Tek Kayıt Testi');
      final bytes = textRecord.toBytes(isFirst: true, isLast: true);

      final parsedList = NdefRecordModel.parseAll(bytes);
      expect(parsedList.length, equals(1));
      expect(NdefCodec.decodeText(parsedList[0]), equals('Tek Kayıt Testi'));
    });

    test('Serializes and parses multi-record message (Text + URL + SMS)', () {
      final textRec = NdefCodec.encodeText('Birinci Kayıt');
      final urlRec = NdefCodec.encodeUri('https://flutter.dev');
      final smsRec = NdefCodec.encodeSms(phoneNumber: '+905551112233', message: 'Selam');

      final rawMessage = encodeNdefMessage([textRec, urlRec, smsRec]);
      expect(rawMessage.isNotEmpty, isTrue);

      final records = NdefRecordModel.parseAll(rawMessage);
      expect(records.length, equals(3));

      expect(NdefCodec.decodeText(records[0]), equals('Birinci Kayıt'));
      expect(NdefCodec.decodeUri(records[1]), equals('https://flutter.dev'));
      final parsedSms = NdefCodec.parseRecord(records[2]);
      expect(parsedSms.type, equals(ParsedRecordType.sms));
      expect(parsedSms.content, equals('+905551112233'));
      expect(parsedSms.extra['message'], equals('Selam'));
    });

    test('Rejects truncated NDEF messages instead of silently returning records', () {
      final bytes = NdefCodec.encodeText('Merhaba').toBytes();
      expect(
        () => NdefRecordModel.parseAll(bytes.sublist(0, bytes.length - 1)),
        throwsFormatException,
      );
    });

    test('Decodes UTF-16 text with a big-endian byte order mark', () {
      final record = NdefRecordModel(
        tnf: NdefTnf.wellKnown,
        type: NdefCodec.rtdText,
        id: Uint8List(0),
        payload: Uint8List.fromList([0x82, 0x65, 0x6e, 0xfe, 0xff, 0x00, 0x41]),
      );
      expect(NdefCodec.decodeText(record), 'A');
    });
  });

  group('vCard 3.0 MIME Encoding & Robust Parsing', () {
    test('Encodes and parses full vCard 3.0 with CRLF and escaping', () {
      final record = NdefCodec.encodeVCard(
        formattedName: 'Can Yılmaz',
        firstName: 'Can',
        lastName: 'Yılmaz',
        organization: 'Acme Corp; Ar-Ge Departmanı, Bölüm 3',
        title: 'Kıdemli \\ Baş Mühendis',
        phone: '+90 555 123 4567',
        email: 'can.yilmaz@example.com',
        url: 'https://example.com/can',
        note: 'Önemli not:\nSatır 2, virgül ve; noktalı virgül içerir.',
      );

      expect(record.tnf, equals(NdefTnf.media));
      expect(ascii.decode(record.type), equals('text/vcard'));

      final payloadStr = utf8.decode(record.payload);
      expect(payloadStr.contains('\r\n'), isTrue);
      expect(payloadStr.contains('BEGIN:VCARD\r\nVERSION:3.0\r\n'), isTrue);
      expect(payloadStr.contains(r'ORG:Acme Corp\; Ar-Ge Departmanı\, Bölüm 3'), isTrue);
      expect(payloadStr.contains(r'TITLE:Kıdemli \\ Baş Mühendis'), isTrue);
      expect(payloadStr.contains(r'NOTE:Önemli not:\nSatır 2\, virgül ve\; noktalı virgül içerir.'), isTrue);

      // Decode and check unescaping
      final decoded = NdefCodec.decodeVCard(record);
      expect(decoded, isNotNull);
      expect(decoded!['fn'], equals('Can Yılmaz'));
      expect(decoded['lastName'], equals('Yılmaz'));
      expect(decoded['firstName'], equals('Can'));
      expect(decoded['org'], equals('Acme Corp; Ar-Ge Departmanı, Bölüm 3'));
      expect(decoded['title'], equals('Kıdemli \\ Baş Mühendis'));
      expect(decoded['tel'], equals('+90 555 123 4567'));
      expect(decoded['email'], equals('can.yilmaz@example.com'));
      expect(decoded['url'], equals('https://example.com/can'));
      expect(decoded['note'], equals('Önemli not:\nSatır 2, virgül ve; noktalı virgül içerir.'));

      // High-level parseRecord preview
      final parsed = NdefCodec.parseRecord(record);
      expect(parsed.type, equals(ParsedRecordType.vcard));
      expect(parsed.title, equals('Kişi Kartı (vCard)'));
      expect(parsed.content.contains('Can Yılmaz'), isTrue);
      expect(parsed.content.contains('Tel: +90 555 123 4567'), isTrue);
    });

    test('vCard RFC 2425 line unfolding test', () {
      const foldedVCard = 'BEGIN:VCARD\r\n'
          'VERSION:3.0\r\n'
          'FN:Ahmet \r\n'
          ' Demir\r\n'
          'NOTE:Bu cok uzun bir \r\n'
          '\taciklama metnidir.\r\n'
          'END:VCARD\r\n';

      final record = NdefRecordModel(
        tnf: NdefTnf.media,
        type: Uint8List.fromList(ascii.encode('text/vcard')),
        id: Uint8List(0),
        payload: Uint8List.fromList(utf8.encode(foldedVCard)),
      );

      final decoded = NdefCodec.decodeVCard(record);
      expect(decoded, isNotNull);
      expect(decoded!['fn'], equals('Ahmet Demir'));
      expect(decoded['note'], equals('Bu cok uzun bir aciklama metnidir.'));
    });

    test('Handles malformed or non-vcard media records gracefully', () {
      final nonVcard = NdefRecordModel(
        tnf: NdefTnf.media,
        type: Uint8List.fromList(ascii.encode('image/png')),
        id: Uint8List(0),
        payload: Uint8List.fromList([1, 2, 3]),
      );
      expect(NdefCodec.decodeVCard(nonVcard), isNull);
    });
  });

  group('Calendar Event MIME RFC 5545 iCalendar Encoding & Decoding', () {
    test('Encodes and parses iCalendar VEVENT with valid UTC DTSTART/DTEND and UID', () {
      final dtStart = DateTime.utc(2026, 10, 15, 9, 30, 0);
      final dtEnd = DateTime.utc(2026, 10, 15, 11, 0, 0);

      final record = NdefCodec.encodeCalendarEvent(
        summary: 'Yıllık Strateji Toplantısı; Bölüm: A, B & C',
        dtStart: dtStart,
        dtEnd: dtEnd,
        location: 'Merkez Ofis, Kat: 4 \\ Salon 1',
        description: 'Gündem:\n1. Bütçe Planı\n2. İlerleme Raporu',
        uid: 'test-event-uuid-2026@nfctagmaster.app',
      );

      expect(record.tnf, equals(NdefTnf.media));
      expect(ascii.decode(record.type), equals('text/calendar'));

      final payloadStr = utf8.decode(record.payload);
      expect(payloadStr.contains('BEGIN:VCALENDAR\r\nVERSION:2.0\r\n'), isTrue);
      expect(payloadStr.contains('BEGIN:VEVENT\r\n'), isTrue);
      expect(payloadStr.contains('UID:test-event-uuid-2026@nfctagmaster.app\r\n'), isTrue);
      expect(payloadStr.contains('DTSTART:20261015T093000Z\r\n'), isTrue);
      expect(payloadStr.contains('DTEND:20261015T110000Z\r\n'), isTrue);
      expect(payloadStr.contains(r'SUMMARY:Yıllık Strateji Toplantısı\; Bölüm: A\, B & C'), isTrue);
      expect(payloadStr.contains(r'LOCATION:Merkez Ofis\, Kat: 4 \\ Salon 1'), isTrue);
      expect(payloadStr.contains(r'DESCRIPTION:Gündem:\n1. Bütçe Planı\n2. İlerleme Raporu'), isTrue);

      final decoded = NdefCodec.decodeCalendarEvent(record);
      expect(decoded, isNotNull);
      expect(decoded!['uid'], equals('test-event-uuid-2026@nfctagmaster.app'));
      expect(decoded['summary'], equals('Yıllık Strateji Toplantısı; Bölüm: A, B & C'));
      expect(decoded['location'], equals('Merkez Ofis, Kat: 4 \\ Salon 1'));
      expect(decoded['description'], equals('Gündem:\n1. Bütçe Planı\n2. İlerleme Raporu'));
      expect(decoded['dtStart'], equals(dtStart));
      expect(decoded['dtEnd'], equals(dtEnd));

      final parsed = NdefCodec.parseRecord(record);
      expect(parsed.type, equals(ParsedRecordType.calendar));
      expect(parsed.title, equals('Takvim Etkinliği (iCal)'));
      expect(parsed.content.contains('Yıllık Strateji Toplantısı'), isTrue);
      expect(parsed.content.contains('20261015T093000Z'), isTrue);
    });

    test('Calendar date parser handles YYYYMMDDTHHMMSSZ and malformed dates safely', () {
      final valid = NdefValueFormatter.parseIcsDate('20260930T150000Z');
      expect(valid, equals(DateTime.utc(2026, 9, 30, 15, 0, 0)));

      final malformed = NdefValueFormatter.parseIcsDate('not-a-date');
      expect(malformed, isNull);

      final shortDate = NdefValueFormatter.parseIcsDate('20260930');
      expect(shortDate, equals(DateTime(2026, 9, 30)));
    });
  });

  group('NFC Forum Smart Poster (Sp) Nested NDEF Message Tests', () {
    test('Encodes and decodes Smart Poster containing nested Text and URI', () {
      final spRecord = NdefCodec.encodeSmartPoster(
        uri: 'https://flutter.dev/multi-platform/nfc',
        title: 'Flutter NFC Rehberi',
        lang: 'tr',
      );

      expect(spRecord.tnf, equals(NdefTnf.wellKnown));
      expect(spRecord.type, equals(NdefCodec.rtdSmartPoster));

      // Payload must be a valid serialized NDEF message
      final innerRecords = NdefRecordModel.parseAll(spRecord.payload);
      expect(innerRecords.length, equals(2)); // Text + URI
      expect(NdefCodec.decodeText(innerRecords[0]), equals('Flutter NFC Rehberi'));
      expect(NdefCodec.decodeUri(innerRecords[1]), equals('https://flutter.dev/multi-platform/nfc'));

      // Test decoding via decodeSmartPoster
      final decodedSp = NdefCodec.decodeSmartPoster(spRecord);
      expect(decodedSp, isNotNull);
      expect(decodedSp!.uri, equals('https://flutter.dev/multi-platform/nfc'));
      expect(decodedSp.title, equals('Flutter NFC Rehberi'));
      expect(decodedSp.lang, equals('tr'));

      // Test high level parsing
      final parsed = NdefCodec.parseRecord(spRecord);
      expect(parsed.type, equals(ParsedRecordType.smartPoster));
      expect(parsed.title, equals('Akıllı Poster (Smart Poster)'));
      expect(parsed.content.contains('Flutter NFC Rehberi'), isTrue);
      expect(parsed.content.contains('https://flutter.dev/multi-platform/nfc'), isTrue);
      expect(parsed.extra['nestedCount'], equals(2));
    });

    test('Encodes Smart Poster with URI only (no title)', () {
      final spRecord = NdefCodec.encodeSmartPoster(
        uri: 'https://example.com',
      );

      final decoded = NdefCodec.decodeSmartPoster(spRecord);
      expect(decoded, isNotNull);
      expect(decoded!.uri, equals('https://example.com'));
      expect(decoded.title, isNull);

      final parsed = NdefCodec.parseRecord(spRecord);
      expect(parsed.type, equals(ParsedRecordType.smartPoster));
      expect(parsed.content, equals('https://example.com'));
    });

    test('Handles malformed Smart Poster payload without crashing', () {
      final corruptSp = NdefRecordModel(
        tnf: NdefTnf.wellKnown,
        type: NdefCodec.rtdSmartPoster,
        id: Uint8List(0),
        payload: Uint8List.fromList([0xFF, 0xFF, 0x00]), // corrupt NDEF
      );

      expect(NdefCodec.decodeSmartPoster(corruptSp), isNull);
      final parsed = NdefCodec.parseRecord(corruptSp);
      expect(parsed.type, equals(ParsedRecordType.smartPoster));
      expect(parsed.title.contains('Geçersiz Yük'), isTrue);
    });
  });

  group('Custom MIME Record Tests', () {
    test('Encodes and parses UTF-8 text custom MIME record', () {
      const jsonContent = '{"status":"active","counter":42}';
      final record = NdefCodec.encodeCustomMime(
        mimeType: 'application/json',
        payload: Uint8List.fromList(utf8.encode(jsonContent)),
      );

      expect(record.tnf, equals(NdefTnf.media));
      expect(ascii.decode(record.type), equals('application/json'));
      expect(utf8.decode(record.payload), equals(jsonContent));

      final parsed = NdefCodec.parseRecord(record);
      expect(parsed.type, equals(ParsedRecordType.customMime));
      expect(parsed.content, equals(jsonContent));
      expect(parsed.extra['mimeType'], equals('application/json'));
    });

    test('Encodes and parses binary/hex custom MIME record preview', () {
      final binaryBytes = Uint8List.fromList([0xDE, 0xAD, 0xBE, 0xEF, 0x01, 0x02]);
      final record = NdefCodec.encodeCustomMime(
        mimeType: 'application/octet-stream',
        payload: binaryBytes,
      );

      final parsed = NdefCodec.parseRecord(record);
      expect(parsed.type, equals(ParsedRecordType.customMime));
      expect(parsed.content.toLowerCase().contains('de ad be ef'), isTrue);
      expect(parsed.extra['byteLength'], equals(6));
    });
  });

  group('Wi-Fi Configuration WSC TLV Credential Tests', () {
    test('Encodes and decodes WPA2-PSK AES Wi-Fi credential TLV structure', () {
      final wifiRecord = NdefCodec.encodeWifiWsc(
        ssid: 'Ofis_Misafir_Agi',
        authType: WifiAuthType.wpa2Psk,
        password: 'GizliSifre2026!',
        encryptionType: WifiEncryptionType.aes,
      );

      expect(wifiRecord.tnf, equals(NdefTnf.media));
      expect(ascii.decode(wifiRecord.type), equals('application/vnd.wfa.wsc'));

      // Decode WSC TLV payload
      final decoded = NdefCodec.decodeWifiWsc(wifiRecord);
      expect(decoded, isNotNull);
      expect(decoded!.ssid, equals('Ofis_Misafir_Agi'));
      expect(decoded.authType, equals(WifiAuthType.wpa2Psk));
      expect(decoded.password, equals('GizliSifre2026!'));
      expect(decoded.encryptionType, equals(WifiEncryptionType.aes));

      // Parse preview check
      final parsed = NdefCodec.parseRecord(wifiRecord);
      expect(parsed.type, equals(ParsedRecordType.wifi));
      expect(parsed.title, equals('Wi-Fi Yapılandırması (WSC)'));
      expect(parsed.content.contains('Ofis_Misafir_Agi'), isTrue);
      expect(parsed.content.contains('WPA2 Personal'), isTrue);
      // Password is masked in readable preview
      expect(parsed.content.contains('Şifre: **************'), isTrue);
      expect(parsed.extra['password'], equals('GizliSifre2026!'));
    });

    test('Encodes and decodes open (unencrypted) Wi-Fi', () {
      final openWifi = NdefCodec.encodeWifiWsc(
        ssid: 'Belediye_Ucretsiz_Wifi',
        authType: WifiAuthType.open,
        password: '',
        encryptionType: WifiEncryptionType.none,
      );

      final decoded = NdefCodec.decodeWifiWsc(openWifi);
      expect(decoded, isNotNull);
      expect(decoded!.ssid, equals('Belediye_Ucretsiz_Wifi'));
      expect(decoded.authType, equals(WifiAuthType.open));
      expect(decoded.password, isEmpty);

      final parsed = NdefCodec.parseRecord(openWifi);
      expect(parsed.content.contains('(Şifresiz)'), isTrue);
    });

    test('Handles malformed or truncated WSC payload safely', () {
      final corruptWsc = NdefRecordModel(
        tnf: NdefTnf.media,
        type: Uint8List.fromList(ascii.encode('application/vnd.wfa.wsc')),
        id: Uint8List(0),
        payload: Uint8List.fromList([0x10, 0x0E, 0x00, 0x20, 0x10, 0x45]), // truncated TLV
      );

      final decoded = NdefCodec.decodeWifiWsc(corruptWsc);
      expect(decoded, isNull);

      final parsed = NdefCodec.parseRecord(corruptWsc);
      expect(parsed.type, equals(ParsedRecordType.wifi));
      expect(parsed.content.contains('Bozuk'), isTrue);
    });
  });

  group('Lossless Binary Round-trip and Multi-type NDEF Message Tests', () {
    test('Full roundtrip: [Text, vCard, Calendar, SmartPoster, Wi-Fi, CustomMIME] serialization', () {
      final originalList = <NdefRecordModel>[
        NdefCodec.encodeText('Kayıt 1 - Metin'),
        NdefCodec.encodeVCard(
          formattedName: 'Zeynep Kaya',
          email: 'zeynep@example.com',
          phone: '+90 544 000 1122',
        ),
        NdefCodec.encodeCalendarEvent(
          summary: ' Lansman Toplantısı ',
          dtStart: DateTime.utc(2026, 11, 1, 14, 0),
          dtEnd: DateTime.utc(2026, 11, 1, 16, 0),
          location: 'Konferans Salonu',
        ),
        NdefCodec.encodeSmartPoster(
          uri: 'https://example.com/event',
          title: 'Etkinlik Sayfası',
        ),
        NdefCodec.encodeWifiWsc(
          ssid: 'TestNetwork',
          authType: WifiAuthType.wpa2Psk,
          password: 'Pass123456()',
        ),
        NdefCodec.encodeCustomMime(
          mimeType: 'application/x-custom-sensor',
          payload: Uint8List.fromList([0xAA, 0xBB, 0xCC, 0xDD]),
        ),
      ];

      final rawBytes = encodeNdefMessage(originalList);
      expect(rawBytes.isNotEmpty, isTrue);

      final parsedRecords = NdefRecordModel.parseAll(rawBytes);
      expect(parsedRecords.length, equals(originalList.length));

      for (int i = 0; i < originalList.length; i++) {
        final orig = originalList[i];
        final roundtrip = parsedRecords[i];

        expect(roundtrip.tnf, equals(orig.tnf));
        expect(roundtrip.type, equals(orig.type));
        expect(roundtrip.id, equals(orig.id));
        expect(roundtrip.payload, equals(orig.payload));
      }

      // Verify specific decoded content after roundtrip
      final vcardDecoded = NdefCodec.decodeVCard(parsedRecords[1]);
      expect(vcardDecoded?['fn'], equals('Zeynep Kaya'));
      expect(vcardDecoded?['email'], equals('zeynep@example.com'));

      final calDecoded = NdefCodec.decodeCalendarEvent(parsedRecords[2]);
      expect(calDecoded?['summary'], equals('Lansman Toplantısı'));

      final spDecoded = NdefCodec.decodeSmartPoster(parsedRecords[3]);
      expect(spDecoded?.title, equals('Etkinlik Sayfası'));
      expect(spDecoded?.uri, equals('https://example.com/event'));

      final wifiDecoded = NdefCodec.decodeWifiWsc(parsedRecords[4]);
      expect(wifiDecoded?.ssid, equals('TestNetwork'));
      expect(wifiDecoded?.password, equals('Pass123456()'));
    });
  });
}
