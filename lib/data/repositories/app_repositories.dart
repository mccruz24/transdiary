import 'package:drift/drift.dart';
import 'package:transition_journal/data/database/app_database.dart';
import 'package:transition_journal/data/repositories/mappers.dart';
import 'package:transition_journal/data/services/notification_scheduler.dart';
import 'package:transition_journal/data/services/protected_file_store.dart';
import 'package:transition_journal/domain/models/models.dart';
import 'package:uuid/uuid.dart';

class AppRepositories {
  AppRepositories({
    required this.db,
    required this.files,
    required this.notifications,
    Uuid? uuid,
  }) : uuid = uuid ?? const Uuid();

  final AppDatabase db;
  final ProtectedFileStore files;
  final NotificationScheduler notifications;
  final Uuid uuid;

  Future<void> syncReminders() async {
    final reminderRows = await db.select(db.reminders).get();
    final regimenRows = await db.select(db.regimens).get();
    final reminderModels = reminderRows.map(mapReminder).toList();
    final regimenMap = {for (final r in regimenRows.map(mapRegimen)) r.id: r};
    await notifications.rescheduleAll(
      reminders: reminderModels,
      regimensById: regimenMap,
    );
  }

  // --- Settings ---
  Future<String?> getSetting(String key) async {
    final row = await (db.select(
      db.appSettings,
    )..where((t) => t.key.equals(key))).getSingleOrNull();
    return row?.value;
  }

  Future<void> setSetting(String key, String value) async {
    await db
        .into(db.appSettings)
        .insertOnConflictUpdate(
          AppSettingsCompanion(key: Value(key), value: Value(value)),
        );
  }

  Future<bool> get onboardingComplete async =>
      (await getSetting('onboarding_complete')) == 'true';

  Future<void> setOnboardingComplete() =>
      setSetting('onboarding_complete', 'true');

  Future<DateTime?> get journeyStartDate async {
    final raw = await getSetting('journey_start_date');
    if (raw == null) return null;
    return DateTime.tryParse(raw);
  }

  Future<void> setJourneyStartDate(DateTime? date) async {
    if (date == null) {
      await (db.delete(
        db.appSettings,
      )..where((t) => t.key.equals('journey_start_date'))).go();
    } else {
      await setSetting('journey_start_date', date.toIso8601String());
    }
  }

  // --- Regimens ---
  Stream<List<Regimen>> watchRegimens({bool? activeOnly}) {
    final query = db.select(db.regimens)
      ..orderBy([(t) => OrderingTerm.desc(t.updatedAt)]);
    if (activeOnly != null) {
      query.where((t) => t.isActive.equals(activeOnly));
    }
    return query.watch().map((rows) => rows.map(mapRegimen).toList());
  }

  Future<List<Regimen>> getRegimens() async {
    final rows = await (db.select(
      db.regimens,
    )..orderBy([(t) => OrderingTerm.desc(t.updatedAt)])).get();
    return rows.map(mapRegimen).toList();
  }

  Future<Regimen?> getRegimen(String id) async {
    final row = await (db.select(
      db.regimens,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
    return row == null ? null : mapRegimen(row);
  }

  Future<void> upsertRegimen(Regimen regimen) async {
    await db
        .into(db.regimens)
        .insertOnConflictUpdate(regimenCompanion(regimen));
    await syncReminders();
  }

  Future<void> deleteRegimen(String id) async {
    await (db.delete(db.reminders)..where((t) => t.regimenId.equals(id))).go();
    await (db.delete(db.doseLogs)..where((t) => t.regimenId.equals(id))).go();
    await (db.delete(db.regimens)..where((t) => t.id.equals(id))).go();
    await syncReminders();
  }

  // --- Reminders ---
  Stream<List<Reminder>> watchRemindersForRegimen(String regimenId) {
    return (db.select(db.reminders)
          ..where((t) => t.regimenId.equals(regimenId)))
        .watch()
        .map((rows) => rows.map(mapReminder).toList());
  }

  Future<List<Reminder>> getAllReminders() async {
    final rows = await db.select(db.reminders).get();
    return rows.map(mapReminder).toList();
  }

  Future<void> upsertReminder(Reminder reminder) async {
    await db
        .into(db.reminders)
        .insertOnConflictUpdate(reminderCompanion(reminder));
    await syncReminders();
  }

  Future<void> deleteReminder(String id) async {
    await (db.delete(db.reminders)..where((t) => t.id.equals(id))).go();
    await syncReminders();
  }

  // --- Dose logs ---
  Stream<List<DoseLog>> watchDoseLogs({String? regimenId, int limit = 50}) {
    final query = db.select(db.doseLogs)
      ..orderBy([(t) => OrderingTerm.desc(t.scheduledAt)])
      ..limit(limit);
    if (regimenId != null) {
      query.where((t) => t.regimenId.equals(regimenId));
    }
    return query.watch().map((rows) => rows.map(mapDoseLog).toList());
  }

  Future<List<DoseLog>> getDoseLogs() async {
    final rows = await (db.select(
      db.doseLogs,
    )..orderBy([(t) => OrderingTerm.desc(t.scheduledAt)])).get();
    return rows.map(mapDoseLog).toList();
  }

  Future<void> addDoseLog(DoseLog log) async {
    await db
        .into(db.doseLogs)
        .insert(
          DoseLogsCompanion.insert(
            id: log.id,
            regimenId: log.regimenId,
            scheduledAt: log.scheduledAt,
            takenAt: Value(log.takenAt),
            status: log.status.name,
            notes: Value(log.notes),
            createdAt: log.createdAt,
          ),
        );
  }

  Future<void> deleteDoseLog(String id) async {
    await (db.delete(db.doseLogs)..where((t) => t.id.equals(id))).go();
  }

  // --- Photos ---
  Stream<List<PhotoEntry>> watchPhotos() {
    return (db.select(db.photoEntries)
          ..orderBy([(t) => OrderingTerm.desc(t.date)]))
        .watch()
        .map((rows) => rows.map(mapPhoto).toList());
  }

  Future<List<PhotoEntry>> getPhotos() async {
    final rows = await (db.select(
      db.photoEntries,
    )..orderBy([(t) => OrderingTerm.desc(t.date)])).get();
    return rows.map(mapPhoto).toList();
  }

  Future<void> upsertPhoto(PhotoEntry entry) async {
    await db
        .into(db.photoEntries)
        .insertOnConflictUpdate(
          PhotoEntriesCompanion(
            id: Value(entry.id),
            photoLocalPath: Value(entry.photoLocalPath),
            date: Value(entry.date),
            hrtStartDateReference: Value(entry.hrtStartDateReference),
            journeyDayNumber: Value(entry.journeyDayNumber),
            caption: Value(entry.caption),
            tags: Value(encodeList(entry.tags)),
            createdAt: Value(entry.createdAt),
            updatedAt: Value(entry.updatedAt),
          ),
        );
  }

  Future<void> deletePhoto(String id) async {
    final row = await (db.select(
      db.photoEntries,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
    if (row != null) {
      await files.deleteIfExists(row.photoLocalPath);
    }
    await (db.delete(db.photoEntries)..where((t) => t.id.equals(id))).go();
  }

  // --- Diary ---
  Stream<List<DiaryEntry>> watchDiary() {
    return (db.select(db.diaryEntries)
          ..orderBy([(t) => OrderingTerm.desc(t.date)]))
        .watch()
        .map((rows) => rows.map(mapDiary).toList());
  }

  Future<DiaryEntry?> getDiaryForDate(DateTime date) async {
    final day = DateTime(date.year, date.month, date.day);
    final next = day.add(const Duration(days: 1));
    final row =
        await (db.select(db.diaryEntries)..where(
              (t) =>
                  t.date.isBiggerOrEqualValue(day) &
                  t.date.isSmallerThanValue(next),
            ))
            .getSingleOrNull();
    return row == null ? null : mapDiary(row);
  }

  Future<List<DiaryEntry>> getDiaryEntries() async {
    final rows = await (db.select(
      db.diaryEntries,
    )..orderBy([(t) => OrderingTerm.desc(t.date)])).get();
    return rows.map(mapDiary).toList();
  }

  Future<void> upsertDiary(DiaryEntry entry) async {
    // Enforce one entry per calendar day: replace any existing for that date.
    final day = DateTime(entry.date.year, entry.date.month, entry.date.day);
    final next = day.add(const Duration(days: 1));
    final existing =
        await (db.select(db.diaryEntries)..where(
              (t) =>
                  t.date.isBiggerOrEqualValue(day) &
                  t.date.isSmallerThanValue(next),
            ))
            .get();
    for (final e in existing) {
      if (e.id != entry.id) {
        await (db.delete(
          db.diaryEntries,
        )..where((t) => t.id.equals(e.id))).go();
      }
    }
    await db
        .into(db.diaryEntries)
        .insertOnConflictUpdate(
          DiaryEntriesCompanion(
            id: Value(entry.id),
            date: Value(day),
            moodScore: Value(entry.moodScore),
            tags: Value(encodeList(entry.tags)),
            body: Value(entry.text),
            createdAt: Value(entry.createdAt),
            updatedAt: Value(entry.updatedAt),
          ),
        );
  }

  Future<void> deleteDiary(String id) async {
    await (db.delete(db.diaryEntries)..where((t) => t.id.equals(id))).go();
  }

  // --- Blood tests ---
  Stream<List<BloodTestRecord>> watchBloodTests() {
    return (db.select(db.bloodTestRecords)
          ..orderBy([(t) => OrderingTerm.desc(t.testDate)]))
        .watch()
        .map((rows) => rows.map(mapBlood).toList());
  }

  Future<List<BloodTestRecord>> getBloodTests() async {
    final rows = await (db.select(
      db.bloodTestRecords,
    )..orderBy([(t) => OrderingTerm.desc(t.testDate)])).get();
    return rows.map(mapBlood).toList();
  }

  Future<void> upsertBloodTest(BloodTestRecord record) async {
    await db
        .into(db.bloodTestRecords)
        .insertOnConflictUpdate(
          BloodTestRecordsCompanion(
            id: Value(record.id),
            testDate: Value(record.testDate),
            labName: Value(record.labName),
            testName: Value(record.testName),
            value: Value(record.value),
            unit: Value(record.unit),
            referenceRange: Value(record.referenceRange),
            notes: Value(record.notes),
            attachmentLocalPath: Value(record.attachmentLocalPath),
            createdAt: Value(record.createdAt),
            updatedAt: Value(record.updatedAt),
          ),
        );
  }

  Future<void> deleteBloodTest(String id) async {
    final row = await (db.select(
      db.bloodTestRecords,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
    if (row != null) {
      await files.deleteIfExists(row.attachmentLocalPath);
    }
    await (db.delete(db.bloodTestRecords)..where((t) => t.id.equals(id))).go();
  }

  Future<ExportBundleData> collectExport() async {
    return ExportBundleData(
      regimens: await getRegimens(),
      reminders: await getAllReminders(),
      doseLogs: await getDoseLogs(),
      photoEntries: await getPhotos(),
      diaryEntries: await getDiaryEntries(),
      bloodTestRecords: await getBloodTests(),
    );
  }

  Future<void> deleteAllLocalData() async {
    await db.transaction(() async {
      await db.delete(db.doseLogs).go();
      await db.delete(db.reminders).go();
      await db.delete(db.regimens).go();
      await db.delete(db.photoEntries).go();
      await db.delete(db.diaryEntries).go();
      await db.delete(db.bloodTestRecords).go();
      await db.delete(db.appSettings).go();
    });
    await files.deleteAllMedia();
    await notifications.cancelAll();
  }
}

class ExportBundleData {
  ExportBundleData({
    required this.regimens,
    required this.reminders,
    required this.doseLogs,
    required this.photoEntries,
    required this.diaryEntries,
    required this.bloodTestRecords,
  });

  final List<Regimen> regimens;
  final List<Reminder> reminders;
  final List<DoseLog> doseLogs;
  final List<PhotoEntry> photoEntries;
  final List<DiaryEntry> diaryEntries;
  final List<BloodTestRecord> bloodTestRecords;
}
