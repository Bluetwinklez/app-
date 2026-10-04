import 'ndef_record.dart';

/// What a phone's operating system does on its own when the tag is tapped
/// (no NFC app open). Phones act on the first record only.
enum TapAction { none, openUrl, openApp, call, sms, email, map, text, contact, wifi, calendar, other }

class TapPreview {
  final TapAction action;

  /// URL, number or address the action uses; empty when not applicable.
  final String target;

  /// Records after the first, which the system ignores.
  final int ignoredRecords;

  const TapPreview(this.action, {this.target = '', this.ignoredRecords = 0});

  static TapPreview of(List<NdefRecordModel> records) {
    if (records.isEmpty) return const TapPreview(TapAction.none);
    final ignored = records.length - 1;
    final parsed = NdefCodec.parseRecord(records.first);
    TapPreview make(TapAction a, [String target = '']) =>
        TapPreview(a, target: target, ignoredRecords: ignored);

    switch (parsed.type) {
      case ParsedRecordType.url:
        return _forUri(parsed.content, ignored);
      case ParsedRecordType.smartPoster:
        final uri = parsed.extra['uri'] as String?;
        return uri == null || uri.isEmpty ? make(TapAction.other) : _forUri(uri, ignored);
      case ParsedRecordType.phone:
        return make(TapAction.call, parsed.content);
      case ParsedRecordType.sms:
        return make(TapAction.sms, parsed.content);
      case ParsedRecordType.email:
        return make(TapAction.email, parsed.content);
      case ParsedRecordType.location:
        return make(TapAction.map, parsed.content);
      case ParsedRecordType.text:
        return make(TapAction.text, parsed.content);
      case ParsedRecordType.vcard:
        return make(TapAction.contact);
      case ParsedRecordType.wifi:
        return make(TapAction.wifi);
      case ParsedRecordType.calendar:
        return make(TapAction.calendar);
      case ParsedRecordType.customMime:
      case ParsedRecordType.unknown:
        return make(TapAction.other);
    }
  }

  static TapPreview _forUri(String uri, int ignored) {
    final lower = uri.toLowerCase();
    TapAction action;
    var target = uri;
    if (lower.startsWith('http://') || lower.startsWith('https://')) {
      action = TapAction.openUrl;
    } else if (lower.startsWith('tel:')) {
      action = TapAction.call;
      target = uri.substring(4);
    } else if (lower.startsWith('sms:')) {
      action = TapAction.sms;
      target = uri.substring(4).split('?').first;
    } else if (lower.startsWith('mailto:')) {
      action = TapAction.email;
      target = uri.substring(7).split('?').first;
    } else if (lower.startsWith('geo:')) {
      action = TapAction.map;
      target = uri.substring(4);
    } else if (lower.contains(':')) {
      action = TapAction.openApp;
      target = uri.substring(0, lower.indexOf(':'));
    } else {
      action = TapAction.other;
    }
    return TapPreview(action, target: target, ignoredRecords: ignored);
  }
}
