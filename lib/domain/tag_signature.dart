import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';

import 'ndef_record.dart';

enum SignatureStatus { none, valid, invalid, otherKey }

/// Tamper detection for tags: an extra NDEF record holds an HMAC-SHA256 of
/// the other records, made with a key that only you (and people you share
/// it with) have. Anyone can still read the tag; only key holders can tell
/// whether the content was changed.
class TagSignature {
  static final Uint8List recordType = Uint8List.fromList(ascii.encode('nfctagmaster.app:sig'));
  static const int version = 1;
  static const String exportPrefix = 'NTMK1:';

  static Uint8List generateKey() {
    final r = Random.secure();
    return Uint8List.fromList(List<int>.generate(32, (_) => r.nextInt(256)));
  }

  static List<int> keyId(List<int> key) => sha256.convert(key).bytes.sublist(0, 4);

  static bool isSignatureRecord(NdefRecordModel r) =>
      r.tnf == NdefTnf.external && _eq(r.type, recordType);

  static List<NdefRecordModel> withoutSignature(List<NdefRecordModel> records) =>
      records.where((r) => !isSignatureRecord(r)).toList();

  static List<int> _mac(List<NdefRecordModel> content, List<int> key) =>
      Hmac(sha256, key).convert(content.isEmpty ? const <int>[] : encodeNdefMessage(content)).bytes;

  /// Content records followed by a fresh signature record.
  static List<NdefRecordModel> sign(List<NdefRecordModel> records, List<int> key) {
    final content = withoutSignature(records);
    final payload = Uint8List.fromList([version, ...keyId(key), ..._mac(content, key)]);
    return [
      ...content,
      NdefRecordModel(tnf: NdefTnf.external, type: recordType, id: Uint8List(0), payload: payload),
    ];
  }

  static SignatureStatus verify(List<NdefRecordModel> records, List<int>? key) {
    final sigs = records.where(isSignatureRecord).toList();
    if (sigs.isEmpty) return SignatureStatus.none;
    final p = sigs.last.payload;
    if (p.length != 1 + 4 + 32 || p[0] != version) return SignatureStatus.invalid;
    if (key == null || !_eq(p.sublist(1, 5), keyId(key))) return SignatureStatus.otherKey;
    final expected = _mac(withoutSignature(records), key);
    return _constantTimeEq(p.sublist(5), expected) ? SignatureStatus.valid : SignatureStatus.invalid;
  }

  /// Shareable text form of a key, e.g. for a colleague's phone.
  static String exportKey(List<int> key) => '$exportPrefix${base64Encode(key)}';

  static Uint8List? importKey(String text) {
    final t = text.trim();
    if (!t.startsWith(exportPrefix)) return null;
    try {
      final k = base64Decode(t.substring(exportPrefix.length));
      return k.length == 32 ? Uint8List.fromList(k) : null;
    } on FormatException {
      return null;
    }
  }

  static bool _eq(List<int> a, List<int> b) {
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }

  static bool _constantTimeEq(List<int> a, List<int> b) {
    if (a.length != b.length) return false;
    var diff = 0;
    for (int i = 0; i < a.length; i++) {
      diff |= a[i] ^ b[i];
    }
    return diff == 0;
  }
}
