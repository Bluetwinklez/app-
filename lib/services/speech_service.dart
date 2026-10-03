import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../domain/ndef_record.dart';

/// Reads tag contents aloud (accessibility).
class SpeechService {
  static FlutterTts? _tts;

  /// Text spoken for a tag: one sentence per record, URLs shortened to the
  /// host so they are not spelled out character by character.
  static String describe(List<NdefRecordModel> records) {
    final parts = <String>[];
    for (final r in records) {
      final p = NdefCodec.parseRecord(r);
      var content = p.content.trim();
      if (p.type == ParsedRecordType.url) {
        final host = Uri.tryParse(content)?.host ?? '';
        if (host.isNotEmpty) content = host.replaceFirst(RegExp(r'^www\.'), '');
      }
      if (content.isEmpty) continue;
      parts.add('${p.title}: $content');
    }
    return parts.join('. ');
  }

  static Future<void> speak(String text, {required String languageCode}) async {
    if (text.trim().isEmpty) return;
    try {
      final tts = _tts ??= FlutterTts();
      await tts.stop();
      await tts.setLanguage(languageCode);
      await tts.setSpeechRate(0.48);
      await tts.speak(text);
    } catch (e) {
      debugPrint('SpeechService: $e');
    }
  }

  static Future<void> stop() async {
    try {
      await _tts?.stop();
    } catch (_) {}
  }
}
