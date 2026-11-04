import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../domain/everyday_tools.dart';
import '../l10n/app_localizations.dart';
import '../l10n/l10n.dart';
import '../services/app_storage_service.dart';
import '../services/security_service.dart';
import 'app_theme.dart';

Widget _page(BuildContext context, String title, List<Widget> children) => DecoratedBox(
      decoration: BoxDecoration(gradient: AppColors.canvasGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(title: Text(title)),
        body: ListView(padding: const EdgeInsets.fromLTRB(16, 8, 16, 32), children: children),
      ),
    );

double? _parse(String s) => double.tryParse(s.trim().replaceAll(',', '.'));

/// Opens the everyday tools that don't need a tag.
class EverydayTools {
  static Future<void> _push(BuildContext context, Widget page) =>
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));

  static Future<void> units(BuildContext context) => _push(context, const UnitConverterPage());
  static Future<void> bill(BuildContext context) => _push(context, const BillSplitPage());
  static Future<void> password(BuildContext context, AppStorageService storage) =>
      _push(context, PasswordGeneratorPage(storage: storage));
  static Future<void> random(BuildContext context) => _push(context, const RandomPickerPage());
  static Future<void> tally(BuildContext context, AppStorageService storage) =>
      _push(context, TallyCounterPage(storage: storage));
}

class UnitConverterPage extends StatefulWidget {
  const UnitConverterPage({super.key});

  @override
  State<UnitConverterPage> createState() => _UnitConverterPageState();
}

class _UnitConverterPageState extends State<UnitConverterPage> {
  UnitCategory _category = UnitCategory.length;
  late String _from = UnitConverter.units[_category]![2].symbol;
  late String _to = UnitConverter.units[_category]![3].symbol;
  final _value = TextEditingController(text: '1');

  @override
  void dispose() {
    _value.dispose();
    super.dispose();
  }

  static String _categoryLabel(UnitCategory c, AppLocalizations loc) => switch (c) {
        UnitCategory.length => loc.unitLength,
        UnitCategory.weight => loc.unitWeight,
        UnitCategory.temperature => loc.unitTemperature,
        UnitCategory.volume => loc.unitVolume,
        UnitCategory.speed => loc.unitSpeed,
      };

  void _setCategory(UnitCategory c) {
    final list = UnitConverter.units[c]!;
    setState(() {
      _category = c;
      _from = list[0].symbol;
      _to = list[1].symbol;
    });
  }

  Widget _unitPicker(String value, ValueChanged<String> onChanged) => DropdownButton<String>(
        value: value,
        isExpanded: true,
        items: [
          for (final u in UnitConverter.units[_category]!) DropdownMenuItem(value: u.symbol, child: Text(u.symbol)),
        ],
        onChanged: (v) => v == null ? null : onChanged(v),
      );

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    final input = _parse(_value.text);
    final result = input == null ? '—' : UnitConverter.format(UnitConverter.convert(input, _category, _from, _to));
    return _page(context, loc.unitTitle, [
      Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          for (final c in UnitCategory.values)
            ChoiceChip(
              label: Text(_categoryLabel(c, loc)),
              selected: c == _category,
              onSelected: (_) => _setCategory(c),
            ),
        ],
      ),
      const SizedBox(height: 16),
      Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: TextField(
                      controller: _value,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                      decoration: InputDecoration(labelText: loc.unitValue),
                      onChanged: (_) => setState(() {}),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(flex: 2, child: _unitPicker(_from, (v) => setState(() => _from = v))),
                ],
              ),
              IconButton(
                tooltip: loc.unitSwap,
                icon: const Icon(Icons.swap_vert_rounded),
                onPressed: () => setState(() {
                  final f = _from;
                  _from = _to;
                  _to = f;
                }),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: SelectableText(result,
                        style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w700)),
                  ),
                  const SizedBox(width: 12),
                  Expanded(flex: 2, child: _unitPicker(_to, (v) => setState(() => _to = v))),
                ],
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}

class BillSplitPage extends StatefulWidget {
  const BillSplitPage({super.key});

  @override
  State<BillSplitPage> createState() => _BillSplitPageState();
}

class _BillSplitPageState extends State<BillSplitPage> {
  final _amount = TextEditingController();
  double _tip = 10;
  int _people = 2;
  bool _roundUp = false;

  @override
  void dispose() {
    _amount.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    final amount = _parse(_amount.text) ?? 0;
    final split = BillSplit.compute(amount, _tip, _people, roundUp: _roundUp);
    String money(double v) => v.toStringAsFixed(2);
    return _page(context, loc.billTitle, [
      TextField(
        controller: _amount,
        autofocus: true,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(labelText: loc.billAmount, prefixIcon: const Icon(Icons.receipt_long_outlined)),
        onChanged: (_) => setState(() {}),
      ),
      const SizedBox(height: 16),
      Text(loc.billTip('${_tip.round()}'), style: const TextStyle(fontWeight: FontWeight.w600)),
      Slider(
        value: _tip,
        min: 0,
        max: 30,
        divisions: 30,
        label: '${_tip.round()}%',
        onChanged: (v) => setState(() => _tip = v),
      ),
      Row(
        children: [
          Expanded(child: Text(loc.billPeople, style: const TextStyle(fontWeight: FontWeight.w600))),
          IconButton(
            tooltip: '-1',
            icon: const Icon(Icons.remove_circle_outline),
            onPressed: _people > 1 ? () => setState(() => _people--) : null,
          ),
          Text('$_people', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
          IconButton(
            tooltip: '+1',
            icon: const Icon(Icons.add_circle_outline),
            onPressed: _people < 50 ? () => setState(() => _people++) : null,
          ),
        ],
      ),
      SwitchListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(loc.billRoundUp),
        value: _roundUp,
        onChanged: (v) => setState(() => _roundUp = v),
      ),
      const SizedBox(height: 8),
      Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(loc.billPerPerson, style: TextStyle(color: AppColors.secondary)),
              Text(money(split.perPerson), style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w800)),
              const SizedBox(height: 8),
              Text('${loc.billTipAmount}: ${money(split.tip)}  ·  ${loc.billTotal}: ${money(split.total)}',
                  style: TextStyle(color: AppColors.secondary)),
            ],
          ),
        ),
      ),
    ]);
  }
}

class PasswordGeneratorPage extends StatefulWidget {
  final AppStorageService storage;

  const PasswordGeneratorPage({super.key, required this.storage});

  @override
  State<PasswordGeneratorPage> createState() => _PasswordGeneratorPageState();
}

class _PasswordGeneratorPageState extends State<PasswordGeneratorPage> {
  double _length = 16;
  bool _lower = true, _upper = true, _digits = true, _symbols = true;
  late String _password = _make();

  String _make() => PasswordGenerator.generate(
        length: _length.round(),
        useLower: _lower,
        useUpper: _upper,
        useDigits: _digits,
        useSymbols: _symbols,
      );

  void _regenerate() => setState(() => _password = _make());

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    final strength = PasswordGenerator.strength(_password);
    final (label, color) = switch (strength) {
      PasswordStrength.weak => (loc.pwWeak, AppColors.danger),
      PasswordStrength.fair => (loc.pwFair, AppColors.warning),
      PasswordStrength.strong => (loc.pwStrong, AppColors.success),
      PasswordStrength.veryStrong => (loc.pwVeryStrong, AppColors.success),
    };
    Widget option(String title, bool value, ValueChanged<bool> set) => SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(title),
          value: value,
          onChanged: (v) {
            set(v);
            _regenerate();
          },
        );
    return _page(context, loc.pwTitle, [
      Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SelectableText(
                _password,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 22, fontFamily: 'monospace', fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Text(label, style: TextStyle(color: color, fontWeight: FontWeight.w700)),
            ],
          ),
        ),
      ),
      const SizedBox(height: 8),
      Row(
        children: [
          Expanded(
            child: OutlinedButton.icon(
              icon: const Icon(Icons.refresh_rounded),
              label: Text(loc.pwNew),
              onPressed: _regenerate,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: ElevatedButton.icon(
              icon: const Icon(Icons.copy_rounded),
              label: Text(loc.pwCopy),
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.accent, foregroundColor: Colors.white),
              onPressed: () async {
                await SecurityService.copySensitive(widget.storage, _password);
                if (!context.mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(loc.pwCopied)));
              },
            ),
          ),
        ],
      ),
      const SizedBox(height: 16),
      Text(loc.pwLength('${_length.round()}'), style: const TextStyle(fontWeight: FontWeight.w600)),
      Slider(
        value: _length,
        min: 6,
        max: 40,
        divisions: 34,
        label: '${_length.round()}',
        onChanged: (v) => setState(() => _length = v),
        onChangeEnd: (_) => _regenerate(),
      ),
      option(loc.pwLower, _lower, (v) => _lower = v),
      option(loc.pwUpper, _upper, (v) => _upper = v),
      option(loc.pwDigits, _digits, (v) => _digits = v),
      option(loc.pwSymbols, _symbols, (v) => _symbols = v),
    ]);
  }
}

class RandomPickerPage extends StatefulWidget {
  const RandomPickerPage({super.key});

  @override
  State<RandomPickerPage> createState() => _RandomPickerPageState();
}

class _RandomPickerPageState extends State<RandomPickerPage> {
  int _diceCount = 1;
  List<int> _dice = const [];
  bool? _heads;
  final _list = TextEditingController();
  List<String> _draw = const [];

  static const _faces = ['⚀', '⚁', '⚂', '⚃', '⚄', '⚅'];

  @override
  void dispose() {
    _list.dispose();
    super.dispose();
  }

  void _haptic() => HapticFeedback.mediumImpact();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    return _page(context, loc.randTitle, [
      SectionHeader(title: loc.randDice),
      Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                _dice.isEmpty ? '🎲' : _dice.map((d) => _faces[d - 1]).join(' '),
                style: const TextStyle(fontSize: 56),
              ),
              if (_dice.length > 1)
                Text(loc.randTotal('${_dice.fold(0, (a, b) => a + b)}'),
                    style: const TextStyle(fontWeight: FontWeight.w700)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (final n in [1, 2, 3])
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: ChoiceChip(
                        label: Text('$n'),
                        selected: _diceCount == n,
                        onSelected: (_) => setState(() => _diceCount = n),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  _haptic();
                  setState(() => _dice = RandomPicker.dice(_diceCount));
                },
                child: Text(loc.randRoll),
              ),
            ],
          ),
        ),
      ),
      SectionHeader(title: loc.randCoin),
      Card(
        child: ListTile(
          leading: const Icon(Icons.monetization_on_outlined, size: 36),
          title: Text(
            _heads == null ? '—' : (_heads! ? loc.randHeads : loc.randTails),
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
          trailing: ElevatedButton(
            onPressed: () {
              _haptic();
              setState(() => _heads = RandomPicker.coinIsHeads());
            },
            child: Text(loc.randFlip),
          ),
        ),
      ),
      SectionHeader(title: loc.randDraw),
      TextField(
        controller: _list,
        minLines: 3,
        maxLines: 8,
        decoration: InputDecoration(hintText: loc.randDrawHint, border: const OutlineInputBorder()),
      ),
      const SizedBox(height: 8),
      ElevatedButton.icon(
        icon: const Icon(Icons.shuffle_rounded),
        label: Text(loc.randDrawButton),
        onPressed: () {
          _haptic();
          setState(() => _draw = RandomPicker.draw(_list.text));
        },
      ),
      if (_draw.isNotEmpty)
        Card(
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.emoji_events_rounded),
                title: Text(_draw.first, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                subtitle: Text(loc.randWinner),
              ),
              for (var i = 1; i < _draw.length; i++)
                ListTile(dense: true, leading: Text('${i + 1}.'), title: Text(_draw[i])),
            ],
          ),
        ),
    ]);
  }
}

class TallyCounterPage extends StatefulWidget {
  final AppStorageService storage;

  const TallyCounterPage({super.key, required this.storage});

  @override
  State<TallyCounterPage> createState() => _TallyCounterPageState();
}

class _TallyCounterPageState extends State<TallyCounterPage> {
  late int _count = widget.storage.tallyCount;

  Future<void> _set(int value) async {
    setState(() => _count = value < 0 ? 0 : value);
    HapticFeedback.selectionClick();
    await widget.storage.setTallyCount(_count);
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    return DecoratedBox(
      decoration: BoxDecoration(gradient: AppColors.canvasGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(loc.tallyTitle),
          actions: [
            TextButton(onPressed: () => _set(0), child: Text(loc.tallyReset)),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Semantics(
                button: true,
                label: loc.tallyTapHint,
                child: InkWell(
                  onTap: () => _set(_count + 1),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('$_count', style: const TextStyle(fontSize: 96, fontWeight: FontWeight.w800)),
                        Text(loc.tallyTapHint, style: TextStyle(color: AppColors.secondary)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      icon: const Icon(Icons.remove_rounded),
                      label: const Text('-1'),
                      onPressed: _count > 0 ? () => _set(_count - 1) : null,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 2,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.add_rounded),
                      label: const Text('+1'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.accent,
                        foregroundColor: Colors.white,
                        minimumSize: const Size.fromHeight(56),
                      ),
                      onPressed: () => _set(_count + 1),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
