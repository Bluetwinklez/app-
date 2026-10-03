import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../domain/ndef_record.dart';
import '../domain/nfc_tag_info.dart';
import '../domain/storage_models.dart';
import '../domain/nfc_workflow_models.dart';
import '../domain/tag_rule.dart';
import '../domain/ntag_tools.dart';
import '../domain/template_variables.dart';
import '../domain/tag_signature.dart';
import '../l10n/l10n.dart';
import '../services/nfc_service.dart';
import '../services/app_storage_service.dart';
import '../services/backup_codec.dart';

/// App state controller managing NFC lifecycle, active scans, composing, writes, history, templates, and tag rules
class NfcStateController extends ChangeNotifier {
  final NfcPlatformService _service;
  final AppStorageService _storage;

  NfcStateController({
    NfcPlatformService? service,
    AppStorageService? storage,
  })  : _service = service ?? MethodChannelNfcService(),
        _storage = storage ?? InMemoryAppStorageService();

  AppStorageService get storage => _storage;

  NfcAvailability _availability = NfcAvailability.notSupported;
  bool _isBusy = false;
  /// Null means "ready"; resolved lazily so it follows the active language.
  String? _statusMessage;
  NfcTagInfo? _lastScannedTag;
  NfcWriteResult? _lastWriteResult;
  int _historySequence = 0;
  NdefClipboardSnapshot? _clipboardSnapshot;

  /// Holds the matching in-app TagRule note for the current scan (if any)
  TagRule? _matchingRuleForLastScan;

  // Getters
  NfcAvailability get availability => _availability;
  bool get isBusy => _isBusy;
  String get statusMessage => _statusMessage ?? L10n.current.statusReady;
  NfcTagInfo? get lastScannedTag => _lastScannedTag;
  NfcWriteResult? get lastWriteResult => _lastWriteResult;
  NdefClipboardSnapshot? get clipboardSnapshot => _clipboardSnapshot;
  TagRule? get matchingRuleForLastScan => _matchingRuleForLastScan;

  bool get hapticsEnabled => _storage.hapticsEnabled;
  bool get soundsEnabled => _storage.soundsEnabled;

  Future<void> setHapticsEnabled(bool enabled) async {
    await _storage.setHapticsEnabled(enabled);
    notifyListeners();
  }

  Future<void> setSoundsEnabled(bool enabled) async {
    await _storage.setSoundsEnabled(enabled);
    notifyListeners();
  }

  /// Short haptic (and optional click) after an NFC operation finishes.
  void _feedback({required bool success}) {
    // Best effort: platform feedback is unavailable in tests and on some devices
    Future<void> ignore(Future<void> Function() call) async {
      try {
        await call();
      } catch (_) {}
    }

    if (_storage.hapticsEnabled) {
      ignore(success ? HapticFeedback.mediumImpact : HapticFeedback.heavyImpact);
    }
    if (_storage.soundsEnabled) {
      ignore(() => SystemSound.play(success ? SystemSoundType.click : SystemSoundType.alert));
    }
  }

  /// Language codes the app ships translations for. Turkish is the source language.
  static const List<String> supportedLanguageCodes = [
    'tr', 'en', 'de', 'fr', 'es', 'it', 'pt', 'ru', 'ar', 'ja', 'zh', 'ko', 'nl', 'uk',
  ];

  /// Locale chosen in settings, or null to follow the device language.
  Locale? get locale {
    final code = _storage.localeCode;
    return code == null ? null : Locale(code);
  }

  Future<void> setLocaleCode(String? code) async {
    await _storage.setLocaleCode(code);
    if (code != null) {
      L10n.update(Locale(code));
    }
    notifyListeners();
  }

  ThemeMode get themeMode {
    switch (_storage.themeMode) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    await _storage.setThemeMode(mode.name);
    notifyListeners();
  }

  bool get onboardingDone => _storage.onboardingDone;

  Future<void> setOnboardingDone(bool done) async {
    await _storage.setOnboardingDone(done);
    notifyListeners();
  }

  /// Computes the SHA-256 hex digest for the given records or last scanned tag
  static String computeRecordsSha256(List<NdefRecordModel> records) {
    if (records.isEmpty) return '';
    final bytes = encodeNdefMessage(records);
    return BackupCodec.computeNdefSha256(bytes);
  }

  /// Copies records into the in-memory clipboard snapshot without mutating original records
  void copyToClipboard(List<NdefRecordModel> records, {String? sourceDescription}) {
    _clipboardSnapshot = NdefClipboardSnapshot.fromRecords(
      records,
      sourceDescription: sourceDescription ?? L10n.current.scannedTag,
    );
    notifyListeners();
  }

  /// Clears in-memory clipboard snapshot
  void clearClipboard() {
    _clipboardSnapshot = null;
    notifyListeners();
  }

  /// Check hardware/system availability and storage on startup or refresh
  Future<void> init() async {
    await _storage.init();
    _availability = await _service.checkAvailability();
    notifyListeners();
  }

  /// Re-checks NFC availability without re-initializing storage (e.g. after
  /// the user toggles NFC in system settings and returns to the app)
  Future<void> refreshAvailability() async {
    if (_isBusy) return;
    final availability = await _service.checkAvailability();
    if (availability != _availability) {
      _availability = availability;
      notifyListeners();
    }
  }

  /// Start scan
  Future<void> scanTag() async {
    if (_availability == NfcAvailability.notSupported) {
      _statusMessage = L10n.current.statusNfcNotSupported;
      notifyListeners();
      return;
    }
    if (_availability == NfcAvailability.disabled) {
      _statusMessage = L10n.current.statusNfcDisabled;
      notifyListeners();
      return;
    }

    _isBusy = true;
    _statusMessage = L10n.current.statusScanning;
    _lastWriteResult = null;
    _matchingRuleForLastScan = null;
    notifyListeners();

    try {
      final info = await _service.scanTag(
        promptMessage: L10n.current.nfcPromptScan,
      );
      // Keep the result even when cancelled: callers read lastScannedTag
      // right after this and must not see an older tag.
      _lastScannedTag = info;
      if (info.wasCancelled) {
        _statusMessage = L10n.current.statusCancelled;
        return;
      }
      if (info.error != null) {
        _statusMessage = L10n.current.statusScanError(info.error!);
        _feedback(success: false);
        // Avoid storing scans with errors
      } else {
        _statusMessage = L10n.current.statusScanSuccess(info.identifier);
        _feedback(success: true);

        await _markLibrarySeen(info.identifier);

        // Check if there is an in-app tag rule matching exact NDEF bytes SHA-256
        if (info.records.isNotEmpty) {
          final sha = computeRecordsSha256(info.records);
          _matchingRuleForLastScan = _storage.getTagRuleBySha256(sha);
        } else {
          _matchingRuleForLastScan = null;
        }

        // Add to history only if successful and history is enabled
        if (_storage.isHistoryEnabled) {
          final entry = ScanHistoryEntry(
            id: '${DateTime.now().microsecondsSinceEpoch}-${_historySequence++}',
            timestamp: DateTime.now(),
            identifier: info.identifier,
            standardTechnologies: info.standardTechnologies,
            isNdefSupported: info.isNdefSupported,
            isWritable: info.isWritable,
            maxByteCapacity: info.maxByteCapacity,
            currentBytesUsed: info.currentBytesUsed,
            records: List<NdefRecordModel>.from(info.records),
          );
          await _storage.addHistoryEntry(entry);
        }
      }
    } catch (e) {
      _statusMessage = L10n.current.statusUnexpectedError(e.toString());
    } finally {
      _isBusy = false;
      notifyListeners();
    }
  }

  /// Remembers when a saved library tag was last scanned (health tracking).
  Future<void> _markLibrarySeen(String uid) async {
    if (uid.isEmpty) return;
    for (final entry in _storage.getLibrary()) {
      if (entry.uid != null && entry.uid!.toUpperCase() == uid.toUpperCase()) {
        try {
          await _storage.saveLibraryEntry(entry.copyWith(lastSeenAt: DateTime.now()));
        } catch (_) {
          // Best effort; the scan itself succeeded.
        }
        return;
      }
    }
  }

  /// Save or update an in-app tag rule for given records
  Future<void> setRuleForRecords(List<NdefRecordModel> records, String note) async {
    if (records.isEmpty) return;
    final sha = computeRecordsSha256(records);
    final now = DateTime.now();
    final existing = _storage.getTagRuleBySha256(sha);

    final rule = TagRule(
      ndefSha256: sha,
      note: note.trim(),
      createdAt: existing?.createdAt ?? now,
      updatedAt: now,
    );
    await _storage.saveTagRule(rule);

    if (_lastScannedTag != null && computeRecordsSha256(_lastScannedTag!.records) == sha) {
      _matchingRuleForLastScan = rule;
    }
    notifyListeners();
  }

  /// Delete an in-app tag rule
  Future<void> deleteRuleForRecords(List<NdefRecordModel> records) async {
    if (records.isEmpty) return;
    final sha = computeRecordsSha256(records);
    await _storage.deleteTagRule(sha);
    if (_matchingRuleForLastScan?.ndefSha256 == sha) {
      _matchingRuleForLastScan = null;
    }
    notifyListeners();
  }

  /// Write composed records
  Future<bool> writeRecords(List<NdefRecordModel> records, {String? promptMessage}) async {
    if (_availability != NfcAvailability.available) {
      _statusMessage = L10n.current.statusNfcUnavailable;
      notifyListeners();
      return false;
    }

    _isBusy = true;
    _statusMessage = L10n.current.statusWriting;
    notifyListeners();

    // {date} {time} {counter} in records are filled in now.
    final usesVariables = TemplateVariables.hasAny(records);
    final usesCounter = TemplateVariables.usesCounter(records);
    final nextCounter = _storage.writeCounter + 1;
    if (usesVariables) {
      records = TemplateVariables.apply(records, now: DateTime.now(), counterValue: nextCounter);
    }

    final signingKey = _storage.signingKey;
    if (_storage.signOnWrite && signingKey != null) {
      records = TagSignature.sign(records, base64Decode(signingKey));
    }

    try {
      final result = await _service.writeTag(
        records: records,
        promptMessage: promptMessage ?? L10n.current.nfcPromptWrite,
        verifyReadAfterWrite: !_storage.compatibilityMode,
      );

      _lastWriteResult = result;
      if (NfcTagInfo.isCancelCode(result.errorCode)) {
        _statusMessage = L10n.current.statusCancelled;
        return false;
      }
      _feedback(success: result.isSuccess);
      if (result.isSuccess) {
        if (usesCounter) {
          await _storage.setWriteCounter(nextCounter);
        }
        _statusMessage = L10n.current.statusWriteSuccess(result.bytesWritten);
      } else {
        _statusMessage = L10n.current.statusWriteFailed(result.message);
      }
      return result.isSuccess;
    } catch (e) {
      _lastWriteResult = NfcWriteResult(isSuccess: false, message: e.toString());
      _statusMessage = L10n.current.statusWriteError(e.toString());
      return false;
    } finally {
      _isBusy = false;
      notifyListeners();
    }
  }

  /// Cancels any ongoing session
  Future<void> cancelSession() async {
    try {
      await _service.cancelSession();
    } catch (_) {}
    _isBusy = false;
    _statusMessage = L10n.current.statusCancelled;
    notifyListeners();
  }

  /// Clear / Format tag
  Future<bool> clearTag() async {
    if (_availability != NfcAvailability.available) {
      _statusMessage = L10n.current.statusNfcUnavailable;
      notifyListeners();
      return false;
    }

    _isBusy = true;
    _statusMessage = L10n.current.statusClearing;
    notifyListeners();

    try {
      final result = await _service.clearTag(
        promptMessage: L10n.current.nfcPromptClear,
      );
      _lastWriteResult = result;
      _feedback(success: result.isSuccess);
      if (result.isSuccess) {
        _statusMessage = L10n.current.statusClearSuccess;
        _lastScannedTag = null;
        _matchingRuleForLastScan = null;
      } else {
        _statusMessage = L10n.current.statusClearFailed(result.message);
      }
      return result.isSuccess;
    } catch (e) {
      _lastWriteResult = NfcWriteResult(isSuccess: false, message: e.toString());
      _statusMessage = L10n.current.statusClearError(e.toString());
      return false;
    } finally {
      _isBusy = false;
      notifyListeners();
    }
  }

  /// Permanently locks a tag (read-only). Callers must confirm with the user first.
  Future<bool> lockTag() async {
    if (_availability != NfcAvailability.available) {
      _statusMessage = L10n.current.statusNfcUnavailable;
      notifyListeners();
      return false;
    }

    _isBusy = true;
    _statusMessage = L10n.current.statusLocking;
    notifyListeners();

    try {
      final result = await _service.lockTag(
        promptMessage: L10n.current.nfcPromptLock,
      );
      _lastWriteResult = result;
      _feedback(success: result.isSuccess);
      _statusMessage = result.isSuccess
          ? L10n.current.statusLockSuccess
          : L10n.current.statusLockFailed(result.message);
      return result.isSuccess;
    } catch (e) {
      _lastWriteResult = NfcWriteResult(isSuccess: false, message: e.toString());
      _statusMessage = L10n.current.statusLockError(e.toString());
      return false;
    } finally {
      _isBusy = false;
      notifyListeners();
    }
  }

  /// Prepares a blank NTAG / Ultralight tag and writes [records] in one tap.
  Future<bool> formatAndWriteRecords(List<NdefRecordModel> records) async {
    final message = encodeNdefMessage(records);
    final chip = await runRawTask<NtagChip>(
      promptMessage: L10n.current.nfcPromptWrite,
      busyMessage: L10n.current.statusWriting,
      task: (t) => NtagTools.formatAndWriteNdef(t, message),
      successMessage: (_) => L10n.current.statusWriteSuccess(message.length),
    );
    _lastWriteResult = NfcWriteResult(
      isSuccess: chip != null,
      message: _statusMessage ?? '',
      bytesWritten: chip != null ? message.length : 0,
      verificationPassed: chip != null,
    );
    notifyListeners();
    return chip != null;
  }

  /// Runs [task] against a tag held in a raw command session (NTAG tools).
  /// Returns null and sets [statusMessage] when anything fails.
  Future<T?> runRawTask<T>({
    required String promptMessage,
    required String busyMessage,
    required Future<T> Function(RawTransceive transceive) task,
    required String Function(T result) successMessage,
  }) async {
    if (_availability != NfcAvailability.available) {
      _statusMessage = L10n.current.statusNfcUnavailable;
      notifyListeners();
      return null;
    }

    _isBusy = true;
    _statusMessage = busyMessage;
    notifyListeners();

    bool sessionOpen = false;
    try {
      await _service.startRawSession(promptMessage: promptMessage);
      sessionOpen = true;
      final result = await task(_service.transceive);
      final message = successMessage(result);
      _feedback(success: true);
      await _service.endRawSession(successMessage: message);
      sessionOpen = false;
      _statusMessage = message;
      return result;
    } catch (e) {
      final message = e is NtagException || e is NfcOperationException ? e.toString() : L10n.current.statusUnexpectedError(e.toString());
      _feedback(success: false);
      if (sessionOpen) {
        await _service.endRawSession(errorMessage: message);
      }
      _statusMessage = message;
      return null;
    } finally {
      _isBusy = false;
      notifyListeners();
    }
  }

  /// Reset current tag view
  void resetTagView() {
    _lastScannedTag = null;
    _lastWriteResult = null;
    _matchingRuleForLastScan = null;
    _statusMessage = null;
    notifyListeners();
  }
}
