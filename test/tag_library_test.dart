import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/domain/ndef_record.dart';
import 'package:nfc_tag_master/domain/tag_library.dart';
import 'package:nfc_tag_master/services/app_storage_service.dart';

void main() {
  final now = DateTime(2026, 10, 2, 12);
  TagLibraryEntry entry(String id, String name) => TagLibraryEntry(
        id: id,
        name: name,
        note: 'Kapının yanında',
        category: TagCategory.home,
        locationNote: 'Mutfak',
        uid: '04:A1:B2',
        records: [NdefCodec.encodeUri('https://example.com/menu')],
        createdAt: now,
        updatedAt: now,
      );

  test('search matches name, note, location, uid and record content', () {
    final e = entry('1', 'Mutfak etiketi');
    expect(e.matches('mutfak'), isTrue);
    expect(e.matches('KAPI'), isTrue);
    expect(e.matches('04:a1'), isTrue);
    expect(e.matches('example.com/menu'), isTrue);
    expect(e.matches('araba'), isFalse);
    expect(e.matches(''), isTrue);
  });

  test('JSON round trip keeps every field', () {
    final e = entry('1', 'Mutfak').copyWith(photoPath: '/tmp/p.jpg');
    final back = TagLibraryEntry.fromJsonMap(e.toJsonMap());
    expect(back.name, 'Mutfak');
    expect(back.category, TagCategory.home);
    expect(back.photoPath, '/tmp/p.jpg');
    expect(NdefCodec.decodeUri(back.records.single), 'https://example.com/menu');
    expect(back.copyWith(clearPhoto: true).photoPath, isNull);
  });

  test('file storage persists, updates and deletes library entries', () async {
    final dir = await Directory.systemTemp.createTemp('nfc_lib_test');
    addTearDown(() => dir.delete(recursive: true));

    final first = LocalFileAppStorageService(baseDirectoryPath: dir.path);
    await first.init();
    await first.saveLibraryEntry(entry('1', 'Mutfak'));
    await first.saveLibraryEntry(entry('2', 'Araba'));
    await first.saveLibraryEntry(entry('1', 'Mutfak (güncel)'));

    final second = LocalFileAppStorageService(baseDirectoryPath: dir.path);
    await second.init();
    expect(second.getLibrary().map((e) => e.name), ['Araba', 'Mutfak (güncel)']);

    await second.deleteLibraryEntry('2');
    final third = LocalFileAppStorageService(baseDirectoryPath: dir.path);
    await third.init();
    expect(third.getLibrary().single.id, '1');
  });

  test('settings persist language, theme and onboarding', () async {
    final dir = await Directory.systemTemp.createTemp('nfc_settings_test');
    addTearDown(() => dir.delete(recursive: true));
    final a = LocalFileAppStorageService(baseDirectoryPath: dir.path);
    await a.init();
    await a.setLocaleCode('de');
    await a.setThemeMode('dark');
    await a.setOnboardingDone(true);
    final b = LocalFileAppStorageService(baseDirectoryPath: dir.path);
    await b.init();
    expect(b.localeCode, 'de');
    expect(b.themeMode, 'dark');
    expect(b.onboardingDone, isTrue);
  });
}
