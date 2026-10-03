import '../l10n/l10n.dart';

/// Turns native NFC error codes into text in the app's language, and gives
/// iOS the texts for its system NFC sheet. Native code only falls back to its
/// own (Turkish) strings when these are missing.
class NativeMessages {
  /// Keys read by `t(...)` in ios/Runner/AppDelegate.swift.
  static Map<String, String> sheet() {
    final l = L10n.current;
    return {
      'multipleTags': l.nfcSheetMultipleTags,
      'unsupportedTag': l.nfcErrUnsupportedTag,
      'connectFailed': l.nfcErrConnectionLost,
      'readFailed': l.nfcReadError,
      'ntagOnly': l.nfcErrNtagOnly,
      'connected': l.nfcSheetConnected,
      'notNdefRead': l.nfcErrNotNdefRead,
      'emptyRead': l.nfcSheetEmptyRead,
      'readOk': l.nfcSheetReadOk,
      'notNdefWrite': l.nfcErrNotNdefWrite,
      'readOnly': l.nfcErrReadOnly,
      'noData': l.nfcErrNoData,
      'capacity': l.nfcErrCapacity('{required}', '{max}'),
      'writeFailed': l.writeFailed,
      'verifyFailed': l.nfcErrVerify,
      'writeVerified': l.nfcSheetWriteVerified,
      'written': l.nfcSheetWritten,
      'alreadyLocked': l.nfcErrAlreadyLocked,
      'lockNotNdef': l.nfcErrLockNotNdef,
      'lockFailed': l.lockFailed,
      'locked': l.nfcSheetLocked,
    };
  }

  /// Localized message for a PlatformException from the NFC channel.
  /// [locking] picks the lock wording for codes shared with writing.
  static String forError(
    String code,
    String? nativeMessage, {
    Object? details,
    required String fallback,
    bool locking = false,
  }) {
    final l = L10n.current;
    final native = nativeMessage?.trim() ?? '';
    String withDetail(String base) => native.isEmpty ? base : '$base ($native)';

    switch (code) {
      case 'NFC_UNAVAILABLE':
      case 'NFC_NOT_AVAILABLE':
        return l.nfcErrUnavailable;
      case 'OPERATION_IN_PROGRESS':
        return l.nfcErrBusy;
      case 'SESSION_CANCELLED':
      case 'USER_CANCELLED':
        return l.nfcErrCancelled;
      case 'ACTIVITY_PAUSED':
        return l.nfcErrAppPaused;
      case 'UNSUPPORTED_TAG':
        return native.contains('NTAG') ? l.nfcErrNtagOnly : l.nfcErrUnsupportedTag;
      case 'NOT_NDEF_FORMATTED':
        return l.nfcErrNotNdefWrite;
      case 'TAG_NOT_SUPPORTED':
        return locking ? l.nfcErrLockNotNdef : l.nfcErrNotNdefWrite;
      case 'TAG_NOT_WRITABLE':
        return locking ? l.nfcErrLockNotNdef : l.nfcErrReadOnly;
      case 'TAG_READ_ONLY':
        return l.nfcErrReadOnly;
      case 'NO_DATA':
        return l.nfcErrNoData;
      case 'CAPACITY_EXCEEDED':
        if (details is Map && details['required'] != null && details['capacity'] != null) {
          return l.nfcErrCapacity('${details['required']}', '${details['capacity']}');
        }
        return l.nfcErrCapacityShort;
      case 'VERIFICATION_FAILED':
        return l.nfcErrVerify;
      case 'CONNECT_FAILED':
      case 'QUERY_FAILED':
        return withDetail(l.nfcErrConnectionLost);
      case 'NO_SESSION':
        return l.nfcErrConnectionLost;
      case 'TRANSCEIVE_FAILED':
        return withDetail(l.commandFailed);
      case 'READ_FAILED':
        return withDetail(l.nfcReadError);
      case 'WRITE_ERROR':
      case 'WRITE_EXCEPTION':
        return withDetail(l.writeFailed);
      case 'ALREADY_LOCKED':
        return l.nfcErrAlreadyLocked;
      case 'LOCK_NOT_SUPPORTED':
        return l.nfcErrLockNotSupported;
      case 'LOCK_FAILED':
        return withDetail(l.lockFailed);
      case 'SESSION_ERROR':
        // iOS invalidation reason, already in the system language.
        return native.isEmpty ? fallback : native;
      default:
        return fallback;
    }
  }
}
