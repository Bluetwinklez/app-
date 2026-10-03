import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

import '../domain/logbook.dart';
import '../domain/reminder_plan.dart';
import '../l10n/l10n.dart';
import 'app_storage_service.dart';

/// Local reminders (no server): daily logbook reminders and inspection due
/// dates. Every sync replaces all pending reminders with a fresh plan.
class NotificationService {
  static final _plugin = FlutterLocalNotificationsPlugin();
  static bool _ready = false;

  static Future<void> init() async {
    try {
      tzdata.initializeTimeZones();
      final zone = await FlutterTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(zone.identifier));
      await _plugin.initialize(
        settings: const InitializationSettings(
          android: AndroidInitializationSettings('@mipmap/ic_launcher'),
          iOS: DarwinInitializationSettings(
            requestAlertPermission: false,
            requestBadgePermission: false,
            requestSoundPermission: false,
          ),
        ),
      );
      _ready = true;
    } catch (e) {
      debugPrint('NotificationService unavailable: $e');
    }
  }

  /// Asks the OS for permission; true when granted.
  static Future<bool> requestPermission() async {
    if (!_ready) return false;
    try {
      if (defaultTargetPlatform == TargetPlatform.iOS) {
        return await _plugin
                .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
                ?.requestPermissions(alert: true, sound: true, badge: false) ??
            false;
      }
      return await _plugin
              .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
              ?.requestNotificationsPermission() ??
          false;
    } catch (_) {
      return false;
    }
  }

  static const _details = NotificationDetails(
    android: AndroidNotificationDetails('reminders', 'Reminders', importance: Importance.defaultImportance),
    iOS: DarwinNotificationDetails(),
  );

  static String bookBody(LogBook b) => L10n.current.reminderBody;

  /// Replaces all pending reminders with the current plan.
  static Future<void> sync(AppStorageService storage) async {
    if (!_ready) return;
    try {
      await _plugin.cancelAll();
      final plan = ReminderPlan.build(
        books: storage.getLogBooks(),
        library: storage.getLibrary(),
        now: DateTime.now(),
        bookBody: bookBody,
        inspectionTitle: (e) => L10n.current.reminderInspectionTitle(e.name),
        inspectionBody: L10n.current.reminderInspectionBody,
        warrantyTitle: (e) => L10n.current.reminderWarrantyTitle(e.name),
        warrantyBody: L10n.current.reminderWarrantyBody,
      );
      for (final r in plan) {
        final now = tz.TZDateTime.now(tz.local);
        if (r.daily) {
          var at = tz.TZDateTime(tz.local, now.year, now.month, now.day, r.hour, r.minute);
          if (!at.isAfter(now)) at = at.add(const Duration(days: 1));
          await _plugin.zonedSchedule(
            id: r.id,
            title: r.title,
            body: r.body,
            scheduledDate: at,
            notificationDetails: _details,
            androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
            matchDateTimeComponents: DateTimeComponents.time,
          );
        } else {
          await _plugin.zonedSchedule(
            id: r.id,
            title: r.title,
            body: r.body,
            scheduledDate: tz.TZDateTime.from(r.at!, tz.local),
            notificationDetails: _details,
            androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
          );
        }
      }
    } catch (e) {
      debugPrint('NotificationService.sync: $e');
    }
  }
}
