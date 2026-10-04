import 'ndef_record.dart';

/// Serializable model representing a saved scan entry in local history.
/// Errors are never stored in history.
class ScanHistoryEntry {
  final String id; // Unique id for deletion
  final DateTime timestamp;
  final String identifier; // Hex UID / serial
  final List<String> standardTechnologies;
  final bool isNdefSupported;
  final bool isWritable;
  final int maxByteCapacity;
  final int currentBytesUsed;
  final List<NdefRecordModel> records;

  /// User labels ("office", "to check") for filtering the history.
  final List<String> labels;

  const ScanHistoryEntry({
    required this.id,
    required this.timestamp,
    required this.identifier,
    this.standardTechnologies = const [],
    this.isNdefSupported = false,
    this.isWritable = false,
    this.maxByteCapacity = 0,
    this.currentBytesUsed = 0,
    this.records = const [],
    this.labels = const [],
  });

  ScanHistoryEntry withLabels(List<String> labels) => ScanHistoryEntry(
        id: id,
        timestamp: timestamp,
        identifier: identifier,
        standardTechnologies: standardTechnologies,
        isNdefSupported: isNdefSupported,
        isWritable: isWritable,
        maxByteCapacity: maxByteCapacity,
        currentBytesUsed: currentBytesUsed,
        records: records,
        labels: labels,
      );

  Map<String, dynamic> toJsonMap() {
    return {
      'id': id,
      'timestamp': timestamp.toIso8601String(),
      'identifier': identifier,
      'standardTechnologies': standardTechnologies,
      'isNdefSupported': isNdefSupported,
      'isWritable': isWritable,
      'maxByteCapacity': maxByteCapacity,
      'currentBytesUsed': currentBytesUsed,
      'records': records.map((r) => r.toJsonMap()).toList(),
      if (labels.isNotEmpty) 'labels': labels,
    };
  }

  factory ScanHistoryEntry.fromJsonMap(Map<String, dynamic> map) {
    final rawRecords = map['records'] as List<dynamic>? ?? [];
    final records = rawRecords
        .map((r) => NdefRecordModel.fromJsonMap(Map<String, dynamic>.from(r as Map)))
        .toList();

    return ScanHistoryEntry(
      id: map['id'] as String? ?? DateTime.now().millisecondsSinceEpoch.toString(),
      timestamp: DateTime.tryParse(map['timestamp'] as String? ?? '') ?? DateTime.now(),
      identifier: map['identifier'] as String? ?? 'Bilinmiyor',
      standardTechnologies: List<String>.from(map['standardTechnologies'] ?? []),
      isNdefSupported: map['isNdefSupported'] as bool? ?? false,
      isWritable: map['isWritable'] as bool? ?? false,
      maxByteCapacity: (map['maxByteCapacity'] as num?)?.toInt() ?? 0,
      currentBytesUsed: (map['currentBytesUsed'] as num?)?.toInt() ?? 0,
      records: records,
      labels: (map['labels'] as List<dynamic>? ?? const []).whereType<String>().toList(),
    );
  }
}

/// Reusable named template holding NDEF records for the write composer.
class WriteTemplate {
  final String id;
  final String name;
  final DateTime createdAt;
  final List<NdefRecordModel> records;

  const WriteTemplate({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.records,
  });

  Map<String, dynamic> toJsonMap() {
    return {
      'id': id,
      'name': name,
      'createdAt': createdAt.toIso8601String(),
      'records': records.map((r) => r.toJsonMap()).toList(),
    };
  }

  factory WriteTemplate.fromJsonMap(Map<String, dynamic> map) {
    final rawRecords = map['records'] as List<dynamic>? ?? [];
    final records = rawRecords
        .map((r) => NdefRecordModel.fromJsonMap(Map<String, dynamic>.from(r as Map)))
        .toList();

    return WriteTemplate(
      id: map['id'] as String? ?? DateTime.now().millisecondsSinceEpoch.toString(),
      name: map['name'] as String? ?? 'Şablon',
      createdAt: DateTime.tryParse(map['createdAt'] as String? ?? '') ?? DateTime.now(),
      records: records,
    );
  }
}
