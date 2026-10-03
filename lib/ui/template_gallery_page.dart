import 'package:flutter/material.dart';
import '../domain/ndef_record.dart';
import '../domain/quick_links.dart';
import '../domain/template_gallery.dart';
import '../l10n/app_localizations.dart';
import '../services/app_storage_service.dart';
import 'app_theme.dart';

/// Grid of ready-made use cases; picking one asks for a few fields and hands
/// the resulting records back through [onRecordsCreated].
class TemplateGalleryPage extends StatefulWidget {
  final void Function(List<NdefRecordModel> records, String title) onRecordsCreated;
  final AppStorageService? storage;

  const TemplateGalleryPage({super.key, required this.onRecordsCreated, this.storage});

  static Future<void> open(
    BuildContext context, {
    required void Function(List<NdefRecordModel> records, String title) onRecordsCreated,
    AppStorageService? storage,
  }) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => TemplateGalleryPage(onRecordsCreated: onRecordsCreated, storage: storage),
      ),
    );
  }

  static IconData iconFor(String key) {
    switch (key) {
      case 'badge':
        return Icons.badge_outlined;
      case 'wifi':
        return Icons.wifi_rounded;
      case 'star':
        return Icons.star_outline_rounded;
      case 'menu':
        return Icons.restaurant_menu_rounded;
      case 'pets':
        return Icons.pets_rounded;
      case 'camera':
        return Icons.camera_alt_outlined;
      case 'chat':
        return Icons.chat_bubble_outline_rounded;
      case 'medical':
        return Icons.medical_information_outlined;
      case 'download':
        return Icons.get_app_rounded;
      case 'place':
        return Icons.place_outlined;
      case 'web':
        return Icons.language_rounded;
      case 'bolt':
        return Icons.bolt_rounded;
      case 'phone':
        return Icons.call_outlined;
      case 'mail':
        return Icons.mail_outline_rounded;
      case 'event':
        return Icons.event_outlined;
      case 'music':
        return Icons.queue_music_rounded;
      case 'luggage':
        return Icons.luggage_outlined;
      case 'home':
        return Icons.home_outlined;
      case 'search':
        return Icons.travel_explore_rounded;
      case 'mic':
        return Icons.mic_none_rounded;
      default:
        return Icons.nfc_rounded;
    }
  }

  static String categoryLabel(AppLocalizations loc, GalleryCategory c) {
    switch (c) {
      case GalleryCategory.business:
        return loc.galleryCatBusiness;
      case GalleryCategory.social:
        return loc.galleryCatSocial;
      case GalleryCategory.home:
        return loc.galleryCatHome;
      case GalleryCategory.personal:
        return loc.galleryCatPersonal;
      case GalleryCategory.automation:
        return loc.galleryCatAutomation;
    }
  }

  @override
  State<TemplateGalleryPage> createState() => _TemplateGalleryPageState();
}

class _TemplateGalleryPageState extends State<TemplateGalleryPage> {
  final _search = TextEditingController();
  GalleryCategory? _category;
  bool _favoritesOnly = false;
  late List<String> _favorites = List.of(widget.storage?.favoritePresets ?? const <String>[]);

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  Future<void> _toggleFavorite(GalleryPreset preset) async {
    setState(() {
      if (!_favorites.remove(preset.id)) _favorites = [preset.id, ..._favorites];
    });
    await widget.storage?.setFavoritePresets(_favorites);
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final items = TemplateGallery.filter(
      query: _search.text,
      category: _category,
      favoritesOnly: _favoritesOnly,
      favorites: _favorites,
    );
    Widget chip(String label, bool selected, VoidCallback onTap, {IconData? icon}) => Padding(
          padding: const EdgeInsets.only(right: 8),
          child: ChoiceChip(
            avatar: icon == null ? null : Icon(icon, size: 16),
            label: Text(label),
            selected: selected,
            onSelected: (_) => onTap(),
          ),
        );

    return DecoratedBox(
      decoration: BoxDecoration(gradient: AppColors.canvasGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(title: Text(loc.readyTemplates)),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
              child: TextField(
                controller: _search,
                onChanged: (_) => setState(() {}),
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  hintText: loc.gallerySearchHint,
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: _search.text.isEmpty
                      ? null
                      : IconButton(
                          tooltip: loc.clearSearch,
                          icon: const Icon(Icons.close),
                          onPressed: () => setState(_search.clear),
                        ),
                ),
              ),
            ),
            SizedBox(
              height: 44,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  chip(loc.all, _category == null && !_favoritesOnly, () => setState(() {
                        _category = null;
                        _favoritesOnly = false;
                      })),
                  if (widget.storage != null)
                    chip(loc.galleryFavorites, _favoritesOnly, () => setState(() {
                          _favoritesOnly = !_favoritesOnly;
                          _category = null;
                        }), icon: Icons.star_rounded),
                  for (final c in GalleryCategory.values)
                    chip(TemplateGalleryPage.categoryLabel(loc, c), _category == c, () => setState(() {
                          _category = _category == c ? null : c;
                          _favoritesOnly = false;
                        })),
                ],
              ),
            ),
            Expanded(
              child: items.isEmpty
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text(loc.galleryNoResults,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: AppColors.secondary)),
                      ),
                    )
                  : LayoutBuilder(
                      builder: (context, constraints) {
                        final columns = constraints.maxWidth > 600 ? 3 : 2;
                        return GridView.builder(
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: columns,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                            mainAxisExtent: 172,
                          ),
                          itemCount: items.length,
                          itemBuilder: (context, i) => _PresetCard(
                            preset: items[i],
                            favorite: _favorites.contains(items[i].id),
                            onToggleFavorite:
                                widget.storage == null ? null : () => _toggleFavorite(items[i]),
                            onTap: () => _openPreset(context, items[i]),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openPreset(BuildContext context, GalleryPreset preset) async {
    final records = await showModalBottomSheet<List<NdefRecordModel>>(
      context: context,
      isScrollControlled: true,
      builder: (_) => _PresetForm(preset: preset),
    );
    if (records == null || records.isEmpty || !context.mounted) return;
    widget.onRecordsCreated(records, preset.title);
    Navigator.of(context).pop();
  }
}

class _PresetCard extends StatelessWidget {
  final GalleryPreset preset;
  final VoidCallback onTap;
  final bool favorite;
  final VoidCallback? onToggleFavorite;

  const _PresetCard({
    required this.preset,
    required this.onTap,
    this.favorite = false,
    this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return SoftCard(
      onTap: onTap,
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  gradient: AppColors.heroGradient,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Icon(TemplateGalleryPage.iconFor(preset.icon), color: Colors.white, size: 22),
              ),
              const Spacer(),
              if (onToggleFavorite != null)
                IconButton(
                  visualDensity: VisualDensity.compact,
                  tooltip: favorite ? loc.galleryRemoveFavorite : loc.galleryAddFavorite,
                  onPressed: onToggleFavorite,
                  icon: Icon(
                    favorite ? Icons.star_rounded : Icons.star_outline_rounded,
                    color: favorite ? AppColors.warning : AppColors.secondary,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            preset.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, letterSpacing: -0.2),
          ),
          const SizedBox(height: 4),
          Expanded(
            child: Text(
              preset.description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12.5, color: AppColors.secondary, height: 1.3),
            ),
          ),
        ],
      ),
    );
  }
}

class _PresetForm extends StatefulWidget {
  final GalleryPreset preset;

  const _PresetForm({required this.preset});

  @override
  State<_PresetForm> createState() => _PresetFormState();
}

class _PresetFormState extends State<_PresetForm> {
  late final Map<String, TextEditingController> _controllers = {
    for (final f in widget.preset.fields) f.key: TextEditingController(),
  };
  String? _error;

  @override
  void dispose() {
    for (final c in _controllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  TextInputType _keyboard(GalleryFieldKind kind) {
    switch (kind) {
      case GalleryFieldKind.phone:
        return TextInputType.phone;
      case GalleryFieldKind.email:
        return TextInputType.emailAddress;
      case GalleryFieldKind.url:
        return TextInputType.url;
      case GalleryFieldKind.multiline:
        return TextInputType.multiline;
      default:
        return TextInputType.text;
    }
  }

  void _submit() {
    try {
      final records = widget.preset.create({
        for (final e in _controllers.entries) e.key: e.value.text,
      });
      Navigator.of(context).pop(records);
    } on QuickLinkException catch (e) {
      setState(() => _error = e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    final preset = widget.preset;
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, MediaQuery.of(context).viewInsets.bottom + 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Icon(TemplateGalleryPage.iconFor(preset.icon), color: AppColors.accent),
                const SizedBox(width: 10),
                Expanded(child: Text(preset.title, style: Theme.of(context).textTheme.titleLarge)),
              ],
            ),
            const SizedBox(height: 6),
            Text(preset.description, style: TextStyle(color: AppColors.secondary)),
            const SizedBox(height: 16),
            for (final field in preset.fields) ...[
              TextField(
                controller: _controllers[field.key],
                keyboardType: _keyboard(field.kind),
                obscureText: field.kind == GalleryFieldKind.password,
                autocorrect: field.kind == GalleryFieldKind.text || field.kind == GalleryFieldKind.multiline,
                maxLines: field.kind == GalleryFieldKind.multiline ? 3 : 1,
                minLines: 1,
                decoration: InputDecoration(
                  labelText: field.required
                      ? field.label
                      : AppLocalizations.of(context)!.optionalField(field.label),
                  hintText: field.hint,
                ),
              ),
              const SizedBox(height: 12),
            ],
            if (_error != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(_error!, style: TextStyle(color: AppColors.danger)),
              ),
            ElevatedButton.icon(
              onPressed: _submit,
              icon: const Icon(Icons.add_task_rounded),
              label: Text(AppLocalizations.of(context)!.addToComposerList),
            ),
          ],
        ),
      ),
    );
  }
}
