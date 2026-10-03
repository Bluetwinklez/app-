import 'package:flutter/material.dart';

import '../domain/ndef_record.dart';
import '../domain/tap_preview.dart';
import '../l10n/app_localizations.dart';
import '../l10n/l10n.dart';
import 'app_theme.dart';

/// Explains what iPhone and Android do on their own when the tag is tapped.
class TapPreviewCard extends StatelessWidget {
  final List<NdefRecordModel> records;

  const TapPreviewCard({super.key, required this.records});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context) ?? L10n.current;
    final p = TapPreview.of(records);
    final (ios, android) = texts(loc, p);
    final iosWarns = p.action != TapAction.none &&
        !const {
          TapAction.openUrl,
          TapAction.openApp,
          TapAction.call,
          TapAction.sms,
          TapAction.email,
        }.contains(p.action);

    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.accentSoft,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.touch_app_outlined, size: 18, color: AppColors.accent),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  loc.tapPreviewTitle,
                  style: TextStyle(fontWeight: FontWeight.w700, color: AppColors.ink),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          _line(Icons.phone_iphone, loc.tapPreviewIphone, ios,
              warn: iosWarns),
          const SizedBox(height: 6),
          _line(Icons.android, loc.tapPreviewAndroid, android),
          if (p.ignoredRecords > 0) ...[
            const SizedBox(height: 6),
            Text(loc.tapIgnoredRecords('${p.ignoredRecords}'),
                style: TextStyle(fontSize: 12, color: AppColors.secondary)),
          ],
          if (p.action != TapAction.none && !iosWarns) ...[
            const SizedBox(height: 6),
            Text(loc.tapIosRequirement,
                style: TextStyle(fontSize: 11, color: AppColors.secondary)),
          ],
        ],
      ),
    );
  }

  Widget _line(IconData icon, String platform, String text, {bool warn = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: warn ? AppColors.warning : AppColors.secondary),
        const SizedBox(width: 6),
        Expanded(
          child: Text.rich(
            TextSpan(children: [
              TextSpan(
                  text: '$platform: ',
                  style: const TextStyle(fontWeight: FontWeight.w600)),
              TextSpan(text: text),
            ]),
            style: TextStyle(fontSize: 13, color: AppColors.ink, height: 1.35),
          ),
        ),
      ],
    );
  }

  static (String, String) texts(AppLocalizations loc, TapPreview p) {
    final t = p.target.length > 60 ? '${p.target.substring(0, 57)}...' : p.target;
    switch (p.action) {
      case TapAction.none:
        return (loc.tapNone, loc.tapNone);
      case TapAction.openUrl:
        return (loc.tapIosUrl(t), loc.tapAndroidUrl(t));
      case TapAction.openApp:
        return (loc.tapIosApp(t), loc.tapAndroidApp(t));
      case TapAction.call:
        return (loc.tapIosCall(t), loc.tapAndroidCall(t));
      case TapAction.sms:
        return (loc.tapIosSms(t), loc.tapAndroidSms(t));
      case TapAction.email:
        return (loc.tapIosEmail(t), loc.tapAndroidEmail(t));
      case TapAction.map:
        return (loc.tapIosMap, loc.tapAndroidMap);
      case TapAction.text:
        return (loc.tapIosNeedsApp, loc.tapAndroidText);
      case TapAction.contact:
        return (loc.tapIosNeedsApp, loc.tapAndroidContact);
      case TapAction.wifi:
        return (loc.tapIosNeedsApp, loc.tapAndroidWifi);
      case TapAction.calendar:
        return (loc.tapIosNeedsApp, loc.tapAndroidCalendar);
      case TapAction.other:
        return (loc.tapIosNeedsApp, loc.tapAndroidOther);
    }
  }
}
