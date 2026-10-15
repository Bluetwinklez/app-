import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/domain/ndef_record.dart';
import 'package:nfc_tag_master/domain/nfc_tag_info.dart';
import 'package:nfc_tag_master/domain/tag_health.dart';
import 'package:nfc_tag_master/domain/tag_signature.dart';
import 'package:nfc_tag_master/domain/treasure_hunt.dart';

void main() {
  final hunt = TreasureHunt(
    id: 'abc123',
    name: 'Garden',
    startClue: 'Look under the doormat',
    clues: ['Check the mailbox', 'Behind the big tree', 'You found the treasure!'],
    createdAt: DateTime(2026, 10, 4),
  );

  group('TreasureHunt', () {
    test('tag records carry a readable clue and a marker', () {
      final records = hunt.recordsFor(1, langCode: 'en');
      final text = NdefCodec.decodeText(records.single)!;
      expect(text, startsWith('2/3 · Behind the big tree'));
      final marker = TreasureHunt.markerIn(records)!;
      expect(marker.huntId, 'abc123');
      expect(marker.station, 2);
    });

    test('json round trip keeps clues and best time', () {
      final saved = TreasureHunt.encodeAll([hunt.copyWith(bestTime: const Duration(minutes: 3))]);
      final back = TreasureHunt.decodeAll(saved).single;
      expect(back.clues, hunt.clues);
      expect(back.startClue, hunt.startClue);
      expect(back.bestTime, const Duration(minutes: 3));
      expect(TreasureHunt.decodeAll('not json'), isEmpty);
      expect(TreasureHunt.decodeAll(''), isEmpty);
    });

    test('game accepts tags only in order and finishes on the last one', () {
      var run = HuntRun(hunt, DateTime(2026));
      expect(run.currentClue, hunt.startClue);

      var (result, next) = HuntGame.scan(run, hunt.recordsFor(1, langCode: 'en'));
      expect(result, HuntScanResult.wrongOrder);
      expect(next.found, 0);

      (result, run) = HuntGame.scan(run, hunt.recordsFor(0, langCode: 'en'));
      expect(result, HuntScanResult.next);
      expect(run.currentClue, 'Check the mailbox');

      (result, run) = HuntGame.scan(run, hunt.recordsFor(0, langCode: 'en'));
      expect(result, HuntScanResult.alreadyFound);

      (result, run) = HuntGame.scan(run, [NdefCodec.encodeText('hello')]);
      expect(result, HuntScanResult.notHunt);

      final other = TreasureHunt(id: 'zzz', name: 'x', startClue: 's', clues: ['a'], createdAt: DateTime(2026));
      (result, run) = HuntGame.scan(run, other.recordsFor(0, langCode: 'en'));
      expect(result, HuntScanResult.otherHunt);

      (result, run) = HuntGame.scan(run, hunt.recordsFor(1, langCode: 'en'));
      (result, run) = HuntGame.scan(run, hunt.recordsFor(2, langCode: 'en'));
      expect(result, HuntScanResult.finished);
      expect(run.finished, isTrue);
    });
  });

  group('TagHealth', () {
    NfcTagInfo tag({
      bool ndef = true,
      bool writable = true,
      int used = 20,
      int max = 144,
      List<NdefRecordModel> records = const [],
    }) =>
        NfcTagInfo(
          identifier: '04AABB',
          standardTechnologies: const ['NfcA'],
          isNdefSupported: ndef,
          isWritable: writable,
          maxByteCapacity: max,
          currentBytesUsed: used,
          records: records,
        );

    test('a healthy tag scores high', () {
      final report = TagHealth.check(tag(records: [NdefCodec.encodeUri('https://example.com')]));
      expect(report.score, 100);
      expect(report.overall, HealthLevel.good);
      expect(report.items.map((i) => i.finding), contains(HealthFinding.roomLeft));
    });

    test('problems lower the score and come first', () {
      final report = TagHealth.check(
        tag(ndef: false, used: 140, records: [NdefCodec.encodeUri('https://paypa1-login.xyz/verify')]),
        possibleClone: true,
      );
      expect(report.score, lessThan(60));
      expect(report.overall, HealthLevel.problem);
      expect(report.items.first.level, HealthLevel.problem);
      final findings = report.items.map((i) => i.finding).toList();
      expect(findings, containsAll([HealthFinding.notNdef, HealthFinding.nearlyFull, HealthFinding.possibleClone]));
    });

    test('read-only and empty tags are reported without penalty', () {
      final report = TagHealth.check(tag(writable: false));
      expect(report.score, 100);
      expect(report.items.map((i) => i.finding), containsAll([HealthFinding.readOnly, HealthFinding.empty]));
    });

    test('signature status is checked with the key', () {
      final key = TagSignature.generateKey();
      final signed = TagSignature.sign([NdefCodec.encodeText('hi')], key);
      expect(TagHealth.check(tag(records: signed), signingKey: key).items.map((i) => i.finding),
          contains(HealthFinding.signedValid));
      final otherKey = Uint8List.fromList(List.filled(32, 7));
      final report = TagHealth.check(tag(records: signed), signingKey: otherKey);
      expect(report.items.map((i) => i.finding), isNot(contains(HealthFinding.signedValid)));
    });
  });
}
