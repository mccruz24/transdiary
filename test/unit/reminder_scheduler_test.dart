import 'package:flutter_test/flutter_test.dart';
import 'package:transition_journal/core/utils/reminder_scheduler.dart';
import 'package:transition_journal/domain/enums/app_enums.dart';
import 'package:transition_journal/domain/models/models.dart';

void main() {
  group('ReminderScheduler.nextOccurrences', () {
    final base = Reminder(
      id: 'r1',
      regimenId: 'g1',
      timeOfDayMinutes: 9 * 60,
      scheduleType: ReminderScheduleType.daily,
      isEnabled: true,
      notificationPrivacyMode: NotificationPrivacyMode.discreet,
      createdAt: DateTime(2026, 1, 1),
      updatedAt: DateTime(2026, 1, 1),
    );

    test('daily returns future mornings only', () {
      final from = DateTime(2026, 3, 10, 10, 0);
      final next = ReminderScheduler.nextOccurrences(
        reminder: base,
        from: from,
        count: 3,
      );
      expect(next, hasLength(3));
      expect(next.first, DateTime(2026, 3, 11, 9, 0));
      expect(next[1], DateTime(2026, 3, 12, 9, 0));
    });

    test('weekdays twice-weekly Mon/Thu', () {
      final reminder = base.copyWith(
        scheduleType: ReminderScheduleType.weekdays,
        weekdayValues: [DateTime.monday, DateTime.thursday],
      );
      final from = DateTime(2026, 3, 9, 8, 0); // Monday
      final next = ReminderScheduler.nextOccurrences(
        reminder: reminder,
        from: from,
        count: 4,
      );
      expect(next.map((e) => e.weekday).toList(), [
        DateTime.monday,
        DateTime.thursday,
        DateTime.monday,
        DateTime.thursday,
      ]);
    });

    test('month days twice-monthly', () {
      final reminder = base.copyWith(
        scheduleType: ReminderScheduleType.monthDays,
        monthDayValues: [1, 15],
      );
      final from = DateTime(2026, 3, 1, 8, 0);
      final next = ReminderScheduler.nextOccurrences(
        reminder: reminder,
        from: from,
        count: 3,
      );
      expect(next.map((e) => e.day).toList(), [1, 15, 1]);
    });

    test('interval days every 3 days', () {
      final reminder = base.copyWith(
        scheduleType: ReminderScheduleType.intervalDays,
        intervalDays: 3,
      );
      final from = DateTime(2026, 3, 10, 8, 0);
      final next = ReminderScheduler.nextOccurrences(
        reminder: reminder,
        from: from,
        count: 3,
      );
      expect(next.map((e) => e.day).toList(), [10, 13, 16]);
    });

    test('disabled returns empty', () {
      final reminder = base.copyWith(isEnabled: false);
      expect(
        ReminderScheduler.nextOccurrences(
          reminder: reminder,
          from: DateTime(2026, 3, 10),
        ),
        isEmpty,
      );
    });
  });

  group('journeyDayNumber', () {
    test('day 1 on start date', () {
      expect(
        ReminderScheduler.journeyDayNumber(
          entryDate: DateTime(2026, 1, 1),
          hrtStartDate: DateTime(2026, 1, 1),
        ),
        1,
      );
    });

    test('day 42', () {
      expect(
        ReminderScheduler.journeyDayNumber(
          entryDate: DateTime(2026, 2, 11),
          hrtStartDate: DateTime(2026, 1, 1),
        ),
        42,
      );
    });

    test('null when before start or missing', () {
      expect(
        ReminderScheduler.journeyDayNumber(
          entryDate: DateTime(2025, 12, 31),
          hrtStartDate: DateTime(2026, 1, 1),
        ),
        isNull,
      );
      expect(
        ReminderScheduler.journeyDayNumber(
          entryDate: DateTime(2026, 1, 1),
          hrtStartDate: null,
        ),
        isNull,
      );
    });
  });

  group('domain models', () {
    test('regimen json round-trip fields', () {
      final now = DateTime(2026, 1, 2, 3, 4, 5);
      final regimen = Regimen(
        id: 'id',
        category: HormoneCategory.custom,
        customCategory: 'My category',
        medicationName: 'Med',
        doseAmount: 2.5,
        doseUnit: 'mg',
        route: AdministrationRoute.injection,
        startDate: DateTime(2026, 1, 1),
        isActive: true,
        createdAt: now,
        updatedAt: now,
      );
      final json = regimen.toJson();
      expect(json['category'], 'custom');
      expect(json['customCategory'], 'My category');
      expect(regimen.categoryLabel, 'My category');
      expect(regimen.doseLabel, '2.5 mg');
    });
  });
}
