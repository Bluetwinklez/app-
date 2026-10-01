/// Represents a local rule attached to a specific NDEF tag content.
/// Keyed by the SHA-256 hex digest of the raw NDEF message bytes.
/// Note: We do NOT key by UID because iOS scan identifiers are placeholder/zeroes in CoreNFC NDEF sessions.
class TagRule {
  final String ndefSha256; // 64 hex characters (lowercase)
  final String note; // User-defined note/label
  final DateTime createdAt;
  final DateTime updatedAt;

  const TagRule({
    required this.ndefSha256,
    required this.note,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toJsonMap() {
    return {
      'ndefSha256': ndefSha256.toLowerCase(),
      'note': note,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory TagRule.fromJsonMap(Map<String, dynamic> map) {
    return TagRule(
      ndefSha256: (map['ndefSha256'] as String? ?? '').toLowerCase(),
      note: map['note'] as String? ?? '',
      createdAt: DateTime.tryParse(map['createdAt'] as String? ?? '') ??
          DateTime.now(),
      updatedAt: DateTime.tryParse(map['updatedAt'] as String? ?? '') ??
          DateTime.now(),
    );
  }

  TagRule copyWith({
    String? note,
    DateTime? updatedAt,
  }) {
    return TagRule(
      ndefSha256: ndefSha256,
      note: note ?? this.note,
      createdAt: createdAt,
      updatedAt: updatedAt ?? DateTime.now(),
    );
  }
}
