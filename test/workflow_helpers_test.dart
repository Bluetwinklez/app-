import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/domain/ndef_record.dart';
import 'package:nfc_tag_master/domain/nfc_workflow_models.dart';

void main() {
  group('UrlSafetyAssessment Tests', () {
    test('Standard HTTPS URL has no suspicious warnings', () {
      final assessment = UrlSafetyAssessment.evaluate('https://example.com/page');
      expect(assessment.scheme, equals('https'));
      expect(assessment.host, equals('example.com'));
      expect(assessment.hasUserInfo, isFalse);
      expect(assessment.isIpLiteral, isFalse);
      expect(assessment.isPunycode, isFalse);
      expect(assessment.isSuspiciousScheme, isFalse);
      expect(assessment.warnings, isEmpty);
    });

    test('HTTP plain URL warns about unencrypted connection', () {
      final assessment = UrlSafetyAssessment.evaluate('http://example.org/test');
      expect(assessment.scheme, equals('http'));
      expect(assessment.warnings.any((w) => w.contains('Şifrelenmemiş')), isTrue);
    });

    test('UserInfo presence triggers warning', () {
      final assessment = UrlSafetyAssessment.evaluate('https://admin:secret@malicious-site.com');
      expect(assessment.hasUserInfo, isTrue);
      expect(assessment.warnings.any((w) => w.contains('userinfo')), isTrue);
    });

    test('IPv4 literal host triggers IP literal warning', () {
      final assessment = UrlSafetyAssessment.evaluate('https://192.168.1.1/dashboard');
      expect(assessment.isIpLiteral, isTrue);
      expect(assessment.host, equals('192.168.1.1'));
      expect(assessment.warnings.any((w) => w.contains('IPv4')), isTrue);
    });

    test('IPv6 literal host triggers IP literal warning', () {
      final assessment = UrlSafetyAssessment.evaluate('https://[::1]/');
      expect(assessment.isIpLiteral, isTrue);
    });

    test('Punycode host triggers IDN warning', () {
      final assessment = UrlSafetyAssessment.evaluate('https://xn--e1afmkfd.xn--80akhbyknj4f');
      expect(assessment.isPunycode, isTrue);
      expect(assessment.warnings.any((w) => w.contains('xn--') || w.contains('Punycode')), isTrue);
    });

    test('Suspicious custom URI scheme triggers warning', () {
      final assessment = UrlSafetyAssessment.evaluate('javascript:alert(1)');
      expect(assessment.isSuspiciousScheme, isTrue);
      expect(assessment.warnings.any((w) => w.contains('Standart dışı')), isTrue);
    });

    test('Non-standard port triggers warning', () {
      final assessment = UrlSafetyAssessment.evaluate('https://example.com:8443/api');
      expect(assessment.port, equals(8443));
      expect(assessment.warnings.any((w) => w.contains('Port: 8443')), isTrue);
    });
  });

  group('NdefClipboardSnapshot Tests', () {
    test('Snapshot deep copies records and calculates byte size correctly', () {
      final record1 = NdefCodec.encodeText('Merhaba NFC');
      final record2 = NdefCodec.encodeUri('https://flutter.dev');
      final source = [record1, record2];

      final snapshot = NdefClipboardSnapshot.fromRecords(source, sourceDescription: 'Test Etiketi');
      expect(snapshot.recordCount, equals(2));
      expect(snapshot.byteSize, equals(encodeNdefMessage(source).length));
      expect(snapshot.sourceDescription, equals('Test Etiketi'));

      // Verify deep copy does not mutate original when snapshot is created
      expect(snapshot.records[0].payload, equals(record1.payload));
      expect(identical(snapshot.records[0].payload, record1.payload), isFalse);
    });
  });

  group('RecordInspectionData Tests', () {
    test('Inspects text record and creates bounded hex preview', () {
      final rec = NdefCodec.encodeText('NFC Test');
      final inspection = RecordInspectionData.inspect(rec, index: 0, maxHexBytes: 4);

      expect(inspection.tnfName, contains('Well-Known'));
      expect(inspection.typeText, equals('T'));
      expect(inspection.typeHex, equals('54'));
      expect(inspection.payloadLength, equals(rec.payload.length));
      expect(inspection.isPayloadTruncated, isTrue);
      expect(inspection.payloadHexPreview.split(' ').length, equals(4));
    });
  });

  group('BatchTagAttempt Model Tests', () {
    test('copyWith updates state correctly', () {
      const attempt = BatchTagAttempt(index: 1);
      expect(attempt.status, equals(BatchTagStatus.pending));

      final updated = attempt.copyWith(
        status: BatchTagStatus.success,
        message: '32 bayt yazıldı',
        completedAt: DateTime(2026, 9, 30),
      );

      expect(updated.index, equals(1));
      expect(updated.status, equals(BatchTagStatus.success));
      expect(updated.message, equals('32 bayt yazıldı'));
      expect(updated.completedAt, equals(DateTime(2026, 9, 30)));
    });
  });
}
