import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/services/app_storage_service.dart';

void main() {
  test('favourite presets and last backup time survive a restart', () async {
    final dir = await Directory.systemTemp.createTemp('nfc_settings');
    addTearDown(() => dir.delete(recursive: true));
    final first = LocalFileAppStorageService(baseDirectoryPath: dir.path);
    await first.init();
    expect(first.lastBackupAt, isNull);
    final when = DateTime(2026, 9, 1, 10, 30);
    await first.setLastBackupAt(when);
    await first.setFavoritePresets(['playlist', 'guest_wifi']);

    final second = LocalFileAppStorageService(baseDirectoryPath: dir.path);
    await second.init();
    expect(second.lastBackupAt, when);
    expect(second.favoritePresets, ['playlist', 'guest_wifi']);
  });
}
