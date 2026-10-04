import 'dart:async';

import 'package:flutter/material.dart';

import '../controllers/nfc_controller.dart';
import '../domain/treasure_hunt.dart';
import '../l10n/app_localizations.dart';
import '../l10n/l10n.dart';
import 'app_theme.dart';

String _formatDuration(Duration d) {
  final m = d.inMinutes;
  final s = d.inSeconds % 60;
  return '$m:${s.toString().padLeft(2, '0')}';
}

/// Treasure hunts: create clues, write them to tags, then play by scanning
/// the tags in order against the clock.
class TreasureHuntsPage extends StatefulWidget {
  final NfcStateController controller;

  const TreasureHuntsPage({super.key, required this.controller});

  static Future<void> open(BuildContext context, NfcStateController controller) =>
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => TreasureHuntsPage(controller: controller)));

  @override
  State<TreasureHuntsPage> createState() => _TreasureHuntsPageState();
}

class _TreasureHuntsPageState extends State<TreasureHuntsPage> {
  List<TreasureHunt> get _hunts => TreasureHunt.decodeAll(widget.controller.storage.treasureHuntsJson);

  Future<void> _save(List<TreasureHunt> hunts) async {
    await widget.controller.storage.setTreasureHuntsJson(TreasureHunt.encodeAll(hunts));
    if (mounted) setState(() {});
  }

  Future<void> _upsert(TreasureHunt hunt) async {
    final hunts = _hunts;
    final i = hunts.indexWhere((h) => h.id == hunt.id);
    if (i >= 0) {
      hunts[i] = hunt;
    } else {
      hunts.insert(0, hunt);
    }
    await _save(hunts);
  }

  Future<void> _edit([TreasureHunt? existing]) async {
    final result = await Navigator.of(context).push<TreasureHunt>(
      MaterialPageRoute(builder: (_) => _HuntEditorPage(existing: existing)),
    );
    if (result != null) await _upsert(result);
  }

  Future<void> _delete(TreasureHunt hunt) async {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(loc.huntDeleteTitle),
        content: Text(hunt.name),
        actions: [
          TextButton(onPressed: () => Navigator.of(ctx).pop(false), child: Text(loc.cancel)),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.danger, foregroundColor: Colors.white),
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(loc.huntDelete),
          ),
        ],
      ),
    );
    if (ok == true) await _save(_hunts.where((h) => h.id != hunt.id).toList());
  }

  /// Writes every station in turn; the user can stop between tags.
  Future<void> _writeTags(TreasureHunt hunt) async {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    final lang = Localizations.localeOf(context).languageCode;
    for (var i = 0; i < hunt.stations; i++) {
      final go = await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (ctx) => AlertDialog(
          title: Text(loc.huntWriteStep('${i + 1}', '${hunt.stations}')),
          content: Text(loc.huntWriteStepBody(hunt.clues[i])),
          actions: [
            TextButton(onPressed: () => Navigator.of(ctx).pop(false), child: Text(loc.cancel)),
            ElevatedButton(onPressed: () => Navigator.of(ctx).pop(true), child: Text(loc.huntWriteNow)),
          ],
        ),
      );
      if (go != true || !mounted) return;
      final ok = await widget.controller.writeRecords(hunt.recordsFor(i, langCode: lang));
      if (!mounted) return;
      if (!ok) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(loc.huntWriteFailed('${i + 1}')),
          backgroundColor: AppColors.danger,
        ));
        i--; // try the same tag again
        continue;
      }
    }
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(loc.huntWriteDone),
      backgroundColor: AppColors.success,
    ));
  }

  Future<void> _play(TreasureHunt hunt) async {
    final best = await Navigator.of(context).push<Duration>(
      MaterialPageRoute(builder: (_) => _HuntPlayPage(controller: widget.controller, hunt: hunt)),
    );
    if (best != null && (hunt.bestTime == null || best < hunt.bestTime!)) {
      await _upsert(hunt.copyWith(bestTime: best));
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    final hunts = _hunts;
    return DecoratedBox(
      decoration: BoxDecoration(gradient: AppColors.canvasGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(title: Text(loc.huntTitle)),
        floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.add_rounded),
          label: Text(loc.huntNew),
          onPressed: () => _edit(),
        ),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 96),
          children: [
            Text(loc.huntIntro, style: TextStyle(color: AppColors.secondary, height: 1.4)),
            const SizedBox(height: 12),
            for (final hunt in hunts)
              Card(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 8, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.explore_rounded),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(hunt.name,
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                          ),
                          PopupMenuButton<String>(
                            onSelected: (v) => v == 'edit' ? _edit(hunt) : _delete(hunt),
                            itemBuilder: (_) => [
                              PopupMenuItem(value: 'edit', child: Text(loc.huntEdit)),
                              PopupMenuItem(value: 'delete', child: Text(loc.huntDelete)),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        [
                          loc.huntStations('${hunt.stations}'),
                          if (hunt.bestTime != null) loc.huntBest(_formatDuration(hunt.bestTime!)),
                        ].join(' · '),
                        style: TextStyle(color: AppColors.secondary),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton.icon(
                              icon: const Icon(Icons.edit_note_rounded),
                              label: Text(loc.huntWriteTags),
                              onPressed: () => _writeTags(hunt),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: ElevatedButton.icon(
                              icon: const Icon(Icons.play_arrow_rounded),
                              label: Text(loc.huntPlay),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.accent, foregroundColor: Colors.white),
                              onPressed: () => _play(hunt),
                            ),
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _HuntEditorPage extends StatefulWidget {
  final TreasureHunt? existing;

  const _HuntEditorPage({this.existing});

  @override
  State<_HuntEditorPage> createState() => _HuntEditorPageState();
}

class _HuntEditorPageState extends State<_HuntEditorPage> {
  late final TextEditingController _name = TextEditingController(text: widget.existing?.name ?? '');
  late final TextEditingController _start = TextEditingController(text: widget.existing?.startClue ?? '');
  late final List<TextEditingController> _clues = [
    for (final c in widget.existing?.clues ?? const ['', '', '']) TextEditingController(text: c),
  ];

  @override
  void dispose() {
    _name.dispose();
    _start.dispose();
    for (final c in _clues) {
      c.dispose();
    }
    super.dispose();
  }

  void _saveAndClose() {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    final clues = _clues.map((c) => c.text.trim()).where((c) => c.isNotEmpty).toList();
    if (_name.text.trim().isEmpty || _start.text.trim().isEmpty || clues.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(loc.huntMissingFields)));
      return;
    }
    final existing = widget.existing;
    Navigator.of(context).pop(TreasureHunt(
      id: existing?.id ?? DateTime.now().millisecondsSinceEpoch.toRadixString(36),
      name: _name.text.trim(),
      startClue: _start.text.trim(),
      clues: clues,
      createdAt: existing?.createdAt ?? DateTime.now(),
      bestTime: existing?.bestTime,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.existing == null ? loc.huntNew : loc.huntEdit),
        actions: [TextButton(onPressed: _saveAndClose, child: Text(loc.huntSave))],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(controller: _name, decoration: InputDecoration(labelText: loc.huntName)),
          const SizedBox(height: 12),
          TextField(
            controller: _start,
            maxLines: 2,
            decoration: InputDecoration(labelText: loc.huntStartClue, helperText: loc.huntStartClueHint),
          ),
          const SizedBox(height: 16),
          for (var i = 0; i < _clues.length; i++)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: TextField(
                controller: _clues[i],
                maxLines: 2,
                maxLength: 200,
                decoration: InputDecoration(
                  labelText: loc.huntClueLabel('${i + 1}'),
                  helperText: i == _clues.length - 1 ? loc.huntLastClueHint : loc.huntClueHint('${i + 2}'),
                  suffixIcon: _clues.length > 1
                      ? IconButton(
                          tooltip: loc.huntDelete,
                          icon: const Icon(Icons.remove_circle_outline),
                          onPressed: () => setState(() => _clues.removeAt(i).dispose()),
                        )
                      : null,
                ),
              ),
            ),
          if (_clues.length < TreasureHunt.maxStations)
            OutlinedButton.icon(
              icon: const Icon(Icons.add_rounded),
              label: Text(loc.huntAddClue),
              onPressed: () => setState(() => _clues.add(TextEditingController())),
            ),
        ],
      ),
    );
  }
}

class _HuntPlayPage extends StatefulWidget {
  final NfcStateController controller;
  final TreasureHunt hunt;

  const _HuntPlayPage({required this.controller, required this.hunt});

  @override
  State<_HuntPlayPage> createState() => _HuntPlayPageState();
}

class _HuntPlayPageState extends State<_HuntPlayPage> {
  late HuntRun _run = HuntRun(widget.hunt, DateTime.now());
  late final Timer _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
    if (mounted && !_run.finished) setState(() {});
  });
  Duration? _finalTime;
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    _ticker; // starts the clock
  }

  @override
  void dispose() {
    _ticker.cancel();
    super.dispose();
  }

  Future<void> _scan() async {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    setState(() => _busy = true);
    await widget.controller.scanTag(autoLog: false);
    if (!mounted) return;
    setState(() => _busy = false);
    final tag = widget.controller.lastScannedTag;
    if (tag == null || tag.error != null || tag.wasCancelled) return;
    final (result, run) = HuntGame.scan(_run, tag.records);
    setState(() => _run = run);
    final message = switch (result) {
      HuntScanResult.next => loc.huntFound('${run.found}', '${run.hunt.stations}'),
      HuntScanResult.finished => null,
      HuntScanResult.wrongOrder => loc.huntWrongOrder,
      HuntScanResult.alreadyFound => loc.huntAlreadyFound,
      HuntScanResult.otherHunt => loc.huntOtherHunt,
      HuntScanResult.notHunt => loc.huntNotHunt,
    };
    if (result == HuntScanResult.finished) {
      setState(() => _finalTime = DateTime.now().difference(_run.startedAt));
      return;
    }
    if (message != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: result == HuntScanResult.next ? AppColors.success : AppColors.warning,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    final elapsed = _finalTime ?? DateTime.now().difference(_run.startedAt);
    final finished = _finalTime != null;
    return DecoratedBox(
      decoration: BoxDecoration(gradient: AppColors.canvasGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(widget.hunt.name),
          leading: IconButton(
            icon: const Icon(Icons.close_rounded),
            tooltip: loc.huntQuit,
            onPressed: () => Navigator.of(context).pop(_finalTime),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  const Icon(Icons.timer_outlined),
                  const SizedBox(width: 6),
                  Text(_formatDuration(elapsed),
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
                  const Spacer(),
                  Text(loc.huntProgress('${_run.found}', '${_run.hunt.stations}'),
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                ],
              ),
              const SizedBox(height: 8),
              LinearProgressIndicator(
                value: _run.hunt.stations == 0 ? 0 : _run.found / _run.hunt.stations,
                minHeight: 8,
                borderRadius: BorderRadius.circular(8),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(finished ? Icons.emoji_events_rounded : Icons.explore_rounded,
                                size: 56, color: finished ? AppColors.warning : AppColors.accent),
                            const SizedBox(height: 16),
                            Text(
                              finished ? loc.huntFinished(_formatDuration(elapsed)) : loc.huntCurrentClue,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: AppColors.secondary, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              finished ? _run.hunt.clues.last : _run.currentClue,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700, height: 1.3),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                icon: Icon(finished ? Icons.check_rounded : Icons.nfc_rounded),
                label: Text(finished ? loc.huntDone : loc.huntScanTag),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accent,
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(56),
                ),
                onPressed: _busy ? null : (finished ? () => Navigator.of(context).pop(_finalTime) : _scan),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
