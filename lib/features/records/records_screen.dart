import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:transition_journal/app/providers.dart';
import 'package:transition_journal/core/theme/tj_theme.dart';
import 'package:transition_journal/core/widgets/tj_widgets.dart';
import 'package:transition_journal/domain/models/models.dart';
import 'package:uuid/uuid.dart';

class RecordsScreen extends ConsumerStatefulWidget {
  const RecordsScreen({super.key});

  @override
  ConsumerState<RecordsScreen> createState() => _RecordsScreenState();
}

class _RecordsScreenState extends ConsumerState<RecordsScreen> {
  String? _filterName;

  @override
  Widget build(BuildContext context) {
    final records = ref.watch(bloodTestsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Records')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const BloodTestEditorScreen()),
        ),
        icon: const Icon(Icons.add),
        label: const Text('Add'),
      ),
      body: records.when(
        loading: () => const TjLoading(),
        error: (_, __) => const Center(child: Text('Could not load records.')),
        data: (items) {
          final names = items.map((e) => e.testName).toSet().toList()..sort();
          final filtered = _filterName == null
              ? items
              : items.where((e) => e.testName == _filterName).toList();
          return ListView(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
            children: [
              const TjDisclaimerBanner(compact: true),
              const SizedBox(height: 12),
              if (names.isNotEmpty)
                Wrap(
                  spacing: 6,
                  children: [
                    FilterChip(
                      label: const Text('All'),
                      selected: _filterName == null,
                      onSelected: (_) => setState(() => _filterName = null),
                    ),
                    for (final n in names)
                      FilterChip(
                        label: Text(n),
                        selected: _filterName == n,
                        onSelected: (_) => setState(() => _filterName = n),
                      ),
                  ],
                ),
              const SizedBox(height: 8),
              if (_filterName != null)
                _SimpleChart(
                  records: filtered
                      .where((r) => r.unit == filtered.first.unit)
                      .toList(),
                ),
              if (filtered.isEmpty)
                TjEmptyState(
                  title: 'No lab records',
                  message: 'Enter results manually. Charts only compare matching units and never label values normal or abnormal.',
                  actionLabel: 'Add record',
                  onAction: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const BloodTestEditorScreen(),
                    ),
                  ),
                  icon: Icons.science_outlined,
                )
              else if (_filterName != null)
                ...filtered.map((r) => _BloodTile(record: r))
              else ...[
                for (final name in names) ...[
                  TjSectionHeader(name),
                  ...filtered
                      .where((r) => r.testName == name)
                      .map((r) => _BloodTile(record: r)),
                ],
              ],
            ],
          );
        },
      ),
    );
  }
}

class _BloodTile extends ConsumerWidget {
  const _BloodTile({required this.record});
  final BloodTestRecord record;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 10),
      color: context.tjColors.surfaceElevated.withValues(alpha: 0.75),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: ListTile(
        title: Text(record.testName),
        subtitle: Text(
          [
            DateFormat.yMMMd().format(record.testDate),
            '${record.value} ${record.unit}',
            if (record.labName?.isNotEmpty ?? false) record.labName!,
          ].join(' · '),
        ),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => BloodTestEditorScreen(existing: record),
          ),
        ),
      ),
    );
  }
}

class _SimpleChart extends StatelessWidget {
  const _SimpleChart({required this.records});
  final List<BloodTestRecord> records;

  @override
  Widget build(BuildContext context) {
    if (records.length < 2) return const SizedBox.shrink();
    final sorted = [...records]
      ..sort((a, b) => a.testDate.compareTo(b.testDate));
    final minV = sorted.map((e) => e.value).reduce((a, b) => a < b ? a : b);
    final maxV = sorted.map((e) => e.value).reduce((a, b) => a > b ? a : b);
    final span = (maxV - minV).abs() < 0.0001 ? 1.0 : (maxV - minV);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.tjColors.surfaceElevated.withValues(alpha: 0.6),
          borderRadius: BorderRadius.circular(14),
        ),
        child: SizedBox(
          height: 120,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: CustomPaint(
              painter: _LinePainter(
                values: sorted.map((e) => (e.value - minV) / span).toList(),
                color: context.tjColors.sage,
              ),
              child: const SizedBox.expand(),
            ),
          ),
        ),
      ),
    );
  }
}

class _LinePainter extends CustomPainter {
  _LinePainter({required this.values, required this.color});
  final List<double> values;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    if (values.isEmpty) return;
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke;
    final path = Path();
    for (var i = 0; i < values.length; i++) {
      final x = values.length == 1
          ? size.width / 2
          : size.width * (i / (values.length - 1));
      final y = size.height * (1 - values[i]);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _LinePainter oldDelegate) =>
      oldDelegate.values != values || oldDelegate.color != color;
}

class BloodTestEditorScreen extends ConsumerStatefulWidget {
  const BloodTestEditorScreen({super.key, this.existing});
  final BloodTestRecord? existing;

  @override
  ConsumerState<BloodTestEditorScreen> createState() =>
      _BloodTestEditorScreenState();
}

class _BloodTestEditorScreenState extends ConsumerState<BloodTestEditorScreen> {
  final _formKey = GlobalKey<FormState>();
  late DateTime _date = widget.existing?.testDate ?? DateTime.now();
  late final _lab = TextEditingController(text: widget.existing?.labName ?? '');
  late final _name = TextEditingController(
    text: widget.existing?.testName ?? '',
  );
  late final _value = TextEditingController(
    text: widget.existing?.value.toString() ?? '',
  );
  late final _unit = TextEditingController(text: widget.existing?.unit ?? '');
  late final _range = TextEditingController(
    text: widget.existing?.referenceRange ?? '',
  );
  late final _notes = TextEditingController(text: widget.existing?.notes ?? '');
  String? _attachment;

  @override
  void initState() {
    super.initState();
    _attachment = widget.existing?.attachmentLocalPath;
  }

  @override
  void dispose() {
    _lab.dispose();
    _name.dispose();
    _value.dispose();
    _unit.dispose();
    _range.dispose();
    _notes.dispose();
    super.dispose();
  }

  Future<void> _pickAttachment() async {
    final picker = ImagePicker();
    final file = await picker.pickImage(source: ImageSource.gallery);
    if (file == null) return;
    final path = await ref
        .read(fileStoreProvider)
        .saveMedia(source: File(file.path), subdirectory: 'attachments');
    setState(() => _attachment = path);
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    final value = double.tryParse(_value.text.trim());
    if (value == null) return;
    final now = DateTime.now();
    final record = BloodTestRecord(
      id: widget.existing?.id ?? const Uuid().v4(),
      testDate: DateTime(_date.year, _date.month, _date.day),
      labName: _lab.text.trim().isEmpty ? null : _lab.text.trim(),
      testName: _name.text.trim(),
      value: value,
      unit: _unit.text.trim(),
      referenceRange: _range.text.trim().isEmpty ? null : _range.text.trim(),
      notes: _notes.text.trim().isEmpty ? null : _notes.text.trim(),
      attachmentLocalPath: _attachment,
      createdAt: widget.existing?.createdAt ?? now,
      updatedAt: now,
    );
    await ref.read(repositoriesProvider).upsertBloodTest(record);
    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.existing == null ? 'Add record' : 'Edit record'),
        actions: [
          if (widget.existing != null)
            IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () async {
                final ok = await TjConfirmDialog.show(
                  context,
                  title: 'Delete record?',
                  message: 'Any attached file will also be removed.',
                  confirmLabel: 'Delete',
                  isDestructive: true,
                );
                if (!ok) return;
                await ref
                    .read(repositoriesProvider)
                    .deleteBloodTest(widget.existing!.id);
                if (mounted) Navigator.pop(context);
              },
            ),
          TextButton(onPressed: _save, child: const Text('Save')),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const TjDisclaimerBanner(compact: true),
            const SizedBox(height: 12),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Test date'),
              subtitle: Text(
                MaterialLocalizations.of(context).formatMediumDate(_date),
              ),
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: _date,
                  firstDate: DateTime(2000),
                  lastDate: DateTime.now(),
                );
                if (picked != null) setState(() => _date = picked);
              },
            ),
            TextFormField(
              controller: _lab,
              decoration: const InputDecoration(
                labelText: 'Lab / clinic (optional)',
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _name,
              decoration: const InputDecoration(labelText: 'Test name'),
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Required' : null,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _value,
                    decoration: const InputDecoration(
                      labelText: 'Result value',
                    ),
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    validator: (v) => double.tryParse(v ?? '') == null
                        ? 'Number required'
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
            TextFormField(
              controller: _range,
              decoration: const InputDecoration(
                labelText: 'Reference range (optional)',
                helperText: 'Stored as text only — not interpreted',
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _notes,
              decoration: const InputDecoration(labelText: 'Notes (optional)'),
              maxLines: 3,
            ),
            const SizedBox(height: 12),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                _attachment == null
                    ? 'Add document / photo attachment'
                    : 'Attachment saved locally',
              ),
              trailing: IconButton(
                icon: const Icon(Icons.attach_file),
                onPressed: _pickAttachment,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
