import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/domain/logbook.dart';
import 'package:nfc_tag_master/domain/tag_library.dart';
import 'package:nfc_tag_master/services/app_storage_service.dart';
import 'package:nfc_tag_master/services/secret_store.dart';
import 'package:nfc_tag_master/services/security_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('wipe erases data and restores defaults', () async {
    final s = InMemoryAppStorageService();
    final now = DateTime(2026);
    await s.saveLibraryEntry(TagLibraryEntry(id: '1', name: 'x', createdAt: now, updatedAt: now));
    await s.saveLogBook(LogBook(id: 'b', name: 'b', kind: LogBookKind.custom, createdAt: now));
    await s.setSigningKey('abc');
    await s.setAppLockEnabled(true);
    await s.setWriteCounter(7);
    await s.setLockAfterSeconds(0);
    await s.setOnboardingDone(true);
    await s.setLocaleCode('tr');
    await s.setLastBackupAt(now);
    await s.setICloudBackupEnabled(true);
    await s.setAccentIndex(2);
    await s.setTextScalePercent(130);
    await s.setSpeakAfterScan(true);
    await s.setFirstTagDone(true);
    await s.setAddMadeWith(true);

    await SecurityService.wipeAllData(s);
    expect(s.getLibrary(), isEmpty);
    expect(s.getLogBooks(), isEmpty);
    expect(s.signingKey, isNull);
    expect(s.appLockEnabled, isFalse);
    expect(s.writeCounter, 0);
    expect(s.lockAfterSeconds, 60);
    expect(s.onboardingDone, isFalse);
    expect(s.localeCode, 'en');
    expect(s.lastBackupAt, isNull);
    expect(s.iCloudBackupEnabled, isFalse);
    expect(s.accentIndex, 0);
    expect(s.textScalePercent, 100);
    expect(s.speakAfterScan, isFalse);
    expect(s.firstTagDone, isFalse);
    expect(s.addMadeWith, isFalse);
  });

  test('sensitive actions ask for authentication only when the lock is on', () async {
    final s = InMemoryAppStorageService();
    var asked = 0;
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
        const MethodChannel('com.antigravity.nfc_tag_master/launch'), (call) async {
      if (call.method == 'authenticate') {
        asked++;
        return false;
      }
      return null;
    });
    expect(await SecurityService.confirmSensitive(s, reason: 'r', title: 't'), isTrue);
    expect(asked, 0);
    await s.setAppLockEnabled(true);
    expect(await SecurityService.confirmSensitive(s, reason: 'r', title: 't'), isFalse);
    expect(asked, 1);
  });

  test('new security settings persist in the settings file', () async {
    final dir = await Directory.systemTemp.createTemp('sec');
    addTearDown(() => dir.delete(recursive: true));
    final a = LocalFileAppStorageService(baseDirectoryPath: dir.path);
    await a.init();
    expect(a.hideInSwitcher, isTrue);
    expect(a.clearClipboardAfterCopy, isTrue);
    await a.setHideInSwitcher(false);
    await a.setClearClipboardAfterCopy(false);
    await a.setLockAfterSeconds(300);
    final b = LocalFileAppStorageService(baseDirectoryPath: dir.path);
    await b.init();
    expect(b.hideInSwitcher, isFalse);
    expect(b.clearClipboardAfterCopy, isFalse);
    expect(b.lockAfterSeconds, 300);
  });

  test('signing key lives in the secret store and an old file key is migrated', () async {
    final dir = await Directory.systemTemp.createTemp('keys');
    addTearDown(() => dir.delete(recursive: true));
    // Older version: key in the settings file.
    final old = LocalFileAppStorageService(baseDirectoryPath: dir.path);
    await old.init();
    await old.setSigningKey('c2VjcmV0');
    expect(File('${dir.path}/nfc_app_settings.json').readAsStringSync(), contains('c2VjcmV0'));

    final secrets = MemorySecretStore();
    final s = LocalFileAppStorageService(baseDirectoryPath: dir.path, secrets: secrets);
    await s.init();
    expect(s.signingKey, 'c2VjcmV0');
    expect(secrets.values[LocalFileAppStorageService.signingKeySecret], 'c2VjcmV0');
    expect(File('${dir.path}/nfc_app_settings.json').readAsStringSync(), isNot(contains('c2VjcmV0')));

    await s.setSigningKey(null);
    expect(secrets.values, isEmpty);
    final again = LocalFileAppStorageService(baseDirectoryPath: dir.path, secrets: secrets);
    await again.init();
    expect(again.signingKey, isNull);
  });

  test('wipe removes sensitive recovery copies while preserving unrelated files', () async {
    final dir = await Directory.systemTemp.createTemp('wipe-recovery');
    addTearDown(() => dir.delete(recursive: true));
    final original = File('${dir.path}/nfc_scan_history.json');
    await original.writeAsString('{private unreadable history');
    final s = LocalFileAppStorageService(baseDirectoryPath: dir.path);
    await s.init();
    await File('${dir.path}/nfc_app_settings.json.bak_123').writeAsString('old key');
    await File('${dir.path}/nfc_tag_library.json.tmp_456').writeAsString('old tags');
    final unrelated = File('${dir.path}/unrelated.corrupt_123');
    await unrelated.writeAsString('keep');
    expect(await dir.list().where((file) =>
        file.path.contains('nfc_scan_history.json.corrupt_')).length, 1);
    await SecurityService.wipeAllData(s);
    final names = await dir.list().map((file) => file.path).toList();
    expect(names.where((name) => name.contains('.json.corrupt_') ||
        name.contains('.json.bak_') || name.contains('.json.tmp_')), isEmpty);
    expect(await unrelated.readAsString(), 'keep');
    final reopened = LocalFileAppStorageService(baseDirectoryPath: dir.path);
    await reopened.init();
    expect(reopened.getHistory(), isEmpty);
    expect(reopened.localeCode, 'en');
  });

}
