import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/domain/logbook.dart';
import 'package:nfc_tag_master/domain/tag_library.dart';
import 'package:nfc_tag_master/services/app_storage_service.dart';
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

    await SecurityService.wipeAllData(s);
    expect(s.getLibrary(), isEmpty);
    expect(s.getLogBooks(), isEmpty);
    expect(s.signingKey, isNull);
    expect(s.appLockEnabled, isFalse);
    expect(s.writeCounter, 0);
    expect(s.lockAfterSeconds, 60);
    expect(s.onboardingDone, isFalse);
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
}
