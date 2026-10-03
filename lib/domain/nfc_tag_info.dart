import '../l10n/l10n.dart';
import 'ndef_record.dart';

/// Tag technologies supported
enum NfcTagType {
  ndef,
  mifareUltralight,
  mifareClassic,
  iso15693,
  isoDep,
  unknown,
}

/// Metadata information about a detected NFC Tag
class NfcTagInfo {
  final String identifier; // Hex string UID/Serial
  final List<String> standardTechnologies;
  final bool isNdefSupported;
  final bool isWritable;
  final int maxByteCapacity;
  final int currentBytesUsed;
  final List<NdefRecordModel> records;
  final String? error;

  /// Native error code when [error] is set (not persisted).
  final String? errorCode;

  const NfcTagInfo({
    required this.identifier,
    this.standardTechnologies = const [],
    this.isNdefSupported = false,
    this.isWritable = false,
    this.maxByteCapacity = 0,
    this.currentBytesUsed = 0,
    this.records = const [],
    this.error,
    this.errorCode,
  });

  /// The user (or the app) stopped the NFC session; not a real failure.
  bool get wasCancelled => isCancelCode(errorCode);

  static bool isCancelCode(String? code) =>
      code == 'USER_CANCELLED' || code == 'SESSION_CANCELLED';

  Map<String, dynamic> toMap() {
    return {
      'identifier': identifier,
      'standardTechnologies': standardTechnologies,
      'isNdefSupported': isNdefSupported,
      'isWritable': isWritable,
      'maxByteCapacity': maxByteCapacity,
      'currentBytesUsed': currentBytesUsed,
      'records': records.map((r) => r.toMap()).toList(),
      'error': error,
    };
  }

  factory NfcTagInfo.fromMap(Map<dynamic, dynamic> map) {
    final rawRecords = map['records'] as List<dynamic>? ?? [];
    final records = rawRecords
        .map((r) => NdefRecordModel.fromMap(Map<dynamic, dynamic>.from(r as Map)))
        .toList();

    return NfcTagInfo(
      identifier: map['identifier'] as String? ?? L10n.current.unknown,
      standardTechnologies: List<String>.from(map['standardTechnologies'] ?? []),
      isNdefSupported: map['isNdefSupported'] as bool? ?? false,
      isWritable: map['isWritable'] as bool? ?? false,
      maxByteCapacity: (map['maxByteCapacity'] as num?)?.toInt() ?? 0,
      currentBytesUsed: (map['currentBytesUsed'] as num?)?.toInt() ?? 0,
      records: records,
      error: map['error'] as String?,
    );
  }

  int get availableBytes => (maxByteCapacity - currentBytesUsed).clamp(0, maxByteCapacity);
}

/// Result of an NFC write operation with verify
class NfcWriteResult {
  final bool isSuccess;
  final String message;
  final int bytesWritten;
  final bool verificationPassed;

  /// Platform error code when the write failed (e.g. NOT_NDEF_FORMATTED).
  final String? errorCode;

  const NfcWriteResult({
    required this.isSuccess,
    required this.message,
    this.bytesWritten = 0,
    this.verificationPassed = false,
    this.errorCode,
  });

  /// The tag has no NDEF capability container yet (blank NTAG on iPhone,
  /// or an unformattable tag on Android) and may be prepared via raw commands.
  bool get needsFormatting => errorCode == 'NOT_NDEF_FORMATTED' || errorCode == 'TAG_NOT_SUPPORTED';
}
