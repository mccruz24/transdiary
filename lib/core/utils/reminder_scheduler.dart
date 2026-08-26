import 'package:transition_journal/domain/enums/app_enums.dart';
import 'package:transition_journal/domain/models/models.dart';

/// Pure scheduling helpers — unit-tested, no platform dependencies.
class ReminderScheduler {
  ReminderScheduler._();

  /// Returns upcoming fire times from [from] (exclusive of past) up to [count].
  static List<DateTime> nextOccurrences({
    required Reminder reminder,
    required DateTime from,
    int count = 30,
  }) {
    if (!reminder.isEnabled || count <= 0) return const [];

    final time = reminder.timeOfDay;
    final results = <DateTime>[];
    var cursor = DateTime(from.year, from.month, from.day);

    // Safety bound to avoid infinite loops on invalid configs.
    for (var i = 0; i < 400 && results.length < count; i++) {
      final candidate = DateTime(
        cursor.year,
        cursor.month,
        cursor.day,
        time.hour,
        time.minute,
      );

      final matches = switch (reminder.scheduleType) {
        ReminderScheduleType.daily => true,
        ReminderScheduleType.weekdays => reminder.weekdayValues.contains(
          candidate.weekday,
        ),
        ReminderScheduleType.monthDays => reminder.monthDayValues.contains(
          candidate.day,
        ),
        ReminderScheduleType.intervalDays => _matchesInterval(
          candidate: candidate,
          from: from,
          intervalDays: reminder.intervalDays ?? 1,
        ),
      };

      if (matches && candidate.isAfter(from)) {
        results.add(candidate);
      }
      cursor = cursor.add(const Duration(days: 1));
    }
    return results;
  }

  static bool _matchesInterval({
    required DateTime candidate,
    required DateTime from,
    required int intervalDays,
  }) {
    if (intervalDays < 1) return false;
    final anchor = DateTime(from.year, from.month, from.day);
    final dayDiff = DateTime(
      candidate.year,
      candidate.month,
      candidate.day,
    ).difference(anchor).inDays;
    return dayDiff >= 0 && dayDiff % intervalDays == 0;
  }

  static int? journeyDayNumber({
    required DateTime entryDate,
    required DateTime? hrtStartDate,
  }) {
    if (hrtStartDate == null) return null;
    final start = DateTime(
      hrtStartDate.year,
      hrtStartDate.month,
      hrtStartDate.day,
    );
    final day = DateTime(entryDate.year, entryDate.month, entryDate.day);
    final diff = day.difference(start).inDays;
    if (diff < 0) return null;
    return diff + 1;
  }
}
