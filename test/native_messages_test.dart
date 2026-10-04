import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/l10n/l10n.dart';
import 'package:nfc_tag_master/services/native_messages.dart';

void main() {
  setUp(() {
    L10n.update(const Locale('en'));
  });

  test('error codes become messages in the app language', () {
    expect(NativeMessages.forError('OPERATION_IN_PROGRESS', 'Zaten devam eden', fallback: 'x'),
        startsWith('Another NFC operation'));
    expect(
      NativeMessages.forError('CAPACITY_EXCEEDED', 'Etiket kapasitesi yetersiz',
          details: {'required': 200, 'capacity': 137}, fallback: 'x'),
      contains('200'),
    );
    expect(NativeMessages.forError('CAPACITY_EXCEEDED', null, fallback: 'x'), 'Not enough space on the tag.');
    expect(NativeMessages.forError('UNSUPPORTED_TAG', 'Bu araç yalnızca NTAG ...', fallback: 'x'),
        contains('NTAG / MIFARE'));
  });

  test('shared codes depend on whether the user was locking', () {
    final write = NativeMessages.forError('TAG_NOT_WRITABLE', null, fallback: 'x');
    final lock = NativeMessages.forError('TAG_NOT_WRITABLE', null, fallback: 'x', locking: true);
    expect(write, isNot(lock));
    expect(lock, contains('before locking'));
  });

  test('system details are kept in brackets, unknown codes use the fallback', () {
    expect(NativeMessages.forError('READ_FAILED', 'Tag connection lost', fallback: 'x'),
        endsWith('(Tag connection lost)'));
    expect(NativeMessages.forError('SOMETHING_NEW', 'native', fallback: 'fb'), 'fb');
  });

  test('iOS sheet texts keep the capacity placeholders for Swift', () {
    final sheet = NativeMessages.sheet();
    expect(sheet['capacity'], allOf(contains('{required}'), contains('{max}')));
    expect(sheet.values.every((v) => v.isNotEmpty), isTrue);
  });
}
