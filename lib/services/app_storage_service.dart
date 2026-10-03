import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'secret_store.dart';
import '../domain/storage_models.dart';
import '../domain/tag_rule.dart';
import '../domain/tag_library.dart';
import '../domain/logbook.dart';
import 'backup_codec.dart';

/// Abstract storage service for app settings, scan history, write templates, and tag rules.
abstract class AppStorageService {
  Future<void> init();

  // Settings: History toggle (disabled by default)
  bool get isHistoryEnabled;
  Future<void> setHistoryEnabled(bool enabled);

  // Settings: UI preferences
  /// Language code chosen by the user (e.g. `tr`, `en`), or null to follow the device.
  String? get localeCode;
  Future<void> setLocaleCode(String? code);

  /// `system`, `light` or `dark`.
  String get themeMode;
  Future<void> setThemeMode(String mode);

  bool get onboardingDone;
  Future<void> setOnboardingDone(bool done);

  /// Haptic and sound feedback after scans and writes.
  bool get hapticsEnabled;
  Future<void> setHapticsEnabled(bool enabled);
  bool get soundsEnabled;
  Future<void> setSoundsEnabled(bool enabled);

  /// Gallery preset ids the user starred, most recent first.
  List<String> get favoritePresets;
  Future<void> setFavoritePresets(List<String> ids);

  /// When a backup was last exported successfully.
  DateTime? get lastBackupAt;
  Future<void> setLastBackupAt(DateTime time);

  /// Value of the last {counter} written by a template.
  int get writeCounter;
  Future<void> setWriteCounter(int value);

  /// Ask for Face ID / Touch ID / device passcode when opening the app.
  bool get appLockEnabled;
  Future<void> setAppLockEnabled(bool value);

  /// Base64 HMAC key for signed tags (null until created).
  String? get signingKey;
  Future<void> setSigningKey(String? value);

  /// Append a signature record to every written tag.
  bool get signOnWrite;
  Future<void> setSignOnWrite(bool value);

  /// Big-button simplified home screen.
  bool get simpleMode;
  Future<void> setSimpleMode(bool value);

  /// Seconds in the background before the app lock asks again (0 = immediately).
  int get lockAfterSeconds;
  Future<void> setLockAfterSeconds(int value);

  /// Cover the screen in the app switcher while the app is in the background.
  bool get hideInSwitcher;
  Future<void> setHideInSwitcher(bool value);

  /// Clear sensitive values (keys, dumps) from the clipboard 60 s after copying.
  bool get clearClipboardAfterCopy;
  Future<void> setClearClipboardAfterCopy(bool value);

  /// Accent colour preset (see AppColors.accentPresets).
  int get accentIndex;
  Future<void> setAccentIndex(int value);

  /// Extra text size, percent (100 = system size).
  int get textScalePercent;
  Future<void> setTextScalePercent(int value);

  /// Read the tag content aloud after each scan.
  bool get speakAfterScan;
  Future<void> setSpeakAfterScan(bool value);

  /// The user wrote a tag or dismissed the first-tag card.
  bool get firstTagDone;
  Future<void> setFirstTagDone(bool value);

  /// Append a short "made with" text record to written tags.
  bool get addMadeWith;
  Future<void> setAddMadeWith(bool value);

  /// Compatibility mode: skip read-back verification after writes.
  bool get compatibilityMode;
  Future<void> setCompatibilityMode(bool enabled);

  // Scan History
  List<ScanHistoryEntry> getHistory();
  Future<void> addHistoryEntry(ScanHistoryEntry entry);
  Future<void> deleteHistoryEntry(String id);
  Future<void> clearHistory();

  // Write Templates
  List<WriteTemplate> getTemplates();
  Future<void> saveTemplate(WriteTemplate template);
  Future<void> deleteTemplate(String id);
  Future<void> clearTemplates();

  // In-app Tag Rules (Keyed by SHA-256 of exact NDEF bytes)
  List<TagRule> getTagRules();
  TagRule? getTagRuleBySha256(String ndefSha256);
  Future<void> saveTagRule(TagRule rule);
  Future<void> deleteTagRule(String ndefSha256);
  Future<void> clearTagRules();

  // Tag library (named physical tags)
  List<TagLibraryEntry> getLibrary();
  Future<void> saveLibraryEntry(TagLibraryEntry entry);
  Future<void> deleteLibraryEntry(String id);

  // Logbooks (attendance, medication, inventory…)
  List<LogBook> getLogBooks();
  Future<void> saveLogBook(LogBook book);
  Future<void> deleteLogBook(String id);

  // Backup & Merge Import
  /// Merges imported templates, rules, and optional history.
  /// Does NOT wipe existing data.
  /// If history is disabled locally, history is either skipped or explicitly enabled per [enableHistoryIfDisabled].
  Future<ImportMergeResult> mergeBackup(
    BackupPayload backup, {
    bool enableHistoryIfDisabled = false,
  });
}

/// In-memory storage implementation (excellent for unit tests and fallback)
class InMemoryAppStorageService implements AppStorageService {
  bool _historyEnabled = false;
  String? _localeCode;
  String _themeMode = 'system';
  bool _onboardingDone = false;
  bool _hapticsEnabled = true;
  bool _soundsEnabled = false;
  final List<ScanHistoryEntry> _history = [];
  final List<WriteTemplate> _templates = [];
  final Map<String, TagRule> _rules = {};
  final List<TagLibraryEntry> _library = [];

  @override
  Future<void> init() async {}

  @override
  bool get hapticsEnabled => _hapticsEnabled;

  @override
  Future<void> setHapticsEnabled(bool enabled) async => _hapticsEnabled = enabled;

  @override
  bool get soundsEnabled => _soundsEnabled;

  @override
  Future<void> setSoundsEnabled(bool enabled) async => _soundsEnabled = enabled;

  List<String> _favoritePresets = const [];

  @override
  List<String> get favoritePresets => _favoritePresets;

  @override
  Future<void> setFavoritePresets(List<String> ids) async =>
      _favoritePresets = List.unmodifiable(ids);

  DateTime? _lastBackupAt;

  @override
  DateTime? get lastBackupAt => _lastBackupAt;

  @override
  Future<void> setLastBackupAt(DateTime time) async => _lastBackupAt = time;

  bool _compatibilityMode = false;

  @override
  bool get compatibilityMode => _compatibilityMode;

  @override
  Future<void> setCompatibilityMode(bool enabled) async => _compatibilityMode = enabled;

  bool _addMadeWith = false;

  @override
  bool get addMadeWith => _addMadeWith;

  @override
  Future<void> setAddMadeWith(bool value) async => _addMadeWith = value;

  bool _firstTagDone = false;

  @override
  bool get firstTagDone => _firstTagDone;

  @override
  Future<void> setFirstTagDone(bool value) async => _firstTagDone = value;

  bool _speakAfterScan = false;

  @override
  bool get speakAfterScan => _speakAfterScan;

  @override
  Future<void> setSpeakAfterScan(bool value) async => _speakAfterScan = value;

  int _textScalePercent = 100;

  @override
  int get textScalePercent => _textScalePercent;

  @override
  Future<void> setTextScalePercent(int value) async => _textScalePercent = value;

  int _accentIndex = 0;

  @override
  int get accentIndex => _accentIndex;

  @override
  Future<void> setAccentIndex(int value) async => _accentIndex = value;

  bool _clearClipboardAfterCopy = true;

  @override
  bool get clearClipboardAfterCopy => _clearClipboardAfterCopy;

  @override
  Future<void> setClearClipboardAfterCopy(bool value) async => _clearClipboardAfterCopy = value;

  bool _hideInSwitcher = true;

  @override
  bool get hideInSwitcher => _hideInSwitcher;

  @override
  Future<void> setHideInSwitcher(bool value) async => _hideInSwitcher = value;

  int _lockAfterSeconds = 60;

  @override
  int get lockAfterSeconds => _lockAfterSeconds;

  @override
  Future<void> setLockAfterSeconds(int value) async => _lockAfterSeconds = value;

  bool _simpleMode = false;

  @override
  bool get simpleMode => _simpleMode;

  @override
  Future<void> setSimpleMode(bool value) async => _simpleMode = value;

  bool _signOnWrite = false;

  @override
  bool get signOnWrite => _signOnWrite;

  @override
  Future<void> setSignOnWrite(bool value) async => _signOnWrite = value;

  String? _signingKey;

  @override
  String? get signingKey => _signingKey;

  @override
  Future<void> setSigningKey(String? value) async => _signingKey = value;

  bool _appLockEnabled = false;

  @override
  bool get appLockEnabled => _appLockEnabled;

  @override
  Future<void> setAppLockEnabled(bool value) async => _appLockEnabled = value;

  int _writeCounter = 0;

  @override
  int get writeCounter => _writeCounter;

  @override
  Future<void> setWriteCounter(int value) async => _writeCounter = value;

  @override
  List<TagLibraryEntry> getLibrary() => List.unmodifiable(_library);

  @override
  Future<void> saveLibraryEntry(TagLibraryEntry entry) async {
    final index = _library.indexWhere((e) => e.id == entry.id);
    if (index >= 0) {
      _library[index] = entry;
    } else {
      _library.insert(0, entry);
    }
  }

  final List<LogBook> _logBooks = [];

  @override
  List<LogBook> getLogBooks() => List.unmodifiable(_logBooks);

  @override
  Future<void> saveLogBook(LogBook book) async {
    final i = _logBooks.indexWhere((b) => b.id == book.id);
    if (i >= 0) {
      _logBooks[i] = book;
    } else {
      _logBooks.insert(0, book);
    }
  }

  @override
  Future<void> deleteLogBook(String id) async => _logBooks.removeWhere((b) => b.id == id);

  @override
  Future<void> deleteLibraryEntry(String id) async {
    _library.removeWhere((e) => e.id == id);
  }

  @override
  bool get isHistoryEnabled => _historyEnabled;

  @override
  Future<void> setHistoryEnabled(bool enabled) async {
    _historyEnabled = enabled;
  }

  @override
  String? get localeCode => _localeCode;

  @override
  Future<void> setLocaleCode(String? code) async {
    _localeCode = code;
  }

  @override
  String get themeMode => _themeMode;

  @override
  Future<void> setThemeMode(String mode) async {
    _themeMode = mode;
  }

  @override
  bool get onboardingDone => _onboardingDone;

  @override
  Future<void> setOnboardingDone(bool done) async {
    _onboardingDone = done;
  }

  @override
  List<ScanHistoryEntry> getHistory() => List.unmodifiable(_history);

  @override
  Future<void> addHistoryEntry(ScanHistoryEntry entry) async {
    if (!_historyEnabled) return;
    _history.insert(0, entry);
  }

  @override
  Future<void> deleteHistoryEntry(String id) async {
    _history.removeWhere((item) => item.id == id);
  }

  @override
  Future<void> clearHistory() async {
    _history.clear();
  }

  @override
  List<WriteTemplate> getTemplates() => List.unmodifiable(_templates);

  @override
  Future<void> saveTemplate(WriteTemplate template) async {
    final index = _templates.indexWhere((t) => t.id == template.id);
    if (index >= 0) {
      _templates[index] = template;
    } else {
      _templates.insert(0, template);
    }
  }

  @override
  Future<void> deleteTemplate(String id) async {
    _templates.removeWhere((t) => t.id == id);
  }

  @override
  Future<void> clearTemplates() async {
    _templates.clear();
  }

  @override
  List<TagRule> getTagRules() => List.unmodifiable(_rules.values.toList());

  @override
  TagRule? getTagRuleBySha256(String ndefSha256) =>
      _rules[ndefSha256.toLowerCase()];

  @override
  Future<void> saveTagRule(TagRule rule) async {
    _rules[rule.ndefSha256.toLowerCase()] = rule;
  }

  @override
  Future<void> deleteTagRule(String ndefSha256) async {
    _rules.remove(ndefSha256.toLowerCase());
  }

  @override
  Future<void> clearTagRules() async {
    _rules.clear();
  }

  @override
  Future<ImportMergeResult> mergeBackup(
    BackupPayload backup, {
    bool enableHistoryIfDisabled = false,
  }) async {
    int addedTemplates = 0;
    int updatedTemplates = 0;
    int addedHistory = 0;
    int skippedHistory = 0;
    bool historySkippedDueToDisabled = false;
    int addedRules = 0;
    int updatedRules = 0;

    // 1. Merge templates by ID
    for (final tpl in backup.templates) {
      final index = _templates.indexWhere((t) => t.id == tpl.id);
      if (index >= 0) {
        // Preserve the user's existing template on ID collision.
      } else {
        _templates.add(tpl);
        addedTemplates++;
      }
    }

    // 2. Merge tag rules by SHA-256
    if (backup.tagRules != null) {
      for (final rule in backup.tagRules!) {
        final key = rule.ndefSha256.toLowerCase();
        if (_rules.containsKey(key)) {
          // Preserve the user's existing note on hash collision.
        } else {
          _rules[key] = rule;
          addedRules++;
        }
      }
    }

    // Tag library: add entries that are not on this device yet
    int addedLibrary = 0;
    for (final entry in backup.tagLibrary ?? const <TagLibraryEntry>[]) {
      if (!_library.any((e) => e.id == entry.id)) {
        _library.add(entry);
        addedLibrary++;
      }
    }

    // 3. Merge history (if present)
    if (backup.history != null && backup.history!.isNotEmpty) {
      if (!_historyEnabled && !enableHistoryIfDisabled) {
        historySkippedDueToDisabled = true;
        skippedHistory = backup.history!.length;
      } else {
        if (!_historyEnabled && enableHistoryIfDisabled) {
          _historyEnabled = true;
        }
        for (final entry in backup.history!) {
          final exists = _history.any((h) => h.id == entry.id);
          if (exists) {
            skippedHistory++;
          } else {
            _history.add(entry);
            addedHistory++;
          }
        }
        // Keep sorted by timestamp descending
        _history.sort((a, b) => b.timestamp.compareTo(a.timestamp));
      }
    }

    return ImportMergeResult(
      addedTemplates: addedTemplates,
      updatedTemplates: updatedTemplates,
      addedHistory: addedHistory,
      skippedHistory: skippedHistory,
      historySkippedDueToDisabled: historySkippedDueToDisabled,
      addedRules: addedRules,
      updatedRules: updatedRules,
      addedLibrary: addedLibrary,
    );
  }
}

/// Robust file-based JSON storage implementation for Flutter.
/// Stores configuration, history, templates, and tag rules in isolated JSON files
/// with in-memory caching and atomic file writes.
class LocalFileAppStorageService implements AppStorageService {
  final String baseDirectoryPath;

  bool _isHistoryEnabled = false;
  String? _localeCode;
  String _themeMode = 'system';
  bool _onboardingDone = false;
  bool _hapticsEnabled = true;
  bool _soundsEnabled = false;
  final List<ScanHistoryEntry> _history = [];
  final List<WriteTemplate> _templates = [];
  final Map<String, TagRule> _rules = {};
  final List<TagLibraryEntry> _library = [];

  /// When set, the signing key lives here (Keychain) instead of the settings
  /// file; a key found in an older settings file is moved over on init.
  final SecretStore? secrets;
  static const String signingKeySecret = 'signing_key';

  LocalFileAppStorageService({required this.baseDirectoryPath, this.secrets});

  File get _settingsFile => File('$baseDirectoryPath/nfc_app_settings.json');
  File get _historyFile => File('$baseDirectoryPath/nfc_scan_history.json');
  File get _templatesFile =>
      File('$baseDirectoryPath/nfc_write_templates.json');
  File get _tagRulesFile => File('$baseDirectoryPath/nfc_tag_rules.json');
  File get _libraryFile => File('$baseDirectoryPath/nfc_tag_library.json');
  File get _logBooksFile => File('$baseDirectoryPath/nfc_logbooks.json');
  final List<LogBook> _logBooks = [];

  @override
  Future<void> init() async {
    final dir = Directory(baseDirectoryPath);
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }

    // Load Settings
    try {
      if (await _settingsFile.exists()) {
        final content = await _settingsFile.readAsString();
        if (content.trim().isNotEmpty) {
          final data = jsonDecode(content) as Map<String, dynamic>;
          _isHistoryEnabled = data['historyEnabled'] as bool? ?? false;
          _localeCode = data['localeCode'] as String?;
          _themeMode = data['themeMode'] as String? ?? 'system';
          _onboardingDone = data['onboardingDone'] as bool? ?? false;
          _hapticsEnabled = data['hapticsEnabled'] as bool? ?? true;
          _soundsEnabled = data['soundsEnabled'] as bool? ?? false;
          final favs = data['favoritePresets'];
          _favoritePresets = favs is List
              ? List.unmodifiable(favs.whereType<String>().take(100))
              : const [];
          _lastBackupAt = DateTime.tryParse(data['lastBackupAt'] as String? ?? '');
          _compatibilityMode = data['compatibilityMode'] as bool? ?? false;
          _addMadeWith = data['addMadeWith'] as bool? ?? false;
          _firstTagDone = data['firstTagDone'] as bool? ?? false;
          _speakAfterScan = data['speakAfterScan'] as bool? ?? false;
          _textScalePercent = data['textScalePercent'] as int? ?? 100;
          _accentIndex = data['accentIndex'] as int? ?? 0;
          _clearClipboardAfterCopy = data['clearClipboardAfterCopy'] as bool? ?? true;
          _hideInSwitcher = data['hideInSwitcher'] as bool? ?? true;
          _lockAfterSeconds = data['lockAfterSeconds'] as int? ?? 60;
          _simpleMode = data['simpleMode'] as bool? ?? false;
          _signOnWrite = data['signOnWrite'] as bool? ?? false;
          _signingKey = data['signingKey'] as String?;
          _appLockEnabled = data['appLockEnabled'] as bool? ?? false;
          _writeCounter = data['writeCounter'] as int? ?? 0;
        }
      }
    } catch (e) {
      debugPrint('LocalFileAppStorageService error loading settings: $e');
    }

    final secretStore = secrets;
    if (secretStore != null) {
      try {
        final fromFile = _signingKey;
        final stored = await secretStore.read(signingKeySecret);
        if (stored != null) {
          _signingKey = stored;
        } else if (fromFile != null) {
          await secretStore.write(signingKeySecret, fromFile);
        }
        if (fromFile != null) await _saveSettings(); // drops it from the file
      } catch (e) {
        debugPrint('LocalFileAppStorageService secret store unavailable: $e');
      }
    }

    // Load History
    try {
      if (await _historyFile.exists()) {
        final content = await _historyFile.readAsString();
        if (content.trim().isNotEmpty) {
          final list = jsonDecode(content) as List<dynamic>;
          _history.clear();
          for (final item in list) {
            _history.add(ScanHistoryEntry.fromJsonMap(
                Map<String, dynamic>.from(item as Map)));
          }
        }
      }
    } catch (e) {
      debugPrint('LocalFileAppStorageService error loading history: $e');
    }

    // Load Templates
    try {
      if (await _templatesFile.exists()) {
        final content = await _templatesFile.readAsString();
        if (content.trim().isNotEmpty) {
          final list = jsonDecode(content) as List<dynamic>;
          _templates.clear();
          for (final item in list) {
            _templates.add(WriteTemplate.fromJsonMap(
                Map<String, dynamic>.from(item as Map)));
          }
        }
      }
    } catch (e) {
      debugPrint('LocalFileAppStorageService error loading templates: $e');
    }

    // Load Tag Rules
    try {
      if (await _tagRulesFile.exists()) {
        final content = await _tagRulesFile.readAsString();
        if (content.trim().isNotEmpty) {
          final list = jsonDecode(content) as List<dynamic>;
          _rules.clear();
          for (final item in list) {
            final rule =
                TagRule.fromJsonMap(Map<String, dynamic>.from(item as Map));
            _rules[rule.ndefSha256.toLowerCase()] = rule;
          }
        }
      }
    } catch (e) {
      debugPrint('LocalFileAppStorageService error loading tag rules: $e');
    }

    // Load Tag Library
    try {
      if (await _libraryFile.exists()) {
        final content = await _libraryFile.readAsString();
        if (content.trim().isNotEmpty) {
          final list = jsonDecode(content) as List<dynamic>;
          _library.clear();
          for (final item in list) {
            _library.add(TagLibraryEntry.fromJsonMap(Map<String, dynamic>.from(item as Map)));
          }
        }
      }
    } catch (e) {
      debugPrint('LocalFileAppStorageService error loading tag library: $e');
    }

    // Load Logbooks
    try {
      if (await _logBooksFile.exists()) {
        final content = await _logBooksFile.readAsString();
        if (content.trim().isNotEmpty) {
          _logBooks
            ..clear()
            ..addAll([
              for (final item in jsonDecode(content) as List<dynamic>)
                LogBook.fromJsonMap(Map<String, dynamic>.from(item as Map)),
            ]);
        }
      }
    } catch (e) {
      debugPrint('LocalFileAppStorageService error loading logbooks: $e');
    }
  }

  /// Atomically writes [content] to [targetFile] by first writing to a temporary file
  /// and then renaming it.
  Future<void> _atomicWrite(File targetFile, String content) async {
    final dir = targetFile.parent;
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }

    final tempFile =
        File('${targetFile.path}.tmp_${DateTime.now().microsecondsSinceEpoch}');
    try {
      await tempFile.writeAsString(content, flush: true);
      if (Platform.isWindows && await targetFile.exists()) {
        final backupFile = File(
            '${targetFile.path}.bak_${DateTime.now().microsecondsSinceEpoch}');
        await targetFile.rename(backupFile.path);
        try {
          await tempFile.rename(targetFile.path);
          if (await backupFile.exists()) {
            await backupFile.delete();
          }
        } catch (e) {
          if (await backupFile.exists()) {
            await backupFile.rename(targetFile.path);
          }
          rethrow;
        }
      } else {
        await tempFile.rename(targetFile.path);
      }
    } catch (e) {
      if (await tempFile.exists()) {
        try {
          await tempFile.delete();
        } catch (_) {}
      }
      rethrow;
    }
  }

  @override
  bool get isHistoryEnabled => _isHistoryEnabled;

  @override
  Future<void> setHistoryEnabled(bool enabled) async {
    final previous = _isHistoryEnabled;
    _isHistoryEnabled = enabled;
    try {
      await _saveSettings();
    } catch (e) {
      _isHistoryEnabled = previous;
      rethrow;
    }
  }

  Future<void> _saveSettings() async {
    final data = jsonEncode({
      'historyEnabled': _isHistoryEnabled,
      'localeCode': _localeCode,
      'themeMode': _themeMode,
      'onboardingDone': _onboardingDone,
      'hapticsEnabled': _hapticsEnabled,
      'soundsEnabled': _soundsEnabled,
      'favoritePresets': _favoritePresets,
      if (_lastBackupAt != null) 'lastBackupAt': _lastBackupAt!.toIso8601String(),
      'compatibilityMode': _compatibilityMode,
      'addMadeWith': _addMadeWith,
      'firstTagDone': _firstTagDone,
      'speakAfterScan': _speakAfterScan,
      'textScalePercent': _textScalePercent,
      'accentIndex': _accentIndex,
      'clearClipboardAfterCopy': _clearClipboardAfterCopy,
      'hideInSwitcher': _hideInSwitcher,
      'lockAfterSeconds': _lockAfterSeconds,
      'simpleMode': _simpleMode,
      'signOnWrite': _signOnWrite,
      if (secrets == null) 'signingKey': _signingKey,
      'appLockEnabled': _appLockEnabled,
      'writeCounter': _writeCounter,
    });
    await _atomicWrite(_settingsFile, data);
  }

  @override
  String? get localeCode => _localeCode;

  @override
  Future<void> setLocaleCode(String? code) async {
    _localeCode = code;
    await _saveSettings();
  }

  @override
  String get themeMode => _themeMode;

  @override
  Future<void> setThemeMode(String mode) async {
    _themeMode = mode;
    await _saveSettings();
  }

  @override
  bool get onboardingDone => _onboardingDone;

  @override
  Future<void> setOnboardingDone(bool done) async {
    _onboardingDone = done;
    await _saveSettings();
  }

  @override
  bool get hapticsEnabled => _hapticsEnabled;

  @override
  Future<void> setHapticsEnabled(bool enabled) async {
    _hapticsEnabled = enabled;
    await _saveSettings();
  }

  List<String> _favoritePresets = const [];

  @override
  List<String> get favoritePresets => _favoritePresets;

  @override
  Future<void> setFavoritePresets(List<String> ids) async {
    _favoritePresets = List.unmodifiable(ids);
    await _saveSettings();
  }

  DateTime? _lastBackupAt;

  @override
  DateTime? get lastBackupAt => _lastBackupAt;

  @override
  Future<void> setLastBackupAt(DateTime time) async {
    _lastBackupAt = time;
    await _saveSettings();
  }

  bool _compatibilityMode = false;

  @override
  bool get compatibilityMode => _compatibilityMode;

  @override
  Future<void> setCompatibilityMode(bool enabled) async {
    _compatibilityMode = enabled;
    await _saveSettings();
  }

  bool _addMadeWith = false;

  @override
  bool get addMadeWith => _addMadeWith;

  @override
  Future<void> setAddMadeWith(bool value) async {
    _addMadeWith = value;
    await _saveSettings();
  }

  bool _firstTagDone = false;

  @override
  bool get firstTagDone => _firstTagDone;

  @override
  Future<void> setFirstTagDone(bool value) async {
    _firstTagDone = value;
    await _saveSettings();
  }

  bool _speakAfterScan = false;

  @override
  bool get speakAfterScan => _speakAfterScan;

  @override
  Future<void> setSpeakAfterScan(bool value) async {
    _speakAfterScan = value;
    await _saveSettings();
  }

  int _textScalePercent = 100;

  @override
  int get textScalePercent => _textScalePercent;

  @override
  Future<void> setTextScalePercent(int value) async {
    _textScalePercent = value;
    await _saveSettings();
  }

  int _accentIndex = 0;

  @override
  int get accentIndex => _accentIndex;

  @override
  Future<void> setAccentIndex(int value) async {
    _accentIndex = value;
    await _saveSettings();
  }

  bool _clearClipboardAfterCopy = true;

  @override
  bool get clearClipboardAfterCopy => _clearClipboardAfterCopy;

  @override
  Future<void> setClearClipboardAfterCopy(bool value) async {
    _clearClipboardAfterCopy = value;
    await _saveSettings();
  }

  bool _hideInSwitcher = true;

  @override
  bool get hideInSwitcher => _hideInSwitcher;

  @override
  Future<void> setHideInSwitcher(bool value) async {
    _hideInSwitcher = value;
    await _saveSettings();
  }

  int _lockAfterSeconds = 60;

  @override
  int get lockAfterSeconds => _lockAfterSeconds;

  @override
  Future<void> setLockAfterSeconds(int value) async {
    _lockAfterSeconds = value;
    await _saveSettings();
  }

  bool _simpleMode = false;

  @override
  bool get simpleMode => _simpleMode;

  @override
  Future<void> setSimpleMode(bool value) async {
    _simpleMode = value;
    await _saveSettings();
  }

  bool _signOnWrite = false;

  @override
  bool get signOnWrite => _signOnWrite;

  @override
  Future<void> setSignOnWrite(bool value) async {
    _signOnWrite = value;
    await _saveSettings();
  }

  String? _signingKey;

  @override
  String? get signingKey => _signingKey;

  @override
  Future<void> setSigningKey(String? value) async {
    final secretStore = secrets;
    if (secretStore != null) await secretStore.write(signingKeySecret, value);
    _signingKey = value;
    await _saveSettings();
  }

  bool _appLockEnabled = false;

  @override
  bool get appLockEnabled => _appLockEnabled;

  @override
  Future<void> setAppLockEnabled(bool value) async {
    _appLockEnabled = value;
    await _saveSettings();
  }

  int _writeCounter = 0;

  @override
  int get writeCounter => _writeCounter;

  @override
  Future<void> setWriteCounter(int value) async {
    _writeCounter = value;
    await _saveSettings();
  }

  @override
  bool get soundsEnabled => _soundsEnabled;

  @override
  Future<void> setSoundsEnabled(bool enabled) async {
    _soundsEnabled = enabled;
    await _saveSettings();
  }

  @override
  List<ScanHistoryEntry> getHistory() => List.unmodifiable(_history);

  @override
  Future<void> addHistoryEntry(ScanHistoryEntry entry) async {
    if (!_isHistoryEnabled) return;
    _history.insert(0, entry);
    try {
      await _saveHistory();
    } catch (e) {
      _history.remove(entry);
      rethrow;
    }
  }

  @override
  Future<void> deleteHistoryEntry(String id) async {
    final index = _history.indexWhere((item) => item.id == id);
    if (index == -1) return;
    final removed = _history.removeAt(index);
    try {
      await _saveHistory();
    } catch (e) {
      _history.insert(index, removed);
      rethrow;
    }
  }

  @override
  Future<void> clearHistory() async {
    final backup = List<ScanHistoryEntry>.from(_history);
    _history.clear();
    try {
      await _saveHistory();
    } catch (e) {
      _history.addAll(backup);
      rethrow;
    }
  }

  Future<void> _saveHistory() async {
    final data = jsonEncode(_history.map((e) => e.toJsonMap()).toList());
    await _atomicWrite(_historyFile, data);
  }

  @override
  List<WriteTemplate> getTemplates() => List.unmodifiable(_templates);

  @override
  Future<void> saveTemplate(WriteTemplate template) async {
    final index = _templates.indexWhere((t) => t.id == template.id);
    final previous = index >= 0 ? _templates[index] : null;
    if (index >= 0) {
      _templates[index] = template;
    } else {
      _templates.insert(0, template);
    }
    try {
      await _saveTemplates();
    } catch (e) {
      if (previous != null) {
        _templates[index] = previous;
      } else {
        _templates.remove(template);
      }
      rethrow;
    }
  }

  @override
  Future<void> deleteTemplate(String id) async {
    final index = _templates.indexWhere((t) => t.id == id);
    if (index == -1) return;
    final removed = _templates.removeAt(index);
    try {
      await _saveTemplates();
    } catch (e) {
      _templates.insert(index, removed);
      rethrow;
    }
  }

  @override
  Future<void> clearTemplates() async {
    final backup = List<WriteTemplate>.from(_templates);
    _templates.clear();
    try {
      await _saveTemplates();
    } catch (e) {
      _templates.addAll(backup);
      rethrow;
    }
  }

  Future<void> _saveTemplates() async {
    final data = jsonEncode(_templates.map((t) => t.toJsonMap()).toList());
    await _atomicWrite(_templatesFile, data);
  }

  // Tag Library implementation
  @override
  List<TagLibraryEntry> getLibrary() => List.unmodifiable(_library);

  @override
  Future<void> saveLibraryEntry(TagLibraryEntry entry) async {
    final index = _library.indexWhere((e) => e.id == entry.id);
    final previous = index >= 0 ? _library[index] : null;
    if (index >= 0) {
      _library[index] = entry;
    } else {
      _library.insert(0, entry);
    }
    try {
      await _saveLibrary();
    } catch (e) {
      if (previous != null) {
        _library[index] = previous;
      } else {
        _library.remove(entry);
      }
      rethrow;
    }
  }

  @override
  Future<void> deleteLibraryEntry(String id) async {
    final index = _library.indexWhere((e) => e.id == id);
    if (index == -1) return;
    final removed = _library.removeAt(index);
    try {
      await _saveLibrary();
    } catch (e) {
      _library.insert(index, removed);
      rethrow;
    }
  }

  @override
  List<LogBook> getLogBooks() => List.unmodifiable(_logBooks);

  @override
  Future<void> saveLogBook(LogBook book) async {
    final before = List<LogBook>.from(_logBooks);
    final i = _logBooks.indexWhere((b) => b.id == book.id);
    if (i >= 0) {
      _logBooks[i] = book;
    } else {
      _logBooks.insert(0, book);
    }
    try {
      await _saveLogBooks();
    } catch (e) {
      _logBooks
        ..clear()
        ..addAll(before);
      rethrow;
    }
  }

  @override
  Future<void> deleteLogBook(String id) async {
    final before = List<LogBook>.from(_logBooks);
    _logBooks.removeWhere((b) => b.id == id);
    try {
      await _saveLogBooks();
    } catch (e) {
      _logBooks
        ..clear()
        ..addAll(before);
      rethrow;
    }
  }

  Future<void> _saveLogBooks() async {
    await _atomicWrite(_logBooksFile, jsonEncode(_logBooks.map((b) => b.toJsonMap()).toList()));
  }

  Future<void> _saveLibrary() async {
    final data = jsonEncode(_library.map((e) => e.toJsonMap()).toList());
    await _atomicWrite(_libraryFile, data);
  }

  // Tag Rules implementation
  @override
  List<TagRule> getTagRules() => List.unmodifiable(_rules.values.toList());

  @override
  TagRule? getTagRuleBySha256(String ndefSha256) =>
      _rules[ndefSha256.toLowerCase()];

  @override
  Future<void> saveTagRule(TagRule rule) async {
    final key = rule.ndefSha256.toLowerCase();
    final previous = _rules[key];
    _rules[key] = rule;
    try {
      await _saveTagRules();
    } catch (e) {
      if (previous != null) {
        _rules[key] = previous;
      } else {
        _rules.remove(key);
      }
      rethrow;
    }
  }

  @override
  Future<void> deleteTagRule(String ndefSha256) async {
    final key = ndefSha256.toLowerCase();
    final previous = _rules[key];
    if (previous == null) return;
    _rules.remove(key);
    try {
      await _saveTagRules();
    } catch (e) {
      _rules[key] = previous;
      rethrow;
    }
  }

  @override
  Future<void> clearTagRules() async {
    final backup = Map<String, TagRule>.from(_rules);
    _rules.clear();
    try {
      await _saveTagRules();
    } catch (e) {
      _rules.addAll(backup);
      rethrow;
    }
  }

  Future<void> _saveTagRules() async {
    final data = jsonEncode(_rules.values.map((r) => r.toJsonMap()).toList());
    await _atomicWrite(_tagRulesFile, data);
  }

  // Merge import
  @override
  Future<ImportMergeResult> mergeBackup(
    BackupPayload backup, {
    bool enableHistoryIfDisabled = false,
  }) async {
    int addedTemplates = 0;
    int updatedTemplates = 0;
    int addedHistory = 0;
    int skippedHistory = 0;
    bool historySkippedDueToDisabled = false;
    int addedRules = 0;
    int updatedRules = 0;

    // 1. Templates
    for (final tpl in backup.templates) {
      final index = _templates.indexWhere((t) => t.id == tpl.id);
      if (index >= 0) {
        // Preserve the user's existing template on ID collision.
      } else {
        _templates.add(tpl);
        addedTemplates++;
      }
    }
    if (addedTemplates > 0 || updatedTemplates > 0) {
      await _saveTemplates();
    }

    // 2. Rules
    if (backup.tagRules != null && backup.tagRules!.isNotEmpty) {
      for (final rule in backup.tagRules!) {
        final key = rule.ndefSha256.toLowerCase();
        if (_rules.containsKey(key)) {
          // Preserve the user's existing note on hash collision.
        } else {
          _rules[key] = rule;
          addedRules++;
        }
      }
      if (addedRules > 0 || updatedRules > 0) {
        await _saveTagRules();
      }
    }

    // Tag library: add entries that are not on this device yet
    int addedLibrary = 0;
    final libraryBackup = List<TagLibraryEntry>.from(_library);
    for (final entry in backup.tagLibrary ?? const <TagLibraryEntry>[]) {
      if (!_library.any((e) => e.id == entry.id)) {
        _library.add(entry);
        addedLibrary++;
      }
    }
    if (addedLibrary > 0) {
      try {
        await _saveLibrary();
      } catch (e) {
        _library
          ..clear()
          ..addAll(libraryBackup);
        rethrow;
      }
    }

    // 3. History
    if (backup.history != null && backup.history!.isNotEmpty) {
      if (!_isHistoryEnabled && !enableHistoryIfDisabled) {
        historySkippedDueToDisabled = true;
        skippedHistory = backup.history!.length;
      } else {
        if (!_isHistoryEnabled && enableHistoryIfDisabled) {
          _isHistoryEnabled = true;
          await _saveSettings();
        }
        for (final entry in backup.history!) {
          final exists = _history.any((h) => h.id == entry.id);
          if (exists) {
            skippedHistory++;
          } else {
            _history.add(entry);
            addedHistory++;
          }
        }
        _history.sort((a, b) => b.timestamp.compareTo(a.timestamp));
        if (addedHistory > 0) {
          await _saveHistory();
        }
      }
    }

    return ImportMergeResult(
      addedTemplates: addedTemplates,
      updatedTemplates: updatedTemplates,
      addedHistory: addedHistory,
      skippedHistory: skippedHistory,
      historySkippedDueToDisabled: historySkippedDueToDisabled,
      addedRules: addedRules,
      updatedRules: updatedRules,
      addedLibrary: addedLibrary,
    );
  }
}
