import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:transition_journal/app/providers.dart';
import 'package:transition_journal/core/theme/tj_theme.dart';
import 'package:transition_journal/core/utils/reminder_scheduler.dart';
import 'package:transition_journal/core/widgets/tj_widgets.dart';
import 'package:transition_journal/domain/enums/app_enums.dart';
import 'package:transition_journal/domain/models/models.dart';
import 'package:transition_journal/features/regimens/dose_log_sheet.dart';
import 'package:uuid/uuid.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final regimens = ref.watch(activeRegimensProvider);
    final doses = ref.watch(doseLogsProvider);
    final diary = ref.watch(diaryProvider);
    final reminders = ref.watch(remindersProvider);
    final colors = context.tjColors;
    final today = DateFormat.yMMMEd().format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transition Journal'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(24),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 8),
              child: Semantics(
                header: true,
                child: Text(
                  today,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
          ),
        ),
      ),
      body: regimens.when(
        loading: () => const TjLoading(),
        error: (e, _) => const Center(child: Text('Could not load home.')),
        data: (active) {
          final recentDoses = doses.asData?.value.take(5).toList() ?? [];
          final recentDiary = diary.asData?.value.take(3).toList() ?? [];
          final todayReminders = _todaysReminders(
            reminders: reminders.asData?.value ?? const [],
            regimens: active,
          );
          return ListView(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      colors.sage.withValues(alpha: 0.18),
                      colors.softAccent.withValues(alpha: 0.12),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Today',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        active.isEmpty
                            ? 'Add a regimen to start logging doses and reminders.'
                            : '${active.length} active regimen${active.length == 1 ? '' : 's'}. Log doses when you take them—no pressure, no judgment.',
                      ),
                      const SizedBox(height: 14),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          FilledButton.tonal(
                            onPressed: () => context.go('/regimens'),
                            child: const Text('View regimens'),
                          ),
                          if (active.isNotEmpty)
                            FilledButton(
                              onPressed: () =>
                                  showDoseLogSheet(context, ref, active),
                              child: const Text('Log a dose'),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const TjSectionHeader(
                "Today's reminders",
                subtitle: 'Local schedules for today. Delivery is best-effort.',
              ),
              if (todayReminders.isEmpty)
                Text(
                  active.isEmpty
                      ? 'Reminders appear here after you add an active regimen.'
                      : 'No reminders scheduled for today.',
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              else
                ...todayReminders.map(
                  (item) => Semantics(
                    label:
                        'Reminder at ${item.$1.timeOfDay.format24h()} for ${item.$2.medicationName}',
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(
                        Icons.notifications_outlined,
                        color: colors.sage,
                      ),
                      title: Text(item.$2.medicationName),
                      subtitle: Text(
                        '${item.$1.timeOfDay.format24h()} · ${item.$1.scheduleType.label}',
                      ),
                      trailing: IconButton(
                        tooltip: 'Log dose',
                        onPressed: () =>
                            showDoseLogSheet(context, ref, [item.$2]),
                        icon: const Icon(Icons.check_circle_outline),
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 12),
              const TjSectionHeader(
                'Quick dose',
                subtitle: 'Mark taken, skipped, or missed.',
              ),
              if (active.isEmpty)
                TjEmptyState(
                  title: 'No active regimens',
                  message: 'Create a regimen to enable quick logging.',
                  actionLabel: 'Add regimen',
                  onAction: () => context.go('/regimens'),
                  icon: Icons.medication_outlined,
                )
              else
                ...active.take(4).map((r) => _QuickDoseTile(regimen: r)),
              const SizedBox(height: 12),
              const TjSectionHeader('Recent activity'),
              if (recentDoses.isEmpty && recentDiary.isEmpty)
                const Text('Your recent logs will appear here.')
              else ...[
                for (final d in recentDoses)
                  Builder(
                    builder: (context) {
                      final all =
                          ref.watch(regimensProvider).asData?.value ?? active;
                      String? name;
                      for (final r in all) {
                        if (r.id == d.regimenId) {
                          name = r.medicationName;
                          break;
                        }
                      }
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Icon(
                          _statusIcon(d.status),
                          color: colors.sage,
                        ),
                        title: Text(
                          '${d.status.label}${name != null ? ' · $name' : ''}',
                        ),
                        subtitle: Text(
                          DateFormat.yMMMd().add_jm().format(d.scheduledAt),
                        ),
                      );
                    },
                  ),
                for (final e in recentDiary)
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(
                      Icons.edit_note_outlined,
                      color: colors.softAccent,
                    ),
                    title: Text('Diary · ${DateFormat.MMMd().format(e.date)}'),
                    subtitle: Text(
                      (e.text?.isNotEmpty ?? false)
                          ? e.text!
                          : 'Mood/tags entry',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
              ],
            ],
          );
        },
      ),
    );
  }

  IconData _statusIcon(DoseStatus status) => switch (status) {
    DoseStatus.taken => Icons.check_circle_outline,
    DoseStatus.skipped => Icons.remove_circle_outline,
    DoseStatus.missed => Icons.schedule_outlined,
  };

  List<(Reminder, Regimen)> _todaysReminders({
    required List<Reminder> reminders,
    required List<Regimen> regimens,
  }) {
    final now = DateTime.now();
    final start = DateTime(
      now.year,
      now.month,
      now.day,
    ).subtract(const Duration(seconds: 1));
    final end = DateTime(now.year, now.month, now.day, 23, 59, 59);
    final byId = {for (final r in regimens) r.id: r};
    final items = <(Reminder, Regimen)>[];
    for (final reminder in reminders.where((r) => r.isEnabled)) {
      final regimen = byId[reminder.regimenId];
      if (regimen == null || !regimen.isActive) continue;
      final next = ReminderScheduler.nextOccurrences(
        reminder: reminder,
        from: start,
        count: 1,
      );
      if (next.isEmpty) continue;
      if (!next.first.isAfter(end)) {
        items.add((reminder, regimen));
      }
    }
    items.sort(
      (a, b) => a.$1.timeOfDayMinutes.compareTo(b.$1.timeOfDayMinutes),
    );
    return items;
  }
}

class _QuickDoseTile extends ConsumerWidget {
  const _QuickDoseTile({required this.regimen});
  final Regimen regimen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Semantics(
      label: 'Quick dose for ${regimen.medicationName}',
      child: Card(
        elevation: 0,
        color: context.tjColors.surfaceElevated.withValues(alpha: 0.7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      regimen.medicationName,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text('${regimen.doseLabel} · ${regimen.routeLabel}'),
                  ],
                ),
              ),
              IconButton(
                tooltip: 'Taken',
                onPressed: () => _log(ref, DoseStatus.taken),
                icon: const Icon(Icons.check),
              ),
              IconButton(
                tooltip: 'Skipped',
                onPressed: () => _log(ref, DoseStatus.skipped),
                icon: const Icon(Icons.remove),
              ),
              IconButton(
                tooltip: 'Missed',
                onPressed: () => _log(ref, DoseStatus.missed),
                icon: const Icon(Icons.schedule),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _log(WidgetRef ref, DoseStatus status) async {
    final now = DateTime.now();
    await ref
        .read(repositoriesProvider)
        .addDoseLog(
          DoseLog(
            id: const Uuid().v4(),
            regimenId: regimen.id,
            scheduledAt: now,
            takenAt: status == DoseStatus.taken ? now : null,
            status: status,
            createdAt: now,
          ),
        );
  }
}
