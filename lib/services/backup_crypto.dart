import 'dart:convert';

import 'package:cryptography/cryptography.dart';

class BackupDecryptException implements Exception {
  final bool wrongPassword;
  const BackupDecryptException({this.wrongPassword = false});
}

/// Password protection for backup files: PBKDF2-HMAC-SHA256 key derivation
/// and AES-256-GCM. The result is a small JSON wrapper so encrypted files
/// are recognised on import.
class BackupCrypto {
  static const String format = 'nfc-tag-master-encrypted';
  static const int defaultIterations = 120000;
  static const int minPasswordLength = 6;

  static Future<SecretKey> _key(String password, List<int> salt, int iterations) =>
      Pbkdf2(macAlgorithm: Hmac.sha256(), iterations: iterations, bits: 256)
          .deriveKeyFromPassword(password: password, nonce: salt);

  static Future<String> encrypt(String plain, String password, {int iterations = defaultIterations}) async {
    final aes = AesGcm.with256bits();
    final salt = SecretKeyData.random(length: 16).bytes;
    final key = await _key(password, salt, iterations);
    final box = await aes.encrypt(utf8.encode(plain), secretKey: key);
    return jsonEncode({
      'format': format,
      'v': 1,
      'kdf': 'pbkdf2-sha256',
      'iter': iterations,
      'salt': base64Encode(salt),
      'nonce': base64Encode(box.nonce),
      'ct': base64Encode(box.cipherText),
      'mac': base64Encode(box.mac.bytes),
    });
  }

  static bool isEncrypted(String content) {
    final t = content.trimLeft();
    if (!t.startsWith('{') || !t.contains(format)) return false;
    try {
      final m = jsonDecode(t);
      return m is Map && m['format'] == format;
    } on FormatException {
      return false;
    }
  }

  static Future<String> decrypt(String content, String password) async {
    final Map<String, dynamic> m;
    try {
      m = Map<String, dynamic>.from(jsonDecode(content) as Map);
    } catch (_) {
      throw const BackupDecryptException();
    }
    if (m['format'] != format || m['v'] != 1) throw const BackupDecryptException();
    final iterations = m['iter'];
    if (iterations is! int || iterations < 1000 || iterations > 5000000) {
      throw const BackupDecryptException();
    }
    try {
      final key = await _key(password, base64Decode(m['salt'] as String), iterations);
      final box = SecretBox(
        base64Decode(m['ct'] as String),
        nonce: base64Decode(m['nonce'] as String),
        mac: Mac(base64Decode(m['mac'] as String)),
      );
      final plain = await AesGcm.with256bits().decrypt(box, secretKey: key);
      return utf8.decode(plain);
    } on SecretBoxAuthenticationError {
      throw const BackupDecryptException(wrongPassword: true);
    } catch (e) {
      if (e is BackupDecryptException) rethrow;
      throw const BackupDecryptException();
    }
  }
}
