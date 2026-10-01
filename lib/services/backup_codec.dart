import 'dart:convert';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import '../domain/ndef_record.dart';
import '../domain/storage_models.dart';
import '../domain/tag_rule.dart';

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
        'Yedekleme verisi izin verilen 2 MiB sınırını aşıyor (${utf8Bytes.length} bayt).',
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
      throw const BackupValidationException(
        'Yedek dosyası boyutu 2 MiB sınırını aşıyor.',
      );
    }

    dynamic decoded;
    try {
      decoded = jsonDecode(jsonContent);
    } catch (e) {
      throw BackupValidationException('Geçersiz JSON biçimi: $e');
    }

    if (decoded is! Map) {
      throw const BackupValidationException(
          'Yedek dosyasının kök yapısı bir JSON nesnesi olmalıdır.');
    }

    final root = Map<String, dynamic>.from(decoded);

    // Schema version validation
    final version = root['schemaVersion'];
    if (version == null) {
      throw const BackupValidationException(
          'Yedek dosyasında "schemaVersion" alanı eksik.');
    }
    if (version is! int) {
      throw const BackupValidationException(
          '"schemaVersion" alanı bir tamsayı olmalıdır.');
    }
    if (version != currentSchemaVersion) {
      throw BackupValidationException(
        'Desteklenmeyen yedek şema sürümü: $version (Beklenen sürüm: $currentSchemaVersion).',
      );
    }

    // 1. Templates validation
    final rawTemplates = root['templates'];
    final List<WriteTemplate> templates = [];
    if (rawTemplates != null) {
      if (rawTemplates is! List) {
        throw const BackupValidationException(
            '"templates" alanı bir liste olmalıdır.');
      }
      if (rawTemplates.length > maxTemplatesCount) {
        throw const BackupValidationException(
          'Şablon sayısı sınırı aşıldı: en fazla $maxTemplatesCount şablon desteklenir.',
        );
      }
      for (int i = 0; i < rawTemplates.length; i++) {
        final item = rawTemplates[i];
        if (item is! Map) {
          throw BackupValidationException(
              'Şablon #$i geçerli bir nesne değil.');
        }
        final map = Map<String, dynamic>.from(item);
        final id = map['id'];
        final name = map['name'];
        if (id == null || id is! String || id.trim().isEmpty) {
          throw BackupValidationException(
              'Şablon #$i için geçerli bir "id" dizesi zorunludur.');
        }
        if (name == null || name is! String || name.trim().isEmpty) {
          throw BackupValidationException(
              'Şablon #$i için geçerli bir "name" dizesi zorunludur.');
        }
        final records =
            _validateAndExtractRecords(map['records'], 'Şablon "$name"');
        final createdAt = _readDate(map['createdAt'], 'Şablon #$i createdAt');

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
        throw const BackupValidationException(
            '"history" alanı bir liste olmalıdır.');
      }
      if (rawHistory.length > maxHistoryCount) {
        throw const BackupValidationException(
          'Tarama geçmişi sınırı aşıldı: en fazla $maxHistoryCount geçmiş kaydı desteklenir.',
        );
      }
      history = [];
      for (int i = 0; i < rawHistory.length; i++) {
        final item = rawHistory[i];
        if (item is! Map) {
          throw BackupValidationException(
              'Geçmiş kaydı #$i geçerli bir nesne değil.');
        }
        final map = Map<String, dynamic>.from(item);
        final id = map['id'];
        if (id == null || id is! String || id.trim().isEmpty) {
          throw BackupValidationException(
              'Geçmiş kaydı #$i için "id" alanı zorunludur.');
        }
        final identifier =
            _readOptionalString(map['identifier'], 'Geçmiş #$i identifier') ??
                'Bilinmiyor';
        final timestamp = _readDate(map['timestamp'], 'Geçmiş #$i timestamp');
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
            map['records'], 'Geçmiş #$i ($identifier)');

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
        throw const BackupValidationException(
            '"tagRules" alanı bir liste olmalıdır.');
      }
      if (rawRules.length > maxRulesCount) {
        throw const BackupValidationException(
          'Etiket kuralı sayısı sınırı aşıldı: en fazla $maxRulesCount kural desteklenir.',
        );
      }
      tagRules = [];
      final hexRegex = RegExp(r'^[0-9a-fA-F]{64}$');
      for (int i = 0; i < rawRules.length; i++) {
        final item = rawRules[i];
        if (item is! Map) {
          throw BackupValidationException('Kural #$i geçerli bir nesne değil.');
        }
        final map = Map<String, dynamic>.from(item);
        final sha = map['ndefSha256'];
        if (sha == null || sha is! String || !hexRegex.hasMatch(sha)) {
          throw BackupValidationException(
            'Kural #$i için geçerli 64 karakterli SHA-256 onaltılık özeti (ndefSha256) zorunludur.',
          );
        }
        final note = map['note'];
        if (note == null || note is! String) {
          throw BackupValidationException(
              'Kural #$i için "note" dize alanı zorunludur.');
        }
        final createdAt = _readDate(map['createdAt'], 'Kural #$i createdAt');
        final updatedAt = _readDate(map['updatedAt'], 'Kural #$i updatedAt');

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
    throw BackupValidationException('$field bir metin olmalıdır.');
  }

  static DateTime _readDate(Object? value, String field) {
    final raw = _readOptionalString(value, field);
    if (raw == null) return DateTime.now();
    final parsed = DateTime.tryParse(raw);
    if (parsed == null) {
      throw BackupValidationException('$field geçerli bir tarih olmalıdır.');
    }
    return parsed;
  }

  static List<NdefRecordModel> _validateAndExtractRecords(
      dynamic rawRecords, String contextName) {
    if (rawRecords == null) return [];
    if (rawRecords is! List) {
      throw BackupValidationException(
          '$contextName: "records" alanı bir liste olmalıdır.');
    }
    if (rawRecords.length > maxRecordsPerItem) {
      throw BackupValidationException(
        '$contextName: Bir öğede en fazla $maxRecordsPerItem NDEF kaydı bulunabilir.',
      );
    }

    final List<NdefRecordModel> result = [];
    for (int r = 0; r < rawRecords.length; r++) {
      final rec = rawRecords[r];
      if (rec is! Map) {
        throw BackupValidationException(
            '$contextName - Kayıt #$r geçerli bir nesne değil.');
      }
      final map = Map<String, dynamic>.from(rec);

      // tnf
      final tnfVal = map['tnf'];
      if (tnfVal == null ||
          tnfVal is! int ||
          tnfVal < 0 ||
          tnfVal >= NdefTnf.values.length) {
        throw BackupValidationException(
            '$contextName - Kayıt #$r: Geçersiz TNF değeri ($tnfVal).');
      }
      final tnf = NdefTnf.values[tnfVal];

      // type (Base64)
      final rawType = map['type'];
      if (rawType != null && rawType is! String) {
        throw BackupValidationException(
            '$contextName - Kayıt #$r: "type" Base64 dizesi olmalıdır.');
      }
      Uint8List typeBytes;
      try {
        typeBytes =
            rawType != null ? base64Decode(rawType as String) : Uint8List(0);
      } catch (e) {
        throw BackupValidationException(
            '$contextName - Kayıt #$r: "type" geçerli Base64 verisi değil ($e).');
      }

      // id (Base64)
      final rawId = map['id'];
      if (rawId != null && rawId is! String) {
        throw BackupValidationException(
            '$contextName - Kayıt #$r: "id" Base64 dizesi olmalıdır.');
      }
      Uint8List idBytes;
      try {
        idBytes = rawId != null ? base64Decode(rawId as String) : Uint8List(0);
      } catch (e) {
        throw BackupValidationException(
            '$contextName - Kayıt #$r: "id" geçerli Base64 verisi değil ($e).');
      }

      // payload (Base64)
      final rawPayload = map['payload'];
      if (rawPayload != null && rawPayload is! String) {
        throw BackupValidationException(
            '$contextName - Kayıt #$r: "payload" Base64 dizesi olmalıdır.');
      }
      Uint8List payloadBytes;
      try {
        payloadBytes = rawPayload != null
            ? base64Decode(rawPayload as String)
            : Uint8List(0);
      } catch (e) {
        throw BackupValidationException(
            '$contextName - Kayıt #$r: "payload" geçerli Base64 verisi değil ($e).');
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
          'Şablonlar: $addedTemplates eklendi, $updatedTemplates güncellendi');
    }
    if (addedRules > 0 || updatedRules > 0) {
      parts.add(
          'Etiket Notları/Kuralları: $addedRules eklendi, $updatedRules güncellendi');
    }
    if (historySkippedDueToDisabled) {
      parts.add(
          'Tarama geçmişi cihazda kapalı olduğu için ${skippedHistory > 0 ? "$skippedHistory kayıt " : ""}atlandı');
    } else if (addedHistory > 0 || skippedHistory > 0) {
      parts
          .add('Geçmiş: $addedHistory eklendi, $skippedHistory mevcut/atlandı');
    }
    if (parts.isEmpty) {
      return 'İçe aktarılacak yeni veri bulunamadı (mevcut kayıtlarla eşleşti).';
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
