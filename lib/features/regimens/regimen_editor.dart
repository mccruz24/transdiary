import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transition_journal/app/providers.dart';
import 'package:transition_journal/domain/enums/app_enums.dart';
import 'package:transition_journal/domain/models/models.dart';
import 'package:uuid/uuid.dart';

Future<void> openRegimenEditor(
  BuildContext context,
  WidgetRef ref, {
  Regimen? existing,
}) async {
  await Navigator.of(context).push(
    MaterialPageRoute(builder: (_) => RegimenEditorScreen(existing: existing)),
  );
}

class RegimenEditorScreen extends ConsumerStatefulWidget {
  const RegimenEditorScreen({super.key, this.existing});
  final Regimen? existing;

  @override
  ConsumerState<RegimenEditorScreen> createState() =>
      _RegimenEditorScreenState();
}

class _RegimenEditorScreenState extends ConsumerState<RegimenEditorScreen> {
  final _formKey = GlobalKey<FormState>();
  late final _name = TextEditingController(
    text: widget.existing?.medicationName ?? '',
  );
  late final _amount = TextEditingController(
    text: widget.existing?.doseAmount.toString() ?? '',
  );
  late final _unit = TextEditingController(
    text: widget.existing?.doseUnit ?? 'mg',
  );
  late final _notes = TextEditingController(text: widget.existing?.notes ?? '');
  late final _customCategory = TextEditingController(
    text: widget.existing?.customCategory ?? '',
  );
  late final _customRoute = TextEditingController(
    text: widget.existing?.customRoute ?? '',
  );
  late HormoneCategory _category =
      widget.existing?.category ?? HormoneCategory.estrogen;
  late AdministrationRoute _route =
      widget.existing?.route ?? AdministrationRoute.oral;
  late DateTime _start = widget.existing?.startDate ?? DateTime.now();
  late bool _active = widget.existing?.isActive ?? true;

  @override
  void dispose() {
    _name.dispose();
    _amount.dispose();
    _unit.dispose();
    _notes.dispose();
    _customCategory.dispose();
    _customRoute.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    final amount = double.tryParse(_amount.text.trim());
    if (amount == null) return;
    final now = DateTime.now();
    final regimen = Regimen(
      id: widget.existing?.id ?? const Uuid().v4(),
      category: _category,
      customCategory: _category == HormoneCategory.custom
          ? _customCategory.text.trim()
          : null,
      medicationName: _name.text.trim(),
      doseAmount: amount,
      doseUnit: _unit.text.trim(),
      route: _route,
      customRoute: _route == AdministrationRoute.custom
          ? _customRoute.text.trim()
          : null,
      startDate: DateTime(_start.year, _start.month, _start.day),
      notes: _notes.text.trim().isEmpty ? null : _notes.text.trim(),
      isActive: _active,
      createdAt: widget.existing?.createdAt ?? now,
      updatedAt: now,
    );
    await ref.read(repositoriesProvider).upsertRegimen(regimen);
    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.existing == null ? 'Add regimen' : 'Edit regimen'),
        actions: [TextButton(onPressed: _save, child: const Text('Save'))],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _name,
              decoration: const InputDecoration(labelText: 'Medication name'),
              textCapitalization: TextCapitalization.sentences,
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Enter a name' : null,
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<HormoneCategory>(
              initialValue: _category,
              decoration: const InputDecoration(labelText: 'Category'),
              items: [
                for (final c in HormoneCategory.values)
                  DropdownMenuItem(value: c, child: Text(c.label)),
              ],
              onChanged: (v) => setState(() => _category = v!),
            ),
            if (_category == HormoneCategory.custom) ...[
              const SizedBox(height: 12),
              TextFormField(
                controller: _customCategory,
                decoration: const InputDecoration(labelText: 'Custom category'),
                validator: (v) =>
                    _category == HormoneCategory.custom &&
                        (v == null || v.trim().isEmpty)
                    ? 'Enter a custom category'
                    : null,
              ),
            ],
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _amount,
                    decoration: const InputDecoration(labelText: 'Dose amount'),
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    validator: (v) => double.tryParse(v ?? '') == null
                        ? 'Enter a number'
                        : null,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    controller: _unit,
                    decoration: const InputDecoration(labelText: 'Unit'),
                    validator: (v) =>
                        (v == null || v.trim().isEmpty) ? 'Required' : null,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<AdministrationRoute>(
              initialValue: _route,
              decoration: const InputDecoration(
                labelText: 'Administration route',
              ),
              items: [
                for (final r in AdministrationRoute.values)
                  DropdownMenuItem(value: r, child: Text(r.label)),
              ],
              onChanged: (v) => setState(() => _route = v!),
            ),
            if (_route == AdministrationRoute.custom) ...[
              const SizedBox(height: 12),
              TextFormField(
                controller: _customRoute,
                decoration: const InputDecoration(labelText: 'Custom route'),
              ),
            ],
            const SizedBox(height: 12),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('HRT start date'),
              subtitle: Text(
                MaterialLocalizations.of(context).formatMediumDate(_start),
              ),
              trailing: const Icon(Icons.calendar_today_outlined),
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: _start,
                  firstDate: DateTime(2000),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                );
                if (picked != null) setState(() => _start = picked);
              },
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              value: _active,
              onChanged: (v) => setState(() => _active = v),
              title: const Text('Active'),
              subtitle: const Text('Archived regimens stay in history'),
            ),
            TextFormField(
              controller: _notes,
              decoration: const InputDecoration(labelText: 'Notes (optional)'),
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}
