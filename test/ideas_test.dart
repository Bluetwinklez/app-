import 'dart:ui';
import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/l10n/app_localizations.dart';
import 'package:nfc_tag_master/domain/template_gallery.dart';
import 'package:nfc_tag_master/ui/ideas_page.dart';

void main() {
  test('every preset idea points at an existing preset', () {
    final loc = lookupAppLocalizations(const Locale('tr'));
    var count = 0;
    for (final (_, ideas) in IdeasPage.sections(loc)) {
      for (final idea in ideas) {
        count++;
        if (idea.action case OpenPreset(:final presetId)) {
          expect(TemplateGallery.byId(presetId), isNotNull, reason: presetId);
        }
      }
    }
    expect(count, greaterThanOrEqualTo(20));
  });
}
