import 'dart:typed_data';
import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/domain/composer_history.dart';
import 'package:nfc_tag_master/domain/ndef_record.dart';

void main() {
  group('ComposerHistory Tests', () {
    late ComposerHistory history;

    setUp(() {
      history = ComposerHistory(maxSnapshots: 5);
    });

    test('Initial state has no undo and no redo', () {
      expect(history.canUndo, isFalse);
      expect(history.canRedo, isFalse);
      expect(history.undoCount, equals(0));
      expect(history.redoCount, equals(0));
    });

    test('Push snapshot enables undo and resets redo', () {
      final initial = [NdefCodec.encodeText('İlk Kayıt')];
      history.push(initial);

      expect(history.canUndo, isTrue);
      expect(history.canRedo, isFalse);
      expect(history.undoCount, equals(1));
    });

    test('Undo returns cloned previous records and populates redo stack', () {
      final rec1 = NdefCodec.encodeText('Metin 1');
      final rec2 = NdefCodec.encodeText('Metin 2');

      // State 0: empty
      history.push([]);

      // State 1: [rec1]
      final state1 = [rec1];
      history.push(state1);

      // State 2: [rec1, rec2]
      final state2 = [rec1, rec2];

      // Perform undo from state 2
      final undone1 = history.undo(state2);
      expect(undone1, isNotNull);
      expect(undone1!.length, equals(1));
      expect(NdefCodec.decodeText(undone1[0]), equals('Metin 1'));
      expect(history.canUndo, isTrue);
      expect(history.canRedo, isTrue);

      // Perform undo to reach empty initial state
      final undone2 = history.undo(undone1);
      expect(undone2, isNotNull);
      expect(undone2!.isEmpty, isTrue);
      expect(history.canUndo, isFalse);
      expect(history.canRedo, isTrue);

      // Redo back to state 1
      final redone1 = history.redo(undone2);
      expect(redone1, isNotNull);
      expect(redone1!.length, equals(1));
      expect(NdefCodec.decodeText(redone1[0]), equals('Metin 1'));
      expect(history.canUndo, isTrue);
      expect(history.canRedo, isTrue);

      // Redo back to state 2
      final redone2 = history.redo(redone1);
      expect(redone2, isNotNull);
      expect(redone2!.length, equals(2));
      expect(NdefCodec.decodeText(redone2[1]), equals('Metin 2'));
      expect(history.canRedo, isFalse);
    });

    test(
        'Snapshots are deeply cloned and mutations do not corrupt previous snapshots',
        () {
      final payload = Uint8List.fromList([1, 2, 3, 4]);
      final rec = NdefRecordModel(
        tnf: NdefTnf.wellKnown,
        type: Uint8List.fromList([0x54]),
        id: Uint8List(0),
        payload: payload,
      );

      final list = [rec];
      history.push(list);

      // Mutate the original payload buffer after pushing
      payload[0] = 99;
      list.clear();

      // Undo should yield the unmodified copy
      final restored = history.undo([rec]);
      expect(restored, isNotNull);
      expect(restored!.length, equals(1));
      expect(restored[0].payload[0], equals(1));
    });

    test('Undo stack is capped to maxSnapshots (bounded)', () {
      final cappedHistory = ComposerHistory(maxSnapshots: 3);

      for (int i = 0; i < 5; i++) {
        cappedHistory.push([NdefCodec.encodeText('Kayıt $i')]);
      }

      // Can at most hold 3 snapshots
      expect(cappedHistory.undoCount, equals(3));

      // The oldest snapshots (0 and 1) must have been evicted
      final u1 = cappedHistory.undo([]);
      expect(NdefCodec.decodeText(u1![0]), equals('Kayıt 4'));

      final u2 = cappedHistory.undo(u1);
      expect(NdefCodec.decodeText(u2![0]), equals('Kayıt 3'));

      final u3 = cappedHistory.undo(u2);
      expect(NdefCodec.decodeText(u3![0]), equals('Kayıt 2'));

      expect(cappedHistory.canUndo, isFalse);
    });

    test('New push invalidates redo stack', () {
      history.push([]);
      final state1 = [NdefCodec.encodeText('A')];
      history.push(state1);

      final undone = history.undo(state1);
      expect(undone, isNotNull);
      expect(history.canRedo, isTrue);

      // Mutate with a brand new branch
      history.push([NdefCodec.encodeText('B')]);
      expect(history.canRedo, isFalse);
      expect(history.redoCount, equals(0));
    });

    test('Undo or redo when empty returns null gracefully', () {
      expect(history.undo([]), isNull);
      expect(history.redo([]), isNull);
    });

    test('Clear clears both undo and redo stacks', () {
      history.push([NdefCodec.encodeText('A')]);
      history.undo([]);
      expect(history.canRedo, isTrue);

      history.clear();
      expect(history.canUndo, isFalse);
      expect(history.canRedo, isFalse);
      expect(history.undoCount, equals(0));
      expect(history.redoCount, equals(0));
    });
  });
}
