import 'dart:convert';

import 'storage_models.dart';
import 'tag_library.dart';

class TeamPackException implements Exception {
  final String message;
  const TeamPackException(this.message);
  @override
  String toString() => message;
}

/// A shareable bundle of library tags and write templates, e.g. for a team
/// labelling the same office. Photos and device-local links (last seen,
/// auto-log book) stay on the sender's phone.
class TeamPack {
  static const String format = 'nfc-tag-master-pack';
  static const int version = 1;
  static const int maxItems = 2000;

  final String name;
  final DateTime createdAt;
  final List<TagLibraryEntry> entries;
  final List<WriteTemplate> templates;

  const TeamPack({
    required this.name,
    required this.createdAt,
    this.entries = const [],
    this.templates = const [],
  });

  static bool isPack(String content) {
    try {
      final data = jsonDecode(content);
      return data is Map && data['format'] == format;
    } catch (_) {
      return false;
    }
  }

  String encode() => const JsonEncoder.withIndent('  ').convert({
        'format': format,
        'version': version,
        'name': name,
        'createdAt': createdAt.toIso8601String(),
        'library': [
          for (final e in entries)
            (Map<String, dynamic>.from(e.toJsonMap())
              ..remove('photoPath')
              ..remove('lastSeenAt')
              ..remove('autoLogBookId')),
        ],
        'templates': [for (final t in templates) t.toJsonMap()],
      });

  /// Throws [TeamPackException] with a short English reason when invalid;
  /// callers show their own localized message.
  static TeamPack decode(String content) {
    final Object? data;
    try {
      data = jsonDecode(content);
    } catch (_) {
      throw const TeamPackException('not JSON');
    }
    if (data is! Map || data['format'] != format) throw const TeamPackException('not a pack');
    final v = data['version'];
    if (v is! int || v > version) throw const TeamPackException('newer pack version');
    final lib = data['library'] is List ? data['library'] as List : const [];
    final tpl = data['templates'] is List ? data['templates'] as List : const [];
    if (lib.length + tpl.length > maxItems) throw const TeamPackException('too many items');
    try {
      return TeamPack(
        name: data['name'] as String? ?? '',
        createdAt: DateTime.tryParse(data['createdAt'] as String? ?? '') ?? DateTime.now(),
        entries: [
          for (final e in lib) TagLibraryEntry.fromJsonMap(Map<String, dynamic>.from(e as Map)),
        ],
        templates: [
          for (final t in tpl) WriteTemplate.fromJsonMap(Map<String, dynamic>.from(t as Map)),
        ],
      );
    } catch (_) {
      throw const TeamPackException('broken item');
    }
  }

  /// What importing adds next to [library] / [existingTemplates]: tags whose
  /// UID or id is already present and templates with a known id are skipped,
  /// so importing the same pack twice adds nothing.
  ({List<TagLibraryEntry> entries, List<WriteTemplate> templates, int skipped}) mergeInto(
    Iterable<TagLibraryEntry> library,
    Iterable<WriteTemplate> existingTemplates, {
    DateTime? now,
  }) {
    now ??= DateTime.now();
    final uids = {
      for (final e in library)
        if ((e.uid ?? '').isNotEmpty) e.uid!.toUpperCase(),
    };
    final ids = {for (final e in library) e.id};
    final tplIds = {for (final t in existingTemplates) t.id};
    var skipped = 0;
    final newEntries = <TagLibraryEntry>[];
    for (final e in entries) {
      final uid = e.uid?.toUpperCase() ?? '';
      if (ids.contains(e.id) || (uid.isNotEmpty && !uids.add(uid))) {
        skipped++;
        continue;
      }
      ids.add(e.id);
      newEntries.add(TagLibraryEntry(
        id: e.id,
        name: e.name,
        note: e.note,
        category: e.category,
        locationNote: e.locationNote,
        labels: e.labels,
        uid: e.uid,
        records: e.records,
        checkEveryDays: e.checkEveryDays,
        createdAt: now,
        updatedAt: now,
      ));
    }
    final newTemplates = <WriteTemplate>[];
    for (final t in templates) {
      if (!tplIds.add(t.id)) {
        skipped++;
        continue;
      }
      newTemplates.add(t);
    }
    return (entries: newEntries, templates: newTemplates, skipped: skipped);
  }
}
