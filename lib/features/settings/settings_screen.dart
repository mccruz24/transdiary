import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transition_journal/app/providers.dart';
import 'package:transition_journal/core/widgets/tj_widgets.dart';
import 'package:transition_journal/data/services/export_service.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  bool? _lockEnabled;
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final enabled = await ref.read(biometricGateProvider).isAppLockEnabled;
    if (mounted) setState(() => _lockEnabled = enabled);
  }

  Future<void> _toggleLock(bool value) async {
    final gate = ref.read(biometricGateProvider);
    if (value) {
      final supported = await gate.isSupported;
      if (!supported) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Device authentication is not available on this device.',
            ),
          ),
        );
        return;
      }
      final ok = await gate.authenticate(reason: 'Enable app lock');
      if (!ok) return;
      await gate.setAppLockEnabled(true);
    } else {
      final ok = await gate.authenticate(reason: 'Disable app lock');
      if (!ok) return;
      await gate.setAppLockEnabled(false);
    }
    await _load();
  }

  Future<void> _export(bool asJson) async {
    setState(() => _busy = true);
    try {
      final data = await ref.read(repositoriesProvider).collectExport();
      final bundle = ExportBundle(
        regimens: data.regimens,
        reminders: data.reminders,
        doseLogs: data.doseLogs,
        photoEntries: data.photoEntries,
        diaryEntries: data.diaryEntries,
        bloodTestRecords: data.bloodTestRecords,
      );
      final export = ref.read(exportServiceProvider);
      final file = asJson
          ? await export.writeJson(bundle)
          : await export.writeCsv(bundle);
      await export.shareFile(file);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _deleteAll() async {
    final ok = await TjConfirmDialog.show(
      context,
      title: 'Delete all local data?',
      message: 'This permanently removes regimens, logs, diary entries, photos, attachments, reminders, and settings on this device. This cannot be undone.',
      confirmLabel: 'Delete everything',
      isDestructive: true,
    );
    if (!ok) return;
    final confirm = await TjConfirmDialog.show(
      context,
      title: 'Are you sure?',
      message: 'Final confirmation: erase all Transition Journal data on this device.',
      confirmLabel: 'Erase all data',
      isDestructive: true,
    );
    if (!confirm) return;
    setState(() => _busy = true);
    try {
      await ref.read(repositoriesProvider).deleteAllLocalData();
      await ref.read(biometricGateProvider).setAppLockEnabled(false);
      ref.invalidate(onboardingCompleteProvider);
      ref.invalidate(journeyStartProvider);
      ref.read(appUnlockedProvider.notifier).state = true;
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('All local data deleted.')),
        );
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _pickJourneyDate() async {
    final current = await ref.read(repositoriesProvider).journeyStartDate;
    if (!mounted) return;
    final picked = await showDatePicker(
      context: context,
      initialDate: current ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked == null) return;
    await ref.read(repositoriesProvider).setJourneyStartDate(picked);
    ref.invalidate(journeyStartProvider);
  }

  @override
  Widget build(BuildContext context) {
    final journey = ref.watch(journeyStartProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
            children: [
              const TjSectionHeader('Privacy'),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                value: _lockEnabled ?? false,
                onChanged: _lockEnabled == null ? null : _toggleLock,
                title: const Text('App lock'),
                subtitle: const Text('Face ID, Touch ID, or device passcode'),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Journey start date'),
                subtitle: Text(
                  journey.asData?.value == null
                      ? 'Optional — used for photo Day N labels'
                      : MaterialLocalizations.of(context)
                            .formatMediumDate(journey.asData!.value!),
                ),
                onTap: _pickJourneyDate,
                trailing: journey.asData?.value != null
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () async {
                          await ref
                              .read(repositoriesProvider)
                              .setJourneyStartDate(null);
                          ref.invalidate(journeyStartProvider);
                        },
                      )
                    : null,
              ),
              const SizedBox(height: 8),
              Text(
                'Data stays on this device. No accounts, analytics, advertising, or cloud sync.',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 20),
              const TjSectionHeader('Notifications'),
              Text(
                'Reminders use local notifications only. Default copy is discreet. Detailed mode is opt-in and may reveal sensitive information on the lock screen.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              TextButton(
                onPressed: () async {
                  await ref.read(repositoriesProvider).syncReminders();
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Reminders rescheduled.')),
                    );
                  }
                },
                child: const Text('Reschedule reminders now'),
              ),
              const SizedBox(height: 12),
              const TjSectionHeader('Export'),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Export JSON'),
                subtitle: const Text('Structured records for your own backup'),
                onTap: _busy ? null : () => _export(true),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Export CSV'),
                subtitle: const Text('Flattened rows for spreadsheets'),
                onTap: _busy ? null : () => _export(false),
              ),
              const SizedBox(height: 12),
              const TjSectionHeader('Data deletion'),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Delete all local data'),
                subtitle: const Text('Irreversible'),
                textColor: Theme.of(context).colorScheme.error,
                onTap: _busy ? null : _deleteAll,
              ),
              const SizedBox(height: 20),
              const TjSectionHeader('Medical disclaimer'),
              const TjDisclaimerBanner(),
            ],
          ),
          if (_busy)
            const ColoredBox(
              color: Color(0x33000000),
              child: Center(child: CircularProgressIndicator.adaptive()),
            ),
        ],
      ),
    );
  }
}
