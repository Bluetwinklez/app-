import 'package:flutter/material.dart';

import '../domain/logbook.dart';
import '../domain/template_gallery.dart';
import '../l10n/app_localizations.dart';
import '../l10n/l10n.dart';
import 'app_theme.dart';
import 'logbook_page.dart';
import 'template_gallery_page.dart';

/// What an idea card does when tapped.
sealed class IdeaAction {
  const IdeaAction();
}

class OpenPreset extends IdeaAction {
  final String presetId;
  const OpenPreset(this.presetId);
}

class OpenLogbooks extends IdeaAction {
  final LogBookKind kind;
  const OpenLogbooks(this.kind);
}

class OpenRoutines extends IdeaAction {
  const OpenRoutines();
}

class Idea {
  final IconData icon;
  final String title;
  final String description;
  final IdeaAction action;

  const Idea(this.icon, this.title, this.description, this.action);
}

/// "What can I do with tags?" inspiration, grouped by life area.
class IdeasPage extends StatelessWidget {
  final void Function(IdeaAction action) onAction;

  const IdeasPage({super.key, required this.onAction});

  static Future<void> open(BuildContext context, {required void Function(IdeaAction action) onAction}) =>
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => IdeasPage(onAction: onAction)));

  static List<(String, List<Idea>)> sections(AppLocalizations loc) {
    Idea preset(String id) {
      final p = TemplateGallery.byId(id)!;
      return Idea(TemplateGalleryPage.iconFor(p.icon), p.title, p.description, OpenPreset(id));
    }

    Idea book(LogBookKind kind, String desc) =>
        Idea(logBookKindIcon(kind), logBookKindLabel(kind, loc), desc, OpenLogbooks(kind));

    return [
      (loc.ideasHome, [
        preset('guest_wifi'),
        preset('rental_home'),
        preset('plant_care'),
        preset('how_to'),
      ]),
      (loc.ideasFamily, [
        book(LogBookKind.chores, loc.ideaChoresDesc),
        preset('child_wristband'),
        book(LogBookKind.feeding, loc.ideaFeedingDesc),
        preset('pet_tag'),
        preset('lost_item'),
        preset('gift_message'),
      ]),
      (loc.ideasHealth, [
        book(LogBookKind.habit, loc.ideaHabitDesc),
        book(LogBookKind.medication, loc.ideaMedicationDesc),
        preset('emergency'),
      ]),
      (loc.ideasWork, [
        preset('business_card'),
        preset('smart_card'),
        preset('restaurant_table'),
        preset('google_review'),
        book(LogBookKind.timeClock, loc.ideaClockDesc),
        book(LogBookKind.visitors, loc.ideaVisitorsDesc),
        book(LogBookKind.inventory, loc.ideaInventoryDesc),
      ]),
      (loc.ideasAutomation, [
        Idea(Icons.bolt_rounded, loc.ideaRoutinesTitle, loc.ideaRoutinesDesc, const OpenRoutines()),
        preset('run_shortcut'),
      ]),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    return DecoratedBox(
      decoration: BoxDecoration(gradient: AppColors.canvasGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(title: Text(loc.ideasTitle)),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
          children: [
            Text(loc.ideasSubtitle, style: TextStyle(color: AppColors.secondary)),
            for (final (title, ideas) in sections(loc)) ...[
              SectionHeader(title: title),
              for (final idea in ideas)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: SoftCard(
                    onTap: () {
                      Navigator.of(context).pop();
                      onAction(idea.action);
                    },
                    padding: const EdgeInsets.all(14),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.accentSoft,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(idea.icon, color: AppColors.accent),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(idea.title, style: const TextStyle(fontWeight: FontWeight.w700)),
                              Text(idea.description,
                                  style: TextStyle(fontSize: 12.5, color: AppColors.secondary, height: 1.35)),
                            ],
                          ),
                        ),
                        const Icon(Icons.chevron_right),
                      ],
                    ),
                  ),
                ),
            ],
          ],
        ),
      ),
    );
  }
}
