import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transition_journal/app/providers.dart';
import 'package:transition_journal/app/router.dart';
import 'package:transition_journal/core/theme/tj_theme.dart';
import 'package:transition_journal/data/database/app_database.dart';
import 'package:transition_journal/data/services/notification_scheduler.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final db = await AppDatabase.open();
  final notifications = LocalNotificationScheduler();
  await notifications.initialize();

  runApp(
    ProviderScope(
      overrides: [
        databaseProvider.overrideWithValue(db),
        notificationSchedulerProvider.overrideWithValue(notifications),
      ],
      child: const TransitionJournalApp(),
    ),
  );
}

class TransitionJournalApp extends ConsumerStatefulWidget {
  const TransitionJournalApp({super.key});

  @override
  ConsumerState<TransitionJournalApp> createState() =>
      _TransitionJournalAppState();
}

class _TransitionJournalAppState extends ConsumerState<TransitionJournalApp>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(repositoriesProvider).syncReminders();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      ref.read(repositoriesProvider).syncReminders();
    }
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: 'Transition Journal',
      debugShowCheckedModeBanner: false,
      theme: buildTjTheme(brightness: Brightness.light),
      darkTheme: buildTjTheme(brightness: Brightness.dark),
      themeMode: ThemeMode.system,
      routerConfig: router,
    );
  }
}
