import 'package:drift/drift.dart';
import 'package:transition_journal/data/database/app_database.dart';
import 'package:transition_journal/data/services/protected_file_store.dart';
import 'package:transition_journal/domain/enums/app_enums.dart';
import 'package:transition_journal/domain/models/models.dart';

T enumByName<T extends Enum>(Iterable<T> values, String name, T fallback) {
  for (final v in values) {
    if (v.name == name) return v;
  }
  return fallback;
}

Regimen mapRegimen(RegimenRow r) => Regimen(
  id: r.id,
  category: enumByName(
    HormoneCategory.values,
    r.category,
    HormoneCategory.other,
  ),
  customCategory: r.customCategory,
  medicationName: r.medicationName,
  doseAmount: r.doseAmount,
  doseUnit: r.doseUnit,
  route: enumByName(
    AdministrationRoute.values,
    r.route,
    AdministrationRoute.other,
  ),
  customRoute: r.customRoute,
  startDate: r.startDate,
  notes: r.notes,
  isActive: r.isActive,
  createdAt: r.createdAt,
  updatedAt: r.updatedAt,
);

Reminder mapReminder(ReminderRow r) => Reminder(
  id: r.id,
  regimenId: r.regimenId,
  timeOfDayMinutes: r.timeOfDayMinutes,
  scheduleType: enumByName(
    ReminderScheduleType.values,
    r.scheduleType,
    ReminderScheduleType.daily,
  ),
  weekdayValues: decodeIntList(r.weekdayValues),
  monthDayValues: decodeIntList(r.monthDayValues),
  intervalDays: r.intervalDays,
  isEnabled: r.isEnabled,
  notificationPrivacyMode: enumByName(
    NotificationPrivacyMode.values,
    r.notificationPrivacyMode,
    NotificationPrivacyMode.discreet,
  ),
  createdAt: r.createdAt,
  updatedAt: r.updatedAt,
);

DoseLog mapDoseLog(DoseLogRow r) => DoseLog(
  id: r.id,
  regimenId: r.regimenId,
  scheduledAt: r.scheduledAt,
  takenAt: r.takenAt,
  status: enumByName(DoseStatus.values, r.status, DoseStatus.missed),
  notes: r.notes,
  createdAt: r.createdAt,
);

PhotoEntry mapPhoto(PhotoEntryRow r) => PhotoEntry(
  id: r.id,
  photoLocalPath: r.photoLocalPath,
  date: r.date,
  hrtStartDateReference: r.hrtStartDateReference,
  journeyDayNumber: r.journeyDayNumber,
  caption: r.caption,
  tags: decodeStringList(r.tags),
  createdAt: r.createdAt,
  updatedAt: r.updatedAt,
);

DiaryEntry mapDiary(DiaryEntryRow r) => DiaryEntry(
  id: r.id,
  date: r.date,
  moodScore: r.moodScore,
  tags: decodeStringList(r.tags),
  text: r.body,
  createdAt: r.createdAt,
  updatedAt: r.updatedAt,
);

BloodTestRecord mapBlood(BloodTestRecordRow r) => BloodTestRecord(
  id: r.id,
  testDate: r.testDate,
  labName: r.labName,
  testName: r.testName,
  value: r.value,
  unit: r.unit,
  referenceRange: r.referenceRange,
  notes: r.notes,
  attachmentLocalPath: r.attachmentLocalPath,
  createdAt: r.createdAt,
  updatedAt: r.updatedAt,
);

RegimensCompanion regimenCompanion(Regimen m) => RegimensCompanion(
  id: Value(m.id),
  category: Value(m.category.name),
  customCategory: Value(m.customCategory),
  medicationName: Value(m.medicationName),
  doseAmount: Value(m.doseAmount),
  doseUnit: Value(m.doseUnit),
  route: Value(m.route.name),
  customRoute: Value(m.customRoute),
  startDate: Value(m.startDate),
  notes: Value(m.notes),
  isActive: Value(m.isActive),
  createdAt: Value(m.createdAt),
  updatedAt: Value(m.updatedAt),
);

RemindersCompanion reminderCompanion(Reminder m) => RemindersCompanion(
  id: Value(m.id),
  regimenId: Value(m.regimenId),
  timeOfDayMinutes: Value(m.timeOfDayMinutes),
  scheduleType: Value(m.scheduleType.name),
  weekdayValues: Value(encodeList(m.weekdayValues)),
  monthDayValues: Value(encodeList(m.monthDayValues)),
  intervalDays: Value(m.intervalDays),
  isEnabled: Value(m.isEnabled),
  notificationPrivacyMode: Value(m.notificationPrivacyMode.name),
  createdAt: Value(m.createdAt),
  updatedAt: Value(m.updatedAt),
);
