import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transition_journal/data/database/app_database.dart';
import 'package:transition_journal/data/repositories/app_repositories.dart';
import 'package:transition_journal/data/services/biometric_gate.dart';
import 'package:transition_journal/data/services/export_service.dart';
import 'package:transition_journal/data/services/notification_scheduler.dart';
import 'package:transition_journal/data/services/protected_file_store.dart';
import 'package:transition_journal/domain/models/models.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  throw UnimplementedError('databaseProvider must be overridden at bootstrap');
});

final fileStoreProvider = Provider<ProtectedFileStore>((ref) {
  return LocalProtectedFileStore();
});

final notificationSchedulerProvider = Provider<NotificationScheduler>((ref) {
  return LocalNotificationScheduler();
});

final biometricGateProvider = Provider<BiometricGate>((ref) {
  return LocalBiometricGate();
});

final exportServiceProvider = Provider<ExportService>((ref) {
  return ExportService();
});

final repositoriesProvider = Provider<AppRepositories>((ref) {
  return AppRepositories(
    db: ref.watch(databaseProvider),
    files: ref.watch(fileStoreProvider),
    notifications: ref.watch(notificationSchedulerProvider),
  );
});

final regimensProvider = StreamProvider<List<Regimen>>((ref) {
  return ref.watch(repositoriesProvider).watchRegimens();
});

final activeRegimensProvider = StreamProvider<List<Regimen>>((ref) {
  return ref.watch(repositoriesProvider).watchRegimens(activeOnly: true);
});

final doseLogsProvider = StreamProvider<List<DoseLog>>((ref) {
  return ref.watch(repositoriesProvider).watchDoseLogs();
});

final photosProvider = StreamProvider<List<PhotoEntry>>((ref) {
  return ref.watch(repositoriesProvider).watchPhotos();
});

final diaryProvider = StreamProvider<List<DiaryEntry>>((ref) {
  return ref.watch(repositoriesProvider).watchDiary();
});

final bloodTestsProvider = StreamProvider<List<BloodTestRecord>>((ref) {
  return ref.watch(repositoriesProvider).watchBloodTests();
});

final onboardingCompleteProvider = FutureProvider<bool>((ref) async {
  return ref.watch(repositoriesProvider).onboardingComplete;
});

final journeyStartProvider = FutureProvider<DateTime?>((ref) async {
  return ref.watch(repositoriesProvider).journeyStartDate;
});

final appUnlockedProvider = StateProvider<bool>((ref) => false);
