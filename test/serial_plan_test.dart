import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/domain/ndef_record.dart';
import 'package:nfc_tag_master/domain/serial_plan.dart';

void main() {
  group('SerialPlan', () {
    test('formats numbers with prefix, step and padding', () {
      const plan = SerialPlan(prefix: 'A-', start: 7, step: 2, padding: 4);
      expect(plan.valueAt(0), 'A-0007');
      expect(plan.valueAt(3), 'A-0013');
      expect(const SerialPlan(padding: 0).valueAt(9), '10');
      expect(const SerialPlan(padding: 2).valueAt(150), '151');
    });

    test('appends a text record when there is no placeholder', () {
      final records = [NdefCodec.encodeUri('https://example.com')];
      final out = const SerialPlan().apply(records, 4);
      expect(out, hasLength(2));
      expect(NdefCodec.decodeUri(out.first), 'https://example.com');
      expect(NdefCodec.decodeText(out.last), '005');
      expect(records, hasLength(1), reason: 'input is not modified');
    });

    test('replaces the placeholder in text, URI and vCard records', () {
      final records = [
        NdefCodec.encodeText('Masa {n}', langCode: 'en'),
        NdefCodec.encodeUri('https://example.com/t/{n}'),
        NdefCodec.encodeVCard(formattedName: 'Kart {n}'),
      ];
      expect(SerialPlan.hasPlaceholder(records), isTrue);
      final out = const SerialPlan(prefix: 'B 1/', padding: 2).apply(records, 0);
      expect(out, hasLength(3));
      expect(NdefCodec.decodeText(out[0]), 'Masa B 1/01');
      expect(out[0].payload.sublist(1, 3), 'en'.codeUnits, reason: 'language kept');
      expect(NdefCodec.decodeUri(out[1]), 'https://example.com/t/B%201%2F01');
      expect(NdefCodec.decodeVCard(out[2])?.values.join(' '), contains('B 1/01'));
    });

    test('every tag gets a distinct value', () {
      final records = [NdefCodec.encodeText('ID {n}')];
      const plan = SerialPlan();
      final values = {
        for (int i = 0; i < 100; i++) NdefCodec.decodeText(plan.apply(records, i).single)
      };
      expect(values, hasLength(100));
    });
  });
}
