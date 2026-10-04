import '../l10n/l10n.dart';
import 'ndef_record.dart';
import 'quick_links.dart';

class CsvImportResult {
  final List<NdefRecordModel> records;
  final List<String> errors;

  const CsvImportResult(this.records, this.errors);
}

/// Imports composer records from CSV. One record per line:
///
/// ```
/// tur,deger,ek
/// url,https://example.com
/// metin,Merhaba dünya
/// telefon,+905551112233
/// eposta,ad@site.com,Konu
/// sms,+905551112233,Mesaj metni
/// konum,41.0082,28.9784
/// wifi,AgAdi,Sifre123
/// ```
class CsvRecordImporter {
  static const int maxRows = 200;
  static const String sample = 'tur,deger,ek\n'
      'url,https://example.com\n'
      'metin,Merhaba dünya\n'
      'telefon,+905551112233\n'
      'eposta,ad@site.com,Konu\n'
      'sms,+905551112233,Mesaj\n'
      'konum,41.0082,28.9784\n'
      'wifi,AgAdi,Sifre123';

  static CsvImportResult parse(String content) {
    final records = <NdefRecordModel>[];
    final errors = <String>[];
    final lines = content.replaceAll('\r\n', '\n').replaceAll('\r', '\n').split('\n');

    for (int i = 0; i < lines.length; i++) {
      final line = lines[i].trim();
      if (line.isEmpty || line.startsWith('#')) continue;
      final cells = splitLine(line);
      final type = cells.first.trim().toLowerCase();
      if (i == 0 && (type == 'tur' || type == 'tür' || type == 'type')) continue;
      if (records.length >= maxRows) {
        errors.add(L10n.current.csvMaxRowsExceeded(maxRows));
        break;
      }
      final value = cells.length > 1 ? cells[1].trim() : '';
      final extra = cells.length > 2 ? cells[2].trim() : '';
      final row = i + 1;
      if (value.isEmpty) {
        errors.add(L10n.current.csvRowEmptyValue(row));
        continue;
      }
      try {
        records.add(_build(type, value, extra));
      } on FormatException catch (e) {
        errors.add(L10n.current.csvRowError(e.message, row));
      } on QuickLinkException catch (e) {
        errors.add(L10n.current.csvRowError(e.message, row));
      }
    }
    return CsvImportResult(records, errors);
  }

  /// One record from a CSV row's type / value / extra cells. Throws
  /// [FormatException] or [QuickLinkException] when invalid.
  static NdefRecordModel buildRecord(String type, String value, String extra) =>
      _build(type.trim().toLowerCase(), value.trim(), extra.trim());

  static NdefRecordModel _build(String type, String value, String extra) {
    switch (type) {
      case 'url':
      case 'uri':
      case 'link':
      case 'web':
        if (!QuickLinkBuilder.isValidUri(value)) {
          throw FormatException(L10n.current.csvInvalidAddress);
        }
        return NdefCodec.encodeUri(value);
      case 'metin':
      case 'text':
        return NdefCodec.encodeText(value);
      case 'telefon':
      case 'phone':
      case 'tel':
        return NdefCodec.encodePhone(value);
      case 'eposta':
      case 'e-posta':
      case 'email':
      case 'mail':
        if (!value.contains('@')) {
          throw FormatException(L10n.current.csvInvalidEmail);
        }
        return NdefCodec.encodeEmail(recipient: value, subject: extra.isEmpty ? null : extra);
      case 'sms':
        return NdefCodec.encodeSms(phoneNumber: value, message: extra.isEmpty ? null : extra);
      case 'konum':
      case 'location':
      case 'geo':
        final lat = double.tryParse(value);
        final lng = double.tryParse(extra);
        if (lat == null || lng == null || lat.abs() > 90 || lng.abs() > 180) {
          throw FormatException(L10n.current.csvInvalidLocation);
        }
        return NdefCodec.encodeLocation(latitude: lat, longitude: lng);
      case 'wifi':
        if (extra.isNotEmpty && (extra.length < 8 || extra.length > 63)) {
          throw FormatException(L10n.current.csvWifiPasswordLength);
        }
        return NdefCodec.encodeWifiWsc(
          ssid: value,
          authType: extra.isEmpty ? WifiAuthType.open : WifiAuthType.wpa2Psk,
          password: extra,
          encryptionType: extra.isEmpty ? WifiEncryptionType.none : WifiEncryptionType.aes,
        );
      default:
        throw FormatException(L10n.current.csvUnknownType(type));
    }
  }

  /// Splits one CSV line, honouring double quotes ("a,b" and "" escapes).
  static List<String> splitLine(String line) {
    final cells = <String>[];
    final current = StringBuffer();
    bool quoted = false;
    for (int i = 0; i < line.length; i++) {
      final ch = line[i];
      if (quoted) {
        if (ch == '"') {
          if (i + 1 < line.length && line[i + 1] == '"') {
            current.write('"');
            i++;
          } else {
            quoted = false;
          }
        } else {
          current.write(ch);
        }
      } else if (ch == '"') {
        quoted = true;
      } else if (ch == ',' || ch == ';') {
        cells.add(current.toString());
        current.clear();
      } else {
        current.write(ch);
      }
    }
    cells.add(current.toString());
    return cells;
  }
}

/// Turns a scanned QR payload into a record: Wi-Fi QR, URL/URI or plain text.
class QrRecordImporter {
  static NdefRecordModel fromQr(String raw) {
    final value = raw.trim();
    if (value.toUpperCase().startsWith('WIFI:')) {
      final wifi = _parseWifi(value);
      if (wifi != null) return wifi;
    }
    if (QuickLinkBuilder.isValidUri(value) && !value.contains(' ') && value.contains(':')) {
      return NdefCodec.encodeUri(value);
    }
    return NdefCodec.encodeText(value);
  }

  static NdefRecordModel? _parseWifi(String value) {
    final fields = <String, String>{};
    final body = value.substring(5);
    final buffer = StringBuffer();
    String? key;
    for (int i = 0; i < body.length; i++) {
      final ch = body[i];
      if (ch == '\\' && i + 1 < body.length) {
        buffer.write(body[++i]);
      } else if (ch == ':' && key == null) {
        key = buffer.toString().toUpperCase();
        buffer.clear();
      } else if (ch == ';') {
        if (key != null) fields[key] = buffer.toString();
        key = null;
        buffer.clear();
      } else {
        buffer.write(ch);
      }
    }
    final ssid = fields['S'];
    if (ssid == null || ssid.isEmpty) return null;
    final password = fields['P'] ?? '';
    final type = (fields['T'] ?? '').toUpperCase();
    final open = type == 'NOPASS' || password.isEmpty;
    return NdefCodec.encodeWifiWsc(
      ssid: ssid,
      authType: open ? WifiAuthType.open : WifiAuthType.wpa2Psk,
      password: open ? '' : password,
      encryptionType: open ? WifiEncryptionType.none : WifiEncryptionType.aes,
    );
  }
}
