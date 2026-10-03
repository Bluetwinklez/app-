import 'dart:convert';
import 'dart:typed_data';

import 'ndef_record.dart';

/// Numbering rule for batch writes: tag `index` (0-based) gets
/// `prefix + (start + index * step, zero padded) + suffix`.
///
/// When any text, URI or text-based MIME record contains [placeholder], the
/// number replaces it there. Otherwise a separate text record carrying the
/// number is appended, so every tag still ends up unique.
class SerialPlan {
  static const String placeholder = '{n}';
  static const int maxPadding = 8;

  final String prefix;
  final String suffix;
  final int start;
  final int step;
  final int padding;

  const SerialPlan({
    this.prefix = '',
    this.suffix = '',
    this.start = 1,
    this.step = 1,
    this.padding = 3,
  })  : assert(start >= 0),
        assert(step >= 1),
        assert(padding >= 0 && padding <= maxPadding);

  String valueAt(int index) {
    final number = (start + index * step).toString().padLeft(padding, '0');
    return '$prefix$number$suffix';
  }

  /// True when at least one record carries [placeholder].
  static bool hasPlaceholder(List<NdefRecordModel> records) =>
      records.any((r) => _textOf(r)?.contains(placeholder) ?? false);

  List<NdefRecordModel> apply(List<NdefRecordModel> records, int index) {
    final value = valueAt(index);
    if (!hasPlaceholder(records)) {
      return [...records, NdefCodec.encodeText(value)];
    }
    return [for (final r in records) _replace(r, value)];
  }

  static NdefRecordModel _replace(NdefRecordModel record, String value) {
    final text = NdefCodec.decodeText(record);
    if (text != null) {
      if (!text.contains(placeholder)) return record;
      return NdefCodec.encodeText(text.replaceAll(placeholder, value),
          langCode: _textLang(record));
    }
    final uri = NdefCodec.decodeUri(record);
    if (uri != null) {
      if (!uri.contains(placeholder)) return record;
      // Numbers inside a URI must stay URL-safe.
      return NdefCodec.encodeUri(
          uri.replaceAll(placeholder, Uri.encodeComponent(value)));
    }
    final mime = _mimeText(record);
    if (mime != null && mime.contains(placeholder)) {
      return NdefRecordModel(
        tnf: record.tnf,
        type: record.type,
        id: record.id,
        payload: Uint8List.fromList(utf8.encode(mime.replaceAll(placeholder, value))),
      );
    }
    return record;
  }

  static String? _textOf(NdefRecordModel r) =>
      NdefCodec.decodeText(r) ?? NdefCodec.decodeUri(r) ?? _mimeText(r);

  /// Payload of text-like MIME records (vCard, calendar, text/*), if valid UTF-8.
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
