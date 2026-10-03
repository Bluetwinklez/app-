import 'package:flutter/material.dart';

import '../domain/content_category.dart';
import '../l10n/app_localizations.dart';
import '../l10n/l10n.dart';
import '../services/app_storage_service.dart';
import 'app_theme.dart';

String contentCategoryLabel(ContentCategory c, AppLocalizations loc) => switch (c) {
      ContentCategory.webText => loc.catWebText,
      ContentCategory.contact => loc.catContact,
      ContentCategory.network => loc.catNetwork,
      ContentCategory.social => loc.catSocial,
      ContentCategory.empty => loc.catEmpty,
      ContentCategory.other => loc.catOther,
    };

IconData contentCategoryIcon(ContentCategory c) => switch (c) {
      ContentCategory.webText => Icons.language_rounded,
      ContentCategory.contact => Icons.contact_phone_outlined,
      ContentCategory.network => Icons.wifi_rounded,
      ContentCategory.social => Icons.groups_outlined,
      ContentCategory.empty => Icons.crop_square_rounded,
      ContentCategory.other => Icons.category_outlined,
    };

/// Scan trends from the local history: per-day bars, top tags, types.
class AnalyticsPage extends StatelessWidget {
  final AppStorageService storage;

  const AnalyticsPage({super.key, required this.storage});

  static Future<void> open(BuildContext context, AppStorageService storage) =>
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => AnalyticsPage(storage: storage)));

  String _name(String uid) {
    for (final e in storage.getLibrary()) {
      if ((e.uid ?? '').toUpperCase() == uid.toUpperCase()) return e.name;
    }
    return uid;
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    final stats = ScanStats.from(storage.getHistory());
    final maxDay = stats.perDay.fold(0, (a, b) => a > b ? a : b);
    return DecoratedBox(
      decoration: BoxDecoration(gradient: AppColors.canvasGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(title: Text(loc.analyticsTitle)),
        body: stats.total == 0
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Text(loc.analyticsEmpty,
                      textAlign: TextAlign.center, style: TextStyle(color: AppColors.secondary, height: 1.4)),
                ),
              )
            : ListView(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
                children: [
                  Row(
                    children: [
                      Expanded(child: StatTile(label: loc.analyticsTotal, value: '${stats.total}', icon: Icons.nfc_rounded)),
                      const SizedBox(width: 10),
                      Expanded(
                          child: StatTile(
                              label: loc.analyticsUnique, value: '${stats.uniqueTags}', icon: Icons.style_outlined)),
                    ],
                  ),
                  SectionHeader(title: loc.analyticsLast14),
                  SoftCard(
                    padding: const EdgeInsets.fromLTRB(12, 16, 12, 10),
                    child: SizedBox(
                      height: 140,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          for (int i = 0; i < stats.perDay.length; i++)
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 2),
                                child: Tooltip(
                                  message: '${stats.perDay[i]}',
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      if (stats.perDay[i] > 0)
                                        Text('${stats.perDay[i]}',
                                            style: TextStyle(fontSize: 10, color: AppColors.secondary)),
                                      const SizedBox(height: 2),
                                      Container(
                                        height: maxDay == 0 ? 2 : 2 + 100 * stats.perDay[i] / maxDay,
                                        decoration: BoxDecoration(
                                          color: i == stats.perDay.length - 1
                                              ? AppColors.accent
                                              : AppColors.accent.withValues(alpha: 0.45),
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  SectionHeader(title: loc.analyticsTop),
                  SoftCard(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Column(
                      children: [
                        for (final (uid, count) in stats.topTags)
                          ListTile(
                            dense: true,
                            leading: Icon(Icons.nfc_rounded, color: AppColors.accent),
                            title: Text(_name(uid), maxLines: 1, overflow: TextOverflow.ellipsis),
                            trailing: Text(loc.analyticsTimes('$count'),
                                style: const TextStyle(fontWeight: FontWeight.w700)),
                          ),
                      ],
                    ),
                  ),
                  SectionHeader(title: loc.analyticsByType),
                  SoftCard(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      children: [
                        for (final c in ContentCategory.values)
                          if ((stats.byCategory[c] ?? 0) > 0)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: [
                                  Icon(contentCategoryIcon(c), size: 18, color: AppColors.accent),
                                  const SizedBox(width: 8),
                                  SizedBox(width: 130, child: Text(contentCategoryLabel(c, loc))),
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: LinearProgressIndicator(
                                        value: stats.byCategory[c]! / stats.total,
                                        minHeight: 8,
                                        backgroundColor: AppColors.subtleFill,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text('${stats.byCategory[c]}', style: const TextStyle(fontWeight: FontWeight.w600)),
                                ],
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
