import 'ndef_record.dart';
import 'record_text.dart';

/// Placeholders filled in at write time: the date, the time and a counter
/// that goes up by one with every successful write that used it.
/// Turkish and English spellings both work.
class TemplateVariables {
  static const date = ['{date}', '{tarih}'];
  static const time = ['{time}', '{saat}'];
  static const counter = ['{counter}', '{sayac}', '{sayaç}'];

  static List<String> get all => [...date, ...time, ...counter];

  static bool hasAny(List<NdefRecordModel> records) => RecordText.containsAny(records, all);

  static bool usesCounter(List<NdefRecordModel> records) =>
      RecordText.containsAny(records, counter);

  static List<NdefRecordModel> apply(
    List<NdefRecordModel> records, {
    required DateTime now,
    required int counterValue,
  }) {
    String two(int v) => v.toString().padLeft(2, '0');
    final values = <String, String>{
      for (final t in date) t: '${now.year}-${two(now.month)}-${two(now.day)}',
      for (final t in time) t: '${two(now.hour)}:${two(now.minute)}',
      for (final t in counter) t: '$counterValue',
    };
    return [for (final r in records) RecordText.replace(r, values)];
  }
}
