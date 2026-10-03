import 'dart:convert';

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

  /// Free-form labels ("office", "floor 2") used like folders for filtering.
  final List<String> labels;

  /// Photo path relative to the app documents folder (the absolute container
  /// path changes between iOS app updates).
  final String? photoPath;

  /// Hardware UID if known (empty on some iOS reads).
  final String? uid;
  final List<NdefRecordModel> records;
  final DateTime createdAt;
  final DateTime updatedAt;

  /// Last time this tag was scanned (matched by UID); null if never.
  final DateTime? lastSeenAt;

  /// Maintenance / inspection interval: the tag should be scanned at least
  /// every this many days (fire extinguisher, filter, plant…). Null = none.
  final int? checkEveryDays;

  static const List<int> checkIntervals = [1, 7, 14, 30, 90, 180, 365];

  const TagLibraryEntry({
    required this.id,
    required this.name,
    this.note = '',
    this.category = TagCategory.other,
    this.locationNote = '',
    this.labels = const [],
    this.photoPath,
    this.uid,
    this.records = const [],
    required this.createdAt,
    required this.updatedAt,
    this.lastSeenAt,
    this.checkEveryDays,
  });

  /// Has an interval and was not scanned within it (counting from creation
  /// when never scanned).
  bool isCheckDue(DateTime now) {
    final days = checkEveryDays;
    if (days == null || days <= 0) return false;
    return !now.isBefore(nextCheckAt!);
  }

  /// When the next inspection scan is due; null without an interval.
  DateTime? get nextCheckAt {
    final days = checkEveryDays;
    if (days == null || days <= 0) return null;
    return (lastSeenAt ?? createdAt).add(Duration(days: days));
  }

  /// Not scanned for at least [days] days (or never).
  bool unseenFor(int days, DateTime now) =>
      lastSeenAt == null || now.difference(lastSeenAt!).inDays >= days;

  TagLibraryEntry copyWith({
    String? name,
    String? note,
    TagCategory? category,
    String? locationNote,
    List<String>? labels,
    String? photoPath,
    bool clearPhoto = false,
    String? uid,
    List<NdefRecordModel>? records,
    DateTime? updatedAt,
    DateTime? lastSeenAt,
    int? checkEveryDays,
    bool clearCheck = false,
  }) {
    return TagLibraryEntry(
      id: id,
      name: name ?? this.name,
      note: note ?? this.note,
      category: category ?? this.category,
      locationNote: locationNote ?? this.locationNote,
      labels: labels ?? this.labels,
      photoPath: clearPhoto ? null : (photoPath ?? this.photoPath),
      uid: uid ?? this.uid,
      records: records ?? this.records,
      createdAt: createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      lastSeenAt: lastSeenAt ?? this.lastSeenAt,
      checkEveryDays: clearCheck ? null : (checkEveryDays ?? this.checkEveryDays),
    );
  }

  /// Case-insensitive search across the text fields and record contents.
  bool matches(String query) {
    final q = foldForSearch(query.trim());
    if (q.isEmpty) return true;
    if (foldForSearch('$name $note $locationNote ${labels.join(' ')} ${uid ?? ''}').contains(q)) {
      return true;
    }
    for (final record in records) {
      if (foldForSearch(NdefCodec.parseRecord(record).content).contains(q)) return true;
    }
    return false;
  }

  static const int maxLabels = 10;
  static const int maxLabelLength = 30;

  /// "Office, floor 2 ,office" → ["Office", "floor 2"]: trimmed, de-duplicated
  /// ignoring case, capped in count and length.
  static List<String> parseLabels(String input) {
    final out = <String>[];
    final seen = <String>{};
    for (final raw in input.split(',')) {
      var label = raw.trim().replaceAll(RegExp(r'\s+'), ' ');
      if (label.isEmpty) continue;
      if (label.length > maxLabelLength) label = label.substring(0, maxLabelLength).trim();
      if (seen.add(TextSearch.fold(label))) out.add(label);
      if (out.length == maxLabels) break;
    }
    return out;
  }

  /// All labels across [entries], sorted, case-insensitively unique.
  static List<String> allLabels(Iterable<TagLibraryEntry> entries) {
    final byKey = <String, String>{};
    for (final e in entries) {
      for (final l in e.labels) {
        byKey.putIfAbsent(TextSearch.fold(l), () => l);
      }
    }
    final keys = byKey.keys.toList()..sort();
    return [for (final k in keys) byKey[k]!];
  }

  bool hasLabel(String label) {
    final key = TextSearch.fold(label);
    return labels.any((l) => TextSearch.fold(l) == key);
  }

  /// Clone check for a scan: a saved tag with the same content but a
  /// different UID, when the scanned UID itself is not in the library.
  /// Returns null when nothing looks copied.
  static TagLibraryEntry? cloneSuspect(
      Iterable<TagLibraryEntry> entries, String uid, List<NdefRecordModel> records) {
    if (uid.isEmpty || records.isEmpty) return null;
    final key = uid.toUpperCase();
    final content = _contentKey(records);
    TagLibraryEntry? suspect;
    for (final e in entries) {
      final other = e.uid?.toUpperCase() ?? '';
      if (other == key) return null;
      if (suspect == null && other.isNotEmpty && e.records.isNotEmpty && _contentKey(e.records) == content) {
        suspect = e;
      }
    }
    return suspect;
  }

  static String _contentKey(List<NdefRecordModel> records) =>
      jsonEncode([for (final r in records) r.toJsonMap()]);

  /// Kept for callers; see [TextSearch.fold].
  static String foldForSearch(String value) => TextSearch.fold(value);

  Map<String, dynamic> toJsonMap() => {
        'id': id,
        'name': name,
        'note': note,
        'category': category.name,
        'locationNote': locationNote,
        if (labels.isNotEmpty) 'labels': labels,
        'photoPath': photoPath,
        'uid': uid,
        'records': records.map((r) => r.toJsonMap()).toList(),
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
        if (lastSeenAt != null) 'lastSeenAt': lastSeenAt!.toIso8601String(),
        if (checkEveryDays != null) 'checkEveryDays': checkEveryDays,
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
      labels: parseLabels((map['labels'] as List<dynamic>? ?? const []).whereType<String>().join(',')),
      photoPath: map['photoPath'] as String?,
      uid: map['uid'] as String?,
      records: rawRecords
          .map((r) => NdefRecordModel.fromJsonMap(Map<String, dynamic>.from(r as Map)))
          .toList(),
      createdAt: created,
      updatedAt: DateTime.tryParse(map['updatedAt'] as String? ?? '') ?? created,
      lastSeenAt: DateTime.tryParse(map['lastSeenAt'] as String? ?? ''),
      checkEveryDays: (map['checkEveryDays'] as num?)?.toInt(),
    );
  }
}
