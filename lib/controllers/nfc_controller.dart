import 'package:flutter/material.dart';
import '../domain/ndef_record.dart';
import '../domain/nfc_tag_info.dart';
import '../domain/storage_models.dart';
import '../domain/nfc_workflow_models.dart';
import '../domain/tag_rule.dart';
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
  String _statusMessage = 'Hazır';
  NfcTagInfo? _lastScannedTag;
  NfcWriteResult? _lastWriteResult;
  int _historySequence = 0;
  NdefClipboardSnapshot? _clipboardSnapshot;

  /// Holds the matching in-app TagRule note for the current scan (if any)
  TagRule? _matchingRuleForLastScan;

  // Getters
  NfcAvailability get availability => _availability;
  bool get isBusy => _isBusy;
  String get statusMessage => _statusMessage;
  NfcTagInfo? get lastScannedTag => _lastScannedTag;
  NfcWriteResult? get lastWriteResult => _lastWriteResult;
  NdefClipboardSnapshot? get clipboardSnapshot => _clipboardSnapshot;
  TagRule? get matchingRuleForLastScan => _matchingRuleForLastScan;

  /// Computes the SHA-256 hex digest for the given records or last scanned tag
  static String computeRecordsSha256(List<NdefRecordModel> records) {
    if (records.isEmpty) return '';
    final bytes = encodeNdefMessage(records);
    return BackupCodec.computeNdefSha256(bytes);
  }

  /// Copies records into the in-memory clipboard snapshot without mutating original records
  void copyToClipboard(List<NdefRecordModel> records, {String sourceDescription = 'Taranan Etiket'}) {
    _clipboardSnapshot = NdefClipboardSnapshot.fromRecords(records, sourceDescription: sourceDescription);
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
      _statusMessage = 'Bu cihazda NFC donanımı bulunmuyor veya desteklenmiyor.';
      notifyListeners();
      return;
    }
    if (_availability == NfcAvailability.disabled) {
      _statusMessage = 'NFC kapalı. Lütfen cihaz ayarlarından NFC özelliğini açın.';
      notifyListeners();
      return;
    }

    _isBusy = true;
    _statusMessage = 'Etiket taranıyor... Telefonunuzu etikete yaklaştırın.';
    _lastWriteResult = null;
    _matchingRuleForLastScan = null;
    notifyListeners();

    try {
      final info = await _service.scanTag(
        promptMessage: 'NFC etiketini okumak için cihazınızın arkasına dokundurun',
      );
      _lastScannedTag = info;
      if (info.error != null) {
        _statusMessage = 'Tarama Hatası: ${info.error}';
        // Avoid storing scans with errors
      } else {
        _statusMessage = 'Etiket başarıyla okundu (${info.identifier}).';

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
      _statusMessage = 'Beklenmeyen hata: $e';
    } finally {
      _isBusy = false;
      notifyListeners();
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
      _statusMessage = 'NFC şu anda kullanılamaz durumda.';
      notifyListeners();
      return false;
    }

    _isBusy = true;
    _statusMessage = 'Yazma modu aktif. Hedef NFC etiketini yaklaştırın...';
    notifyListeners();

    try {
      final result = await _service.writeTag(
        records: records,
        promptMessage: promptMessage ?? 'Verileri kaydetmek için NFC etiketini yaklaştırın',
        verifyReadAfterWrite: true,
      );

      _lastWriteResult = result;
      if (result.isSuccess) {
        _statusMessage = 'Yazma ve doğrulama başarılı! (${result.bytesWritten} bayt)';
      } else {
        _statusMessage = 'Yazma işlemi tamamlanamadı: ${result.message}';
      }
      return result.isSuccess;
    } catch (e) {
      _lastWriteResult = NfcWriteResult(isSuccess: false, message: e.toString());
      _statusMessage = 'Yazma hatası: $e';
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
    _statusMessage = 'İşlem iptal edildi.';
    notifyListeners();
  }

  /// Clear / Format tag
  Future<bool> clearTag() async {
    if (_availability != NfcAvailability.available) {
      _statusMessage = 'NFC şu anda kullanılamaz durumda.';
      notifyListeners();
      return false;
    }

    _isBusy = true;
    _statusMessage = 'Sıfırlama modu aktif. Etiketi yaklaştırın...';
    notifyListeners();

    try {
      final result = await _service.clearTag(
        promptMessage: 'Etiketi sıfırlamak için cihazınıza yaklaştırın',
      );
      _lastWriteResult = result;
      if (result.isSuccess) {
        _statusMessage = 'Etiket içeriği başarıyla temizlendi.';
        _lastScannedTag = null;
        _matchingRuleForLastScan = null;
      } else {
        _statusMessage = 'Sıfırlama başarısız: ${result.message}';
      }
      return result.isSuccess;
    } catch (e) {
      _lastWriteResult = NfcWriteResult(isSuccess: false, message: e.toString());
      _statusMessage = 'Sıfırlama hatası: $e';
      return false;
    } finally {
      _isBusy = false;
      notifyListeners();
    }
  }

  /// Permanently locks a tag (read-only). Callers must confirm with the user first.
  Future<bool> lockTag() async {
    if (_availability != NfcAvailability.available) {
      _statusMessage = 'NFC şu anda kullanılamaz durumda.';
      notifyListeners();
      return false;
    }

    _isBusy = true;
    _statusMessage = 'Kilitleme modu aktif. Etiketi yaklaştırın...';
    notifyListeners();

    try {
      final result = await _service.lockTag(
        promptMessage: 'Kalıcı olarak kilitlenecek etiketi yaklaştırın',
      );
      _lastWriteResult = result;
      _statusMessage = result.isSuccess
          ? 'Etiket kalıcı olarak kilitlendi (salt okunur).'
          : 'Kilitleme başarısız: ${result.message}';
      return result.isSuccess;
    } catch (e) {
      _lastWriteResult = NfcWriteResult(isSuccess: false, message: e.toString());
      _statusMessage = 'Kilitleme hatası: $e';
      return false;
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
    _statusMessage = 'Hazır';
    notifyListeners();
  }
}
