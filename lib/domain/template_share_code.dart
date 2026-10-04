import 'dart:convert';

import 'ndef_record.dart';

/// A template packed into a QR-friendly string so another phone running the
/// app can scan it: `nfctm1:` + base64url(JSON {n: name, r: records}).
class TemplateShareCode {
  static const String prefix = 'nfctm1:';
  static const int maxRecords = 20;

  static String encode(String name, List<NdefRecordModel> records) {
    final json = jsonEncode({'n': name, 'r': [for (final r in records) r.toJsonMap()]});
    return '$prefix${base64Url.encode(utf8.encode(json)).replaceAll('=', '')}';
  }

  static bool isCode(String value) => value.trim().startsWith(prefix);

  /// (name, records) or null when the code is not valid.
  static (String, List<NdefRecordModel>)? decode(String value) {
    final v = value.trim();
    if (!v.startsWith(prefix)) return null;
    try {
      var data = v.substring(prefix.length);
      data = data.padRight(data.length + (4 - data.length % 4) % 4, '=');
      final map = jsonDecode(utf8.decode(base64Url.decode(data)));
      if (map is! Map) return null;
      final raw = map['r'];
      if (raw is! List || raw.isEmpty || raw.length > maxRecords) return null;
      return (
        (map['n'] as String? ?? '').trim(),
        [for (final r in raw) NdefRecordModel.fromJsonMap(Map<String, dynamic>.from(r as Map))],
      );
    } catch (_) {
      return null;
    }
  }
}
