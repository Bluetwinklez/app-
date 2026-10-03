/// What a logbook is for; changes the summary shown on top.
enum LogBookKind { attendance, medication, inventory, custom }

/// One tap recorded in a logbook.
class LogEntry {
  final DateTime time;
  final String uid;

  /// Library name or the first record's text, whatever identified the tag.
  final String label;

  const LogEntry({required this.time, required this.uid, required this.label});

  Map<String, dynamic> toJsonMap() => {'time': time.toIso8601String(), 'uid': uid, 'label': label};

  factory LogEntry.fromJsonMap(Map<String, dynamic> m) => LogEntry(
        time: DateTime.tryParse(m['time'] as String? ?? '') ?? DateTime.fromMillisecondsSinceEpoch(0),
        uid: m['uid'] as String? ?? '',
        label: m['label'] as String? ?? '',
      );
}

/// A named list of timestamped scans: attendance, medication taken,
/// inventory counts…
class LogBook {
  static const int maxEntries = 5000;

  final String id;
  final String name;
  final LogBookKind kind;
  final DateTime createdAt;

  /// Newest first.
  final List<LogEntry> entries;

  const LogBook({
    required this.id,
    required this.name,
    required this.kind,
    required this.createdAt,
    this.entries = const [],
  });

  LogBook copyWith({String? name, List<LogEntry>? entries}) => LogBook(
        id: id,
        name: name ?? this.name,
        kind: kind,
        createdAt: createdAt,
        entries: entries ?? this.entries,
      );

  /// Adds [entry] on top, dropping the oldest beyond [maxEntries].
  LogBook add(LogEntry entry) =>
      copyWith(entries: [entry, ...entries].take(maxEntries).toList());

  LogBook removeAt(int index) => copyWith(entries: [...entries]..removeAt(index));

  static bool _sameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  List<LogEntry> entriesOn(DateTime day) =>
      entries.where((e) => _sameDay(e.time.toLocal(), day)).toList();

  /// Distinct tags (by UID, falling back to label) seen on [day].
  int distinctTagsOn(DateTime day) =>
      entriesOn(day).map((e) => e.uid.isNotEmpty ? e.uid : e.label).toSet().length;

  /// For inventory: last time each tag was seen, newest first.
  List<LogEntry> latestPerTag() {
    final seen = <String>{};
    return [
      for (final e in entries)
        if (seen.add(e.uid.isNotEmpty ? e.uid : e.label)) e,
    ];
  }

  Map<String, dynamic> toJsonMap() => {
        'id': id,
        'name': name,
        'kind': kind.name,
        'createdAt': createdAt.toIso8601String(),
        'entries': entries.map((e) => e.toJsonMap()).toList(),
      };

  factory LogBook.fromJsonMap(Map<String, dynamic> m) => LogBook(
        id: m['id'] as String,
        name: m['name'] as String? ?? '',
        kind: LogBookKind.values.firstWhere((k) => k.name == m['kind'], orElse: () => LogBookKind.custom),
        createdAt: DateTime.tryParse(m['createdAt'] as String? ?? '') ?? DateTime.now(),
        entries: [
          for (final e in (m['entries'] as List<dynamic>? ?? const []))
            LogEntry.fromJsonMap(Map<String, dynamic>.from(e as Map)),
        ],
      );
}
