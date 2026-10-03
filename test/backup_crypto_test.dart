import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/services/backup_crypto.dart';

void main() {
  test('round trip, wrong password and tampering', () async {
    const plain = '{"schemaVersion":2,"note":"Wi-Fi şifresi"}';
    final enc = await BackupCrypto.encrypt(plain, 'gizli-parola', iterations: 2000);
    expect(BackupCrypto.isEncrypted(enc), isTrue);
    expect(BackupCrypto.isEncrypted(plain), isFalse);
    expect(enc, isNot(contains('Wi-Fi')));
    expect(await BackupCrypto.decrypt(enc, 'gizli-parola'), plain);

    await expectLater(
      BackupCrypto.decrypt(enc, 'yanlis'),
      throwsA(isA<BackupDecryptException>().having((e) => e.wrongPassword, 'wrongPassword', isTrue)),
    );
    final tampered = enc.replaceFirst('"ct":"', '"ct":"AA');
    await expectLater(BackupCrypto.decrypt(tampered, 'gizli-parola'), throwsA(isA<BackupDecryptException>()));
  });

  test('two encryptions of the same data differ (random salt and nonce)', () async {
    final a = await BackupCrypto.encrypt('x', 'parola1', iterations: 1000);
    final b = await BackupCrypto.encrypt('x', 'parola1', iterations: 1000);
    expect(a, isNot(b));
  });
}
