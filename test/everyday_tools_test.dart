import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/domain/everyday_tools.dart';

void main() {
  group('UnitConverter', () {
    test('length, weight, volume and speed', () {
      expect(UnitConverter.convert(1, UnitCategory.length, 'km', 'm'), 1000);
      expect(UnitConverter.convert(1, UnitCategory.length, 'mi', 'km'), closeTo(1.609344, 1e-9));
      expect(UnitConverter.convert(1, UnitCategory.weight, 'lb', 'g'), closeTo(453.59237, 1e-9));
      expect(UnitConverter.convert(1, UnitCategory.volume, 'gal', 'L'), closeTo(3.785411784, 1e-9));
      expect(UnitConverter.convert(100, UnitCategory.speed, 'km/h', 'm/s'), closeTo(27.7778, 1e-4));
    });

    test('temperature', () {
      expect(UnitConverter.convert(100, UnitCategory.temperature, '°C', '°F'), closeTo(212, 1e-9));
      expect(UnitConverter.convert(32, UnitCategory.temperature, '°F', '°C'), closeTo(0, 1e-9));
      expect(UnitConverter.convert(0, UnitCategory.temperature, '°C', 'K'), closeTo(273.15, 1e-9));
    });

    test('formatting drops trailing zeros', () {
      expect(UnitConverter.format(1000), '1000');
      expect(UnitConverter.format(1.5), '1.5');
      expect(UnitConverter.format(0.1 + 0.2), '0.3');
      expect(UnitConverter.format(double.nan), '—');
    });
  });

  test('bill split with tip and rounding', () {
    final s = BillSplit.compute(300, 10, 4);
    expect(s.tip, 30);
    expect(s.total, 330);
    expect(s.perPerson, 82.5);
    final r = BillSplit.compute(300, 10, 4, roundUp: true);
    expect(r.perPerson, 83);
    expect(r.total, 332);
    expect(BillSplit.compute(100, 0, 0).perPerson, 100);
  });

  group('PasswordGenerator', () {
    test('uses every selected set and the requested length', () {
      for (var i = 0; i < 20; i++) {
        final p = PasswordGenerator.generate(length: 12, random: Random(i));
        expect(p.length, 12);
        expect(p, contains(RegExp('[a-z]')));
        expect(p, contains(RegExp('[A-Z]')));
        expect(p, contains(RegExp('[0-9]')));
        expect(p, contains(RegExp(r'[^a-zA-Z0-9]')));
        expect(p, isNot(contains(RegExp('[l1O0I]'))));
      }
      final digitsOnly = PasswordGenerator.generate(
          length: 6, useLower: false, useUpper: false, useSymbols: false, random: Random(1));
      expect(digitsOnly, matches(RegExp(r'^[2-9]{6}$')));
    });

    test('strength grows with length and variety', () {
      expect(PasswordGenerator.strength('abc'), PasswordStrength.weak);
      expect(PasswordGenerator.strength('abcdefghij'), PasswordStrength.fair);
      expect(PasswordGenerator.strength('Abcdefgh1234'), PasswordStrength.strong);
      expect(PasswordGenerator.strength(PasswordGenerator.generate(length: 20, random: Random(3))),
          PasswordStrength.veryStrong);
    });
  });

  test('random picker', () {
    final rolls = RandomPicker.dice(3, random: Random(1));
    expect(rolls, hasLength(3));
    expect(rolls.every((r) => r >= 1 && r <= 6), isTrue);
    expect(RandomPicker.draw('Ali\nAyşe, Can\n\n', random: Random(2)).toSet(), {'Ali', 'Ayşe', 'Can'});
    expect(RandomPicker.draw('  '), isEmpty);
  });
}
