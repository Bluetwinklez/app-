import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../domain/tag_library.dart';
import '../l10n/app_localizations.dart';
import '../l10n/l10n.dart';
import '../services/launch_action_service.dart';
import 'app_theme.dart';

/// Library tags with a known position, on an OpenStreetMap map.
class TagMapPage extends StatelessWidget {
  final List<TagLibraryEntry> entries;

  const TagMapPage({super.key, required this.entries});

  static Future<void> open(BuildContext context, List<TagLibraryEntry> entries) =>
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => TagMapPage(entries: entries)));

  void _show(BuildContext context, TagLibraryEntry e, ({double lat, double lng}) p) {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    showModalBottomSheet<void>(
      context: context,
      builder: (ctx) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(e.name, style: Theme.of(ctx).textTheme.titleLarge),
              if (e.locationNote.isNotEmpty)
                Text(e.locationNote, style: TextStyle(color: AppColors.secondary)),
              if (e.note.isNotEmpty) Text(e.note),
              const SizedBox(height: 4),
              Text(loc.mapPositionSaved(p.lat.toStringAsFixed(5), p.lng.toStringAsFixed(5)),
                  style: TextStyle(fontSize: 12, color: AppColors.secondary)),
              const SizedBox(height: 12),
              FilledButton.icon(
                icon: const Icon(Icons.map_outlined),
                label: Text(loc.mapOpenInMaps),
                onPressed: () => LaunchActionService.openUrl(
                    'https://maps.apple.com/?ll=${p.lat},${p.lng}&q=${Uri.encodeComponent(e.name)}'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    final placed = [
      for (final e in entries)
        if (e.position case final p?) (e, p),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(loc.mapTitle),
        actions: [
          IconButton(
            tooltip: loc.mapTilesNote,
            icon: const Icon(Icons.info_outline_rounded),
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(loc.mapTilesNote))),
          ),
        ],
      ),
      body: placed.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Text(loc.mapEmpty,
                    textAlign: TextAlign.center, style: TextStyle(color: AppColors.secondary, height: 1.4)),
              ),
            )
          : FlutterMap(
              options: MapOptions(
                initialCameraFit: placed.length == 1
                    ? null
                    : CameraFit.coordinates(
                        coordinates: [for (final (_, p) in placed) LatLng(p.lat, p.lng)],
                        padding: const EdgeInsets.all(56),
                        maxZoom: 17,
                      ),
                initialCenter: LatLng(placed.first.$2.lat, placed.first.$2.lng),
                initialZoom: 16,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.bluetwinklez.nfctagmaster',
                ),
                MarkerLayer(
                  markers: [
                    for (final (e, p) in placed)
                      Marker(
                        point: LatLng(p.lat, p.lng),
                        width: 44,
                        height: 44,
                        child: GestureDetector(
                          onTap: () => _show(context, e, p),
                          child: Semantics(
                            label: e.name,
                            button: true,
                            child: Icon(Icons.location_on, size: 44, color: AppColors.accent),
                          ),
                        ),
                      ),
                  ],
                ),
                const SimpleAttributionWidget(source: Text('OpenStreetMap contributors')),
              ],
            ),
    );
  }
}
