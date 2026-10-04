import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Small key/value store for secrets (Keychain on iOS, Keystore-backed
/// encrypted storage on Android).
abstract class SecretStore {
  Future<String?> read(String key);
  Future<void> write(String key, String? value);
}

class KeychainSecretStore implements SecretStore {
  static const _storage = FlutterSecureStorage(
    // Readable after the first unlock, never copied to another device.
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock_this_device),
  );

  @override
  Future<String?> read(String key) => _storage.read(key: key);

  @override
  Future<void> write(String key, String? value) =>
      value == null ? _storage.delete(key: key) : _storage.write(key: key, value: value);
}

/// Test double.
class MemorySecretStore implements SecretStore {
  final Map<String, String> values = {};

  @override
  Future<String?> read(String key) async => values[key];

  @override
  Future<void> write(String key, String? value) async =>
      value == null ? values.remove(key) : values[key] = value;
}
