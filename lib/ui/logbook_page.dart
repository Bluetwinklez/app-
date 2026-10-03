import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

import '../controllers/nfc_controller.dart';
import '../domain/csv_export.dart';
import '../domain/logbook.dart';
import '../domain/ndef_record.dart';
import '../domain/nfc_tag_info.dart';
import '../l10n/app_localizations.dart';
import '../l10n/l10n.dart';
import 'app_theme.dart';

String logBookKindLabel(LogBookKind kind, AppLocalizations loc) => switch (kind) {
      LogBookKind.attendance => loc.logbookKindAttendance,
      LogBookKind.medication => loc.logbookKindMedication,
      LogBookKind.inventory => loc.logbookKindInventory,
      LogBookKind.timeClock => loc.logbookKindTimeClock,
      LogBookKind.custom => loc.logbookKindCustom,
    };

IconData logBookKindIcon(LogBookKind kind) => switch (kind) {
      LogBookKind.attendance => Icons.how_to_reg_outlined,
      LogBookKind.medication => Icons.medication_outlined,
      LogBookKind.inventory => Icons.inventory_2_outlined,
      LogBookKind.timeClock => Icons.punch_clock_outlined,
      LogBookKind.custom => Icons.event_note_outlined,
    };

/// List of logbooks; each one records timestamped scans.
class LogBooksPage extends StatefulWidget {
  final NfcStateController controller;

  const LogBooksPage({super.key, required this.controller});

  static Future<void> open(BuildContext context, NfcStateController controller) =>
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => LogBooksPage(controller: controller)));

  @override
  State<LogBooksPage> createState() => _LogBooksPageState();
}

class _LogBooksPageState extends State<LogBooksPage> {
  Future<void> _create() async {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    final name = TextEditingController();
    var kind = LogBookKind.attendance;
    final created = await showDialog<LogBook>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDlg) => AlertDialog(
          title: Text(loc.logbookNew),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: name,
                autofocus: true,
                maxLength: 40,
                decoration: InputDecoration(labelText: loc.logbookName, counterText: ''),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<LogBookKind>(
                initialValue: kind,
                items: [
                  for (final k in LogBookKind.values)
                    DropdownMenuItem(value: k, child: Text(logBookKindLabel(k, loc))),
                ],
                onChanged: (v) => setDlg(() => kind = v ?? kind),
              ),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Navigator.of(ctx).pop(), child: Text(loc.cancel)),
            ElevatedButton(
              onPressed: () {
                final n = name.text.trim();
                if (n.isEmpty) return;
                Navigator.of(ctx).pop(LogBook(
                  id: '${DateTime.now().microsecondsSinceEpoch}',
                  name: n,
                  kind: kind,
                  createdAt: DateTime.now(),
                ));
              },
              child: Text(loc.save),
            ),
          ],
        ),
      ),
    );
    name.dispose();
    if (created == null) return;
    await widget.controller.storage.saveLogBook(created);
    if (!mounted) return;
    setState(() {});
    await Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => LogBookDetailPage(controller: widget.controller, bookId: created.id),
    ));
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    final books = widget.controller.storage.getLogBooks();
    return DecoratedBox(
      decoration: BoxDecoration(gradient: AppColors.canvasGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(title: Text(loc.logbookTitle)),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _create,
          backgroundColor: AppColors.accent,
          foregroundColor: Colors.white,
          icon: const Icon(Icons.add_rounded),
          label: Text(loc.logbookNew),
        ),
        body: books.isEmpty
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Text(loc.logbookEmpty,
                      textAlign: TextAlign.center, style: TextStyle(color: AppColors.secondary, height: 1.4)),
                ),
              )
            : ListView(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 100),
                children: [
                  for (final b in books)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: SoftCard(
                        onTap: () async {
                          await Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => LogBookDetailPage(controller: widget.controller, bookId: b.id),
                          ));
                          if (mounted) setState(() {});
                        },
                        padding: const EdgeInsets.all(14),
                        child: Row(
                          children: [
                            Icon(logBookKindIcon(b.kind), color: AppColors.accent),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(b.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                                  Text(
                                    '${logBookKindLabel(b.kind, loc)} · ${loc.logbookEntries('${b.entries.length}')}',
                                    style: TextStyle(fontSize: 12.5, color: AppColors.secondary),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(Icons.chevron_right),
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

/// One logbook: summary, "scan and log" button and the entry list.
class LogBookDetailPage extends StatefulWidget {
  final NfcStateController controller;
  final String bookId;

  const LogBookDetailPage({super.key, required this.controller, required this.bookId});

  @override
  State<LogBookDetailPage> createState() => _LogBookDetailPageState();
}

class _LogBookDetailPageState extends State<LogBookDetailPage> {
  LogBook? get _book {
    for (final b in widget.controller.storage.getLogBooks()) {
      if (b.id == widget.bookId) return b;
    }
    return null;
  }

  /// Library name, else the first record's text, else the UID.
  String _labelFor(NfcTagInfo tag) {
    for (final e in widget.controller.storage.getLibrary()) {
      if (e.uid != null && e.uid!.isNotEmpty && e.uid == tag.identifier) return e.name;
    }
    if (tag.records.isNotEmpty) {
      final text = NdefCodec.parseRecord(tag.records.first).content.trim();
      if (text.isNotEmpty) return text.length > 60 ? '${text.substring(0, 57)}...' : text;
    }
    return tag.identifier;
  }

  Future<void> _scan() async {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    final book = _book;
    if (book == null) return;
    await widget.controller.scanTag();
    if (!mounted) return;
    final tag = widget.controller.lastScannedTag;
    if (tag == null || tag.error != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(widget.controller.statusMessage),
        backgroundColor: tag?.wasCancelled == true ? null : AppColors.danger,
      ));
      return;
    }
    final updated = book.add(LogEntry(time: DateTime.now(), uid: tag.identifier, label: _labelFor(tag)));
    final entry = updated.entries.first;
    await widget.controller.storage.saveLogBook(updated);
    if (!mounted) return;
    setState(() {});
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(switch (entry.checkIn) {
        true => loc.logbookCheckedIn(entry.label),
        false => loc.logbookCheckedOut(entry.label),
        null => loc.logbookEntryAdded(entry.label),
      }),
      backgroundColor: AppColors.success,
    ));
  }

  Future<void> _delete(LogBook book) async {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        content: Text(loc.logbookDeleteConfirm(book.name)),
        actions: [
          TextButton(onPressed: () => Navigator.of(ctx).pop(false), child: Text(loc.cancel)),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.danger),
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(loc.delete),
          ),
        ],
      ),
    );
    if (ok != true) return;
    await widget.controller.storage.deleteLogBook(book.id);
    if (mounted) Navigator.of(context).pop();
  }

  Future<void> _export(LogBook book) async {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    final clock = book.kind == LogBookKind.timeClock;
    final csv = CsvExport.build(
      [loc.csvColumnTime, loc.name, 'UID', if (clock) loc.csvColumnDirection],
      [
        for (final e in book.entries)
          [
            DateFormat('yyyy-MM-dd HH:mm:ss').format(e.time.toLocal()),
            e.label,
            e.uid,
            if (clock) e.checkIn == false ? loc.logbookCheckOut : loc.logbookCheckIn,
          ],
      ],
    );
    final safe = book.name.replaceAll(RegExp(r'[^\w\-]+'), '_');
    final fileName = 'logbook_${safe}_${DateTime.now().toIso8601String().substring(0, 10)}.csv';
    await SharePlus.instance.share(ShareParams(
      files: [XFile.fromData(Uint8List.fromList(utf8.encode(csv)), mimeType: 'text/csv', name: fileName)],
      fileNameOverrides: [fileName],
    ));
  }

  String _duration(Duration d, AppLocalizations loc) =>
      loc.durationHm('${d.inHours}', '${d.inMinutes.remainder(60)}');

  Widget _clockSummary(LogBook book, AppLocalizations loc) {
    final today = DateTime.now();
    final worked = book.workedOn(today).values.toList()
      ..sort((a, b) => b.worked.compareTo(a.worked));
    return SoftCard(
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.people_alt_outlined, color: AppColors.success),
              const SizedBox(width: 10),
              Expanded(
                child: Text(loc.logbookPresentNow('${book.presentNow().length}'),
                    style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.success)),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Icon(Icons.timer_outlined, color: AppColors.accent),
              const SizedBox(width: 10),
              Expanded(
                child: Text(loc.logbookWorkedToday(_duration(book.totalWorkedOn(today), loc)),
                    style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.accent)),
              ),
            ],
          ),
          if (worked.isNotEmpty) ...[
            const SizedBox(height: 10),
            Text(loc.logbookWorkedPerPerson,
                style: TextStyle(fontSize: 12.5, color: AppColors.secondary, fontWeight: FontWeight.w600)),
            for (final w in worked)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Row(
                  children: [
                    Expanded(child: Text(w.label, maxLines: 1, overflow: TextOverflow.ellipsis)),
                    Text(_duration(w.worked, loc), style: const TextStyle(fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
          ],
        ],
      ),
    );
  }

  Widget _summary(LogBook book, AppLocalizations loc) {
    if (book.kind == LogBookKind.timeClock) return _clockSummary(book, loc);
    final today = DateTime.now();
    final time = DateFormat.Hm(Localizations.localeOf(context).toLanguageTag());
    final (IconData icon, Color color, String text) = switch (book.kind) {
      LogBookKind.medication => book.entriesOn(today).isEmpty
          ? (Icons.error_outline, AppColors.warning, loc.logbookMedNotTaken)
          : (Icons.check_circle, AppColors.success,
              loc.logbookMedTaken(time.format(book.entriesOn(today).first.time.toLocal()))),
      LogBookKind.inventory => (Icons.inventory_2_outlined, AppColors.accent,
          loc.logbookInventorySummary('${book.latestPerTag().length}')),
      _ => (Icons.today_outlined, AppColors.accent,
          loc.logbookToday('${book.entriesOn(today).length}', '${book.distinctTagsOn(today)}')),
    };
    return SoftCard(
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 10),
          Expanded(child: Text(text, style: TextStyle(fontWeight: FontWeight.w600, color: color))),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    final book = _book;
    if (book == null) return const SizedBox.shrink();
    final fmt = DateFormat.yMMMd(Localizations.localeOf(context).toLanguageTag()).add_Hm();
    final shown = book.kind == LogBookKind.inventory ? book.latestPerTag() : book.entries;
    return DecoratedBox(
      decoration: BoxDecoration(gradient: AppColors.canvasGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(book.name),
          actions: [
            if (book.entries.isNotEmpty)
              IconButton(
                tooltip: loc.exportCsv,
                icon: const Icon(Icons.ios_share_rounded),
                onPressed: () => _export(book),
              ),
            IconButton(
              tooltip: loc.delete,
              icon: const Icon(Icons.delete_outline),
              onPressed: () => _delete(book),
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
          children: [
            _summary(book, loc),
            const SizedBox(height: 12),
            ListenableBuilder(
              listenable: widget.controller,
              builder: (context, _) => FilledButton.icon(
                onPressed: widget.controller.isBusy ? null : _scan,
                icon: const Icon(Icons.nfc_rounded),
                label: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(loc.logbookScanButton, style: const TextStyle(fontSize: 16)),
                ),
              ),
            ),
            const SizedBox(height: 16),
            if (shown.isEmpty)
              Padding(
                padding: const EdgeInsets.all(24),
                child: Text(loc.logbookNoEntries,
                    textAlign: TextAlign.center, style: TextStyle(color: AppColors.secondary)),
              )
            else
              for (int i = 0; i < shown.length; i++)
                Dismissible(
                  key: ValueKey('${shown[i].time.microsecondsSinceEpoch}_$i'),
                  direction: book.kind == LogBookKind.inventory
                      ? DismissDirection.none
                      : DismissDirection.endToStart,
                  background: Container(
                    alignment: AlignmentDirectional.centerEnd,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    color: AppColors.dangerSoft,
                    child: Icon(Icons.delete_outline, color: AppColors.danger),
                  ),
                  onDismissed: (_) async {
                    await widget.controller.storage.saveLogBook(book.removeAt(i));
                    if (mounted) setState(() {});
                  },
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: switch (shown[i].checkIn) {
                      true => Icon(Icons.login_rounded, color: AppColors.success),
                      false => Icon(Icons.logout_rounded, color: AppColors.warning),
                      null => Icon(logBookKindIcon(book.kind), color: AppColors.secondary),
                    },
                    title: Text(shown[i].label, maxLines: 2, overflow: TextOverflow.ellipsis),
                    subtitle: Text(
                        [
                          if (shown[i].checkIn != null)
                            shown[i].checkIn! ? loc.logbookCheckIn : loc.logbookCheckOut,
                          fmt.format(shown[i].time.toLocal()),
                          shown[i].uid,
                        ].join(' · '),
                        style: TextStyle(fontSize: 12, color: AppColors.secondary)),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
