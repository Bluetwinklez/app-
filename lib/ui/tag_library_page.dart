import 'dart:io';
import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import '../domain/ndef_record.dart';
import '../domain/tag_library.dart';
import '../l10n/l10n.dart';
import '../services/app_storage_service.dart';
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
class TagLibraryPage extends StatefulWidget {
  final AppStorageService storage;

  /// Records of the last successful scan, offered as the content of a new entry.
  final List<NdefRecordModel> lastScanRecords;
  final String? lastScanUid;

  /// Current write list, offered as the content of a new entry.
  final List<NdefRecordModel> composerRecords;

  /// Copies an entry's records into the write list.
  final void Function(List<NdefRecordModel> records, String name) onUseRecords;

  /// Opens the editor for a new entry from the last scan right away.
  final bool startWithLastScan;

  const TagLibraryPage({
    super.key,
    required this.storage,
    required this.lastScanRecords,
    required this.lastScanUid,
    required this.composerRecords,
    required this.onUseRecords,
    this.startWithLastScan = false,
  });

  @override
  State<TagLibraryPage> createState() => _TagLibraryPageState();
}

class _TagLibraryPageState extends State<TagLibraryPage> {
  String _query = '';
  TagCategory? _filter;
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

  List<TagLibraryEntry> get _visible => widget.storage
      .getLibrary()
      .where((e) => (_filter == null || e.category == _filter) && e.matches(_query))
      .toList();

  Future<void> _addEntry() async {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    final sources = <_LibrarySource, List<NdefRecordModel>>{
      if (widget.lastScanRecords.isNotEmpty) _LibrarySource.lastScan: widget.lastScanRecords,
      if (widget.composerRecords.isNotEmpty) _LibrarySource.composer: widget.composerRecords,
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
                    style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
              ),
              for (final entry in sources.entries)
                ListTile(
                  leading: const Icon(Icons.nfc_rounded),
                  title: Text(_sourceLabel(entry.key, loc)),
                  subtitle: entry.value.isEmpty ? null : Text(loc.ndefRecordsCount(entry.value.length)),
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
      builder: (_) => _EntryEditor(entry: entry, docsDir: _docsDir, isNew: isNew),
    );
    if (result == null) return;
    try {
      await widget.storage.saveLibraryEntry(result);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Kaydedilemedi: $e'), backgroundColor: AppColors.danger),
        );
      }
    }
    if (mounted) setState(() {});
  }

  Future<void> _delete(TagLibraryEntry entry) async {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(loc.tagLibraryDeleteTitle),
        content: Text(loc.tagLibraryDeleteConfirm(entry.name)),
        actions: [
          TextButton(onPressed: () => Navigator.of(ctx).pop(false), child: Text(loc.dismiss)),
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
      decoration: const BoxDecoration(gradient: AppColors.canvasGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(title: Text(loc.tagLibraryTitle)),
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
                        avatar: Icon(tagCategoryIcon(c), size: 16,
                            color: _filter == c ? Colors.white : AppColors.secondary),
                        label: Text(tagCategoryLabel(c, loc)),
                        selected: _filter == c,
                        onSelected: (_) => setState(() => _filter = _filter == c ? null : c),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            if (entries.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 48),
                child: Column(
                  children: [
                    const Icon(Icons.collections_bookmark_outlined, size: 48, color: AppColors.secondary),
                    const SizedBox(height: 12),
                    Text(
                      widget.storage.getLibrary().isEmpty
                          ? loc.tagLibraryEmpty
                          : loc.tagLibraryNoMatch,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: AppColors.secondary, height: 1.4),
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
  final VoidCallback onDelete;

  const _EntryCard({
    required this.entry,
    required this.photo,
    required this.onTap,
    required this.onUse,
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
                      child: Icon(tagCategoryIcon(entry.category), color: AppColors.accent),
                    ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(entry.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 2),
                Text(
                  [
                    tagCategoryLabel(entry.category, loc),
                    if (entry.locationNote.isNotEmpty) entry.locationNote,
                  ].join(' · '),
                  style: const TextStyle(fontSize: 12.5, color: AppColors.secondary),
                ),
                const SizedBox(height: 2),
                Text(
                  summary,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12.5, color: AppColors.secondary),
                ),
              ],
            ),
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert_rounded, color: AppColors.secondary),
            onSelected: (v) {
              if (v == 'use') onUse?.call();
              if (v == 'delete') onDelete();
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                value: 'use',
                enabled: onUse != null,
                child: Text(loc.copyToComposer),
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

  const _EntryEditor({required this.entry, required this.docsDir, required this.isNew});

  @override
  State<_EntryEditor> createState() => _EntryEditorState();
}

class _EntryEditorState extends State<_EntryEditor> {
  late final _name = TextEditingController(text: widget.entry.name);
  late final _note = TextEditingController(text: widget.entry.note);
  late final _location = TextEditingController(text: widget.entry.locationNote);
  late TagCategory _category = widget.entry.category;
  late String? _photoPath = widget.entry.photoPath;
  String? _error;

  @override
  void dispose() {
    _name.dispose();
    _note.dispose();
    _location.dispose();
    super.dispose();
  }

  Future<void> _pickPhoto(ImageSource source) async {
    final docs = widget.docsDir;
    if (docs == null) return;
    try {
      final picked = await ImagePicker().pickImage(source: source, maxWidth: 1200, imageQuality: 80);
      if (picked == null) return;
      final dir = Directory('${docs.path}/tag_photos');
      if (!await dir.exists()) await dir.create(recursive: true);
      final relative = 'tag_photos/${widget.entry.id}_${DateTime.now().millisecondsSinceEpoch}.jpg';
      await File(picked.path).copy('${docs.path}/$relative');
      setState(() => _photoPath = relative);
    } catch (e) {
      if (!mounted) return;
      final loc = AppLocalizations.of(context) ?? L10n.current;
      setState(() => _error = loc.tagLibraryPhotoError(e.toString()));
    }
  }

  void _save() {
    final name = _name.text.trim();
    if (name.isEmpty) {
      final loc = AppLocalizations.of(context) ?? L10n.current;
      setState(() => _error = loc.tagLibraryNamePrompt);
      return;
    }
    Navigator.of(context).pop(widget.entry.copyWith(
      name: name,
      note: _note.text.trim(),
      locationNote: _location.text.trim(),
      category: _category,
      photoPath: _photoPath,
      clearPhoto: _photoPath == null,
      updatedAt: DateTime.now(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    final docs = widget.docsDir;
    final photo = _photoPath != null && docs != null ? File('${docs.path}/$_photoPath') : null;
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, MediaQuery.of(context).viewInsets.bottom + 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(widget.isNew ? loc.tagLibraryAddToLibrary : loc.tagLibraryEditTag,
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
                          child: Icon(tagCategoryIcon(_category), size: 44, color: AppColors.accent),
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
              decoration: InputDecoration(labelText: loc.name, hintText: loc.tagLibraryNameHint),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<TagCategory>(
              initialValue: _category,
              decoration: InputDecoration(labelText: loc.categoryLabel),
              items: [
                for (final c in TagCategory.values)
                  DropdownMenuItem(value: c, child: Text(tagCategoryLabel(c, loc))),
              ],
              onChanged: (v) => setState(() => _category = v ?? _category),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _location,
              decoration: InputDecoration(labelText: loc.locationLabel, hintText: loc.tagLibraryLocationHint),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _note,
              maxLines: 3,
              minLines: 1,
              decoration: InputDecoration(labelText: loc.noteLabel),
            ),
            const SizedBox(height: 12),
            Text(
              widget.entry.records.isEmpty
                  ? loc.tagLibraryNoTagContent
                  : '${loc.tagLibraryRecordSummary(widget.entry.records.length)}'
                      '${NdefCodec.parseRecord(widget.entry.records.first).content}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: AppColors.secondary, fontSize: 13),
            ),
            if (widget.entry.uid != null && widget.entry.uid!.isNotEmpty)
              Text('UID: ${widget.entry.uid}',
                  style: const TextStyle(color: AppColors.secondary, fontSize: 13)),
            if (_error != null)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(_error!, style: const TextStyle(color: AppColors.danger)),
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
