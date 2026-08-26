import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transition_journal/app/providers.dart';
import 'package:transition_journal/domain/enums/app_enums.dart';
import 'package:transition_journal/domain/models/models.dart';
import 'package:uuid/uuid.dart';

Future<void> showDoseLogSheet(
  BuildContext context,
  WidgetRef ref,
  List<Regimen> regimens,
) async {
  if (regimens.isEmpty) return;
  await showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    builder: (context) => DoseLogSheet(regimens: regimens),
  );
}

class DoseLogSheet extends ConsumerStatefulWidget {
  const DoseLogSheet({super.key, required this.regimens});
  final List<Regimen> regimens;

  @override
  ConsumerState<DoseLogSheet> createState() => _DoseLogSheetState();
}

class _DoseLogSheetState extends ConsumerState<DoseLogSheet> {
  late String _regimenId = widget.regimens.first.id;
  DoseStatus _status = DoseStatus.taken;
  DateTime _when = DateTime.now();
  final _notes = TextEditingController();

  @override
  void dispose() {
    _notes.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final now = DateTime.now();
    await ref
        .read(repositoriesProvider)
        .addDoseLog(
          DoseLog(
            id: const Uuid().v4(),
            regimenId: _regimenId,
            scheduledAt: _when,
            takenAt: _status == DoseStatus.taken ? _when : null,
            status: _status,
            notes: _notes.text.trim().isEmpty ? null : _notes.text.trim(),
            createdAt: now,
          ),
        );
    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 8,
        bottom: MediaQuery.viewInsetsOf(context).bottom + 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Log a dose', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 8),
          Text(
            'Record what happened. This app will not suggest catching up or changing medication.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            initialValue: _regimenId,
            decoration: const InputDecoration(labelText: 'Regimen'),
            items: [
              for (final r in widget.regimens)
                DropdownMenuItem(value: r.id, child: Text(r.medicationName)),
            ],
            onChanged: (v) => setState(() => _regimenId = v!),
          ),
          const SizedBox(height: 12),
          SegmentedButton<DoseStatus>(
            segments: [
              for (final s in DoseStatus.values)
                ButtonSegment(value: s, label: Text(s.label)),
            ],
            selected: {_status},
            onSelectionChanged: (s) => setState(() => _status = s.first),
          ),
          const SizedBox(height: 12),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Time'),
            subtitle: Text(
              MaterialLocalizations.of(context)
                  .formatTimeOfDay(TimeOfDay.fromDateTime(_when)),
            ),
            trailing: const Icon(Icons.schedule),
            onTap: () async {
              final t = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.fromDateTime(_when),
              );
              if (t != null) {
                setState(() {
                  _when = DateTime(
                    _when.year,
                    _when.month,
                    _when.day,
                    t.hour,
                    t.minute,
                  );
                });
              }
            },
          ),
          TextField(
            controller: _notes,
            decoration: const InputDecoration(labelText: 'Notes (optional)'),
            maxLines: 2,
          ),
          const SizedBox(height: 16),
          FilledButton(onPressed: _save, child: const Text('Save log')),
        ],
      ),
    );
  }
}
