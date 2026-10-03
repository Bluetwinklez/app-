/// What a logbook is for; changes the summary shown on top.
enum LogBookKind { attendance, medication, inventory, timeClock, habit, chores, feeding, visitors, custom }

/// One tap recorded in a logbook.
class LogEntry {
  final DateTime time;
  final String uid;

  /// Library name or the first record's text, whatever identified the tag.
  final String label;

  /// Time clock books only: true for check-in, false for check-out.
  final bool? checkIn;

  /// Free text typed at scan time (visitor name…).
  final String note;

  const LogEntry({required this.time, required this.uid, required this.label, this.checkIn, this.note = ''});

  /// UID, or the label when the UID is unknown; identifies a person/tag.
  String get key => uid.isNotEmpty ? uid : label;

  Map<String, dynamic> toJsonMap() => {
        'time': time.toIso8601String(),
        'uid': uid,
        'label': label,
        if (checkIn != null) 'in': checkIn,
        if (note.isNotEmpty) 'note': note,
      };

  factory LogEntry.fromJsonMap(Map<String, dynamic> m) => LogEntry(
        time: DateTime.tryParse(m['time'] as String? ?? '') ?? DateTime.fromMillisecondsSinceEpoch(0),
        uid: m['uid'] as String? ?? '',
        label: m['label'] as String? ?? '',
        checkIn: m['in'] as bool?,
        note: m['note'] as String? ?? '',
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

  /// Adds [entry] on top, dropping the oldest beyond [maxEntries]. In a time
  /// clock book the entry alternates check-in / check-out per tag.
  LogBook add(LogEntry entry) {
    if (kind == LogBookKind.timeClock && entry.checkIn == null) {
      entry = LogEntry(
          time: entry.time, uid: entry.uid, label: entry.label, note: entry.note, checkIn: !isInside(entry.key));
    }
    return copyWith(entries: [entry, ...entries].take(maxEntries).toList());
  }

  /// Time clock: the tag's latest entry is a check-in.
  bool isInside(String key) {
    for (final e in entries) {
      if (e.key == key) return e.checkIn == true;
    }
    return false;
  }

  /// Time clock: labels of tags currently checked in, by check-in time.
  List<LogEntry> presentNow() {
    final seen = <String>{};
    return [
      for (final e in entries)
        if (seen.add(e.key) && e.checkIn == true) e,
    ];
  }

  /// Time clock: time spent inside on [day] per tag key (label for display
  /// comes from the latest entry). An open check-in counts until [now] (or
  /// the end of [day]). Intervals crossing midnight are clipped to [day].
  Map<String, ({String label, Duration worked})> workedOn(DateTime day, {DateTime? now}) {
    now ??= DateTime.now();
    final start = DateTime(day.year, day.month, day.day);
    final end = start.add(const Duration(days: 1));
    final result = <String, ({String label, Duration worked})>{};
    final open = <String, DateTime>{};
    final labels = <String, String>{};
    void addSpan(String key, DateTime from, DateTime to) {
      final a = from.isBefore(start) ? start : from;
      final b = to.isAfter(end) ? end : to;
      if (!b.isAfter(a)) return;
      final prev = result[key]?.worked ?? Duration.zero;
      result[key] = (label: labels[key]!, worked: prev + b.difference(a));
    }

    for (final e in entries.reversed) {
      final t = e.time.toLocal();
      labels[e.key] = e.label;
      if (e.checkIn == true) {
        open.putIfAbsent(e.key, () => t);
      } else if (e.checkIn == false) {
        final from = open.remove(e.key);
        if (from != null) addSpan(e.key, from, t);
      }
    }
    open.forEach((key, from) => addSpan(key, from, now!.isBefore(end) ? now : end));
    return result;
  }

  /// Habit streak: consecutive days with at least one entry, ending today
  /// (or yesterday when today has no entry yet, so the streak isn't lost
  /// before the day is over). Returns (current, best).
  ({int current, int best}) streak({DateTime? today}) {
    today ??= DateTime.now();
    final days = {
      for (final e in entries)
        DateTime(e.time.toLocal().year, e.time.toLocal().month, e.time.toLocal().day),
    };
    if (days.isEmpty) return (current: 0, best: 0);
    final sorted = days.toList()..sort();
    var best = 1, run = 1;
    for (int i = 1; i < sorted.length; i++) {
      run = _dayGap(sorted[i - 1], sorted[i]) == 1 ? run + 1 : 1;
      if (run > best) best = run;
    }
    var day = DateTime(today.year, today.month, today.day);
    if (!days.contains(day)) day = DateTime(day.year, day.month, day.day - 1);
    var current = 0;
    while (days.contains(day)) {
      current++;
      day = DateTime(day.year, day.month, day.day - 1);
    }
    return (current: current, best: best);
  }

  static int _dayGap(DateTime a, DateTime b) =>
      DateTime.utc(b.year, b.month, b.day).difference(DateTime.utc(a.year, a.month, a.day)).inDays;

  /// Latest entry, or null for an empty book.
  LogEntry? get last => entries.isEmpty ? null : entries.first;

  Duration totalWorkedOn(DateTime day, {DateTime? now}) =>
      workedOn(day, now: now).values.fold(Duration.zero, (a, b) => a + b.worked);

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
