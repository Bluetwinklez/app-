import 'dart:ui';
import 'app_localizations.dart';

class L10n {
  static AppLocalizations _current = lookupAppLocalizations(const Locale('tr'));

  /// The active [AppLocalizations] instance for non-widget code (services, controllers, domain models).
  static AppLocalizations get current => _current;

  /// Update the current localization according to [locale].
  static void update(Locale locale) {
    try {
      _current = lookupAppLocalizations(locale);
    } catch (_) {
      _current = lookupAppLocalizations(const Locale('tr'));
    }
  }

  /// Manually set [AppLocalizations].
  static void set(AppLocalizations localizations) {
    _current = localizations;
  }
}
