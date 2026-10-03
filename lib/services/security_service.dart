import 'dart:async';

import 'package:flutter/services.dart';

import 'app_storage_service.dart';
import 'launch_action_service.dart';

/// Security helpers shared by the settings screen and sensitive actions.
class SecurityService {
  static const List<int> lockDelays = [0, 30, 60, 300, 900];
  static const Duration clipboardLifetime = Duration(seconds: 60);

  static Timer? _clipboardTimer;

  /// Copies [text]; when the setting is on, clears the clipboard after
  /// [clipboardLifetime] unless something else was copied meanwhile.
  static Future<void> copySensitive(AppStorageService storage, String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    _clipboardTimer?.cancel();
    if (!storage.clearClipboardAfterCopy) return;
    _clipboardTimer = Timer(clipboardLifetime, () async {
      try {
        final current = await Clipboard.getData(Clipboard.kTextPlain);
        if (current?.text == text) await Clipboard.setData(const ClipboardData(text: ''));
      } catch (_) {
        // Clipboard unavailable; nothing to clear.
      }
    });
  }

  /// When the app lock is on, asks for Face ID / passcode before a sensitive
  /// action. Returns true when the action may go ahead.
  static Future<bool> confirmSensitive(AppStorageService storage,
      {required String reason, required String title}) async {
    if (!storage.appLockEnabled) return true;
    final ok = await LaunchActionService.authenticate(reason: reason, title: title);
    // No device passcode any more: the lock cannot protect anything.
    return ok == true || ok == null;
  }

  /// Erases everything the app stores and restores default settings. Photos
  /// on disk are removed by the caller (they live outside the storage).
  static Future<void> wipeAllData(AppStorageService s) async {
    await s.clearHistory();
    await s.clearTemplates();
    await s.clearTagRules();
    for (final e in [...s.getLibrary()]) {
      await s.deleteLibraryEntry(e.id);
    }
    for (final b in [...s.getLogBooks()]) {
      await s.deleteLogBook(b.id);
    }
    await s.setSigningKey(null);
    await s.setSignOnWrite(false);
    await s.setWriteCounter(0);
    await s.setFavoritePresets(const []);
    await s.setAppLockEnabled(false);
    await s.setLockAfterSeconds(60);
    await s.setHideInSwitcher(true);
    await s.setClearClipboardAfterCopy(true);
    await s.setHistoryEnabled(false);
    await s.setSimpleMode(false);
    await s.setCompatibilityMode(false);
    await s.setHapticsEnabled(true);
    await s.setSoundsEnabled(false);
    await s.setThemeMode('system');
    await s.setLocaleCode(null);
    await s.setOnboardingDone(false);
  }
}
