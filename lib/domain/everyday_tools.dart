import 'dart:math';

/// Everyday helpers that don't need a tag: unit conversion, splitting a
/// bill, passwords and random picks.

enum UnitCategory { length, weight, temperature, volume, speed }

class Unit {
  final String symbol;

  /// Value of one unit in the category's base unit (metre, kilogram,
  /// litre, metre per second). Temperature uses [_toKelvin]/[_fromKelvin].
  final double factor;

  const Unit(this.symbol, this.factor);
}

class UnitConverter {
  static const Map<UnitCategory, List<Unit>> units = {
    UnitCategory.length: [
      Unit('mm', 0.001),
      Unit('cm', 0.01),
      Unit('m', 1),
      Unit('km', 1000),
      Unit('in', 0.0254),
      Unit('ft', 0.3048),
      Unit('yd', 0.9144),
      Unit('mi', 1609.344),
    ],
    UnitCategory.weight: [
      Unit('mg', 0.000001),
      Unit('g', 0.001),
      Unit('kg', 1),
      Unit('t', 1000),
      Unit('oz', 0.028349523125),
      Unit('lb', 0.45359237),
    ],
    UnitCategory.temperature: [
      Unit('°C', 1),
      Unit('°F', 1),
      Unit('K', 1),
    ],
    UnitCategory.volume: [
      Unit('mL', 0.001),
      Unit('L', 1),
      Unit('m³', 1000),
      Unit('tsp', 0.00492892159375),
      Unit('tbsp', 0.01478676478125),
      Unit('cup', 0.2365882365),
      Unit('fl oz', 0.0295735295625),
      Unit('gal', 3.785411784),
    ],
    UnitCategory.speed: [
      Unit('m/s', 1),
      Unit('km/h', 1 / 3.6),
      Unit('mph', 0.44704),
      Unit('kn', 1852 / 3600),
    ],
  };

  static double convert(double value, UnitCategory category, String from, String to) {
    if (category == UnitCategory.temperature) {
      return _fromKelvin(_toKelvin(value, from), to);
    }
    final list = units[category]!;
    final a = list.firstWhere((u) => u.symbol == from);
    final b = list.firstWhere((u) => u.symbol == to);
    return value * a.factor / b.factor;
  }

  static double _toKelvin(double v, String unit) => switch (unit) {
        '°C' => v + 273.15,
        '°F' => (v - 32) * 5 / 9 + 273.15,
        _ => v,
      };

  static double _fromKelvin(double k, String unit) => switch (unit) {
        '°C' => k - 273.15,
        '°F' => (k - 273.15) * 9 / 5 + 32,
        _ => k,
      };

  /// Up to 6 significant decimals without trailing zeros.
  static String format(double v) {
    if (v.isNaN || v.isInfinite) return '—';
    final fixed = v.abs() >= 1e9 || (v != 0 && v.abs() < 1e-6) ? v.toStringAsExponential(4) : v.toStringAsFixed(6);
    if (fixed.contains('e')) return fixed;
    return fixed.replaceFirst(RegExp(r'\.?0+$'), '');
  }
}

class BillSplit {
  final double tip;
  final double total;
  final double perPerson;

  const BillSplit(this.tip, this.total, this.perPerson);

  /// [amount] split between [people] after adding [tipPercent]. When
  /// [roundUp] each share is rounded up to a whole unit.
  static BillSplit compute(double amount, double tipPercent, int people, {bool roundUp = false}) {
    final count = max(1, people);
    final tip = amount * tipPercent / 100;
    var per = (amount + tip) / count;
    if (roundUp) per = per.ceilToDouble();
    return BillSplit(tip, roundUp ? per * count : amount + tip, per);
  }
}

enum PasswordStrength { weak, fair, strong, veryStrong }

class PasswordGenerator {
  static const lower = 'abcdefghijkmnopqrstuvwxyz';
  static const upper = 'ABCDEFGHJKLMNPQRSTUVWXYZ';
  static const digits = '23456789';
  static const symbols = '!@#\$%&*?-_=+';

  /// A password using every selected set at least once. Look-alike
  /// characters (l, 1, O, 0, I) are left out so it is easy to type.
  static String generate({
    int length = 16,
    bool useLower = true,
    bool useUpper = true,
    bool useDigits = true,
    bool useSymbols = true,
    Random? random,
  }) {
    final rng = random ?? Random.secure();
    final sets = [
      if (useLower) lower,
      if (useUpper) upper,
      if (useDigits) digits,
      if (useSymbols) symbols,
    ];
    if (sets.isEmpty) sets.add(lower);
    final n = max(length, sets.length);
    final all = sets.join();
    final chars = [
      for (final s in sets) s[rng.nextInt(s.length)],
      for (var i = sets.length; i < n; i++) all[rng.nextInt(all.length)],
    ]..shuffle(rng);
    return chars.join();
  }

  /// Entropy-based estimate from length and the character sets used.
  static PasswordStrength strength(String password) {
    if (password.isEmpty) return PasswordStrength.weak;
    var pool = 0;
    if (password.contains(RegExp('[a-z]'))) pool += 26;
    if (password.contains(RegExp('[A-Z]'))) pool += 26;
    if (password.contains(RegExp('[0-9]'))) pool += 10;
    if (password.contains(RegExp(r'[^a-zA-Z0-9]'))) pool += 32;
    final bits = password.length * log(max(pool, 1)) / ln2;
    if (bits < 40) return PasswordStrength.weak;
    if (bits < 60) return PasswordStrength.fair;
    if (bits < 90) return PasswordStrength.strong;
    return PasswordStrength.veryStrong;
  }
}

class RandomPicker {
  static List<int> dice(int count, {int sides = 6, Random? random}) {
    final rng = random ?? Random.secure();
    return [for (var i = 0; i < count; i++) rng.nextInt(sides) + 1];
  }

  static bool coinIsHeads({Random? random}) => (random ?? Random.secure()).nextBool();

  /// Non-empty lines of [text] in random order; the first is the winner.
  static List<String> draw(String text, {Random? random}) {
    final items = text.split(RegExp(r'[\n,]')).map((s) => s.trim()).where((s) => s.isNotEmpty).toList();
    items.shuffle(random ?? Random.secure());
    return items;
  }
}
