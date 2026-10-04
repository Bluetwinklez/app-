import 'ndef_record.dart';
import 'record_text.dart';

/// Numbering rule for batch writes: tag `index` (0-based) gets
/// `prefix + (start + index * step, zero padded) + suffix`.
///
/// When any text, URI or text-based MIME record contains [placeholder], the
/// number replaces it there. Otherwise a separate text record carrying the
/// number is appended, so every tag still ends up unique.
class SerialPlan {
  static const String placeholder = '{n}';
  static const int maxPadding = 8;

  final String prefix;
  final String suffix;
  final int start;
  final int step;
  final int padding;

  const SerialPlan({
    this.prefix = '',
    this.suffix = '',
    this.start = 1,
    this.step = 1,
    this.padding = 3,
  })  : assert(start >= 0),
        assert(step >= 1),
        assert(padding >= 0 && padding <= maxPadding);

  String valueAt(int index) {
    final number = (start + index * step).toString().padLeft(padding, '0');
    return '$prefix$number$suffix';
  }

  /// True when at least one record carries [placeholder].
  static bool hasPlaceholder(List<NdefRecordModel> records) =>
      RecordText.containsAny(records, const [placeholder]);

  List<NdefRecordModel> apply(List<NdefRecordModel> records, int index) {
    final value = valueAt(index);
    if (!hasPlaceholder(records)) {
      return [...records, NdefCodec.encodeText(value)];
    }
    return [for (final r in records) RecordText.replace(r, {placeholder: value})];
  }
}
