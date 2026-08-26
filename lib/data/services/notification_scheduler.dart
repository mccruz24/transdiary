import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;
import 'package:transition_journal/core/utils/reminder_scheduler.dart';
import 'package:transition_journal/domain/enums/app_enums.dart';
import 'package:transition_journal/domain/models/models.dart';

/// Platform-agnostic notification scheduling. iOS uses UNUserNotificationCenter.
abstract class NotificationScheduler {
  Future<void> initialize();
  Future<bool> requestPermission();
  Future<bool> hasPermission();
  Future<void> rescheduleAll({
    required List<Reminder> reminders,
    required Map<String, Regimen> regimensById,
  });
  Future<void> cancelAll();
}

class LocalNotificationScheduler implements NotificationScheduler {
  LocalNotificationScheduler({FlutterLocalNotificationsPlugin? plugin})
    : _plugin = plugin ?? FlutterLocalNotificationsPlugin();

  final FlutterLocalNotificationsPlugin _plugin;
  bool _initialized = false;

  static const _channelId = 'tj_medication_reminders';
  static const _channelName = 'Reminders';
  static const _channelDescription = 'Local medication reminders';
  static const discreetBody = "It's time for your reminder.";

  @override
  Future<void> initialize() async {
    if (_initialized) return;
    tzdata.initializeTimeZones();
    try {
      final name = await FlutterTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(name));
    } catch (_) {
      tz.setLocalLocation(tz.UTC);
    }

    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const ios = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );
    await _plugin.initialize(
      const InitializationSettings(android: android, iOS: ios),
    );
    _initialized = true;
  }

  @override
  Future<bool> requestPermission() async {
    await initialize();
    final ios = _plugin
        .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin
        >();
    if (ios != null) {
      final result = await ios.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
      return result ?? false;
    }
    final android = _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    if (android != null) {
      return await android.requestNotificationsPermission() ?? false;
    }
    return true;
  }

  @override
  Future<bool> hasPermission() async {
    await initialize();
    final ios = _plugin
        .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin
        >();
    if (ios != null) {
      final opts = await ios.checkPermissions();
      return opts?.isEnabled ?? false;
    }
    final android = _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    if (android != null) {
      return await android.areNotificationsEnabled() ?? false;
    }
    return true;
  }

  @override
  Future<void> cancelAll() async {
    await initialize();
    await _plugin.cancelAll();
  }

  @override
  Future<void> rescheduleAll({
    required List<Reminder> reminders,
    required Map<String, Regimen> regimensById,
  }) async {
    await initialize();
    await cancelAll();
    final now = DateTime.now();
    var notifId = 1000;

    for (final reminder in reminders.where((r) => r.isEnabled)) {
      final regimen = regimensById[reminder.regimenId];
      if (regimen == null || !regimen.isActive) continue;

      final occurrences = ReminderScheduler.nextOccurrences(
        reminder: reminder,
        from: now,
        count: 24,
      );

      final detailed =
          reminder.notificationPrivacyMode == NotificationPrivacyMode.detailed;
      final title = detailed ? 'Transition Journal' : 'Reminder';
      final body = detailed
          ? 'Time for ${regimen.medicationName} (${regimen.doseLabel}).'
          : discreetBody;

      for (final when in occurrences) {
        final id = notifId++;
        try {
          await _plugin.zonedSchedule(
            id,
            title,
            body,
            tz.TZDateTime.from(when, tz.local),
            NotificationDetails(
              android: AndroidNotificationDetails(
                _channelId,
                _channelName,
                channelDescription: _channelDescription,
                importance: Importance.defaultImportance,
                priority: Priority.defaultPriority,
              ),
              iOS: const DarwinNotificationDetails(
                presentAlert: true,
                presentBadge: false,
                presentSound: true,
              ),
            ),
            androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
          );
        } catch (e) {
          // Best-effort scheduling; never log medication details.
          assert(() {
            debugPrint('Notification schedule skipped');
            return true;
          }());
        }
      }
    }
  }
}
