import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../l10n/l10n.dart';
import '../services/launch_action_service.dart';
import 'app_theme.dart';

/// iPhone home screen icon choice (alternate icons are iOS only).
class AppIconPicker extends StatefulWidget {
  const AppIconPicker({super.key});

  /// (native icon name or null for default, preview asset, label)
  static List<(String?, String, String Function(AppLocalizations))> get options => [
        (null, 'assets/app_icons/default.png', (l) => l.iconBlue),
        ('AppIcon-Green', 'assets/app_icons/green.png', (l) => l.iconGreen),
        ('AppIcon-Purple', 'assets/app_icons/purple.png', (l) => l.iconPurple),
        ('AppIcon-Orange', 'assets/app_icons/orange.png', (l) => l.iconOrange),
        ('AppIcon-Dark', 'assets/app_icons/dark.png', (l) => l.iconDark),
      ];

  static bool get supported => defaultTargetPlatform == TargetPlatform.iOS;

  @override
  State<AppIconPicker> createState() => _AppIconPickerState();
}

class _AppIconPickerState extends State<AppIconPicker> {
  String? _current;

  @override
  void initState() {
    super.initState();
    LaunchActionService.currentAppIcon().then((v) {
      if (mounted) setState(() => _current = v);
    });
  }

  Future<void> _choose(String? name) async {
    if (name == _current) return;
    final ok = await LaunchActionService.setAppIcon(name);
    if (!mounted) return;
    if (ok) {
      setState(() => _current = name);
    } else {
      final loc = AppLocalizations.of(context) ?? L10n.current;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(loc.appIconFailed)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(loc.appIconTitle, style: const TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 12,
            runSpacing: 8,
            children: [
              for (final (name, asset, label) in AppIconPicker.options)
                Semantics(
                  button: true,
                  selected: name == _current,
                  label: label(loc),
                  child: GestureDetector(
                    onTap: () => _choose(name),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: name == _current ? AppColors.accent : Colors.transparent,
                              width: 2.5,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(11),
                            child: Image.asset(asset, width: 48, height: 48),
                          ),
                        ),
                        const SizedBox(height: 4),
                        ExcludeSemantics(child: Text(label(loc), style: const TextStyle(fontSize: 11.5))),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
