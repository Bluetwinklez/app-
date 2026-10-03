import 'dart:convert';
import 'dart:typed_data';
import '../l10n/l10n.dart';
import 'ndef_record.dart';

/// In-memory snapshot of NDEF records copied to clipboard
class NdefClipboardSnapshot {
  final List<NdefRecordModel> records;
  final DateTime copiedAt;
  final String sourceDescription;

  const NdefClipboardSnapshot({
    required this.records,
    required this.copiedAt,
    required this.sourceDescription,
  });

  int get recordCount => records.length;

  /// Total NDEF message byte size
  int get byteSize => encodeNdefMessage(records).length;

  /// Creates a pure, immutable snapshot of the given records
  factory NdefClipboardSnapshot.fromRecords(
    List<NdefRecordModel> source, {
    String? sourceDescription,
  }) {
    // Deep clone records to ensure no shared mutable byte references
    final cloned = source.map((r) {
      return NdefRecordModel(
        tnf: r.tnf,
        type: Uint8List.fromList(r.type),
        id: Uint8List.fromList(r.id),
        payload: Uint8List.fromList(r.payload),
      );
    }).toList(growable: false);

    return NdefClipboardSnapshot(
      records: cloned,
      copiedAt: DateTime.now(),
      sourceDescription: sourceDescription ?? L10n.current.scannedTag,
    );
  }
}

/// Offline URL Safety Assessment
class UrlSafetyAssessment {
  final String rawUrl;
  final String scheme;
  final String host;
  final int? port;
  final bool hasUserInfo;
  final bool isIpLiteral;
  final bool isPunycode;
  final bool isSuspiciousScheme;
  final List<String> warnings;

  const UrlSafetyAssessment({
    required this.rawUrl,
    required this.scheme,
    required this.host,
    this.port,
    required this.hasUserInfo,
    required this.isIpLiteral,
    required this.isPunycode,
    required this.isSuspiciousScheme,
    required this.warnings,
  });

  /// Evaluates URL statically without network requests and without claiming malware detection
  static UrlSafetyAssessment evaluate(String input) {
    final trimmed = input.trim();
    final warnings = <String>[];

    Uri? uri;
    try {
      if (!trimmed.contains('://') && !trimmed.contains(':')) {
        uri = Uri.tryParse('http://$trimmed');
        // keep note that original lacked scheme
      } else {
        uri = Uri.tryParse(trimmed);
      }
    } catch (_) {
      warnings.add(L10n.current.urlSafetyInvalidUrl);
    }

    final hasOrigScheme = trimmed.contains('://') || (trimmed.contains(':') && !trimmed.startsWith(':'));
    final scheme = hasOrigScheme ? (Uri.tryParse(trimmed)?.scheme.toLowerCase() ?? '') : '';
    final effectiveUri = uri ?? Uri.tryParse(trimmed);
    final host = effectiveUri?.host.toLowerCase() ?? '';
    final port = (effectiveUri != null && effectiveUri.hasPort) ? effectiveUri.port : null;
    final userInfo = effectiveUri?.userInfo ?? '';
    final hasUserInfo = userInfo.isNotEmpty;

    // Check scheme
    bool isSuspiciousScheme = false;
    if (scheme.isEmpty) {
      warnings.add(L10n.current.urlSafetyMissingScheme);
    } else if (scheme != 'http' && scheme != 'https') {
      isSuspiciousScheme = true;
      warnings.add(L10n.current.urlSafetySuspiciousScheme(scheme));
    } else if (scheme == 'http') {
      warnings.add(L10n.current.urlSafetyUnencrypted);
    }

    // Check userInfo
    if (hasUserInfo) {
      warnings.add(L10n.current.urlSafetyUserInfo);
    }

    // Check IP literal (IPv4 or IPv6)
    bool isIpLiteral = false;
    final ipv4Parts = host.split('.');
    if (ipv4Parts.length == 4 && ipv4Parts.every((p) {
      final n = int.tryParse(p);
      return n != null && n >= 0 && n <= 255;
    })) {
      isIpLiteral = true;
      warnings.add(L10n.current.urlSafetyIpv4);
    } else if (host.contains(':')) {
      isIpLiteral = true;
      warnings.add(L10n.current.urlSafetyIpv6);
    }

    // Check Punycode (IDN homograph attack indicator)
    bool isPunycode = false;
    if (host.contains('xn--')) {
      isPunycode = true;
      warnings.add(L10n.current.urlSafetyPunycode);
    }

    // Port check
    if (port != null && port != 80 && port != 443) {
      warnings.add(L10n.current.urlSafetyNonStandardPort(port.toString()));
    }

    return UrlSafetyAssessment(
      rawUrl: trimmed,
      scheme: scheme,
      host: host,
      port: port,
      hasUserInfo: hasUserInfo,
      isIpLiteral: isIpLiteral,
      isPunycode: isPunycode,
      isSuspiciousScheme: isSuspiciousScheme,
      warnings: warnings,
    );
  }
}

/// Helper for advanced record preview and formatting
class RecordInspectionData {
  final int index;
  final String tnfName;
  final String typeText;
  final String typeHex;
  final String idText;
  final String idHex;
  final int payloadLength;
  final String payloadHexPreview; // Bounded hex preview
  final String payloadTextPreview; // Bounded text preview
  final bool isPayloadTruncated;

  const RecordInspectionData({
    required this.index,
    required this.tnfName,
    required this.typeText,
    required this.typeHex,
    required this.idText,
    required this.idHex,
    required this.payloadLength,
    required this.payloadHexPreview,
    required this.payloadTextPreview,
    required this.isPayloadTruncated,
  });

  static RecordInspectionData inspect(NdefRecordModel record, {int index = 0, int maxHexBytes = 64, int maxChars = 200}) {
    final tnfName = _tnfDescription(record.tnf);
    final typeText = _toPrintableString(record.type);
    final typeHex = _bytesToHex(record.type);
    final idText = _toPrintableString(record.id);
    final idHex = _bytesToHex(record.id);

    final payloadLength = record.payload.length;
    final bool isPayloadTruncated = payloadLength > maxHexBytes;
    final previewBytes = record.payload.sublist(0, payloadLength > maxHexBytes ? maxHexBytes : payloadLength);
    final payloadHexPreview = _bytesToHex(previewBytes);

    // Text preview (bounded)
    String textPreview = '';
    try {
      final decoded = utf8.decode(previewBytes, allowMalformed: true);
      // Clean control chars
      textPreview = decoded.replaceAll(RegExp(r'[\x00-\x08\x0B\x0C\x0E-\x1F]'), '·');
      if (textPreview.length > maxChars) {
        textPreview = '${textPreview.substring(0, maxChars)}...';
      }
    } catch (_) {
      textPreview = L10n.current.binaryDataPreview;
    }

    return RecordInspectionData(
      index: index,
      tnfName: tnfName,
      typeText: typeText.isEmpty ? L10n.current.emptyValue : typeText,
      typeHex: typeHex.isEmpty ? L10n.current.emptyValue : typeHex,
      idText: idText.isEmpty ? L10n.current.emptyValue : idText,
      idHex: idHex.isEmpty ? L10n.current.emptyValue : idHex,
      payloadLength: payloadLength,
      payloadHexPreview: payloadHexPreview.isEmpty ? '(${L10n.current.bytesValue('0')})' : payloadHexPreview,
      payloadTextPreview: textPreview,
      isPayloadTruncated: isPayloadTruncated,
    );
  }

  static String _tnfDescription(NdefTnf tnf) {
    switch (tnf) {
      case NdefTnf.empty:
        return L10n.current.tnfEmpty;
      case NdefTnf.wellKnown:
        return L10n.current.tnfWellKnown;
      case NdefTnf.media:
        return L10n.current.tnfMedia;
      case NdefTnf.absoluteUri:
        return L10n.current.tnfAbsoluteUri;
      case NdefTnf.external:
        return L10n.current.tnfExternal;
      case NdefTnf.unknown:
        return L10n.current.tnfUnknown;
      case NdefTnf.unchanged:
        return L10n.current.tnfUnchanged;
      case NdefTnf.reserved:
        return L10n.current.tnfReserved;
    }
  }

  static String _bytesToHex(Uint8List bytes) {
    return bytes.map((b) => b.toRadixString(16).padLeft(2, '0').toUpperCase()).join(' ');
  }

  static String _toPrintableString(Uint8List bytes) {
    if (bytes.isEmpty) return '';
    final isAsciiPrintable = bytes.every((b) => b >= 32 && b <= 126);
    if (isAsciiPrintable) {
      return ascii.decode(bytes);
    }
    return '';
  }
}

/// State tracking for batch write operations
enum BatchTagStatus {
  pending,
  writing,
  success,
  failed,
  cancelled,
}

class BatchTagAttempt {
  final int index;
  final BatchTagStatus status;
  final String? message;
  final DateTime? completedAt;

  const BatchTagAttempt({
    required this.index,
    this.status = BatchTagStatus.pending,
    this.message,
    this.completedAt,
  });

  BatchTagAttempt copyWith({
    BatchTagStatus? status,
    String? message,
    DateTime? completedAt,
  }) {
    return BatchTagAttempt(
      index: index,
      status: status ?? this.status,
      message: message ?? this.message,
      completedAt: completedAt ?? this.completedAt,
    );
  }
}
