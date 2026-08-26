import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

@DataClassName('RegimenRow')
class Regimens extends Table {
  TextColumn get id => text()();
  TextColumn get category => text()();
  TextColumn get customCategory => text().nullable()();
  TextColumn get medicationName => text()();
  RealColumn get doseAmount => real()();
  TextColumn get doseUnit => text()();
  TextColumn get route => text()();
  TextColumn get customRoute => text().nullable()();
  DateTimeColumn get startDate => dateTime()();
  TextColumn get notes => text().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DataClassName('ReminderRow')
class Reminders extends Table {
  TextColumn get id => text()();
  TextColumn get regimenId => text().references(Regimens, #id)();
  IntColumn get timeOfDayMinutes => integer()();
  TextColumn get scheduleType => text()();
  TextColumn get weekdayValues => text().withDefault(const Constant('[]'))();
  TextColumn get monthDayValues => text().withDefault(const Constant('[]'))();
  IntColumn get intervalDays => integer().nullable()();
  BoolColumn get isEnabled => boolean().withDefault(const Constant(false))();
  TextColumn get notificationPrivacyMode =>
      text().withDefault(const Constant('discreet'))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DataClassName('DoseLogRow')
class DoseLogs extends Table {
  TextColumn get id => text()();
  TextColumn get regimenId => text().references(Regimens, #id)();
  DateTimeColumn get scheduledAt => dateTime()();
  DateTimeColumn get takenAt => dateTime().nullable()();
  TextColumn get status => text()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DataClassName('PhotoEntryRow')
class PhotoEntries extends Table {
  TextColumn get id => text()();
  TextColumn get photoLocalPath => text()();
  DateTimeColumn get date => dateTime()();
  DateTimeColumn get hrtStartDateReference => dateTime().nullable()();
  IntColumn get journeyDayNumber => integer().nullable()();
  TextColumn get caption => text().nullable()();
  TextColumn get tags => text().withDefault(const Constant('[]'))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DataClassName('DiaryEntryRow')
class DiaryEntries extends Table {
  TextColumn get id => text()();
  DateTimeColumn get date => dateTime()();
  IntColumn get moodScore => integer().nullable()();
  TextColumn get tags => text().withDefault(const Constant('[]'))();
  TextColumn get body => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DataClassName('BloodTestRecordRow')
class BloodTestRecords extends Table {
  TextColumn get id => text()();
  DateTimeColumn get testDate => dateTime()();
  TextColumn get labName => text().nullable()();
  TextColumn get testName => text()();
  RealColumn get value => real()();
  TextColumn get unit => text()();
  TextColumn get referenceRange => text().nullable()();
  TextColumn get notes => text().nullable()();
  TextColumn get attachmentLocalPath => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DataClassName('AppSettingRow')
class AppSettings extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();

  @override
  Set<Column<Object>> get primaryKey => {key};
}

@DriftDatabase(
  tables: [
    Regimens,
    Reminders,
    DoseLogs,
    PhotoEntries,
    DiaryEntries,
    BloodTestRecords,
    AppSettings,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 1;

  static Future<AppDatabase> open() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'transition_journal.sqlite'));
    return AppDatabase(NativeDatabase.createInBackground(file));
  }
}
