import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/app_info.dart';

void main() {
  test('AppInfo.version matches pubspec.yaml', () {
    final line = File('pubspec.yaml').readAsLinesSync().firstWhere((l) => l.startsWith('version:'));
    expect(line.split(':').last.trim().split('+').first, AppInfo.version);
  });

  test('CHANGELOG mentions the current version', () {
    expect(File('CHANGELOG.md').readAsStringSync(), contains('## ${AppInfo.version}'));
  });
}
