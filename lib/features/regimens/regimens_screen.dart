import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:transition_journal/app/providers.dart';
import 'package:transition_journal/core/theme/tj_theme.dart';
import 'package:transition_journal/core/widgets/tj_widgets.dart';
import 'package:transition_journal/domain/models/models.dart';
import 'package:transition_journal/features/regimens/dose_log_sheet.dart';
import 'package:transition_journal/features/regimens/regimen_editor.dart';
import 'package:transition_journal/features/regimens/reminder_editor.dart';

class RegimensScreen extends ConsumerWidget {
  const RegimensScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final regimens = ref.watch(regimensProvider);
    final colors = context.tjColors;

    return Scaffold(
      appBar: AppBar(title: const Text('Regimens')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => openRegimenEditor(context, ref),
        icon: const Icon(Icons.add),
        label: const Text('Add'),
      ),
      body: regimens.when(
        loading: () => const TjLoading(),
        error: (e, _) => const Center(child: Text('Could not load regimens.')),
        data: (items) {
          if (items.isEmpty) {
            return TjEmptyState(
              title: 'No regimens yet',
              message: 'Track medications with inclusive categories and custom labels.',
              actionLabel: 'Add regimen',
              onAction: () => openRegimenEditor(context, ref),
            );
          }
          final active = items.where((r) => r.isActive).toList();
          final archived = items.where((r) => !r.isActive).toList();
          return ListView(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
            children: [
              if (active.isNotEmpty) ...[
                const TjSectionHeader('Active'),
                ...active.map((r) => _RegimenTile(regimen: r)),
              ],
              if (archived.isNotEmpty) ...[
                const SizedBox(height: 12),
                TjSectionHeader(
                  'Archived',
                  subtitle: 'Kept for history; reminders stay off.',
                ),
                ...archived.map((r) => _RegimenTile(regimen: r)),
              ],
              const SizedBox(height: 16),
              TextButton.icon(
                onPressed: () {
                  final activeList = active;
                  if (activeList.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Add an active regimen first.'),
                      ),
                    );
                    return;
                  }
                  showDoseLogSheet(context, ref, activeList);
                },
                icon: Icon(Icons.edit_calendar_outlined, color: colors.sage),
                label: const Text('Log a dose'),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _RegimenTile extends ConsumerWidget {
  const _RegimenTile({required this.regimen});
  final Regimen regimen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.tjColors;
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 10),
      color: colors.surfaceElevated.withValues(alpha: 0.75),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () => _openDetails(context, ref),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      regimen.medicationName,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  if (!regimen.isActive)
                    Text(
                      'Archived',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                '${regimen.categoryLabel} · ${regimen.doseLabel} · ${regimen.routeLabel}',
              ),
              const SizedBox(height: 4),
              Text('Started ${DateFormat.yMMMd().format(regimen.startDate)}'),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _openDetails(BuildContext context, WidgetRef ref) async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) => _RegimenDetails(regimen: regimen),
    );
  }
}

class _RegimenDetails extends ConsumerWidget {
  const _RegimenDetails({required this.regimen});
  final Regimen regimen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reminders = ref.watch(
      StreamProvider(
        (ref) => ref
            .watch(repositoriesProvider)
            .watchRemindersForRegimen(regimen.id),
      ),
    );
    final doses = ref.watch(
      StreamProvider(
        (ref) => ref
            .watch(repositoriesProvider)
            .watchDoseLogs(regimenId: regimen.id, limit: 20),
      ),
    );

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.75,
      maxChildSize: 0.95,
      builder: (context, controller) {
        return ListView(
          controller: controller,
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
          children: [
            Text(
              regimen.medicationName,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 6),
            Text(
              '${regimen.categoryLabel} · ${regimen.doseLabel} · ${regimen.routeLabel}',
            ),
            if (regimen.notes?.isNotEmpty ?? false) ...[
              const SizedBox(height: 8),
              Text(regimen.notes!),
            ],
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              children: [
                FilledButton.tonal(
                  onPressed: () {
                    Navigator.pop(context);
                    openRegimenEditor(context, ref, existing: regimen);
                  },
                  child: const Text('Edit'),
                ),
                FilledButton.tonal(
                  onPressed: () async {
                    await ref
                        .read(repositoriesProvider)
                        .upsertRegimen(
                          regimen.copyWith(
                            isActive: !regimen.isActive,
                            updatedAt: DateTime.now(),
                          ),
                        );
                    if (context.mounted) Navigator.pop(context);
                  },
                  child: Text(regimen.isActive ? 'Archive' : 'Restore'),
                ),
                TextButton(
                  onPressed: () async {
                    final ok = await TjConfirmDialog.show(
                      context,
                      title: 'Delete regimen?',
                      message: 'This removes its reminders and dose history. This cannot be undone.',
                      confirmLabel: 'Delete',
                      isDestructive: true,
                    );
                    if (!ok) return;
                    await ref
                        .read(repositoriesProvider)
                        .deleteRegimen(regimen.id);
                    if (context.mounted) Navigator.pop(context);
                  },
                  child: const Text('Delete'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Reminders',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                TextButton(
                  onPressed: () =>
                      openReminderEditor(context, ref, regimenId: regimen.id),
                  child: const Text('Add'),
                ),
              ],
            ),
            reminders.when(
              loading: () => const LinearProgressIndicator(),
              error: (_, __) => const Text('Could not load reminders'),
              data: (items) {
                if (items.isEmpty) {
                  return const Text(
                    'No reminders yet. Enable one when you are ready—permission is requested then.',
                  );
                }
                return Column(
                  children: [
                    for (final r in items)
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          '${r.timeOfDay.format24h()} · ${r.scheduleType.label}',
                        ),
                        subtitle: Text(
                          r.isEnabled
                              ? 'On · ${r.notificationPrivacyMode.label}'
                              : 'Off',
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.edit_outlined),
                          onPressed: () => openReminderEditor(
                            context,
                            ref,
                            regimenId: regimen.id,
                            existing: r,
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
            const SizedBox(height: 12),
            Text(
              'Recent dose history',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            doses.when(
              loading: () => const LinearProgressIndicator(),
              error: (_, __) => const Text('Could not load history'),
              data: (items) {
                if (items.isEmpty) return const Text('No dose logs yet.');
                return Column(
                  children: [
                    for (final d in items)
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(d.status.label),
                        subtitle: Text(
                          DateFormat.yMMMd().add_jm().format(d.scheduledAt),
                        ),
                      ),
                  ],
                );
              },
            ),
          ],
        );
      },
    );
  }
}
