import 'dart:convert';
import 'dart:typed_data';

import 'ndef_record.dart';

/// Finds and replaces placeholder text inside text, URI and text-based MIME
/// records (vCard, calendar, text/*), keeping each record's type and language.
class RecordText {
  /// Text of a record if it is text-like, else null.
  static String? textOf(NdefRecordModel r) =>
      NdefCodec.decodeText(r) ?? NdefCodec.decodeUri(r) ?? _mimeText(r);

  static bool containsAny(List<NdefRecordModel> records, Iterable<String> tokens) =>
      records.any((r) {
        final t = textOf(r);
        return t != null && tokens.any(t.contains);
      });

  /// Replaces every key of [values] with its value. Values placed inside a URI
  /// are percent-encoded so the link stays valid.
  static NdefRecordModel replace(NdefRecordModel record, Map<String, String> values) {
    String sub(String s, {bool uri = false}) {
      var out = s;
      values.forEach((k, v) => out = out.replaceAll(k, uri ? Uri.encodeComponent(v) : v));
      return out;
    }

    final text = NdefCodec.decodeText(record);
    if (text != null) {
      final next = sub(text);
      return next == text ? record : NdefCodec.encodeText(next, langCode: _textLang(record));
    }
    final uri = NdefCodec.decodeUri(record);
    if (uri != null) {
      final next = sub(uri, uri: true);
      return next == uri ? record : NdefCodec.encodeUri(next);
    }
    final mime = _mimeText(record);
    if (mime != null) {
      final next = sub(mime);
      if (next == mime) return record;
      return NdefRecordModel(
        tnf: record.tnf,
        type: record.type,
        id: record.id,
        payload: Uint8List.fromList(utf8.encode(next)),
      );
    }
    return record;
  }

  static String? _mimeText(NdefRecordModel r) {
    if (r.tnf != NdefTnf.media) return null;
    final type = ascii.decode(r.type, allowInvalid: true).toLowerCase();
    if (!type.startsWith('text/')) return null;
    try {
      return utf8.decode(r.payload);
    } on FormatException {
      return null;
    }
  }

  static String _textLang(NdefRecordModel r) {
    if (r.payload.isEmpty) return 'tr';
    final len = r.payload[0] & 0x3F;
    if (len == 0 || 1 + len > r.payload.length) return 'tr';
    return ascii.decode(r.payload.sublist(1, 1 + len), allowInvalid: true);
  }
}
