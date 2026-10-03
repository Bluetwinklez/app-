import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/domain/storage_models.dart';
import 'package:nfc_tag_master/services/app_storage_service.dart';

void main() {
  test('history labels persist and update in place', () async {
    final dir = await Directory.systemTemp.createTemp('hist');
    addTearDown(() => dir.delete(recursive: true));
    final a = LocalFileAppStorageService(baseDirectoryPath: dir.path);
    await a.init();
    await a.setHistoryEnabled(true);
    final e = ScanHistoryEntry(id: 'h1', timestamp: DateTime(2026), identifier: '04AA');
    await a.addHistoryEntry(e);
    await a.updateHistoryEntry(e.withLabels(['ofis', 'kontrol']));
    final b = LocalFileAppStorageService(baseDirectoryPath: dir.path);
    await b.init();
    expect(b.getHistory().single.labels, ['ofis', 'kontrol']);
    expect(b.getHistory().single.identifier, '04AA');
  });
}
