import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transition_journal/app/providers.dart';
import 'package:transition_journal/core/widgets/tj_widgets.dart';
import 'package:transition_journal/domain/enums/app_enums.dart';
import 'package:transition_journal/domain/models/models.dart';
import 'package:uuid/uuid.dart';

Future<void> openReminderEditor(
  BuildContext context,
  WidgetRef ref, {
  required String regimenId,
  Reminder? existing,
}) async {
  await Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) =>
          ReminderEditorScreen(regimenId: regimenId, existing: existing),
    ),
  );
}

class ReminderEditorScreen extends ConsumerStatefulWidget {
  const ReminderEditorScreen({
    super.key,
    required this.regimenId,
    this.existing,
  });

  final String regimenId;
  final Reminder? existing;

  @override
  ConsumerState<ReminderEditorScreen> createState() =>
      _ReminderEditorScreenState();
}

class _ReminderEditorScreenState extends ConsumerState<ReminderEditorScreen> {
  late int _minutes = widget.existing?.timeOfDayMinutes ?? 9 * 60;
  late ReminderScheduleType _type =
      widget.existing?.scheduleType ?? ReminderScheduleType.daily;
  late Set<int> _weekdays = {...?widget.existing?.weekdayValues};
  late Set<int> _monthDays = {...?widget.existing?.monthDayValues};
  late final _interval = TextEditingController(
    text: '${widget.existing?.intervalDays ?? 2}',
  );
  late bool _enabled = widget.existing?.isEnabled ?? false;
  late NotificationPrivacyMode _privacy =
      widget.existing?.notificationPrivacyMode ??
      NotificationPrivacyMode.discreet;
  String? _permissionMessage;

  @override
  void dispose() {
    _interval.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (_type == ReminderScheduleType.weekdays && _weekdays.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Select at least one weekday.')),
      );
      return;
    }
    if (_type == ReminderScheduleType.monthDays && _monthDays.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Select at least one day of the month.')),
      );
      return;
    }
    final interval = int.tryParse(_interval.text.trim());
    if (_type == ReminderScheduleType.intervalDays &&
        (interval == null || interval < 1)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter an interval of 1 or more days.')),
      );
      return;
    }

    if (_enabled) {
      final scheduler = ref.read(notificationSchedulerProvider);
      final granted = await scheduler.requestPermission();
      if (!granted) {
        setState(() {
          _permissionMessage = 'Notifications are off. You can still save this reminder and enable it after allowing notifications in system settings.';
          _enabled = false;
        });
      }
    }

    if (_privacy == NotificationPrivacyMode.detailed) {
      final ok = await TjConfirmDialog.show(
        context,
        title: 'Detailed notifications',
        message: 'Detailed alerts may show medication names on your lock screen. Prefer discreet mode if device privacy matters.',
        confirmLabel: 'Use detailed',
      );
      if (!ok) {
        setState(() => _privacy = NotificationPrivacyMode.discreet);
      }
    }

    final now = DateTime.now();
    final reminder = Reminder(
      id: widget.existing?.id ?? const Uuid().v4(),
      regimenId: widget.regimenId,
      timeOfDayMinutes: _minutes,
      scheduleType: _type,
      weekdayValues: _weekdays.toList()..sort(),
      monthDayValues: _monthDays.toList()..sort(),
      intervalDays: _type == ReminderScheduleType.intervalDays
          ? interval
          : null,
      isEnabled: _enabled,
      notificationPrivacyMode: _privacy,
      createdAt: widget.existing?.createdAt ?? now,
      updatedAt: now,
    );
    await ref.read(repositoriesProvider).upsertReminder(reminder);
    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final time = TimeOfDay(hour: _minutes ~/ 60, minute: _minutes % 60);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.existing == null ? 'Add reminder' : 'Edit reminder'),
        actions: [
          if (widget.existing != null)
            IconButton(
              tooltip: 'Delete',
              onPressed: () async {
                final ok = await TjConfirmDialog.show(
                  context,
                  title: 'Delete reminder?',
                  message: 'This cannot be undone.',
                  confirmLabel: 'Delete',
                  isDestructive: true,
                );
                if (!ok) return;
                await ref
                    .read(repositoriesProvider)
                    .deleteReminder(widget.existing!.id);
                if (mounted) Navigator.pop(context);
              },
              icon: const Icon(Icons.delete_outline),
            ),
          TextButton(onPressed: _save, child: const Text('Save')),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Time'),
            subtitle: Text(time.format(context)),
            trailing: const Icon(Icons.schedule),
            onTap: () async {
              final picked = await showTimePicker(
                context: context,
                initialTime: time,
              );
              if (picked != null) {
                setState(() => _minutes = picked.hour * 60 + picked.minute);
              }
            },
          ),
          DropdownButtonFormField<ReminderScheduleType>(
            initialValue: _type,
            decoration: const InputDecoration(labelText: 'Schedule'),
            items: [
              for (final t in ReminderScheduleType.values)
                DropdownMenuItem(value: t, child: Text(t.label)),
            ],
            onChanged: (v) => setState(() => _type = v!),
          ),
          if (_type == ReminderScheduleType.weekdays) ...[
            const SizedBox(height: 12),
            Text('Weekdays', style: Theme.of(context).textTheme.titleMedium),
            Wrap(
              spacing: 6,
              children: [
                for (final day in [
                  (1, 'Mon'),
                  (2, 'Tue'),
                  (3, 'Wed'),
                  (4, 'Thu'),
                  (5, 'Fri'),
                  (6, 'Sat'),
                  (7, 'Sun'),
                ])
                  FilterChip(
                    label: Text(day.$2),
                    selected: _weekdays.contains(day.$1),
                    onSelected: (s) => setState(() {
                      if (s) {
                        _weekdays.add(day.$1);
                      } else {
                        _weekdays.remove(day.$1);
                      }
                    }),
                  ),
              ],
            ),
          ],
          if (_type == ReminderScheduleType.monthDays) ...[
            const SizedBox(height: 12),
            Text(
              'Days of month',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Wrap(
              spacing: 4,
              runSpacing: 4,
              children: [
                for (var d = 1; d <= 31; d++)
                  FilterChip(
                    label: Text('$d'),
                    selected: _monthDays.contains(d),
                    onSelected: (s) => setState(() {
                      if (s) {
                        _monthDays.add(d);
                      } else {
                        _monthDays.remove(d);
                      }
                    }),
                  ),
              ],
            ),
          ],
          if (_type == ReminderScheduleType.intervalDays) ...[
            const SizedBox(height: 12),
            TextField(
              controller: _interval,
              decoration: const InputDecoration(
                labelText: 'Every N days',
                helperText: 'Example: 3 for every third day',
              ),
              keyboardType: TextInputType.number,
            ),
          ],
          const SizedBox(height: 12),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            value: _enabled,
            onChanged: (v) => setState(() => _enabled = v),
            title: const Text('Enabled'),
            subtitle: const Text('Permission is requested only when enabling'),
          ),
          if (_permissionMessage != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                _permissionMessage!,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          DropdownButtonFormField<NotificationPrivacyMode>(
            initialValue: _privacy,
            decoration: const InputDecoration(
              labelText: 'Notification privacy',
            ),
            items: [
              for (final m in NotificationPrivacyMode.values)
                DropdownMenuItem(value: m, child: Text(m.label)),
            ],
            onChanged: (v) => setState(() => _privacy = v!),
          ),
          const SizedBox(height: 8),
          Text(
            _privacy == NotificationPrivacyMode.discreet
                ? 'Default copy: “It’s time for your reminder.”'
                : 'Detailed mode may reveal medication names on the lock screen.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 8),
          Text(
            'Local reminders are best-effort. Schedules are refreshed when you open the app or change a reminder.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
