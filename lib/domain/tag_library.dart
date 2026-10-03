import 'ndef_record.dart';
import '../util/text_search.dart';

/// Category shown as a chip on a saved tag.
enum TagCategory { home, work, car, personal, business, other }

/// A physical tag the user wants to remember: a name, where it is, a photo
/// and the content that was written to it.
class TagLibraryEntry {
  final String id;
  final String name;
  final String note;
  final TagCategory category;
  final String locationNote;

  /// Photo path relative to the app documents folder (the absolute container
  /// path changes between iOS app updates).
  final String? photoPath;

  /// Hardware UID if known (empty on some iOS reads).
  final String? uid;
  final List<NdefRecordModel> records;
  final DateTime createdAt;
  final DateTime updatedAt;

  const TagLibraryEntry({
    required this.id,
    required this.name,
    this.note = '',
    this.category = TagCategory.other,
    this.locationNote = '',
    this.photoPath,
    this.uid,
    this.records = const [],
    required this.createdAt,
    required this.updatedAt,
  });

  TagLibraryEntry copyWith({
    String? name,
    String? note,
    TagCategory? category,
    String? locationNote,
    String? photoPath,
    bool clearPhoto = false,
    String? uid,
    List<NdefRecordModel>? records,
    DateTime? updatedAt,
  }) {
    return TagLibraryEntry(
      id: id,
      name: name ?? this.name,
      note: note ?? this.note,
      category: category ?? this.category,
      locationNote: locationNote ?? this.locationNote,
      photoPath: clearPhoto ? null : (photoPath ?? this.photoPath),
      uid: uid ?? this.uid,
      records: records ?? this.records,
      createdAt: createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  /// Case-insensitive search across the text fields and record contents.
  bool matches(String query) {
    final q = foldForSearch(query.trim());
    if (q.isEmpty) return true;
    if (foldForSearch('$name $note $locationNote ${uid ?? ''}').contains(q)) return true;
    for (final record in records) {
      if (foldForSearch(NdefCodec.parseRecord(record).content).contains(q)) return true;
    }
    return false;
  }

  /// Kept for callers; see [TextSearch.fold].
  static String foldForSearch(String value) => TextSearch.fold(value);

  Map<String, dynamic> toJsonMap() => {
        'id': id,
        'name': name,
        'note': note,
        'category': category.name,
        'locationNote': locationNote,
        'photoPath': photoPath,
        'uid': uid,
        'records': records.map((r) => r.toJsonMap()).toList(),
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
      };

  factory TagLibraryEntry.fromJsonMap(Map<String, dynamic> map) {
    final rawRecords = map['records'] as List<dynamic>? ?? [];
    final created = DateTime.tryParse(map['createdAt'] as String? ?? '') ?? DateTime.now();
    return TagLibraryEntry(
      id: map['id'] as String,
      name: map['name'] as String? ?? '',
      note: map['note'] as String? ?? '',
      category: TagCategory.values.firstWhere(
        (c) => c.name == map['category'],
        orElse: () => TagCategory.other,
      ),
      locationNote: map['locationNote'] as String? ?? '',
      photoPath: map['photoPath'] as String?,
      uid: map['uid'] as String?,
      records: rawRecords
          .map((r) => NdefRecordModel.fromJsonMap(Map<String, dynamic>.from(r as Map)))
          .toList(),
      createdAt: created,
      updatedAt: DateTime.tryParse(map['updatedAt'] as String? ?? '') ?? created,
    );
  }
}
