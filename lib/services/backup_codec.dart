import 'dart:convert';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import '../domain/ndef_record.dart';
import '../domain/storage_models.dart';
import '../domain/tag_rule.dart';
import '../l10n/l10n.dart';

/// Pure Dart codec and validator for versioned JSON backups.
///
/// Limits:
/// - Max raw JSON payload size: 2 MiB (2 * 1024 * 1024 bytes)
/// - Max templates count: 500
/// - Max history entries count: 1000
/// - Max tag rules count: 500
/// - Max records per entry/template: 100
/// - Schema version: 1
class BackupCodec {
  static const int currentSchemaVersion = 1;
  static const int maxByteSize = 2 * 1024 * 1024; // 2 MiB
  static const int maxTemplatesCount = 500;
  static const int maxHistoryCount = 1000;
  static const int maxRulesCount = 500;
  static const int maxRecordsPerItem = 100;

  /// Computes the lowercase hex SHA-256 digest of raw NDEF bytes.
  static String computeNdefSha256(Uint8List ndefBytes) {
    return sha256.convert(ndefBytes).toString().toLowerCase();
  }

  /// Encodes templates, optional history, and optional tag rules into a formatted JSON string.
  /// Does not include secrets or keys beyond the stored payloads.
  static String encodeBackup({
    required List<WriteTemplate> templates,
    List<ScanHistoryEntry>? history,
    List<TagRule>? tagRules,
    String? clientAppVersion,
  }) {
    final Map<String, dynamic> root = {
      'schemaVersion': currentSchemaVersion,
      'app': 'nfc_tag_master',
      'exportedAt': DateTime.now().toUtc().toIso8601String(),
      if (clientAppVersion != null) 'appVersion': clientAppVersion,
      'templates': templates.map((t) => t.toJsonMap()).toList(),
      if (history != null)
        'history': history.map((h) => h.toJsonMap()).toList(),
      if (tagRules != null)
        'tagRules': tagRules.map((r) => r.toJsonMap()).toList(),
    };

    final jsonStr = const JsonEncoder.withIndent('  ').convert(root);
    final utf8Bytes = utf8.encode(jsonStr);
    if (utf8Bytes.length > maxByteSize) {
      throw BackupValidationException(
        L10n.current.backupSizeExceeded(utf8Bytes.length),
      );
    }
    return jsonStr;
  }

  /// Validates and decodes raw JSON string or bytes into a structured [BackupPayload].
  /// Enforces:
  /// - Byte size <= 2 MiB
  /// - JSON parse & Map structure
  /// - schemaVersion == 1
  /// - Count limits
  /// - Strict type checking & Base64 validation for all NDEF records
  /// - SHA-256 hex format validation for tag rules
  static BackupPayload decodeAndValidate(String jsonContent) {
    final encodedBytes = utf8.encode(jsonContent);
    if (encodedBytes.length > maxByteSize) {
      throw BackupValidationException(
        L10n.current.backupFileSizeExceeded,
      );
    }

    dynamic decoded;
    try {
      decoded = jsonDecode(jsonContent);
    } catch (e) {
      throw BackupValidationException(L10n.current.backupInvalidJson(e.toString()));
    }

    if (decoded is! Map) {
      throw BackupValidationException(
          L10n.current.backupRootMustBeObject);
    }

    final root = Map<String, dynamic>.from(decoded);

    // Schema version validation
    final version = root['schemaVersion'];
    if (version == null) {
      throw BackupValidationException(
          L10n.current.backupMissingSchemaVersion);
    }
    if (version is! int) {
      throw BackupValidationException(
          L10n.current.backupSchemaVersionMustBeInt);
    }
    if (version != currentSchemaVersion) {
      throw BackupValidationException(
        L10n.current.backupUnsupportedSchemaVersion(version.toString()),
      );
    }

    // 1. Templates validation
    final rawTemplates = root['templates'];
    final List<WriteTemplate> templates = [];
    if (rawTemplates != null) {
      if (rawTemplates is! List) {
        throw BackupValidationException(
            L10n.current.backupTemplatesMustBeList);
      }
      if (rawTemplates.length > maxTemplatesCount) {
        throw BackupValidationException(
          L10n.current.backupMaxTemplatesExceeded(maxTemplatesCount, rawTemplates.length),
        );
      }
      for (int i = 0; i < rawTemplates.length; i++) {
        final item = rawTemplates[i];
        if (item is! Map) {
          throw BackupValidationException(
              L10n.current.backupTemplateMustBeObject);
        }
        final map = Map<String, dynamic>.from(item);
        final id = map['id'];
        final name = map['name'];
        if (id == null || id is! String || id.trim().isEmpty) {
          throw BackupValidationException(
              L10n.current.backupInvalidTemplateId);
        }
        if (name == null || name is! String || name.trim().isEmpty) {
          throw BackupValidationException(
              L10n.current.backupInvalidTemplateName);
        }
        final records =
            _validateAndExtractRecords(map['records'], map['name']?.toString() ?? '');
        final createdAt = _readDate(map['createdAt'], 'createdAt');

        templates.add(WriteTemplate(
          id: id,
          name: name,
          createdAt: createdAt,
          records: records,
        ));
      }
    }

    // 2. History validation (optional in backup)
    final rawHistory = root['history'];
    List<ScanHistoryEntry>? history;
    if (rawHistory != null) {
      if (rawHistory is! List) {
        throw BackupValidationException(
            L10n.current.backupHistoryMustBeList);
      }
      if (rawHistory.length > maxHistoryCount) {
        throw BackupValidationException(
          L10n.current.backupMaxHistoryExceeded(maxHistoryCount, rawHistory.length),
        );
      }
      history = [];
      for (int i = 0; i < rawHistory.length; i++) {
        final item = rawHistory[i];
        if (item is! Map) {
          throw BackupValidationException(
              L10n.current.backupRecordMustBeObject);
        }
        final map = Map<String, dynamic>.from(item);
        final id = map['id'];
        if (id == null || id is! String || id.trim().isEmpty) {
          throw BackupValidationException(
              L10n.current.backupInvalidTemplateId);
        }
        final identifier =
            _readOptionalString(map['identifier'], 'identifier') ??
                L10n.current.unknown;
        final timestamp = _readDate(map['timestamp'], 'timestamp');
        final isNdefSupported = map['isNdefSupported'] is bool
            ? map['isNdefSupported'] as bool
            : false;
        final isWritable =
            map['isWritable'] is bool ? map['isWritable'] as bool : false;
        final maxByteCapacity = (map['maxByteCapacity'] is num)
            ? (map['maxByteCapacity'] as num).toInt()
            : 0;
        final currentBytesUsed = (map['currentBytesUsed'] is num)
            ? (map['currentBytesUsed'] as num).toInt()
            : 0;
        final List<String> standardTechnologies = [];
        if (map['standardTechnologies'] is List) {
          for (final t in map['standardTechnologies'] as List) {
            if (t is String) standardTechnologies.add(t);
          }
        }
        final records = _validateAndExtractRecords(
            map['records'], identifier);

        history.add(ScanHistoryEntry(
          id: id,
          timestamp: timestamp,
          identifier: identifier,
          standardTechnologies: standardTechnologies,
          isNdefSupported: isNdefSupported,
          isWritable: isWritable,
          maxByteCapacity: maxByteCapacity,
          currentBytesUsed: currentBytesUsed,
          records: records,
        ));
      }
    }

    // 3. Tag rules validation (optional in backup)
    final rawRules = root['tagRules'];
    List<TagRule>? tagRules;
    if (rawRules != null) {
      if (rawRules is! List) {
        throw BackupValidationException(
            L10n.current.backupTagRulesMustBeList);
      }
      if (rawRules.length > maxRulesCount) {
        throw BackupValidationException(
          L10n.current.backupMaxTagRulesExceeded(maxRulesCount, rawRules.length),
        );
      }
      tagRules = [];
      final hexRegex = RegExp(r'^[0-9a-fA-F]{64}$');
      for (int i = 0; i < rawRules.length; i++) {
        final item = rawRules[i];
        if (item is! Map) {
          throw BackupValidationException(L10n.current.backupRuleMustBeObject);
        }
        final map = Map<String, dynamic>.from(item);
        final sha = map['ndefSha256'];
        if (sha == null || sha is! String || !hexRegex.hasMatch(sha)) {
          throw BackupValidationException(
            L10n.current.backupInvalidRuleSha,
          );
        }
        final note = map['note'];
        if (note == null || note is! String) {
          throw BackupValidationException(
              L10n.current.backupInvalidRuleNote);
        }
        final createdAt = _readDate(map['createdAt'], 'createdAt');
        final updatedAt = _readDate(map['updatedAt'], 'updatedAt');

        tagRules.add(TagRule(
          ndefSha256: sha.toLowerCase(),
          note: note,
          createdAt: createdAt,
          updatedAt: updatedAt,
        ));
      }
    }

    return BackupPayload(
      schemaVersion: version,
      exportedAt: _readDate(root['exportedAt'], 'exportedAt'),
      templates: templates,
      history: history,
      tagRules: tagRules,
    );
  }

  static String? _readOptionalString(Object? value, String field) {
    if (value == null) return null;
    if (value is String) return value;
    throw BackupValidationException(L10n.current.backupFieldMustBeString(field));
  }

  static DateTime _readDate(Object? value, String field) {
    final raw = _readOptionalString(value, field);
    if (raw == null) return DateTime.now();
    final parsed = DateTime.tryParse(raw);
    if (parsed == null) {
      throw BackupValidationException(L10n.current.backupFieldMustBeDate(field));
    }
    return parsed;
  }

  static List<NdefRecordModel> _validateAndExtractRecords(
      dynamic rawRecords, String contextName) {
    if (rawRecords == null) return [];
    if (rawRecords is! List) {
      throw BackupValidationException(
          L10n.current.backupContextRecordsMustBeList(contextName));
    }
    if (rawRecords.length > maxRecordsPerItem) {
      throw BackupValidationException(
        L10n.current.backupContextMaxRecords(contextName, maxRecordsPerItem),
      );
    }

    final List<NdefRecordModel> result = [];
    for (int r = 0; r < rawRecords.length; r++) {
      final rec = rawRecords[r];
      if (rec is! Map) {
        throw BackupValidationException(
            L10n.current.backupContextRecordMustBeObject(contextName, r));
      }
      final map = Map<String, dynamic>.from(rec);

      // tnf
      final tnfVal = map['tnf'];
      if (tnfVal == null ||
          tnfVal is! int ||
          tnfVal < 0 ||
          tnfVal >= NdefTnf.values.length) {
        throw BackupValidationException(
            L10n.current.backupContextInvalidTnf(contextName, r, tnfVal.toString()));
      }
      final tnf = NdefTnf.values[tnfVal];

      // type (Base64)
      final rawType = map['type'];
      if (rawType != null && rawType is! String) {
        throw BackupValidationException(
            L10n.current.backupContextTypeMustBeString(contextName, r));
      }
      Uint8List typeBytes;
      try {
        typeBytes =
            rawType != null ? base64Decode(rawType as String) : Uint8List(0);
      } catch (e) {
        throw BackupValidationException(
            L10n.current.backupContextInvalidTypeBase64(contextName, r, e.toString()));
      }

      // id (Base64)
      final rawId = map['id'];
      if (rawId != null && rawId is! String) {
        throw BackupValidationException(
            L10n.current.backupContextIdMustBeString(contextName, r));
      }
      Uint8List idBytes;
      try {
        idBytes = rawId != null ? base64Decode(rawId as String) : Uint8List(0);
      } catch (e) {
        throw BackupValidationException(
            L10n.current.backupContextInvalidIdBase64(contextName, r, e.toString()));
      }

      // payload (Base64)
      final rawPayload = map['payload'];
      if (rawPayload != null && rawPayload is! String) {
        throw BackupValidationException(
            L10n.current.backupContextPayloadMustBeString(contextName, r));
      }
      Uint8List payloadBytes;
      try {
        payloadBytes = rawPayload != null
            ? base64Decode(rawPayload as String)
            : Uint8List(0);
      } catch (e) {
        throw BackupValidationException(
            L10n.current.backupContextInvalidPayloadBase64(contextName, r, e.toString()));
      }

      result.add(NdefRecordModel(
        tnf: tnf,
        type: typeBytes,
        id: idBytes,
        payload: payloadBytes,
      ));
    }
    return result;
  }
}

/// Structured container holding verified backup contents.
class BackupPayload {
  final int schemaVersion;
  final DateTime exportedAt;
  final List<WriteTemplate> templates;
  final List<ScanHistoryEntry>? history;
  final List<TagRule>? tagRules;

  const BackupPayload({
    required this.schemaVersion,
    required this.exportedAt,
    required this.templates,
    this.history,
    this.tagRules,
  });

  bool get hasHistory => history != null && history!.isNotEmpty;
  bool get hasTagRules => tagRules != null && tagRules!.isNotEmpty;
}

/// Result of an import merge operation.
class ImportMergeResult {
  final int addedTemplates;
  final int updatedTemplates;
  final int addedHistory;
  final int skippedHistory;
  final bool historySkippedDueToDisabled;
  final int addedRules;
  final int updatedRules;

  const ImportMergeResult({
    required this.addedTemplates,
    required this.updatedTemplates,
    required this.addedHistory,
    required this.skippedHistory,
    required this.historySkippedDueToDisabled,
    required this.addedRules,
    required this.updatedRules,
  });

  String toSummaryMessage() {
    final parts = <String>[];
    if (addedTemplates > 0 || updatedTemplates > 0) {
      parts.add(
          L10n.current.backupSummaryTemplates(addedTemplates.toString(), updatedTemplates.toString()));
    }
    if (addedRules > 0 || updatedRules > 0) {
      parts.add(
          L10n.current.backupSummaryRules(addedRules.toString(), updatedRules.toString()));
    }
    if (historySkippedDueToDisabled) {
      final skippedStr = skippedHistory > 0 ? '$skippedHistory ' : '';
      parts.add(L10n.current.backupSummaryHistoryDisabled(skippedStr));
    } else if (addedHistory > 0 || skippedHistory > 0) {
      parts.add(
          L10n.current.backupSummaryHistory(addedHistory.toString(), skippedHistory.toString()));
    }
    if (parts.isEmpty) {
      return L10n.current.backupSummaryNoNewData;
    }
    return parts.join(' | ');
  }
}

/// Thrown when backup JSON validation fails.
class BackupValidationException implements Exception {
  final String message;
  const BackupValidationException(this.message);

  @override
  String toString() => message;
}
