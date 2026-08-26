import 'dart:io';

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:transition_journal/data/database/app_database.dart';
import 'package:transition_journal/data/repositories/app_repositories.dart';
import 'package:transition_journal/data/services/notification_scheduler.dart';
import 'package:transition_journal/data/services/protected_file_store.dart';
import 'package:transition_journal/domain/enums/app_enums.dart';
import 'package:transition_journal/domain/models/models.dart';

class _MemNotifications implements NotificationScheduler {
  int rescheduleCount = 0;
  int cancelCount = 0;

  @override
  Future<void> cancelAll() async => cancelCount++;

  @override
  Future<bool> hasPermission() async => true;

  @override
  Future<void> initialize() async {}

  @override
  Future<bool> requestPermission() async => true;

  @override
  Future<void> rescheduleAll({
    required List<Reminder> reminders,
    required Map<String, Regimen> regimensById,
  }) async {
    rescheduleCount++;
  }
}

class _TrackingFiles implements ProtectedFileStore {
  final deleted = <String?>[];
  bool deletedAll = false;

  @override
  Future<void> deleteAllMedia() async => deletedAll = true;

  @override
  Future<void> deleteIfExists(String? path) async {
    deleted.add(path);
    if (path != null) {
      final f = File(path);
      if (await f.exists()) await f.delete();
    }
  }

  @override
  Future<String> saveMedia({
    required File source,
    required String subdirectory,
    String? preferredExtension,
  }) async {
    final dest = File(
      '${Directory.systemTemp.path}/tj_${subdirectory}_${DateTime.now().microsecondsSinceEpoch}.jpg',
    );
    await source.copy(dest.path);
    return dest.path;
  }
}

void main() {
  late AppDatabase db;
  late _MemNotifications notifications;
  late _TrackingFiles files;
  late AppRepositories repos;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    notifications = _MemNotifications();
    files = _TrackingFiles();
    repos = AppRepositories(db: db, files: files, notifications: notifications);
  });

  tearDown(() async {
    await db.close();
  });

  Regimen sampleRegimen({String id = 'r1', bool active = true}) {
    final now = DateTime(2026, 1, 1);
    return Regimen(
      id: id,
      category: HormoneCategory.estrogen,
      medicationName: 'Estradiol',
      doseAmount: 2,
      doseUnit: 'mg',
      route: AdministrationRoute.oral,
      startDate: now,
      isActive: active,
      createdAt: now,
      updatedAt: now,
    );
  }

  test('regimen upsert and watch', () async {
    await repos.upsertRegimen(sampleRegimen());
    final items = await repos.getRegimens();
    expect(items, hasLength(1));
    expect(items.first.medicationName, 'Estradiol');
    expect(notifications.rescheduleCount, greaterThan(0));
  });

  test('delete regimen removes reminders and dose logs', () async {
    await repos.upsertRegimen(sampleRegimen());
    final now = DateTime(2026, 1, 2);
    await repos.upsertReminder(
      Reminder(
        id: 'rem1',
        regimenId: 'r1',
        timeOfDayMinutes: 540,
        scheduleType: ReminderScheduleType.daily,
        isEnabled: true,
        notificationPrivacyMode: NotificationPrivacyMode.discreet,
        createdAt: now,
        updatedAt: now,
      ),
    );
    await repos.addDoseLog(
      DoseLog(
        id: 'd1',
        regimenId: 'r1',
        scheduledAt: now,
        status: DoseStatus.taken,
        takenAt: now,
        createdAt: now,
      ),
    );
    await repos.deleteRegimen('r1');
    expect(await repos.getRegimens(), isEmpty);
    expect(await repos.getAllReminders(), isEmpty);
    expect(await repos.getDoseLogs(), isEmpty);
  });

  test('diary enforces one entry per date', () async {
    final day = DateTime(2026, 3, 10);
    final now = DateTime(2026, 3, 10, 12);
    await repos.upsertDiary(
      DiaryEntry(
        id: 'a',
        date: day,
        text: 'first',
        createdAt: now,
        updatedAt: now,
      ),
    );
    await repos.upsertDiary(
      DiaryEntry(
        id: 'b',
        date: day,
        text: 'second',
        createdAt: now,
        updatedAt: now,
      ),
    );
    final entries = await repos.getDiaryEntries();
    expect(entries, hasLength(1));
    expect(entries.first.id, 'b');
    expect(entries.first.text, 'second');
  });

  test('delete photo removes local file', () async {
    final source = File('${Directory.systemTemp.path}/tj_src.jpg')
      ..writeAsStringSync('img');
    final path = await files.saveMedia(source: source, subdirectory: 'photos');
    final now = DateTime(2026, 3, 1);
    await repos.upsertPhoto(
      PhotoEntry(
        id: 'p1',
        photoLocalPath: path,
        date: now,
        createdAt: now,
        updatedAt: now,
      ),
    );
    expect(await File(path).exists(), isTrue);
    await repos.deletePhoto('p1');
    expect(await File(path).exists(), isFalse);
    expect(files.deleted, contains(path));
  });

  test('delete blood test removes attachment file', () async {
    final source = File('${Directory.systemTemp.path}/tj_lab.jpg')
      ..writeAsStringSync('lab');
    final path = await files.saveMedia(
      source: source,
      subdirectory: 'attachments',
    );
    final now = DateTime(2026, 3, 1);
    await repos.upsertBloodTest(
      BloodTestRecord(
        id: 'b1',
        testDate: now,
        testName: 'E2',
        value: 120,
        unit: 'pg/mL',
        attachmentLocalPath: path,
        createdAt: now,
        updatedAt: now,
      ),
    );
    await repos.deleteBloodTest('b1');
    expect(await File(path).exists(), isFalse);
  });

  test('delete all local data clears tables and media', () async {
    await repos.upsertRegimen(sampleRegimen());
    await repos.setOnboardingComplete();
    await repos.deleteAllLocalData();
    expect(await repos.getRegimens(), isEmpty);
    expect(await repos.onboardingComplete, isFalse);
    expect(files.deletedAll, isTrue);
    expect(notifications.cancelCount, greaterThan(0));
  });

  test('export bundle contains structured records', () async {
    await repos.upsertRegimen(sampleRegimen());
    final data = await repos.collectExport();
    expect(data.regimens, hasLength(1));
    expect(data.regimens.first.toJson()['medicationName'], 'Estradiol');
  });
}
