import 'dart:convert';

import 'ndef_record.dart';

/// A treasure hunt: tags hidden around the house or garden. Each tag holds
/// the clue that leads to the next one; the app shows the first clue.
class TreasureHunt {
  static const int maxStations = 20;
  static final RegExp _marker = RegExp(r'#hunt:([A-Za-z0-9]+):(\d+)');

  final String id;
  final String name;

  /// Shown on the phone when the game starts; leads to tag 1.
  final String startClue;

  /// clues[i] is written on tag i+1 and leads to the next tag; the last one
  /// is the finish message.
  final List<String> clues;
  final DateTime createdAt;

  /// Fastest finish so far.
  final Duration? bestTime;

  const TreasureHunt({
    required this.id,
    required this.name,
    required this.startClue,
    required this.clues,
    required this.createdAt,
    this.bestTime,
  });

  int get stations => clues.length;

  TreasureHunt copyWith({String? name, String? startClue, List<String>? clues, Duration? bestTime}) =>
      TreasureHunt(
        id: id,
        name: name ?? this.name,
        startClue: startClue ?? this.startClue,
        clues: clues ?? this.clues,
        createdAt: createdAt,
        bestTime: bestTime ?? this.bestTime,
      );

  /// Records for tag [index] (0-based): the readable clue, plus a marker
  /// the app uses to recognise the tag and its position.
  List<NdefRecordModel> recordsFor(int index, {required String langCode}) => [
        NdefCodec.encodeText('${index + 1}/$stations · ${clues[index]}\n#hunt:$id:${index + 1}',
            langCode: langCode),
      ];

  /// (hunt id, 1-based station) found in [records], if any.
  static ({String huntId, int station})? markerIn(List<NdefRecordModel> records) {
    for (final r in records) {
      final text = NdefCodec.decodeText(r);
      if (text == null) continue;
      final m = _marker.firstMatch(text);
      if (m != null) return (huntId: m.group(1)!, station: int.parse(m.group(2)!));
    }
    return null;
  }

  Map<String, dynamic> toJsonMap() => {
        'id': id,
        'name': name,
        'start': startClue,
        'clues': clues,
        'created': createdAt.toIso8601String(),
        if (bestTime != null) 'best': bestTime!.inSeconds,
      };

  factory TreasureHunt.fromJsonMap(Map<String, dynamic> m) => TreasureHunt(
        id: m['id'] as String? ?? '',
        name: m['name'] as String? ?? '',
        startClue: m['start'] as String? ?? '',
        clues: [for (final c in (m['clues'] as List? ?? const [])) '$c'],
        createdAt: DateTime.tryParse(m['created'] as String? ?? '') ?? DateTime.fromMillisecondsSinceEpoch(0),
        bestTime: m['best'] is int ? Duration(seconds: m['best'] as int) : null,
      );

  static List<TreasureHunt> decodeAll(String json) {
    if (json.trim().isEmpty) return [];
    try {
      final list = jsonDecode(json);
      if (list is! List) return [];
      return [
        for (final item in list)
          if (item is Map) TreasureHunt.fromJsonMap(Map<String, dynamic>.from(item)),
      ].where((h) => h.id.isNotEmpty && h.clues.isNotEmpty).toList();
    } on FormatException {
      return [];
    }
  }

  static String encodeAll(List<TreasureHunt> hunts) => jsonEncode([for (final h in hunts) h.toJsonMap()]);
}

/// Progress of one game.
class HuntRun {
  final TreasureHunt hunt;
  final DateTime startedAt;

  /// Stations found so far, in order (1-based).
  final int found;

  const HuntRun(this.hunt, this.startedAt, [this.found = 0]);

  bool get finished => found >= hunt.stations;

  /// The clue the players are following now.
  String get currentClue => found == 0 ? hunt.startClue : hunt.clues[found - 1];
}

enum HuntScanResult { next, finished, wrongOrder, alreadyFound, otherHunt, notHunt }

class HuntGame {
  /// Applies a scanned tag to [run]; returns the result and the new run.
  static (HuntScanResult, HuntRun) scan(HuntRun run, List<NdefRecordModel> records) {
    final marker = TreasureHunt.markerIn(records);
    if (marker == null) return (HuntScanResult.notHunt, run);
    if (marker.huntId != run.hunt.id) return (HuntScanResult.otherHunt, run);
    if (marker.station <= run.found) return (HuntScanResult.alreadyFound, run);
    if (marker.station != run.found + 1) return (HuntScanResult.wrongOrder, run);
    final next = HuntRun(run.hunt, run.startedAt, marker.station);
    return (next.finished ? HuntScanResult.finished : HuntScanResult.next, next);
  }
}
