import 'ndef_record.dart';
import 'storage_models.dart';
import 'tag_library.dart';

/// A tag captured during continuous scanning.
class ScanLogEntry {
  final DateTime time;
  final String uid;
  final List<NdefRecordModel> records;

  const ScanLogEntry(this.time, this.uid, this.records);
}

/// Summary of a continuous scanning session.
class ScanReport {
  final int total;
  final int unique;

  /// Tags read more than once.
  final int duplicates;

  /// Distinct tags with no NDEF records.
  final int empty;

  const ScanReport({required this.total, required this.unique, required this.duplicates, required this.empty});

  factory ScanReport.of(List<ScanLogEntry> log) {
    final counts = <String, int>{};
    final emptyUids = <String>{};
    for (final e in log) {
      counts[e.uid] = (counts[e.uid] ?? 0) + 1;
      if (e.records.isEmpty) emptyUids.add(e.uid);
    }
    return ScanReport(
      total: log.length,
      unique: counts.length,
      duplicates: counts.values.where((c) => c > 1).length,
      empty: emptyUids.length,
    );
  }
}

/// Builds Excel-friendly CSV (UTF-8 with BOM, CRLF, RFC 4180 quoting).
class CsvExport {
  static const String bom = '﻿';

  static String escape(String value) {
    final needsQuotes = value.contains(',') || value.contains('"') || value.contains('\n') || value.contains('\r');
    final escaped = value.replaceAll('"', '""');
    return needsQuotes ? '"$escaped"' : escaped;
  }

  static String build(List<String> header, List<List<String>> rows) {
    final lines = [header, ...rows].map((r) => r.map(escape).join(','));
    return '$bom${lines.join('\r\n')}\r\n';
  }

  static String _content(List<NdefRecordModel> records) =>
      records.map((r) => NdefCodec.parseRecord(r).content).join(' | ');

  static String _date(DateTime t) => t.toLocal().toIso8601String().substring(0, 19).replaceFirst('T', ' ');

  static String scans(List<ScanLogEntry> entries, {required List<String> header}) => build(header, [
        for (final e in entries) [_date(e.time), e.uid, '${e.records.length}', _content(e.records)],
      ]);

  static String history(List<ScanHistoryEntry> entries, {required List<String> header}) => build(header, [
        for (final e in entries)
          [_date(e.timestamp), e.identifier, '${e.maxByteCapacity}', '${e.currentBytesUsed}', _content(e.records)],
      ]);

  static String library(List<TagLibraryEntry> entries, {required List<String> header}) => build(header, [
        for (final e in entries)
          [e.name, e.category.name, e.locationNote, e.labels.join(', '), e.note, e.uid ?? '', _content(e.records), _date(e.updatedAt)],
      ]);
}
