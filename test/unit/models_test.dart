import 'package:flutter_test/flutter_test.dart';
import 'package:transition_journal/domain/enums/app_enums.dart';
import 'package:transition_journal/domain/models/models.dart';

void main() {
  final now = DateTime(2026, 2, 1, 8, 30);

  test('Reminder and DoseLog json fields', () {
    final reminder = Reminder(
      id: 'rem',
      regimenId: 'r',
      timeOfDayMinutes: 9 * 60 + 15,
      scheduleType: ReminderScheduleType.weekdays,
      weekdayValues: [1, 4],
      isEnabled: true,
      notificationPrivacyMode: NotificationPrivacyMode.discreet,
      createdAt: now,
      updatedAt: now,
    );
    expect(reminder.timeOfDay.format24h(), '09:15');
    expect(reminder.toJson()['scheduleType'], 'weekdays');

    final dose = DoseLog(
      id: 'd',
      regimenId: 'r',
      scheduledAt: now,
      takenAt: now,
      status: DoseStatus.taken,
      createdAt: now,
    );
    expect(dose.toJson()['status'], 'taken');
  });

  test('PhotoEntry DiaryEntry BloodTestRecord json fields', () {
    final photo = PhotoEntry(
      id: 'p',
      photoLocalPath: '/tmp/a.jpg',
      date: now,
      journeyDayNumber: 42,
      tags: const ['mirror'],
      createdAt: now,
      updatedAt: now,
    );
    expect(photo.toJson()['journeyDayNumber'], 42);

    final diary = DiaryEntry(
      id: 'di',
      date: now,
      moodScore: 4,
      text: 'calm',
      createdAt: now,
      updatedAt: now,
    );
    expect(diary.toJson()['moodScore'], 4);

    final blood = BloodTestRecord(
      id: 'b',
      testDate: now,
      testName: 'E2',
      value: 150,
      unit: 'pg/mL',
      referenceRange: 'lab-specific',
      createdAt: now,
      updatedAt: now,
    );
    expect(blood.toJson()['unit'], 'pg/mL');
    expect(blood.toJson().containsKey('normal'), isFalse);
  });

  test('inclusive category and route labels', () {
    expect(HormoneCategory.pubertyBlocker.label, 'Puberty blocker');
    expect(HormoneCategory.antiAndrogen.label, 'Anti-androgen');
    expect(AdministrationRoute.topical.label, 'Topical');
    expect(NotificationPrivacyMode.discreet.label, 'Discreet');
  });
}
