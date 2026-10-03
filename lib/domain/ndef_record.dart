import 'dart:convert';
import 'dart:typed_data';
import '../l10n/l10n.dart';

/// TNF (Type Name Format) constants according to NFC Forum specifications
enum NdefTnf {
  empty,
  wellKnown,
  media,
  absoluteUri,
  external,
  unknown,
  unchanged,
  reserved,
}

/// Represents an individual NDEF Record in an NDEF Message
class NdefRecordModel {
  final NdefTnf tnf;
  final Uint8List type;
  final Uint8List id;
  final Uint8List payload;

  const NdefRecordModel({
    required this.tnf,
    required this.type,
    required this.id,
    required this.payload,
  });

  Map<String, dynamic> toMap() {
    return {
      'tnf': tnf.index,
      'type': type,
      'id': id,
      'payload': payload,
    };
  }

  factory NdefRecordModel.fromMap(Map<dynamic, dynamic> map) {
    return NdefRecordModel(
      tnf: NdefTnf.values[(map['tnf'] as int?) ?? 0],
      type: map['type'] != null ? Uint8List.fromList(List<int>.from(map['type'])) : Uint8List(0),
      id: map['id'] != null ? Uint8List.fromList(List<int>.from(map['id'])) : Uint8List(0),
      payload: map['payload'] != null ? Uint8List.fromList(List<int>.from(map['payload'])) : Uint8List(0),
    );
  }

  /// JSON serialization using Base64 for exact preservation of TNF, type, id, and payload
  Map<String, dynamic> toJsonMap() {
    return {
      'tnf': tnf.index,
      'type': base64Encode(type),
      'id': base64Encode(id),
      'payload': base64Encode(payload),
    };
  }

  /// JSON deserialization from Base64
  factory NdefRecordModel.fromJsonMap(Map<String, dynamic> map) {
    return NdefRecordModel(
      tnf: NdefTnf.values[(map['tnf'] as int?) ?? 0],
      type: map['type'] != null ? base64Decode(map['type'] as String) : Uint8List(0),
      id: map['id'] != null ? base64Decode(map['id'] as String) : Uint8List(0),
      payload: map['payload'] != null ? base64Decode(map['payload'] as String) : Uint8List(0),
    );
  }

  /// Encodes this single record into raw NDEF bytes according to NFC Forum spec.
  /// [isFirst] sets MB (Message Begin), [isLast] sets ME (Message End).
  Uint8List toBytes({bool isFirst = true, bool isLast = true}) {
    if (type.length > 255 || id.length > 255) {
      throw FormatException(L10n.current.ndefTypeOrIdTooLong);
    }
    final bool sr = payload.length <= 255; // Short Record
    final bool il = id.isNotEmpty; // ID Length field present

    int header = (tnf.index & 0x07);
    if (isFirst) header |= 0x80; // MB
    if (isLast) header |= 0x40;  // ME
    // CF (Chunk Flag) is 0 for unchunked
    if (sr) header |= 0x10;      // SR
    if (il) header |= 0x08;      // IL

    final builder = BytesBuilder();
    builder.addByte(header);
    builder.addByte(type.length);

    if (sr) {
      builder.addByte(payload.length);
    } else {
      final lenBytes = ByteData(4)..setUint32(0, payload.length, Endian.big);
      builder.add(lenBytes.buffer.asUint8List());
    }

    if (il) {
      builder.addByte(id.length);
    }

    builder.add(type);
    if (il) {
      builder.add(id);
    }
    builder.add(payload);

    return builder.toBytes();
  }

  /// Parses raw NDEF records from bytes
  static List<NdefRecordModel> parseAll(Uint8List data) {
    final records = <NdefRecordModel>[];
    int offset = 0;

    while (offset < data.length) {
      final header = data[offset++];
      final bool mb = (header & 0x80) != 0;
      final bool me = (header & 0x40) != 0;
      final bool cf = (header & 0x20) != 0;
      final bool sr = (header & 0x10) != 0;
      final bool il = (header & 0x08) != 0;
      final int tnfVal = header & 0x07;
      final NdefTnf tnf = (tnfVal < NdefTnf.values.length)
          ? NdefTnf.values[tnfVal]
          : NdefTnf.unknown;

      if (cf || (records.isEmpty && !mb) || (records.isNotEmpty && mb)) {
        throw FormatException(L10n.current.ndefUnsupportedOrInvalidRecord);
      }
      if (offset >= data.length) throw FormatException(L10n.current.ndefMissingTypeLength);
      final typeLength = data[offset++];

      int payloadLength = 0;
      if (sr) {
        if (offset >= data.length) throw FormatException(L10n.current.ndefMissingPayloadLength);
        payloadLength = data[offset++];
      } else {
        if (offset + 4 > data.length) throw FormatException(L10n.current.ndefMissingPayloadLength);
        final bd = ByteData.sublistView(data, offset, offset + 4);
        payloadLength = bd.getUint32(0, Endian.big);
        offset += 4;
      }

      int idLength = 0;
      if (il) {
        if (offset >= data.length) throw FormatException(L10n.current.ndefMissingIdLength);
        idLength = data[offset++];
      }

      if (offset + typeLength > data.length) throw FormatException(L10n.current.ndefMissingType);
      final type = data.sublist(offset, offset + typeLength);
      offset += typeLength;

      Uint8List id = Uint8List(0);
      if (il) {
        if (offset + idLength > data.length) throw FormatException(L10n.current.ndefMissingId);
        id = data.sublist(offset, offset + idLength);
        offset += idLength;
      }

      if (offset + payloadLength > data.length) throw FormatException(L10n.current.ndefMissingPayload);
      final payload = data.sublist(offset, offset + payloadLength);
      offset += payloadLength;

      records.add(NdefRecordModel(
        tnf: tnf,
        type: type,
        id: id,
        payload: payload,
      ));

      if (me) {
        if (offset != data.length) throw const FormatException('NDEF sonunda fazladan veri var');
        return records;
      }
    }
    if (records.isNotEmpty) throw const FormatException('NDEF mesaj sonu eksik');
    return records;
  }
}

/// Represents a parsed high-level record
enum ParsedRecordType {
  text,
  url,
  email,
  phone,
  sms,
  location,
  vcard,
  calendar,
  smartPoster,
  customMime,
  wifi,
  unknown,
}

class ParsedRecordData {
  final ParsedRecordType type;
  final String title;
  final String content;
  final Map<String, dynamic> extra;

  const ParsedRecordData({
    required this.type,
    required this.title,
    required this.content,
    this.extra = const {},
  });
}

/// Helper for escaping and formatting vCard 3.0 and iCalendar (.ics) values
class NdefValueFormatter {
  /// Escapes text values for vCard 3.0 according to RFC 2426:
  /// Backslash '\', semicolon ';', and comma ',' MUST be escaped with a backslash.
  /// Newlines are escaped as \n.
  static String escapeVCard(String value) {
    final sb = StringBuffer();
    for (int i = 0; i < value.length; i++) {
      final char = value[i];
      if (char == '\\') {
        sb.write(r'\\');
      } else if (char == ';') {
        sb.write(r'\;');
      } else if (char == ',') {
        sb.write(r'\,');
      } else if (char == '\r') {
        if (i + 1 < value.length && value[i + 1] == '\n') {
          i++;
        }
        sb.write(r'\n');
      } else if (char == '\n') {
        sb.write(r'\n');
      } else {
        sb.write(char);
      }
    }
    return sb.toString();
  }

  /// Unescapes vCard 3.0 values
  static String unescapeVCard(String value) {
    final sb = StringBuffer();
    for (int i = 0; i < value.length; i++) {
      if (value[i] == '\\' && i + 1 < value.length) {
        final next = value[i + 1];
        if (next == 'n' || next == 'N') {
          sb.write('\n');
          i++;
        } else if (next == '\\' || next == ';' || next == ',') {
          sb.write(next);
          i++;
        } else {
          sb.write(value[i]);
        }
      } else {
        sb.write(value[i]);
      }
    }
    return sb.toString();
  }

  /// Escapes text values for iCalendar according to RFC 5545:
  /// Backslash '\', semicolon ';', and comma ',' MUST be escaped with a backslash.
  /// Line breaks are encoded as \n.
  static String escapeIcs(String value) {
    return escapeVCard(value);
  }

  /// Unescapes iCalendar values
  static String unescapeIcs(String value) {
    return unescapeVCard(value);
  }

  /// Formats UTC DateTime to ICS basic UTC format: YYYYMMDDTHHMMSSZ
  static String formatIcsUtc(DateTime dateTime) {
    final utc = dateTime.toUtc();
    final y = utc.year.toString().padLeft(4, '0');
    final m = utc.month.toString().padLeft(2, '0');
    final d = utc.day.toString().padLeft(2, '0');
    final h = utc.hour.toString().padLeft(2, '0');
    final min = utc.minute.toString().padLeft(2, '0');
    final s = utc.second.toString().padLeft(2, '0');
    return '$y$m${d}T$h$min${s}Z';
  }

  /// Parses ICS basic format date string (e.g. 20260930T150000Z or local format)
  static DateTime? parseIcsDate(String str) {
    final clean = str.trim();
    if (clean.length < 8) return null;
    try {
      final y = int.parse(clean.substring(0, 4));
      final m = int.parse(clean.substring(4, 6));
      final d = int.parse(clean.substring(6, 8));
      if (clean.length >= 15 && clean[8] == 'T') {
        final h = int.parse(clean.substring(9, 11));
        final min = int.parse(clean.substring(11, 13));
        final s = int.parse(clean.substring(13, 15));
        final isUtc = clean.endsWith('Z');
        if (isUtc) {
          return DateTime.utc(y, m, d, h, min, s);
        } else {
          return DateTime(y, m, d, h, min, s);
        }
      }
      return DateTime(y, m, d);
    } catch (_) {
      return null;
    }
  }

  /// Unfolds folded lines (CRLF followed by space or tab) per RFC 2425/RFC 5545
  static List<String> unfoldLines(String raw) {
    final normalized = raw.replaceAll('\r\n', '\n').replaceAll('\r', '\n');
    final rawLines = normalized.split('\n');
    final unfolded = <String>[];
    for (final line in rawLines) {
      if (line.startsWith(' ') || line.startsWith('\t')) {
        if (unfolded.isNotEmpty) {
          unfolded[unfolded.length - 1] += line.substring(1);
        } else {
          unfolded.add(line.substring(1));
        }
      } else {
        if (line.isNotEmpty) {
          unfolded.add(line);
        }
      }
    }
    return unfolded;
  }
}

/// Wi-Fi Authentication types for WSC / Wi-Fi Simple Configuration
enum WifiAuthType {
  open,
  wpaPsk,
  wpa2Psk,
  wpaWpa2Personal,
}

/// Wi-Fi Encryption types
enum WifiEncryptionType {
  none,
  tkip,
  aes,
  tkipAes,
}

/// Wi-Fi Configuration Model
class WifiConfigData {
  final String ssid;
  final WifiAuthType authType;
  final String password;
  final WifiEncryptionType encryptionType;

  const WifiConfigData({
    required this.ssid,
    this.authType = WifiAuthType.wpa2Psk,
    this.password = '',
    this.encryptionType = WifiEncryptionType.aes,
  });

  String get authTypeLabel {
    switch (authType) {
      case WifiAuthType.open:
        return L10n.current.wifiAuthOpen;
      case WifiAuthType.wpaPsk:
        return 'WPA Personal';
      case WifiAuthType.wpa2Psk:
        return 'WPA2 Personal';
      case WifiAuthType.wpaWpa2Personal:
        return 'WPA/WPA2 Personal';
    }
  }
}

/// Smart Poster data model
class SmartPosterData {
  final String uri;
  final String? title;
  final String? lang;
  final List<NdefRecordModel> otherRecords;

  const SmartPosterData({
    required this.uri,
    this.title,
    this.lang,
    this.otherRecords = const [],
  });
}

/// Decoder and Encoder for NFC Forum standard payload types
class NdefCodec {
  static final Uint8List rtdText = Uint8List.fromList([0x54]); // 'T'
  static final Uint8List rtdUri = Uint8List.fromList([0x55]);  // 'U'
  static final Uint8List rtdSmartPoster = Uint8List.fromList([0x53, 0x70]); // 'Sp'
  static final Uint8List mimeTypeVCard = Uint8List.fromList(ascii.encode('text/vcard'));
  static final Uint8List mimeTypeCalendar = Uint8List.fromList(ascii.encode('text/calendar'));
  static final Uint8List mimeTypeWifiWsc = Uint8List.fromList(ascii.encode('application/vnd.wfa.wsc'));

  // WSC Attribute IDs (Big-Endian 2 bytes)
  static const int wscAttrCredential = 0x100E;
  static const int wscAttrNetworkIndex = 0x1026;
  static const int wscAttrSsid = 0x1045;
  static const int wscAttrAuthType = 0x1003;
  static const int wscAttrEncryptionType = 0x100F;
  static const int wscAttrNetworkKey = 0x1027;
  static const int wscAttrMacAddress = 0x1020;

  // URI Prefix mapping (NFC Forum RTD URI 1.0)
  static const List<String> uriPrefixes = [
    '', // 0x00
    'http://www.', // 0x01
    'https://www.', // 0x02
    'http://', // 0x03
    'https://', // 0x04
    'tel:', // 0x05
    'mailto:', // 0x06
    'ftp://anonymous:anonymous@', // 0x07
    'ftp://ftp.', // 0x08
    'ftps://', // 0x09
    'sftp://', // 0x0A
    'smb://', // 0x0B
    'nfs://', // 0x0C
    'ftp://', // 0x0D
    'dav://', // 0x0E
    'news:', // 0x0F
    'telnet://', // 0x10
    'imap:', // 0x11
    'rtsp://', // 0x12
    'urn:', // 0x13
    'pop:', // 0x14
    'sip:', // 0x15
    'sips:', // 0x16
    'tftp:', // 0x17
    'btspp://', // 0x18
    'btl2cap://', // 0x19
    'btgoep://', // 0x1A
    'tcpobex://', // 0x1B
    'irdaobex://', // 0x1C
    'file://', // 0x1D
    'urn:epc:id:', // 0x1E
    'urn:epc:tag:', // 0x1F
    'urn:epc:pat:', // 0x20
    'urn:epc:raw:', // 0x21
    'urn:epc:', // 0x22
    'urn:nfc:', // 0x23
  ];

  /// Encode RTD Text Record
  /// Payload format: [Status Byte (1 byte)] + [Language Code (ISO 639-1)] + [Text (UTF-8/UTF-16)]
  static NdefRecordModel encodeText(String text, {String langCode = 'tr'}) {
    final langBytes = ascii.encode(langCode);
    final textBytes = utf8.encode(text);
    final statusByte = langBytes.length & 0x3F; // UTF-8 (bit 7 = 0)

    final payload = Uint8List(1 + langBytes.length + textBytes.length);
    payload[0] = statusByte;
    payload.setRange(1, 1 + langBytes.length, langBytes);
    payload.setRange(1 + langBytes.length, payload.length, textBytes);

    return NdefRecordModel(
      tnf: NdefTnf.wellKnown,
      type: rtdText,
      id: Uint8List(0),
      payload: payload,
    );
  }

  /// Decode RTD Text Record
  static String? decodeText(NdefRecordModel record) {
    if (record.tnf != NdefTnf.wellKnown || !_bytesEqual(record.type, rtdText)) {
      return null;
    }
    if (record.payload.isEmpty) return '';

    final status = record.payload[0];
    final bool isUtf16 = (status & 0x80) != 0;
    final int langLength = status & 0x3F;

    if (1 + langLength > record.payload.length) return null;

    final textBytes = record.payload.sublist(1 + langLength);
    if (isUtf16) {
      if (textBytes.length.isOdd || textBytes.length < 2) return null;
      final bigEndian = textBytes[0] == 0xFE && textBytes[1] == 0xFF;
      final littleEndian = textBytes[0] == 0xFF && textBytes[1] == 0xFE;
      if (!bigEndian && !littleEndian) return null;
      final units = <int>[];
      for (var i = 2; i < textBytes.length; i += 2) {
        units.add(bigEndian
            ? (textBytes[i] << 8) | textBytes[i + 1]
            : textBytes[i] | (textBytes[i + 1] << 8));
      }
      return String.fromCharCodes(units);
    } else {
      return utf8.decode(textBytes, allowMalformed: true);
    }
  }

  /// Encode RTD URI Record
  /// Payload format: [Prefix code (1 byte)] + [URI remainder]
  static NdefRecordModel encodeUri(String uriString) {
    int prefixIndex = 0;
    String remainder = uriString;

    for (int i = 1; i < uriPrefixes.length; i++) {
      final p = uriPrefixes[i];
      if (uriString.startsWith(p)) {
        prefixIndex = i;
        remainder = uriString.substring(p.length);
        break;
      }
    }

    final remainderBytes = utf8.encode(remainder);
    final payload = Uint8List(1 + remainderBytes.length);
    payload[0] = prefixIndex;
    payload.setRange(1, payload.length, remainderBytes);

    return NdefRecordModel(
      tnf: NdefTnf.wellKnown,
      type: rtdUri,
      id: Uint8List(0),
      payload: payload,
    );
  }

  /// Decode RTD URI Record
  static String? decodeUri(NdefRecordModel record) {
    if (record.tnf != NdefTnf.wellKnown || !_bytesEqual(record.type, rtdUri)) {
      return null;
    }
    if (record.payload.isEmpty) return '';

    final prefixCode = record.payload[0];
    final prefix = (prefixCode < uriPrefixes.length) ? uriPrefixes[prefixCode] : '';
    final remainder = utf8.decode(record.payload.sublist(1), allowMalformed: true);
    return '$prefix$remainder';
  }

  /// Encode Email Record (mailto: URI)
  static NdefRecordModel encodeEmail({
    required String recipient,
    String? subject,
    String? body,
  }) {
    final queryParams = <String>[];
    if (subject != null && subject.isNotEmpty) {
      queryParams.add('subject=${Uri.encodeComponent(subject)}');
    }
    if (body != null && body.isNotEmpty) {
      queryParams.add('body=${Uri.encodeComponent(body)}');
    }
    final qs = queryParams.isNotEmpty ? '?${queryParams.join('&')}' : '';
    final fullUri = 'mailto:$recipient$qs';
    return encodeUri(fullUri);
  }

  /// Encode Phone Call Record (tel: URI)
  static NdefRecordModel encodePhone(String phoneNumber) {
    final cleanPhone = phoneNumber.replaceAll(RegExp(r'\s+'), '');
    return encodeUri('tel:$cleanPhone');
  }

  /// Encode SMS Record (sms: URI)
  static NdefRecordModel encodeSms({required String phoneNumber, String? message}) {
    final cleanPhone = phoneNumber.replaceAll(RegExp(r'\s+'), '');
    final uri = (message != null && message.isNotEmpty)
        ? 'sms:$cleanPhone?body=${Uri.encodeComponent(message)}'
        : 'sms:$cleanPhone';
    return encodeUri(uri);
  }

  /// Encode Location / Geo Record (geo:lat,lng)
  static NdefRecordModel encodeLocation({required double latitude, required double longitude}) {
    return encodeUri('geo:$latitude,$longitude');
  }

  /// -------------------------------------------------------------
  /// vCard 3.0 (MIME text/vcard)
  /// -------------------------------------------------------------
  static NdefRecordModel encodeVCard({
    required String formattedName,
    String? firstName,
    String? lastName,
    String? organization,
    String? title,
    String? phone,
    String? email,
    String? url,
    String? note,
  }) {
    final sb = StringBuffer();
    sb.write('BEGIN:VCARD\r\n');
    sb.write('VERSION:3.0\r\n');

    final fn = formattedName.trim();
    sb.write('FN:${NdefValueFormatter.escapeVCard(fn)}\r\n');

    final l = lastName?.trim() ?? '';
    final f = firstName?.trim() ?? '';
    if (l.isNotEmpty || f.isNotEmpty) {
      sb.write('N:${NdefValueFormatter.escapeVCard(l)};${NdefValueFormatter.escapeVCard(f)};;;\r\n');
    } else {
      sb.write('N:${NdefValueFormatter.escapeVCard(fn)};;;;\r\n');
    }

    if (organization != null && organization.trim().isNotEmpty) {
      sb.write('ORG:${NdefValueFormatter.escapeVCard(organization.trim())}\r\n');
    }
    if (title != null && title.trim().isNotEmpty) {
      sb.write('TITLE:${NdefValueFormatter.escapeVCard(title.trim())}\r\n');
    }
    if (phone != null && phone.trim().isNotEmpty) {
      sb.write('TEL;TYPE=CELL:${NdefValueFormatter.escapeVCard(phone.trim())}\r\n');
    }
    if (email != null && email.trim().isNotEmpty) {
      sb.write('EMAIL;TYPE=INTERNET:${NdefValueFormatter.escapeVCard(email.trim())}\r\n');
    }
    if (url != null && url.trim().isNotEmpty) {
      sb.write('URL:${NdefValueFormatter.escapeVCard(url.trim())}\r\n');
    }
    if (note != null && note.trim().isNotEmpty) {
      sb.write('NOTE:${NdefValueFormatter.escapeVCard(note.trim())}\r\n');
    }

    sb.write('END:VCARD\r\n');

    return NdefRecordModel(
      tnf: NdefTnf.media,
      type: mimeTypeVCard,
      id: Uint8List(0),
      payload: Uint8List.fromList(utf8.encode(sb.toString())),
    );
  }

  /// Decode vCard 3.0 Record
  static Map<String, String>? decodeVCard(NdefRecordModel record) {
    if (record.tnf != NdefTnf.media) return null;
    final typeStr = ascii.decode(record.type, allowInvalid: true).toLowerCase();
    if (typeStr != 'text/vcard' && typeStr != 'text/x-vcard') return null;

    final raw = utf8.decode(record.payload, allowMalformed: true);
    final lines = NdefValueFormatter.unfoldLines(raw);

    final result = <String, String>{};
    for (final line in lines) {
      final colonIdx = line.indexOf(':');
      if (colonIdx == -1) continue;
      final propPart = line.substring(0, colonIdx).trim().toUpperCase();
      final valPart = line.substring(colonIdx + 1);
      final propName = propPart.split(';').first;

      final unescaped = NdefValueFormatter.unescapeVCard(valPart);
      if (propName == 'FN') {
        result['fn'] = unescaped;
      } else if (propName == 'N') {
        final parts = valPart.split(';');
        if (parts.isNotEmpty) result['lastName'] = NdefValueFormatter.unescapeVCard(parts[0]);
        if (parts.length > 1) result['firstName'] = NdefValueFormatter.unescapeVCard(parts[1]);
      } else if (propName == 'ORG') {
        result['org'] = unescaped;
      } else if (propName == 'TITLE') {
        result['title'] = unescaped;
      } else if (propName == 'TEL') {
        result['tel'] = unescaped;
      } else if (propName == 'EMAIL') {
        result['email'] = unescaped;
      } else if (propName == 'URL') {
        result['url'] = unescaped;
      } else if (propName == 'NOTE') {
        result['note'] = unescaped;
      }
    }

    return result;
  }

  /// -------------------------------------------------------------
  /// Calendar Event (MIME text/calendar) iCalendar RFC 5545
  /// -------------------------------------------------------------
  static NdefRecordModel encodeCalendarEvent({
    required String summary,
    required DateTime dtStart,
    required DateTime dtEnd,
    String? location,
    String? description,
    String? uid,
  }) {
    final sb = StringBuffer();
    sb.write('BEGIN:VCALENDAR\r\n');
    sb.write('VERSION:2.0\r\n');
    sb.write('PRODID:-//NFC Tag Master//TR\r\n');
    sb.write('BEGIN:VEVENT\r\n');

    final eventUid = (uid != null && uid.isNotEmpty)
        ? uid
        : '${DateTime.now().millisecondsSinceEpoch}@nfctagmaster.app';
    sb.write('UID:$eventUid\r\n');
    sb.write('DTSTAMP:${NdefValueFormatter.formatIcsUtc(DateTime.now())}\r\n');
    sb.write('DTSTART:${NdefValueFormatter.formatIcsUtc(dtStart)}\r\n');
    sb.write('DTEND:${NdefValueFormatter.formatIcsUtc(dtEnd)}\r\n');
    sb.write('SUMMARY:${NdefValueFormatter.escapeIcs(summary.trim())}\r\n');

    if (location != null && location.trim().isNotEmpty) {
      sb.write('LOCATION:${NdefValueFormatter.escapeIcs(location.trim())}\r\n');
    }
    if (description != null && description.trim().isNotEmpty) {
      sb.write('DESCRIPTION:${NdefValueFormatter.escapeIcs(description.trim())}\r\n');
    }

    sb.write('END:VEVENT\r\n');
    sb.write('END:VCALENDAR\r\n');

    return NdefRecordModel(
      tnf: NdefTnf.media,
      type: mimeTypeCalendar,
      id: Uint8List(0),
      payload: Uint8List.fromList(utf8.encode(sb.toString())),
    );
  }

  /// Decode Calendar Record
  static Map<String, dynamic>? decodeCalendarEvent(NdefRecordModel record) {
    if (record.tnf != NdefTnf.media) return null;
    final typeStr = ascii.decode(record.type, allowInvalid: true).toLowerCase();
    if (typeStr != 'text/calendar') return null;

    final raw = utf8.decode(record.payload, allowMalformed: true);
    final lines = NdefValueFormatter.unfoldLines(raw);

    final result = <String, dynamic>{};
    for (final line in lines) {
      final colonIdx = line.indexOf(':');
      if (colonIdx == -1) continue;
      final propPart = line.substring(0, colonIdx).trim().toUpperCase();
      final valPart = line.substring(colonIdx + 1);
      final propName = propPart.split(';').first;

      if (propName == 'SUMMARY') {
        result['summary'] = NdefValueFormatter.unescapeIcs(valPart);
      } else if (propName == 'LOCATION') {
        result['location'] = NdefValueFormatter.unescapeIcs(valPart);
      } else if (propName == 'DESCRIPTION') {
        result['description'] = NdefValueFormatter.unescapeIcs(valPart);
      } else if (propName == 'UID') {
        result['uid'] = valPart.trim();
      } else if (propName == 'DTSTART') {
        result['dtStart'] = NdefValueFormatter.parseIcsDate(valPart);
        result['dtStartRaw'] = valPart.trim();
      } else if (propName == 'DTEND') {
        result['dtEnd'] = NdefValueFormatter.parseIcsDate(valPart);
        result['dtEndRaw'] = valPart.trim();
      }
    }

    return result;
  }

  /// -------------------------------------------------------------
  /// NFC Forum Smart Poster Record (RTD 'Sp')
  /// Contains nested NDEF message with at least URI and optional Text/Action/Size/Type
  /// -------------------------------------------------------------
  static NdefRecordModel encodeSmartPoster({
    required String uri,
    String? title,
    String lang = 'tr',
    List<NdefRecordModel>? extraInnerRecords,
  }) {
    final innerList = <NdefRecordModel>[];
    if (title != null && title.trim().isNotEmpty) {
      innerList.add(encodeText(title.trim(), langCode: lang));
    }
    innerList.add(encodeUri(uri.trim()));
    if (extraInnerRecords != null && extraInnerRecords.isNotEmpty) {
      innerList.addAll(extraInnerRecords);
    }

    final innerNdefBytes = encodeNdefMessage(innerList);

    return NdefRecordModel(
      tnf: NdefTnf.wellKnown,
      type: rtdSmartPoster,
      id: Uint8List(0),
      payload: innerNdefBytes,
    );
  }

  /// Decode Smart Poster Record
  static SmartPosterData? decodeSmartPoster(NdefRecordModel record) {
    if (record.tnf != NdefTnf.wellKnown || !_bytesEqual(record.type, rtdSmartPoster)) {
      return null;
    }
    try {
      final innerRecords = NdefRecordModel.parseAll(record.payload);
      String? uri;
      String? title;
      String? lang;
      final others = <NdefRecordModel>[];

      for (final rec in innerRecords) {
        if (rec.tnf == NdefTnf.wellKnown && _bytesEqual(rec.type, rtdUri) && uri == null) {
          uri = decodeUri(rec);
        } else if (rec.tnf == NdefTnf.wellKnown && _bytesEqual(rec.type, rtdText) && title == null) {
          title = decodeText(rec);
          if (rec.payload.isNotEmpty) {
            final status = rec.payload[0];
            final lLen = status & 0x3F;
            if (1 + lLen <= rec.payload.length) {
              lang = ascii.decode(rec.payload.sublist(1, 1 + lLen), allowInvalid: true);
            }
          }
        } else {
          others.add(rec);
        }
      }

      if (uri == null) return null;
      return SmartPosterData(
        uri: uri,
        title: title,
        lang: lang,
        otherRecords: others,
      );
    } catch (_) {
      return null;
    }
  }

  /// -------------------------------------------------------------
  /// Custom MIME Record
  /// -------------------------------------------------------------
  static NdefRecordModel encodeCustomMime({
    required String mimeType,
    required Uint8List payload,
  }) {
    final cleanType = mimeType.trim().toLowerCase();
    return NdefRecordModel(
      tnf: NdefTnf.media,
      type: Uint8List.fromList(ascii.encode(cleanType)),
      id: Uint8List(0),
      payload: payload,
    );
  }

  /// -------------------------------------------------------------
  /// Wi-Fi Configuration (application/vnd.wfa.wsc) WSC TLV Credential
  /// -------------------------------------------------------------
  static NdefRecordModel encodeWifiWsc({
    required String ssid,
    required WifiAuthType authType,
    required String password,
    WifiEncryptionType encryptionType = WifiEncryptionType.aes,
  }) {
    final credBytesBuilder = BytesBuilder();

    // 1. Network Index (0x1026, 1 byte = 1)
    _addWscTlvByte(credBytesBuilder, wscAttrNetworkIndex, 1);

    // 2. SSID (0x1045)
    final ssidBytes = utf8.encode(ssid);
    _addWscTlv(credBytesBuilder, wscAttrSsid, Uint8List.fromList(ssidBytes));

    // 3. Authentication Type (0x1003, 2 bytes)
    // 0x0001: Open, 0x0002: WPA-PSK, 0x0020: WPA2-PSK, 0x0022: WPA/WPA2-PSK
    int authVal = 0x0020;
    if (authType == WifiAuthType.open) {
      authVal = 0x0001;
    } else if (authType == WifiAuthType.wpaPsk) {
      authVal = 0x0002;
    } else if (authType == WifiAuthType.wpa2Psk) {
      authVal = 0x0020;
    } else if (authType == WifiAuthType.wpaWpa2Personal) {
      authVal = 0x0022;
    }
    _addWscTlvUint16(credBytesBuilder, wscAttrAuthType, authVal);

    // 4. Encryption Type (0x100F, 2 bytes)
    // 0x0001: None, 0x0004: TKIP, 0x0008: AES, 0x000C: TKIP/AES
    int encVal = 0x0008;
    if (authType == WifiAuthType.open) {
      encVal = 0x0001;
    } else {
      switch (encryptionType) {
        case WifiEncryptionType.none:
          encVal = 0x0001;
          break;
        case WifiEncryptionType.tkip:
          encVal = 0x0004;
          break;
        case WifiEncryptionType.aes:
          encVal = 0x0008;
          break;
        case WifiEncryptionType.tkipAes:
          encVal = 0x000C;
          break;
      }
    }
    _addWscTlvUint16(credBytesBuilder, wscAttrEncryptionType, encVal);

    // 5. Network Key (0x1027, password bytes)
    if (authType != WifiAuthType.open && password.isNotEmpty) {
      final keyBytes = utf8.encode(password);
      _addWscTlv(credBytesBuilder, wscAttrNetworkKey, Uint8List.fromList(keyBytes));
    }

    // 6. MAC Address (0x1020, 6 bytes broadcast FF:FF:FF:FF:FF:FF)
    _addWscTlv(credBytesBuilder, wscAttrMacAddress, Uint8List.fromList([0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF]));

    final credBytes = credBytesBuilder.toBytes();

    // Wrap Credential TLV inside outer container
    final outerBuilder = BytesBuilder();
    _addWscTlv(outerBuilder, wscAttrCredential, credBytes);

    return NdefRecordModel(
      tnf: NdefTnf.media,
      type: mimeTypeWifiWsc,
      id: Uint8List(0),
      payload: outerBuilder.toBytes(),
    );
  }

  static void _addWscTlv(BytesBuilder bb, int tag, Uint8List value) {
    bb.addByte((tag >> 8) & 0xFF);
    bb.addByte(tag & 0xFF);
    bb.addByte((value.length >> 8) & 0xFF);
    bb.addByte(value.length & 0xFF);
    bb.add(value);
  }

  static void _addWscTlvByte(BytesBuilder bb, int tag, int byteVal) {
    _addWscTlv(bb, tag, Uint8List.fromList([byteVal & 0xFF]));
  }

  static void _addWscTlvUint16(BytesBuilder bb, int tag, int val) {
    _addWscTlv(bb, tag, Uint8List.fromList([(val >> 8) & 0xFF, val & 0xFF]));
  }

  /// Decode Wi-Fi WSC Record
  static WifiConfigData? decodeWifiWsc(NdefRecordModel record) {
    if (record.tnf != NdefTnf.media) return null;
    final typeStr = ascii.decode(record.type, allowInvalid: true).toLowerCase();
    if (typeStr != 'application/vnd.wfa.wsc') return null;

    final data = record.payload;
    // Iterate outer TLVs to find Credential (0x100E)
    Uint8List? credPayload = _findWscTlv(data, wscAttrCredential);
    final targetData = credPayload ?? data; // Allow bare credentials if inner payload directly provided

    final ssidBytes = _findWscTlv(targetData, wscAttrSsid);
    final ssid = ssidBytes != null ? utf8.decode(ssidBytes, allowMalformed: true) : '';

    final authBytes = _findWscTlv(targetData, wscAttrAuthType);
    WifiAuthType authType = WifiAuthType.wpa2Psk;
    if (authBytes != null && authBytes.length >= 2) {
      final code = (authBytes[0] << 8) | authBytes[1];
      if (code == 0x0001) {
        authType = WifiAuthType.open;
      } else if (code == 0x0002) {
        authType = WifiAuthType.wpaPsk;
      } else if (code == 0x0020) {
        authType = WifiAuthType.wpa2Psk;
      } else if (code == 0x0022) {
        authType = WifiAuthType.wpaWpa2Personal;
      }
    }

    final keyBytes = _findWscTlv(targetData, wscAttrNetworkKey);
    final password = keyBytes != null ? utf8.decode(keyBytes, allowMalformed: true) : '';

    final encBytes = _findWscTlv(targetData, wscAttrEncryptionType);
    WifiEncryptionType encType = WifiEncryptionType.aes;
    if (encBytes != null && encBytes.length >= 2) {
      final code = (encBytes[0] << 8) | encBytes[1];
      if (code == 0x0001) {
        encType = WifiEncryptionType.none;
      } else if (code == 0x0004) {
        encType = WifiEncryptionType.tkip;
      } else if (code == 0x0008) {
        encType = WifiEncryptionType.aes;
      } else if (code == 0x000C) {
        encType = WifiEncryptionType.tkipAes;
      }
    }

    if (ssid.isEmpty && password.isEmpty) return null;
    return WifiConfigData(
      ssid: ssid,
      authType: authType,
      password: password,
      encryptionType: encType,
    );
  }

  static Uint8List? _findWscTlv(Uint8List data, int targetTag) {
    int offset = 0;
    while (offset + 4 <= data.length) {
      final tag = (data[offset] << 8) | data[offset + 1];
      final len = (data[offset + 2] << 8) | data[offset + 3];
      offset += 4;
      if (offset + len > data.length) break;
      if (tag == targetTag) {
        return data.sublist(offset, offset + len);
      }
      offset += len;
    }
    return null;
  }

  /// Helper to categorize and parse high level record
  static ParsedRecordData parseRecord(NdefRecordModel record) {
    // 1. Text Record
    if (record.tnf == NdefTnf.wellKnown && _bytesEqual(record.type, rtdText)) {
      final text = decodeText(record) ?? '';
      return ParsedRecordData(
        type: ParsedRecordType.text,
        title: L10n.current.recordTypeText,
        content: text,
      );
    }

    // 2. Smart Poster Record
    if (record.tnf == NdefTnf.wellKnown && _bytesEqual(record.type, rtdSmartPoster)) {
      final sp = decodeSmartPoster(record);
      if (sp != null) {
        final titlePart = sp.title != null ? '${sp.title}\n' : '';
        return ParsedRecordData(
          type: ParsedRecordType.smartPoster,
          title: L10n.current.recordTypeSmartPoster,
          content: '$titlePart${sp.uri}',
          extra: {
            'uri': sp.uri,
            'title': sp.title ?? '',
            'lang': sp.lang ?? '',
            'nestedCount': sp.otherRecords.length + (sp.title != null ? 2 : 1),
          },
        );
      }
      return ParsedRecordData(
        type: ParsedRecordType.smartPoster,
        title: L10n.current.recordTypeSmartPosterInvalid,
        content: L10n.current.recordTypeSmartPosterCorrupt(record.payload.length),
      );
    }

    // 3. URI Record & Subtypes
    if (record.tnf == NdefTnf.wellKnown && _bytesEqual(record.type, rtdUri)) {
      final uriStr = decodeUri(record) ?? '';
      if (uriStr.startsWith('mailto:')) {
        return _parseMailto(uriStr);
      } else if (uriStr.startsWith('tel:')) {
        final phone = uriStr.substring(4);
        return ParsedRecordData(
          type: ParsedRecordType.phone,
          title: L10n.current.recordTypePhone,
          content: phone,
        );
      } else if (uriStr.startsWith('sms:')) {
        return _parseSms(uriStr);
      } else if (uriStr.startsWith('geo:')) {
        return _parseGeo(uriStr);
      } else {
        return ParsedRecordData(
          type: ParsedRecordType.url,
          title: L10n.current.recordTypeUrl,
          content: uriStr,
          extra: {'url': uriStr},
        );
      }
    }

    // 4. Media / MIME Types
    if (record.tnf == NdefTnf.media) {
      final mimeStr = ascii.decode(record.type, allowInvalid: true).toLowerCase();

      // vCard
      if (mimeStr == 'text/vcard' || mimeStr == 'text/x-vcard') {
        final vcard = decodeVCard(record);
        final name = vcard?['fn'] ?? '${vcard?['firstName'] ?? ''} ${vcard?['lastName'] ?? ''}'.trim();
        final details = <String>[];
        if (name.isNotEmpty) details.add(name);
        if (vcard?['tel'] != null && vcard!['tel']!.isNotEmpty) details.add('Tel: ${vcard['tel']}');
        if (vcard?['email'] != null && vcard!['email']!.isNotEmpty) details.add('E-posta: ${vcard['email']}');
        if (vcard?['org'] != null && vcard!['org']!.isNotEmpty) details.add('Kurum: ${vcard['org']}');
        return ParsedRecordData(
          type: ParsedRecordType.vcard,
          title: L10n.current.recordTypeVCard,
          content: details.isNotEmpty ? details.join(' | ') : L10n.current.recordTypeVCard,
          extra: vcard ?? {},
        );
      }

      // Calendar
      if (mimeStr == 'text/calendar') {
        final cal = decodeCalendarEvent(record);
        final summary = cal?['summary'] as String? ?? 'Etkinlik';
        final startRaw = cal?['dtStartRaw'] as String? ?? '';
        final endRaw = cal?['dtEndRaw'] as String? ?? '';
        final loc = cal?['location'] as String? ?? '';
        final locText = loc.isNotEmpty ? ' @ $loc' : '';
        return ParsedRecordData(
          type: ParsedRecordType.calendar,
          title: L10n.current.recordTypeCalendar,
          content: '$summary ($startRaw - $endRaw)$locText',
          extra: cal ?? {},
        );
      }

      // Wi-Fi WSC
      if (mimeStr == 'application/vnd.wfa.wsc') {
        final wifi = decodeWifiWsc(record);
        if (wifi != null) {
          final passMask = wifi.password.isEmpty ? L10n.current.unprotected : '${L10n.current.wifiPassword}: ${'*' * wifi.password.length}';
          return ParsedRecordData(
            type: ParsedRecordType.wifi,
            title: L10n.current.recordTypeWifi,
            content: 'SSID: ${wifi.ssid} [${wifi.authTypeLabel}] $passMask',
            extra: {
              'ssid': wifi.ssid,
              'authType': wifi.authTypeLabel,
              'password': wifi.password,
            },
          );
        }
        return ParsedRecordData(
          type: ParsedRecordType.wifi,
          title: L10n.current.recordTypeWifi,
          content: L10n.current.recordTypeWifiCorrupt,
        );
      }

      // Other Custom MIME
      final isPrintable = record.payload.isNotEmpty && record.payload.every((b) => (b >= 32 && b <= 126) || b == 10 || b == 13 || b == 9);
      final preview = isPrintable
          ? utf8.decode(record.payload, allowMalformed: true)
          : record.payload.take(16).map((b) => b.toRadixString(16).padLeft(2, '0')).join(' ');
      return ParsedRecordData(
        type: ParsedRecordType.customMime,
        title: L10n.current.recordTypeCustomMime(mimeStr),
        content: preview,
        extra: {'mimeType': mimeStr, 'byteLength': record.payload.length},
      );
    }

    return ParsedRecordData(
      type: ParsedRecordType.unknown,
      title: L10n.current.recordTypeUnknown,
      content: L10n.current.recordDebugSummary(record.tnf.name, '${record.payload.length}'),
    );
  }

  static ParsedRecordData _parseMailto(String uriStr) {
    final uri = Uri.tryParse(uriStr);
    final email = uri?.path ?? uriStr.substring(7);
    final subject = uri?.queryParameters['subject'] ?? '';
    final body = uri?.queryParameters['body'] ?? '';
    return ParsedRecordData(
      type: ParsedRecordType.email,
      title: L10n.current.recordTypeEmail,
      content: email,
      extra: {'subject': subject, 'body': body},
    );
  }

  static ParsedRecordData _parseSms(String uriStr) {
    final uri = Uri.tryParse(uriStr);
    final phone = uri?.path ?? '';
    final body = uri?.queryParameters['body'] ?? '';
    return ParsedRecordData(
      type: ParsedRecordType.sms,
      title: L10n.current.recordTypeSms,
      content: phone,
      extra: {'message': body},
    );
  }

  static ParsedRecordData _parseGeo(String uriStr) {
    final raw = uriStr.substring(4); // remove geo:
    final parts = raw.split('?').first.split(',');
    return ParsedRecordData(
      type: ParsedRecordType.location,
      title: L10n.current.recordTypeLocation,
      content: raw,
      extra: {
        'latitude': parts.isNotEmpty ? parts[0] : '',
        'longitude': parts.length > 1 ? parts[1] : '',
      },
    );
  }

  static bool _bytesEqual(Uint8List a, Uint8List b) {
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}

/// Converts a list of records into an entire NDEF Message payload
Uint8List encodeNdefMessage(List<NdefRecordModel> records) {
  if (records.isEmpty) return Uint8List(0);
  final builder = BytesBuilder();
  for (int i = 0; i < records.length; i++) {
    final isFirst = (i == 0);
    final isLast = (i == records.length - 1);
    builder.add(records[i].toBytes(isFirst: isFirst, isLast: isLast));
  }
  return builder.toBytes();
}
