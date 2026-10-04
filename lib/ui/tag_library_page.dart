import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import '../domain/csv_export.dart';
import '../domain/library_import.dart';
import '../domain/team_pack.dart';
import '../services/backup_crypto.dart';
import 'password_prompt.dart';
import '../services/notification_service.dart';
import 'tag_map_page.dart';
import '../domain/logbook.dart';
import '../domain/ndef_record.dart';
import '../domain/tag_library.dart';
import '../l10n/app_localizations.dart';
import '../l10n/l10n.dart';
import '../services/app_storage_service.dart';
import '../services/print_sheet.dart';
import 'app_theme.dart';

String tagCategoryLabel(TagCategory c, [AppLocalizations? loc]) {
  final l = loc ?? L10n.current;
  switch (c) {
    case TagCategory.home:
      return l.catHome;
    case TagCategory.work:
      return l.catWork;
    case TagCategory.car:
      return l.catCar;
    case TagCategory.personal:
      return l.catPersonal;
    case TagCategory.business:
      return l.catBusiness;
    case TagCategory.other:
      return l.catOther;
  }
}

IconData tagCategoryIcon(TagCategory c) {
  switch (c) {
    case TagCategory.home:
      return Icons.home_outlined;
    case TagCategory.work:
      return Icons.work_outline_rounded;
    case TagCategory.car:
      return Icons.directions_car_outlined;
    case TagCategory.personal:
      return Icons.person_outline_rounded;
    case TagCategory.business:
      return Icons.storefront_outlined;
    case TagCategory.other:
      return Icons.label_outline_rounded;
  }
}

/// Named physical tags with notes and photos.
/// Shows what a team pack contains, asks to confirm and merges it into the
/// library and templates. [content] may still be encrypted. Returns true when
/// something was added.
Future<bool> importTeamPack(BuildContext context, AppStorageService storage, String content) async {
  final loc = AppLocalizations.of(context) ?? L10n.current;
  if (BackupCrypto.isEncrypted(content)) {
    final plain = await askPasswordAndDecrypt(context, content);
    if (plain == null || !context.mounted) return false;
    content = plain;
  }
  final TeamPack pack;
  try {
    pack = TeamPack.decode(content);
  } on TeamPackException catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(loc.packInvalid(e.message)),
      backgroundColor: AppColors.danger,
    ));
    return false;
  }
  final ok = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text(loc.packImport),
      content: Text(loc.packPreview(pack.name, '${pack.entries.length}', '${pack.templates.length}')),
      actions: [
        TextButton(onPressed: () => Navigator.of(ctx).pop(false), child: Text(loc.cancel)),
        ElevatedButton(onPressed: () => Navigator.of(ctx).pop(true), child: Text(loc.libraryImportAdd)),
      ],
    ),
  );
  if (ok != true) return false;
  final merged = pack.mergeInto(storage.getLibrary(), storage.getTemplates());
  for (final e in merged.entries.reversed) {
    await storage.saveLibraryEntry(e);
  }
  for (final t in merged.templates) {
    await storage.saveTemplate(t);
  }
  if (context.mounted) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(loc.packImported(
          '${merged.entries.length}', '${merged.templates.length}', '${merged.skipped}')),
      backgroundColor: AppColors.success,
    ));
  }
  return merged.entries.isNotEmpty || merged.templates.isNotEmpty;
}

class TagLibraryPage extends StatefulWidget {
  final AppStorageService storage;

  /// Records of the last successful scan, offered as the content of a new entry.
  final List<NdefRecordModel> lastScanRecords;
  final String? lastScanUid;

  /// Current write list, offered as the content of a new entry.
  final List<NdefRecordModel> composerRecords;

  /// Copies an entry's records into the write list.
  final void Function(List<NdefRecordModel> records, String name) onUseRecords;

  /// Writes an entry's records straight to a tag; returns success.
  final Future<bool> Function(List<NdefRecordModel> records, String name)? onWriteRecords;

  /// Opens the editor for a new entry from the last scan right away.
  final bool startWithLastScan;

  const TagLibraryPage({
    super.key,
    required this.storage,
    required this.lastScanRecords,
    required this.lastScanUid,
    required this.composerRecords,
    required this.onUseRecords,
    this.onWriteRecords,
    this.startWithLastScan = false,
  });

  @override
  State<TagLibraryPage> createState() => _TagLibraryPageState();
}

class _TagLibraryPageState extends State<TagLibraryPage> {
  String _query = '';
  TagCategory? _filter;
  String? _labelFilter;
  bool _sortUnseen = false;
  bool _dueOnly = false;
  Directory? _docsDir;

  @override
  void initState() {
    super.initState();
    getApplicationDocumentsDirectory().then((dir) {
      if (mounted) setState(() => _docsDir = dir);
    }).catchError((_) {});
    if (widget.startWithLastScan && widget.lastScanRecords.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        final now = DateTime.now();
        _edit(
          TagLibraryEntry(
            id: '${now.microsecondsSinceEpoch}',
            name: '',
            uid: widget.lastScanUid,
            records: List<NdefRecordModel>.from(widget.lastScanRecords),
            createdAt: now,
            updatedAt: now,
          ),
          isNew: true,
        );
      });
    }
  }

  File? _photoFile(TagLibraryEntry entry) {
    final rel = entry.photoPath;
    if (rel == null || _docsDir == null) return null;
    final file = File('${_docsDir!.path}/$rel');
    return file.existsSync() ? file : null;
  }

  List<TagLibraryEntry> get _visible {
    final list = widget.storage
        .getLibrary()
        .where((e) =>
            (_filter == null || e.category == _filter) &&
            (_labelFilter == null || e.hasLabel(_labelFilter!)) &&
            (!_dueOnly || e.isCheckDue(DateTime.now())) &&
            e.matches(_query))
        .toList();
    if (_sortUnseen) {
      // Never seen first, then the oldest sighting.
      list.sort((a, b) {
        final x = a.lastSeenAt, y = b.lastSeenAt;
        if (x == null) return y == null ? 0 : -1;
        if (y == null) return 1;
        return x.compareTo(y);
      });
    }
    return list;
  }

  Future<void> _sharePack() async {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    final entries = _visible;
    final templates = widget.storage.getTemplates();
    final name = TextEditingController(text: loc.tagLibraryTitle);
    final password = TextEditingController();
    var withTemplates = false;
    String? error;
    final go = await showDialog<bool>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDlg) => AlertDialog(
          title: Text(loc.packShare),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(loc.packHint, style: TextStyle(fontSize: 13, color: AppColors.secondary, height: 1.35)),
                const SizedBox(height: 8),
                Text(loc.packCount('${entries.length}'),
                    style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.accent)),
                TextField(
                  controller: name,
                  maxLength: 60,
                  decoration: InputDecoration(labelText: loc.packName, counterText: ''),
                ),
                if (templates.isNotEmpty)
                  CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    value: withTemplates,
                    title: Text(loc.packIncludeTemplates('${templates.length}')),
                    onChanged: (v) => setDlg(() => withTemplates = v ?? false),
                  ),
                TextField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(labelText: loc.packPassword, errorText: error),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.of(ctx).pop(false), child: Text(loc.cancel)),
            ElevatedButton(
              onPressed: entries.isEmpty && !withTemplates
                  ? null
                  : () {
                      final p = password.text;
                      if (p.isNotEmpty && p.length < BackupCrypto.minPasswordLength) {
                        setDlg(() => error = loc.packPasswordShort);
                        return;
                      }
                      Navigator.of(ctx).pop(true);
                    },
              child: Text(loc.shareTag),
            ),
          ],
        ),
      ),
    );
    final packName = name.text.trim();
    final pass = password.text;
    name.dispose();
    password.dispose();
    if (go != true) return;
    var content = TeamPack(
      name: packName.isEmpty ? loc.tagLibraryTitle : packName,
      createdAt: DateTime.now(),
      entries: entries,
      templates: withTemplates ? templates : const [],
    ).encode();
    if (pass.isNotEmpty) content = await BackupCrypto.encrypt(content, pass);
    final safe = (packName.isEmpty ? 'pack' : packName).replaceAll(RegExp(r'[^\w\-]+'), '_');
    final file = 'nfc_pack_$safe.json';
    await SharePlus.instance.share(ShareParams(
      files: [XFile.fromData(Uint8List.fromList(utf8.encode(content)), mimeType: 'application/json', name: file)],
      fileNameOverrides: [file],
    ));
  }

  Future<void> _importPackFile() async {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    try {
      final file = await openFile();
      if (file == null || !mounted) return;
      if (await file.length() > 5 * 1024 * 1024) throw const FormatException('> 5 MB');
      final content = utf8.decode(await file.readAsBytes());
      if (!mounted) return;
      if (await importTeamPack(context, widget.storage, content) && mounted) setState(() {});
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(loc.fileReadError('$e')),
        backgroundColor: AppColors.danger,
      ));
    }
  }

  Future<void> _importCsv() async {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    final text = TextEditingController();
    LibraryImportResult preview() => LibraryCsvImporter.parse(
          text.text,
          existing: widget.storage.getLibrary(),
          headerAliases: {
            loc.name: LibraryColumn.name,
            loc.csvColumnContent: LibraryColumn.content,
            loc.locationLabel: LibraryColumn.location,
            loc.csvColumnLabels: LibraryColumn.labels,
            loc.noteLabel: LibraryColumn.note,
            loc.categoryLabel: LibraryColumn.category,
          },
        );
    final result = await showDialog<LibraryImportResult>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDlg) {
          final r = preview();
          return AlertDialog(
            title: Text(loc.libraryImportTitle),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(loc.libraryImportHint, style: TextStyle(fontSize: 13, color: AppColors.secondary, height: 1.35)),
                  const SizedBox(height: 10),
                  TextField(
                    controller: text,
                    minLines: 4,
                    maxLines: 8,
                    style: const TextStyle(fontFamily: 'monospace', fontSize: 12.5),
                    onChanged: (_) => setDlg(() {}),
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: TextButton.icon(
                      icon: const Icon(Icons.content_paste_rounded, size: 18),
                      label: Text(loc.libraryImportPaste),
                      onPressed: () async {
                        final data = await Clipboard.getData(Clipboard.kTextPlain);
                        if (data?.text != null) setDlg(() => text.text = data!.text!);
                      },
                    ),
                  ),
                  if (text.text.trim().isNotEmpty) ...[
                    Text(loc.libraryImportPreview('${r.entries.length}'),
                        style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.accent)),
                    if (r.duplicates > 0 || r.invalidRows.isNotEmpty)
                      Text(loc.libraryImportSkipped('${r.duplicates}', '${r.invalidRows.length}'),
                          style: TextStyle(fontSize: 12.5, color: AppColors.warning)),
                  ],
                ],
              ),
            ),
            actions: [
              TextButton(onPressed: () => Navigator.of(ctx).pop(), child: Text(loc.cancel)),
              ElevatedButton(
                onPressed: r.entries.isEmpty ? null : () => Navigator.of(ctx).pop(r),
                child: Text(loc.libraryImportAdd),
              ),
            ],
          );
        },
      ),
    );
    text.dispose();
    if (result == null) return;
    // New entries go on top; save in reverse so the sheet order is kept.
    for (final e in result.entries.reversed) {
      await widget.storage.saveLibraryEntry(e);
    }
    if (!mounted) return;
    setState(() {});
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(loc.libraryImportDone('${result.entries.length}')),
      backgroundColor: AppColors.success,
    ));
  }

  Future<void> _exportCsv() async {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    final csv = CsvExport.library(widget.storage.getLibrary(), header: [
      loc.name,
      loc.categoryLabel,
      loc.locationLabel,
      loc.csvColumnLabels,
      loc.noteLabel,
      'UID',
      loc.csvColumnContent,
      loc.csvColumnTime,
    ]);
    final name =
        'nfc_library_${DateTime.now().toIso8601String().substring(0, 10)}.csv';
    await SharePlus.instance.share(ShareParams(
      files: [
        XFile.fromData(Uint8List.fromList(utf8.encode(csv)),
            mimeType: 'text/csv', name: name)
      ],
      fileNameOverrides: [name],
    ));
  }

  Future<void> _addEntry() async {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    final sources = <_LibrarySource, List<NdefRecordModel>>{
      if (widget.lastScanRecords.isNotEmpty)
        _LibrarySource.lastScan: widget.lastScanRecords,
      if (widget.composerRecords.isNotEmpty)
        _LibrarySource.composer: widget.composerRecords,
      _LibrarySource.empty: const [],
    };
    _LibrarySource? chosen = sources.keys.first;
    if (sources.length > 1) {
      chosen = await showModalBottomSheet<_LibrarySource>(
        context: context,
        builder: (ctx) => SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
                child: Text(loc.sourceSelectPrompt,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w700)),
              ),
              for (final entry in sources.entries)
                ListTile(
                  leading: const Icon(Icons.nfc_rounded),
                  title: Text(_sourceLabel(entry.key, loc)),
                  subtitle: entry.value.isEmpty
                      ? null
                      : Text(loc.ndefRecordsCount(entry.value.length)),
                  onTap: () => Navigator.of(ctx).pop(entry.key),
                ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      );
    }
    if (chosen == null || !mounted) return;
    final now = DateTime.now();
    final fromScan = chosen == _LibrarySource.lastScan;
    final draft = TagLibraryEntry(
      id: '${now.microsecondsSinceEpoch}',
      name: '',
      uid: fromScan ? widget.lastScanUid : null,
      records: List<NdefRecordModel>.from(sources[chosen]!),
      createdAt: now,
      updatedAt: now,
    );
    await _edit(draft, isNew: true);
  }

  Future<void> _edit(TagLibraryEntry entry, {bool isNew = false}) async {
    final result = await showModalBottomSheet<TagLibraryEntry>(
      context: context,
      isScrollControlled: true,
      builder: (_) =>
          _EntryEditor(entry: entry, docsDir: _docsDir, isNew: isNew, logBooks: widget.storage.getLogBooks()),
    );
    if (result == null) return;
    if (result.checkEveryDays != null && entry.checkEveryDays == null) {
      await NotificationService.requestPermission();
    }
    try {
      await widget.storage.saveLibraryEntry(result);
      if (result.checkEveryDays != entry.checkEveryDays ||
          result.checkEveryDays != null ||
          result.warrantyUntil != entry.warrantyUntil) {
        NotificationService.sync(widget.storage);
      }
      // The editor copies a new photo; drop the one it replaced.
      final old = entry.photoPath;
      if (old != null && old != result.photoPath && _docsDir != null) {
        final file = File('${_docsDir!.path}/$old');
        if (await file.exists()) await file.delete();
      }
    } catch (e) {
      if (mounted) {
        final loc = AppLocalizations.of(context) ?? L10n.current;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(loc.librarySaveFailed('$e')),
              backgroundColor: AppColors.danger),
        );
      }
    }
    if (mounted) setState(() {});
  }

  /// PDF with a QR label per visible entry, shared through the share sheet.
  Future<void> _printSheet() async {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    final fontData = await rootBundle.load('assets/fonts/NotoSans-Regular.ttf');
    final labels = [
      for (final e in _visible)
        PrintLabel(
          title: e.name,
          subtitle: e.locationNote.isNotEmpty
              ? e.locationNote
              : (e.records.isEmpty ? '' : NdefCodec.parseRecord(e.records.first).content),
          qrData: e.records.isEmpty ? null : _qrDataFor(e.records.first),
        ),
    ];
    final bytes = await PrintSheet.build(labels, font: pw.Font.ttf(fontData), heading: loc.tagLibraryTitle);
    final name = 'nfc_labels_${DateTime.now().toIso8601String().substring(0, 10)}.pdf';
    await SharePlus.instance.share(ShareParams(
      files: [XFile.fromData(bytes, mimeType: 'application/pdf', name: name)],
      fileNameOverrides: [name],
    ));
  }

  /// URL or text that a QR code can carry for this record, if any.
  static String? _qrDataFor(NdefRecordModel record) {
    final parsed = NdefCodec.parseRecord(record);
    switch (parsed.type) {
      case ParsedRecordType.url:
        return parsed.extra['url'] as String? ?? parsed.content;
      case ParsedRecordType.smartPoster:
        return parsed.extra['uri'] as String?;
      case ParsedRecordType.text:
      case ParsedRecordType.phone:
      case ParsedRecordType.email:
        return parsed.content;
      default:
        return null;
    }
  }

  Future<void> _writeEntry(TagLibraryEntry entry) async {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    final ok = await widget.onWriteRecords!(entry.records, entry.name);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(ok ? loc.nfcWriteDone : loc.writeFailed),
      backgroundColor: ok ? AppColors.success : AppColors.danger,
    ));
  }

  Future<void> _delete(TagLibraryEntry entry) async {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(loc.tagLibraryDeleteTitle),
        content: Text(loc.tagLibraryDeleteConfirm(entry.name)),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(ctx).pop(false),
              child: Text(loc.dismiss)),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.danger),
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(loc.delete),
          ),
        ],
      ),
    );
    if (ok != true) return;
    final photo = _photoFile(entry);
    await widget.storage.deleteLibraryEntry(entry.id);
    try {
      await photo?.delete();
    } catch (_) {}
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    final entries = _visible;
    return DecoratedBox(
      decoration: BoxDecoration(gradient: AppColors.canvasGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(loc.tagLibraryTitle),
          actions: [
            IconButton(
              tooltip: loc.mapTitle,
              icon: const Icon(Icons.map_outlined),
              onPressed: () => TagMapPage.open(context, _visible),
            ),
            PopupMenuButton<String>(
              tooltip: loc.libraryMoreActions,
              icon: const Icon(Icons.more_horiz_rounded),
              onSelected: (v) {
                switch (v) {
                  case 'import_table':
                    _importCsv();
                  case 'import_pack':
                    _importPackFile();
                  case 'share_pack':
                    _sharePack();
                  case 'csv':
                    _exportCsv();
                  case 'print':
                    _printSheet();
                }
              },
              itemBuilder: (_) {
                final hasEntries = widget.storage.getLibrary().isNotEmpty;
                PopupMenuItem<String> item(String value, IconData icon, String label, {bool enabled = true}) =>
                    PopupMenuItem(
                      value: value,
                      enabled: enabled,
                      child: Row(children: [
                        Icon(icon, size: 20, color: AppColors.accent),
                        const SizedBox(width: 12),
                        Expanded(child: Text(label)),
                      ]),
                    );
                return [
                  item('import_table', Icons.table_view_outlined, loc.libraryImportTitle),
                  item('import_pack', Icons.group_add_outlined, loc.packImport),
                  item('share_pack', Icons.groups_outlined, loc.packShare, enabled: hasEntries || widget.storage.getTemplates().isNotEmpty),
                  item('csv', Icons.ios_share_rounded, loc.exportCsv, enabled: hasEntries),
                  item('print', Icons.print_outlined, loc.printSheet, enabled: hasEntries),
                ];
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _addEntry,
          backgroundColor: AppColors.accent,
          foregroundColor: Colors.white,
          icon: const Icon(Icons.add_rounded),
          label: Text(loc.tagLibraryAddTag),
        ),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 100),
          children: [
            TextField(
              onChanged: (v) => setState(() => _query = v),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search_rounded),
                hintText: loc.tagLibrarySearchHint,
              ),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 8),
                    child: ChoiceChip(
                      label: Text(loc.all),
                      selected: _filter == null,
                      onSelected: (_) => setState(() => _filter = null),
                    ),
                  ),
                  for (final c in TagCategory.values)
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 8),
                      child: ChoiceChip(
                        avatar: Icon(tagCategoryIcon(c),
                            size: 16,
                            color: _filter == c
                                ? Colors.white
                                : AppColors.secondary),
                        label: Text(tagCategoryLabel(c, loc)),
                        selected: _filter == c,
                        onSelected: (_) =>
                            setState(() => _filter = _filter == c ? null : c),
                      ),
                    ),
                ],
              ),
            ),
            if (TagLibraryEntry.allLabels(widget.storage.getLibrary()) case final labels
                when labels.isNotEmpty) ...[
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (final label in labels)
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: 8),
                        child: FilterChip(
                          avatar: Icon(Icons.label_outline_rounded,
                              size: 16, color: AppColors.secondary),
                          label: Text(label),
                          selected: _labelFilter == label,
                          onSelected: (_) => setState(() =>
                              _labelFilter = _labelFilter == label ? null : label),
                        ),
                      ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 6,
              children: [
                FilterChip(
                  avatar: Icon(Icons.history_toggle_off_rounded, size: 16, color: AppColors.secondary),
                  label: Text(loc.sortLongestUnseen),
                  selected: _sortUnseen,
                  onSelected: (v) => setState(() => _sortUnseen = v),
                ),
                if (widget.storage.getLibrary().where((e) => e.isCheckDue(DateTime.now())).length
                    case final due when due > 0 || _dueOnly)
                  FilterChip(
                    avatar: Icon(Icons.build_circle_outlined, size: 16, color: AppColors.warning),
                    label: Text(loc.libraryDueFilter('$due')),
                    selected: _dueOnly,
                    onSelected: (v) => setState(() => _dueOnly = v),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            if (entries.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 48),
                child: Column(
                  children: [
                    Icon(Icons.collections_bookmark_outlined,
                        size: 48, color: AppColors.secondary),
                    const SizedBox(height: 12),
                    Text(
                      widget.storage.getLibrary().isEmpty
                          ? loc.tagLibraryEmpty
                          : loc.tagLibraryNoMatch,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: AppColors.secondary, height: 1.4),
                    ),
                  ],
                ),
              )
            else
              for (final entry in entries)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: _EntryCard(
                    entry: entry,
                    photo: _photoFile(entry),
                    onTap: () => _edit(entry),
                    onUse: entry.records.isEmpty
                        ? null
                        : () {
                            widget.onUseRecords(entry.records, entry.name);
                            Navigator.of(context).pop();
                          },
                    onDelete: () => _delete(entry),
                    onWrite: entry.records.isEmpty || widget.onWriteRecords == null
                        ? null
                        : () => _writeEntry(entry),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}

class _EntryCard extends StatelessWidget {
  final TagLibraryEntry entry;
  final File? photo;
  final VoidCallback onTap;
  final VoidCallback? onUse;
  final VoidCallback? onWrite;
  final VoidCallback onDelete;

  const _EntryCard({
    required this.entry,
    required this.photo,
    required this.onTap,
    required this.onUse,
    this.onWrite,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    final summary = entry.records.isEmpty
        ? (entry.note.isEmpty ? loc.noContent : entry.note)
        : NdefCodec.parseRecord(entry.records.first).content;
    return SoftCard(
      onTap: onTap,
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: SizedBox(
              width: 58,
              height: 58,
              child: photo != null
                  ? Image.file(photo!, fit: BoxFit.cover)
                  : Container(
                      color: AppColors.accentSoft,
                      child: Icon(tagCategoryIcon(entry.category),
                          color: AppColors.accent),
                    ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(entry.name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 2),
                Text(
                  [
                    tagCategoryLabel(entry.category, loc),
                    if (entry.locationNote.isNotEmpty) entry.locationNote,
                    ...entry.labels.map((l) => '#$l'),
                  ].join(' · '),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12.5, color: AppColors.secondary),
                ),
                const SizedBox(height: 2),
                Text(
                  summary,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12.5, color: AppColors.secondary),
                ),
                const SizedBox(height: 2),
                Text(
                  entry.lastSeenAt == null
                      ? loc.neverSeen
                      : entry.unseenFor(30, DateTime.now())
                          ? loc.unseen30Days
                          : loc.lastSeenAt(DateFormat.yMMMd(Localizations.localeOf(context).toLanguageTag())
                              .format(entry.lastSeenAt!.toLocal())),
                  style: TextStyle(
                    fontSize: 12,
                    color: entry.lastSeenAt != null && entry.unseenFor(30, DateTime.now())
                        ? AppColors.warning
                        : AppColors.secondary,
                  ),
                ),
                if (entry.assignee.isNotEmpty || entry.warrantyUntil != null)
                  Text(
                    [
                      if (entry.assignee.isNotEmpty) loc.assigneeText(entry.assignee),
                      if (entry.warrantyUntil != null)
                        entry.warrantyExpired(DateTime.now())
                            ? loc.warrantyExpired
                            : loc.warrantyUntilText(DateFormat.yMMMd(Localizations.localeOf(context).toLanguageTag())
                                .format(entry.warrantyUntil!)),
                    ].join(' · '),
                    style: TextStyle(
                      fontSize: 12,
                      color: entry.warrantyExpired(DateTime.now()) ? AppColors.danger : AppColors.secondary,
                    ),
                  ),
                if (entry.nextCheckAt case final next?)
                  Row(
                    children: [
                      Icon(Icons.build_circle_outlined,
                          size: 14,
                          color: entry.isCheckDue(DateTime.now()) ? AppColors.danger : AppColors.secondary),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          entry.isCheckDue(DateTime.now())
                              ? loc.libraryCheckDue
                              : loc.libraryCheckNext(DateFormat.yMMMd(Localizations.localeOf(context).toLanguageTag())
                                  .format(next.toLocal())),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: entry.isCheckDue(DateTime.now()) ? FontWeight.w700 : FontWeight.normal,
                            color: entry.isCheckDue(DateTime.now()) ? AppColors.danger : AppColors.secondary,
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert_rounded, color: AppColors.secondary),
            onSelected: (v) {
              if (v == 'use') onUse?.call();
              if (v == 'write') onWrite?.call();
              if (v == 'delete') onDelete();
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                value: 'use',
                enabled: onUse != null,
                child: Text(loc.copyToComposer),
              ),
              PopupMenuItem(
                value: 'write',
                enabled: onWrite != null,
                child: Text(loc.libraryWriteToTag),
              ),
              PopupMenuItem(value: 'delete', child: Text(loc.delete)),
            ],
          ),
        ],
      ),
    );
  }
}

class _EntryEditor extends StatefulWidget {
  final TagLibraryEntry entry;
  final Directory? docsDir;
  final bool isNew;
  final List<LogBook> logBooks;

  const _EntryEditor(
      {required this.entry, required this.docsDir, required this.isNew, this.logBooks = const []});

  @override
  State<_EntryEditor> createState() => _EntryEditorState();
}

class _EntryEditorState extends State<_EntryEditor> {
  late final _name = TextEditingController(text: widget.entry.name);
  late final _note = TextEditingController(text: widget.entry.note);
  late final _location = TextEditingController(text: widget.entry.locationNote);
  late final _labels = TextEditingController(text: widget.entry.labels.join(', '));
  late final _serial = TextEditingController(text: widget.entry.assetSerial);
  late final _assignee = TextEditingController(text: widget.entry.assignee);
  late DateTime? _warranty = widget.entry.warrantyUntil;
  final _pickedPhotos = <String>[];
  bool _saved = false;
  late TagCategory _category = widget.entry.category;
  late String? _photoPath = widget.entry.photoPath;
  late int? _checkEvery = widget.entry.checkEveryDays;
  late double? _lat = widget.entry.latitude;
  late double? _lng = widget.entry.longitude;
  bool _locating = false;
  late String? _autoLog = widget.logBooks.any((b) => b.id == widget.entry.autoLogBookId)
      ? widget.entry.autoLogBookId
      : null;
  String? _error;

  @override
  void dispose() {
    _name.dispose();
    _note.dispose();
    _location.dispose();
    _labels.dispose();
    _serial.dispose();
    _assignee.dispose();
    // Photos picked in this editor but not kept are orphans; remove them.
    final keep = _saved ? _photoPath : null;
    final docs = widget.docsDir;
    if (docs != null) {
      for (final rel in _pickedPhotos) {
        if (rel == keep) continue;
        File('${docs.path}/$rel').delete().ignore();
      }
    }
    super.dispose();
  }

  Future<void> _pickPhoto(ImageSource source) async {
    final docs = widget.docsDir;
    if (docs == null) return;
    try {
      final picked = await ImagePicker()
          .pickImage(source: source, maxWidth: 1200, imageQuality: 80);
      if (picked == null) return;
      final dir = Directory('${docs.path}/tag_photos');
      if (!await dir.exists()) await dir.create(recursive: true);
      final relative =
          'tag_photos/${widget.entry.id}_${DateTime.now().millisecondsSinceEpoch}.jpg';
      await File(picked.path).copy('${docs.path}/$relative');
      _pickedPhotos.add(relative);
      setState(() => _photoPath = relative);
    } catch (e) {
      if (!mounted) return;
      final loc = AppLocalizations.of(context) ?? L10n.current;
      setState(() => _error = loc.tagLibraryPhotoError(e.toString()));
    }
  }

  Future<void> _useCurrentLocation() async {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    setState(() {
      _locating = true;
      _error = null;
    });
    try {
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
        if (mounted) setState(() => _error = loc.mapLocationDenied);
        return;
      }
      final p = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(accuracy: LocationAccuracy.high, timeLimit: Duration(seconds: 20)),
      );
      if (mounted) {
        setState(() {
          _lat = double.parse(p.latitude.toStringAsFixed(6));
          _lng = double.parse(p.longitude.toStringAsFixed(6));
        });
      }
    } catch (e) {
      if (mounted) setState(() => _error = loc.mapLocationFailed('$e'));
    } finally {
      if (mounted) setState(() => _locating = false);
    }
  }

  void _save() {
    final name = _name.text.trim();
    if (name.isEmpty) {
      final loc = AppLocalizations.of(context) ?? L10n.current;
      setState(() => _error = loc.tagLibraryNamePrompt);
      return;
    }
    _saved = true;
    Navigator.of(context).pop(widget.entry.copyWith(
      name: name,
      labels: TagLibraryEntry.parseLabels(_labels.text),
      note: _note.text.trim(),
      locationNote: _location.text.trim(),
      category: _category,
      photoPath: _photoPath,
      clearPhoto: _photoPath == null,
      checkEveryDays: _checkEvery,
      clearCheck: _checkEvery == null,
      autoLogBookId: _autoLog,
      clearAutoLog: _autoLog == null,
      latitude: _lat,
      longitude: _lng,
      assetSerial: _serial.text.trim(),
      assignee: _assignee.text.trim(),
      warrantyUntil: _warranty,
      clearWarranty: _warranty == null,
      clearPosition: _lat == null || _lng == null,
      updatedAt: DateTime.now(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    final docs = widget.docsDir;
    final photo = _photoPath != null && docs != null
        ? File('${docs.path}/$_photoPath')
        : null;
    return Padding(
      padding: EdgeInsets.fromLTRB(
          20, 0, 20, MediaQuery.of(context).viewInsets.bottom + 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
                widget.isNew
                    ? loc.tagLibraryAddToLibrary
                    : loc.tagLibraryEditTag,
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 14),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  width: 120,
                  height: 120,
                  child: photo != null && photo.existsSync()
                      ? Image.file(photo, fit: BoxFit.cover)
                      : Container(
                          color: AppColors.accentSoft,
                          child: Icon(tagCategoryIcon(_category),
                              size: 44, color: AppColors.accent),
                        ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 4,
              children: [
                TextButton.icon(
                  onPressed: () => _pickPhoto(ImageSource.camera),
                  icon: const Icon(Icons.photo_camera_outlined, size: 18),
                  label: Text(loc.takePhoto),
                ),
                TextButton.icon(
                  onPressed: () => _pickPhoto(ImageSource.gallery),
                  icon: const Icon(Icons.photo_library_outlined, size: 18),
                  label: Text(loc.chooseFromGallery),
                ),
                if (_photoPath != null)
                  TextButton(
                    onPressed: () => setState(() => _photoPath = null),
                    child: Text(loc.remove),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _name,
              decoration: InputDecoration(
                  labelText: loc.name, hintText: loc.tagLibraryNameHint),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<TagCategory>(
              initialValue: _category,
              decoration: InputDecoration(labelText: loc.categoryLabel),
              items: [
                for (final c in TagCategory.values)
                  DropdownMenuItem(
                      value: c, child: Text(tagCategoryLabel(c, loc))),
              ],
              onChanged: (v) => setState(() => _category = v ?? _category),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _location,
              decoration: InputDecoration(
                  labelText: loc.locationLabel,
                  hintText: loc.tagLibraryLocationHint),
            ),
            Row(
              children: [
                Expanded(
                  child: _lat != null && _lng != null
                      ? Text(loc.mapPositionSaved(_lat!.toStringAsFixed(5), _lng!.toStringAsFixed(5)),
                          style: TextStyle(fontSize: 12.5, color: AppColors.secondary))
                      : TextButton.icon(
                          onPressed: _locating ? null : _useCurrentLocation,
                          icon: _locating
                              ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                              : const Icon(Icons.my_location_rounded, size: 18),
                          label: Text(loc.mapAddCurrent),
                        ),
                ),
                if (_lat != null)
                  IconButton(
                    tooltip: loc.remove,
                    icon: const Icon(Icons.close_rounded, size: 18),
                    onPressed: () => setState(() => _lat = _lng = null),
                  ),
              ],
            ),
            const SizedBox(height: 4),
            TextField(
              controller: _labels,
              decoration: InputDecoration(
                labelText: loc.libraryLabelsField,
                hintText: loc.libraryLabelsHint,
                prefixIcon: const Icon(Icons.label_outline_rounded),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _note,
              maxLines: 3,
              minLines: 1,
              decoration: InputDecoration(labelText: loc.noteLabel),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<int?>(
              initialValue: _checkEvery,
              decoration: InputDecoration(
                labelText: loc.libraryCheckEvery,
                helperText: loc.libraryCheckHint,
                helperMaxLines: 3,
                prefixIcon: const Icon(Icons.build_circle_outlined),
              ),
              items: [
                DropdownMenuItem<int?>(value: null, child: Text(loc.libraryCheckNone)),
                for (final d in {...TagLibraryEntry.checkIntervals, if (_checkEvery != null) _checkEvery!})
                  DropdownMenuItem<int?>(value: d, child: Text(loc.libraryCheckDays('$d'))),
              ],
              onChanged: (v) => setState(() => _checkEvery = v),
            ),
            if (_checkEvery != null)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(loc.inspectionRemindersNote,
                    style: TextStyle(fontSize: 12, color: AppColors.secondary)),
              ),
            const SizedBox(height: 8),
            ExpansionTile(
              tilePadding: EdgeInsets.zero,
              initiallyExpanded: widget.entry.hasAssetInfo,
              leading: const Icon(Icons.inventory_2_outlined),
              title: Text(loc.assetSection),
              childrenPadding: const EdgeInsets.only(bottom: 8),
              children: [
                TextField(controller: _serial, decoration: InputDecoration(labelText: loc.assetSerialLabel)),
                const SizedBox(height: 10),
                TextField(controller: _assignee, decoration: InputDecoration(labelText: loc.assigneeLabel)),
                const SizedBox(height: 4),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(loc.warrantyLabel),
                  subtitle: Text(_warranty == null
                      ? loc.libraryCheckNone
                      : DateFormat.yMMMd(Localizations.localeOf(context).toLanguageTag()).format(_warranty!)),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (_warranty != null)
                        IconButton(
                          tooltip: loc.remove,
                          icon: const Icon(Icons.close_rounded, size: 18),
                          onPressed: () => setState(() => _warranty = null),
                        ),
                      const Icon(Icons.event_outlined),
                    ],
                  ),
                  onTap: () async {
                    final now = DateTime.now();
                    final d = await showDatePicker(
                      context: context,
                      initialDate: _warranty ?? DateTime(now.year + 1, now.month, now.day),
                      firstDate: DateTime(now.year - 10),
                      lastDate: DateTime(now.year + 20),
                    );
                    if (d != null) setState(() => _warranty = d);
                  },
                ),
              ],
            ),
            if (widget.logBooks.isNotEmpty) ...[
              const SizedBox(height: 12),
              DropdownButtonFormField<String?>(
                initialValue: _autoLog,
                isExpanded: true,
                decoration: InputDecoration(
                  labelText: loc.libraryAutoLog,
                  helperText: loc.libraryAutoLogHint,
                  helperMaxLines: 3,
                  prefixIcon: const Icon(Icons.event_note_outlined),
                ),
                items: [
                  DropdownMenuItem<String?>(value: null, child: Text(loc.libraryCheckNone)),
                  for (final b in widget.logBooks)
                    DropdownMenuItem<String?>(value: b.id, child: Text(b.name, overflow: TextOverflow.ellipsis)),
                ],
                onChanged: (v) => setState(() => _autoLog = v),
              ),
            ],
            const SizedBox(height: 12),
            Text(
              widget.entry.records.isEmpty
                  ? loc.tagLibraryNoTagContent
                  : '${loc.tagLibraryRecordSummary(widget.entry.records.length)}'
                      '${NdefCodec.parseRecord(widget.entry.records.first).content}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: AppColors.secondary, fontSize: 13),
            ),
            if (widget.entry.uid != null && widget.entry.uid!.isNotEmpty)
              Text('UID: ${widget.entry.uid}',
                  style: TextStyle(color: AppColors.secondary, fontSize: 13)),
            if (_error != null)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(_error!, style: TextStyle(color: AppColors.danger)),
              ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _save, child: Text(loc.save)),
          ],
        ),
      ),
    );
  }
}

enum _LibrarySource { lastScan, composer, empty }

String _sourceLabel(_LibrarySource s, AppLocalizations loc) {
  switch (s) {
    case _LibrarySource.lastScan:
      return loc.tagLibrarySourceLastScanned;
    case _LibrarySource.composer:
      return loc.tagLibrarySourceWriteList;
    case _LibrarySource.empty:
      return loc.tagLibrarySourceEmpty;
  }
}
