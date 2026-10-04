import 'package:flutter/material.dart';

import '../domain/ndef_record.dart';
import '../l10n/app_localizations.dart';
import '../l10n/l10n.dart';
import 'app_theme.dart';

/// Pick single records from several sources (library tags, templates, the
/// last scan) and return them in the picked order, to write on one tag.
class MergeRecordsPage extends StatefulWidget {
  /// (source name, records)
  final List<(String, List<NdefRecordModel>)> sources;

  const MergeRecordsPage({super.key, required this.sources});

  static Future<List<NdefRecordModel>?> open(BuildContext context, List<(String, List<NdefRecordModel>)> sources) =>
      Navigator.of(context).push<List<NdefRecordModel>>(
          MaterialPageRoute(builder: (_) => MergeRecordsPage(sources: sources)));

  @override
  State<MergeRecordsPage> createState() => _MergeRecordsPageState();
}

class _MergeRecordsPageState extends State<MergeRecordsPage> {
  /// "source:index" keys in the order they were ticked.
  final List<String> _picked = [];

  NdefRecordModel _record(String key) {
    final parts = key.split(':');
    return widget.sources[int.parse(parts[0])].$2[int.parse(parts[1])];
  }

  IconData _icon(ParsedRecordType t) => switch (t) {
        ParsedRecordType.url || ParsedRecordType.smartPoster => Icons.link_rounded,
        ParsedRecordType.text => Icons.notes_rounded,
        ParsedRecordType.phone => Icons.call_outlined,
        ParsedRecordType.sms => Icons.sms_outlined,
        ParsedRecordType.email => Icons.mail_outline_rounded,
        ParsedRecordType.vcard => Icons.badge_outlined,
        ParsedRecordType.wifi => Icons.wifi_rounded,
        ParsedRecordType.location => Icons.place_outlined,
        ParsedRecordType.calendar => Icons.event_outlined,
        _ => Icons.data_object_rounded,
      };

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    final empty = widget.sources.every((s) => s.$2.isEmpty);
    return DecoratedBox(
      decoration: BoxDecoration(gradient: AppColors.canvasGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(title: Text(loc.mergeTitle)),
        bottomNavigationBar: empty
            ? null
            : SafeArea(
                minimum: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                child: FilledButton.icon(
                  onPressed: _picked.isEmpty
                      ? null
                      : () => Navigator.of(context).pop([for (final k in _picked) _record(k)]),
                  icon: const Icon(Icons.merge_rounded),
                  label: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(loc.mergeButton('${_picked.length}'), style: const TextStyle(fontSize: 16)),
                  ),
                ),
              ),
        body: empty
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Text(loc.mergeEmpty,
                      textAlign: TextAlign.center, style: TextStyle(color: AppColors.secondary)),
                ),
              )
            : ListView(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                children: [
                  Text(loc.mergeSubtitle, style: TextStyle(color: AppColors.secondary)),
                  for (int s = 0; s < widget.sources.length; s++)
                    if (widget.sources[s].$2.isNotEmpty) ...[
                      SectionHeader(title: widget.sources[s].$1),
                      for (int r = 0; r < widget.sources[s].$2.length; r++)
                        Builder(builder: (context) {
                          final key = '$s:$r';
                          final p = NdefCodec.parseRecord(widget.sources[s].$2[r]);
                          final order = _picked.indexOf(key);
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: SoftCard(
                              onTap: () => setState(() => order >= 0 ? _picked.remove(key) : _picked.add(key)),
                              padding: const EdgeInsets.all(12),
                              child: Row(
                                children: [
                                  Container(
                                    width: 38,
                                    height: 38,
                                    decoration: BoxDecoration(
                                      color: AppColors.accentSoft,
                                      borderRadius: BorderRadius.circular(11),
                                    ),
                                    child: Icon(_icon(p.type), color: AppColors.accent, size: 20),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(p.title, style: const TextStyle(fontWeight: FontWeight.w600)),
                                        Text(p.content,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontSize: 12.5, color: AppColors.secondary)),
                                      ],
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 13,
                                    backgroundColor: order >= 0 ? AppColors.accent : AppColors.subtleFill,
                                    child: order >= 0
                                        ? Text('${order + 1}',
                                            style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700))
                                        : null,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                    ],
                ],
              ),
      ),
    );
  }
}
