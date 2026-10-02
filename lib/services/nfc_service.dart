import 'dart:async';
import 'package:flutter/services.dart';
import '../domain/ndef_record.dart';
import '../domain/nfc_tag_info.dart';

/// Clean interface abstracting platform-specific NFC functionality
abstract class NfcPlatformService {
  /// Checks if NFC hardware is supported and enabled on the current device
  Future<NfcAvailability> checkAvailability();

  /// Starts a scan session to read an NDEF tag
  Future<NfcTagInfo> scanTag({String promptMessage = 'Etiketi telefonunuza yaklaştırın'});

  /// Writes NDEF records to a tag, checking capacity and verifying by reading back
  Future<NfcWriteResult> writeTag({
    required List<NdefRecordModel> records,
    String promptMessage = 'Yazmak istediğiniz etiketi yaklaştırın',
    bool verifyReadAfterWrite = true,
  });

  /// Clears / formats NDEF contents of an NFC tag (writing an empty NDEF record)
  Future<NfcWriteResult> clearTag({
    String promptMessage = 'Sıfırlamak istediğiniz etiketi yaklaştırın',
  });

  /// Permanently makes the tag read-only. This cannot be undone.
  Future<NfcWriteResult> lockTag({
    String promptMessage = 'Kilitlemek istediğiniz etiketi yaklaştırın',
  });

  /// Waits for an NTAG / Ultralight tag and keeps it connected for raw
  /// commands. Returns the tag UID as hex.
  Future<String> startRawSession({String promptMessage = 'Etiketi yaklaştırın'});

  /// Sends one raw NFC-A command on the open raw session.
  Future<Uint8List> transceive(Uint8List command);

  /// Closes the raw session, showing [errorMessage] or [successMessage] on iOS.
  Future<void> endRawSession({String? errorMessage, String? successMessage});

  /// Cancels any active scanning or writing session
  Future<void> cancelSession();
}

/// Error raised by raw NFC session calls
class NfcOperationException implements Exception {
  final String message;
  const NfcOperationException(this.message);

  @override
  String toString() => message;
}

/// Status of device NFC capability
enum NfcAvailability {
  available,
  disabled,
  notSupported,
}

/// Real implementation of [NfcPlatformService] talking over MethodChannel
class MethodChannelNfcService implements NfcPlatformService {
  static const MethodChannel _channel = MethodChannel('com.antigravity.nfc_tag_master/nfc');

  @override
  Future<NfcAvailability> checkAvailability() async {
    try {
      final String? status = await _channel.invokeMethod<String>('checkAvailability');
      switch (status) {
        case 'available':
          return NfcAvailability.available;
        case 'disabled':
          return NfcAvailability.disabled;
        case 'notSupported':
        default:
          return NfcAvailability.notSupported;
      }
    } on PlatformException {
      return NfcAvailability.notSupported;
    } catch (_) {
      return NfcAvailability.notSupported;
    }
  }

  @override
  Future<NfcTagInfo> scanTag({String promptMessage = 'Etiketi telefonunuza yaklaştırın'}) async {
    try {
      final dynamic result = await _channel.invokeMethod('scanTag', {
        'promptMessage': promptMessage,
      });

      if (result is Map) {
        return NfcTagInfo.fromMap(result);
      }
      return const NfcTagInfo(
        identifier: 'Bilinmiyor',
        error: 'Geçersiz yanıt formatı alındı',
      );
    } on PlatformException catch (e) {
      return NfcTagInfo(
        identifier: 'Hata',
        error: e.message ?? 'NFC okuma hatası',
      );
    } catch (e) {
      return NfcTagInfo(
        identifier: 'Hata',
        error: e.toString(),
      );
    }
  }

  @override
  Future<NfcWriteResult> writeTag({
    required List<NdefRecordModel> records,
    String promptMessage = 'Yazmak istediğiniz etiketi yaklaştırın',
    bool verifyReadAfterWrite = true,
  }) async {
    try {
      final recordsData = records.map((r) => r.toMap()).toList();
      final dynamic result = await _channel.invokeMethod('writeTag', {
        'records': recordsData,
        'promptMessage': promptMessage,
        'verifyReadAfterWrite': verifyReadAfterWrite,
      });

      if (result is Map) {
        return NfcWriteResult(
          isSuccess: result['isSuccess'] as bool? ?? false,
          message: result['message'] as String? ?? '',
          bytesWritten: (result['bytesWritten'] as num?)?.toInt() ?? 0,
          verificationPassed: result['verificationPassed'] as bool? ?? false,
        );
      }
      return const NfcWriteResult(
        isSuccess: false,
        message: 'Platformdan geçersiz yanıt alındı',
      );
    } on PlatformException catch (e) {
      return NfcWriteResult(
        isSuccess: false,
        message: e.message ?? 'Yazma başarısız oldu',
      );
    } catch (e) {
      return NfcWriteResult(
        isSuccess: false,
        message: e.toString(),
      );
    }
  }

  @override
  Future<NfcWriteResult> clearTag({
    String promptMessage = 'Sıfırlamak istediğiniz etiketi yaklaştırın',
  }) async {
    // An empty NDEF record with TNF=empty and length 0
    final emptyRecord = NdefRecordModel(
      tnf: NdefTnf.empty,
      type: Uint8List(0),
      id: Uint8List(0),
      payload: Uint8List(0),
    );

    return writeTag(
      records: [emptyRecord],
      promptMessage: promptMessage,
      verifyReadAfterWrite: true,
    );
  }

  @override
  Future<NfcWriteResult> lockTag({
    String promptMessage = 'Kilitlemek istediğiniz etiketi yaklaştırın',
  }) async {
    try {
      final dynamic result = await _channel.invokeMethod('lockTag', {
        'promptMessage': promptMessage,
      });
      if (result is Map) {
        return NfcWriteResult(
          isSuccess: result['isSuccess'] as bool? ?? false,
          message: result['message'] as String? ?? '',
        );
      }
      return const NfcWriteResult(
        isSuccess: false,
        message: 'Platformdan geçersiz yanıt alındı',
      );
    } on PlatformException catch (e) {
      return NfcWriteResult(
        isSuccess: false,
        message: e.message ?? 'Kilitleme başarısız oldu',
      );
    } catch (e) {
      return NfcWriteResult(isSuccess: false, message: e.toString());
    }
  }

  @override
  Future<String> startRawSession({String promptMessage = 'Etiketi yaklaştırın'}) async {
    try {
      final dynamic result = await _channel.invokeMethod('startRawSession', {
        'promptMessage': promptMessage,
      });
      if (result is Map) {
        return result['identifier'] as String? ?? '';
      }
      throw const NfcOperationException('Platformdan geçersiz yanıt alındı');
    } on PlatformException catch (e) {
      throw NfcOperationException(e.message ?? 'Etikete bağlanılamadı');
    }
  }

  @override
  Future<Uint8List> transceive(Uint8List command) async {
    try {
      final dynamic result = await _channel.invokeMethod('transceive', {'command': command});
      if (result is Uint8List) return result;
      throw const NfcOperationException('Etiketten geçersiz yanıt alındı');
    } on PlatformException catch (e) {
      throw NfcOperationException(e.message ?? 'Komut başarısız');
    }
  }

  @override
  Future<void> endRawSession({String? errorMessage, String? successMessage}) async {
    try {
      await _channel.invokeMethod('endRawSession', {
        'errorMessage': errorMessage,
        'successMessage': successMessage,
      });
    } catch (_) {}
  }

  @override
  Future<void> cancelSession() async {
    try {
      await _channel.invokeMethod('cancelSession');
    } catch (_) {}
  }
}
