import 'dart:async';
import 'package:flutter/services.dart';

/// Actions that can open the app from outside: a `nfctagmaster://<action>`
/// link (for example written on a tag or used in a Shortcuts automation) or a
/// Siri shortcut.
enum LaunchAction { scan, write, tools, history, settings }

class LaunchActionService {
  static const MethodChannel _channel = MethodChannel('com.antigravity.nfc_tag_master/launch');

  final StreamController<LaunchAction> _actions = StreamController<LaunchAction>.broadcast();

  /// Emits every action requested while the app is running or at launch.
  Stream<LaunchAction> get actions => _actions.stream;

  /// Starts listening; also delivers an action that launched the app.
  Future<void> start() async {
    _channel.setMethodCallHandler((call) async {
      if (call.method == 'launchActionAvailable') {
        await _take();
      }
    });
    await _take();
  }

  Future<void> _take() async {
    try {
      final code = await _channel.invokeMethod<String>('takeLaunchAction');
      final action = parse(code);
      if (action != null) _actions.add(action);
    } on MissingPluginException {
      // Not available (tests, web preview)
    } on PlatformException {
      // Ignore: launching normally
    }
  }

  static LaunchAction? parse(String? code) {
    for (final action in LaunchAction.values) {
      if (action.name == code) return action;
    }
    return null;
  }

  /// Link that opens the app and runs [action], e.g. `nfctagmaster://scan`.
  static String linkFor(LaunchAction action) => 'nfctagmaster://${action.name}';

  void dispose() {
    _channel.setMethodCallHandler(null);
    _actions.close();
  }

  /// Asks the store for the system review prompt (shown at the OS's discretion).
  static Future<bool> requestReview() => _invokeBool('requestReview');

  /// Opens a URL (sms:, tel:, https:, maps…) in the matching system app.
  static Future<bool> openUrl(String url) => _invokeBool('openUrl', {'url': url});

  static Future<bool> _invokeBool(String method, [Map<String, Object?>? args]) async {
    try {
      return await _channel.invokeMethod<bool>(method, args) ?? false;
    } on MissingPluginException {
      return false;
    } on PlatformException {
      return false;
    }
  }

  /// Text found in the image at [path] (iPhone, on-device Vision). Null
  /// when unsupported or nothing could be read.
  static Future<String?> recognizeText(String path) async {
    try {
      final text = await _channel.invokeMethod<String>('recognizeText', {'path': path});
      return (text == null || text.trim().isEmpty) ? null : text.trim();
    } on MissingPluginException {
      return null;
    } on PlatformException {
      return null;
    }
  }

  /// Switches the iPhone home screen icon; null restores the default.
  static Future<bool> setAppIcon(String? name) => _invokeBool('setAppIcon', {'name': name});

  /// Alternate icon in use (null = default or unsupported).
  static Future<String?> currentAppIcon() async {
    try {
      return await _channel.invokeMethod<String>('currentAppIcon');
    } on MissingPluginException {
      return null;
    } on PlatformException {
      return null;
    }
  }

  /// Blurs the app in the app switcher (iOS) / hides it in Recents (Android).
  static Future<bool> setPrivacyCover(bool enabled) => _invokeBool('setPrivacyCover', {'enabled': enabled});

  /// Whether the device has Face ID / Touch ID / a passcode to unlock with.
  static Future<bool> canAuthenticate() => _invokeBool('canAuthenticate');

  /// Shows the system unlock prompt. Null when no device lock is set up.
  static Future<bool?> authenticate({required String reason, String title = ''}) async {
    try {
      return await _channel.invokeMethod<bool>('authenticate', {'reason': reason, 'title': title});
    } on MissingPluginException {
      return null;
    } on PlatformException {
      return false;
    }
  }
}
