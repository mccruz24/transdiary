import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:transition_journal/app/providers.dart';
import 'package:transition_journal/core/theme/tj_theme.dart';
import 'package:transition_journal/core/utils/reminder_scheduler.dart';
import 'package:transition_journal/core/widgets/tj_widgets.dart';
import 'package:transition_journal/domain/models/models.dart';
import 'package:uuid/uuid.dart';

class JournalScreen extends ConsumerStatefulWidget {
  const JournalScreen({super.key});

  @override
  ConsumerState<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends ConsumerState<JournalScreen>
    with SingleTickerProviderStateMixin {
  late final _tabs = TabController(length: 2, vsync: this);

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Journal'),
        bottom: TabBar(
          controller: _tabs,
          tabs: const [
            Tab(text: 'Feelings'),
            Tab(text: 'Photos'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabs,
        children: const [_FeelingsTab(), _PhotosTab()],
      ),
    );
  }
}

class _FeelingsTab extends ConsumerWidget {
  const _FeelingsTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final diary = ref.watch(diaryProvider);
    return diary.when(
      loading: () => const TjLoading(),
      error: (_, __) => const Center(child: Text('Could not load diary.')),
      data: (entries) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'One entry per day. Reflections only—no medical interpretation.',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  FilledButton.tonal(
                    onPressed: () => _openEditor(context, ref),
                    child: const Text('Today'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: entries.isEmpty
                  ? TjEmptyState(
                      title: 'No diary entries',
                      message:
                          'Write how you feel, add optional mood and tags.',
                      actionLabel: 'Write today',
                      onAction: () => _openEditor(context, ref),
                      icon: Icons.edit_note_outlined,
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: entries.length,
                      itemBuilder: (context, i) {
                        final e = entries[i];
                        return Card(
                          elevation: 0,
                          color: context.tjColors.surfaceElevated.withValues(
                            alpha: 0.75,
                          ),
                          margin: const EdgeInsets.only(bottom: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: ListTile(
                            title: Text(DateFormat.yMMMEd().format(e.date)),
                            subtitle: Text(
                              [
                                if (e.moodScore != null)
                                  'Mood ${e.moodScore}/5',
                                if (e.text?.isNotEmpty ?? false) e.text!,
                              ].join(' · '),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            onTap: () => _openEditor(context, ref, existing: e),
                          ),
                        );
                      },
                    ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _openEditor(
    BuildContext context,
    WidgetRef ref, {
    DiaryEntry? existing,
  }) async {
    await Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => DiaryEditorScreen(existing: existing)),
    );
  }
}

class DiaryEditorScreen extends ConsumerStatefulWidget {
  const DiaryEditorScreen({super.key, this.existing, this.initialDate});
  final DiaryEntry? existing;
  final DateTime? initialDate;

  @override
  ConsumerState<DiaryEditorScreen> createState() => _DiaryEditorScreenState();
}

class _DiaryEditorScreenState extends ConsumerState<DiaryEditorScreen> {
  late DateTime _date =
      widget.existing?.date ?? widget.initialDate ?? DateTime.now();
  late int? _mood = widget.existing?.moodScore;
  late final _text = TextEditingController(text: widget.existing?.text ?? '');
  late final _tags = TextEditingController(
    text: widget.existing?.tags.join(', ') ?? '',
  );

  @override
  void dispose() {
    _text.dispose();
    _tags.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final now = DateTime.now();
    final tags = _tags.text
        .split(',')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();
    final entry = DiaryEntry(
      id: widget.existing?.id ?? const Uuid().v4(),
      date: DateTime(_date.year, _date.month, _date.day),
      moodScore: _mood,
      tags: tags,
      text: _text.text.trim().isEmpty ? null : _text.text.trim(),
      createdAt: widget.existing?.createdAt ?? now,
      updatedAt: now,
    );
    await ref.read(repositoriesProvider).upsertDiary(entry);
    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feelings diary'),
        actions: [
          if (widget.existing != null)
            IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () async {
                final ok = await TjConfirmDialog.show(
                  context,
                  title: 'Delete entry?',
                  message: 'This cannot be undone.',
                  confirmLabel: 'Delete',
                  isDestructive: true,
                );
                if (!ok) return;
                await ref
                    .read(repositoriesProvider)
                    .deleteDiary(widget.existing!.id);
                if (mounted) Navigator.pop(context);
              },
            ),
          TextButton(onPressed: _save, child: const Text('Save')),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Date'),
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
          Text(
            'Mood (optional)',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: [
              for (var i = 1; i <= 5; i++)
                ChoiceChip(
                  label: Text('$i'),
                  selected: _mood == i,
                  onSelected: (s) => setState(() => _mood = s ? i : null),
                ),
            ],
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _tags,
            decoration: const InputDecoration(
              labelText: 'Tags (comma separated)',
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _text,
            decoration: const InputDecoration(
              labelText: 'How are you feeling?',
            ),
            maxLines: 8,
            textCapitalization: TextCapitalization.sentences,
          ),
        ],
      ),
    );
  }
}

class _PhotosTab extends ConsumerStatefulWidget {
  const _PhotosTab();

  @override
  ConsumerState<_PhotosTab> createState() => _PhotosTabState();
}

class _PhotosTabState extends ConsumerState<_PhotosTab> {
  String _tagFilter = '';

  @override
  Widget build(BuildContext context) {
    final photos = ref.watch(photosProvider);
    return photos.when(
      loading: () => const TjLoading(),
      error: (_, __) => const Center(child: Text('Could not load photos.')),
      data: (items) {
        final filtered = _tagFilter.trim().isEmpty
            ? items
            : items
                  .where(
                    (p) => p.tags.any(
                      (t) => t.toLowerCase().contains(
                        _tagFilter.trim().toLowerCase(),
                      ),
                    ),
                  )
                  .toList();
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'Filter by tag',
                        prefixIcon: Icon(Icons.filter_list),
                        isDense: true,
                      ),
                      onChanged: (v) => setState(() => _tagFilter = v),
                    ),
                  ),
                  const SizedBox(width: 8),
                  FilledButton(
                    onPressed: () => _addPhoto(context),
                    child: const Text('Add'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: filtered.isEmpty
                  ? TjEmptyState(
                      title: 'No photos yet',
                      message: 'Capture or choose a photo. Nothing is uploaded or analyzed.',
                      actionLabel: 'Add photo',
                      onAction: () => _addPhoto(context),
                      icon: Icons.photo_outlined,
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.all(16),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 0.78,
                          ),
                      itemCount: filtered.length,
                      itemBuilder: (context, i) {
                        final p = filtered[i];
                        return InkWell(
                          onTap: () => _openViewer(context, filtered, i),
                          borderRadius: BorderRadius.circular(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(14),
                                  child: Image.file(
                                    File(p.photoLocalPath),
                                    fit: BoxFit.cover,
                                    errorBuilder: (_, __, ___) => ColoredBox(
                                      color: context.tjColors.mist,
                                      child: const Icon(
                                        Icons.broken_image_outlined,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                DateFormat.yMMMd().format(p.date),
                                maxLines: 1,
                              ),
                              if (p.journeyDayNumber != null)
                                Text(
                                  'Day ${p.journeyDayNumber}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium,
                                ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _addPhoto(BuildContext context) async {
    final source = await showModalBottomSheet<ImageSource>(
      context: context,
      showDragHandle: true,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: const Text('Choose from library'),
              onTap: () => Navigator.pop(context, ImageSource.gallery),
            ),
            ListTile(
              leading: const Icon(Icons.photo_camera_outlined),
              title: const Text('Take photo'),
              onTap: () => Navigator.pop(context, ImageSource.camera),
            ),
          ],
        ),
      ),
    );
    if (source == null) return;
    final picker = ImagePicker();
    final file = await picker.pickImage(source: source, imageQuality: 88);
    if (file == null || !context.mounted) return;
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => PhotoEditorScreen(sourcePath: file.path),
      ),
    );
  }

  void _openViewer(BuildContext context, List<PhotoEntry> items, int index) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => PhotoViewerScreen(entries: items, initialIndex: index),
      ),
    );
  }
}

class PhotoEditorScreen extends ConsumerStatefulWidget {
  const PhotoEditorScreen({super.key, this.sourcePath, this.existing});
  final String? sourcePath;
  final PhotoEntry? existing;

  @override
  ConsumerState<PhotoEditorScreen> createState() => _PhotoEditorScreenState();
}

class _PhotoEditorScreenState extends ConsumerState<PhotoEditorScreen> {
  late DateTime _date = widget.existing?.date ?? DateTime.now();
  late final _caption = TextEditingController(
    text: widget.existing?.caption ?? '',
  );
  late final _tags = TextEditingController(
    text: widget.existing?.tags.join(', ') ?? '',
  );

  @override
  void dispose() {
    _caption.dispose();
    _tags.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final repos = ref.read(repositoriesProvider);
    final journey = await repos.journeyStartDate;
    final now = DateTime.now();
    String path = widget.existing?.photoLocalPath ?? '';
    if (widget.sourcePath != null) {
      path = await ref
          .read(fileStoreProvider)
          .saveMedia(source: File(widget.sourcePath!), subdirectory: 'photos');
    }
    final day = DateTime(_date.year, _date.month, _date.day);
    final entry = PhotoEntry(
      id: widget.existing?.id ?? const Uuid().v4(),
      photoLocalPath: path,
      date: day,
      hrtStartDateReference: journey,
      journeyDayNumber: ReminderScheduler.journeyDayNumber(
        entryDate: day,
        hrtStartDate: journey,
      ),
      caption: _caption.text.trim().isEmpty ? null : _caption.text.trim(),
      tags: _tags.text
          .split(',')
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty)
          .toList(),
      createdAt: widget.existing?.createdAt ?? now,
      updatedAt: now,
    );
    await repos.upsertPhoto(entry);
    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final previewPath = widget.sourcePath ?? widget.existing?.photoLocalPath;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.existing == null ? 'New photo' : 'Edit photo'),
        actions: [TextButton(onPressed: _save, child: const Text('Save'))],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (previewPath != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.file(File(previewPath), fit: BoxFit.cover),
              ),
            ),
          const SizedBox(height: 12),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Date'),
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
          TextField(
            controller: _caption,
            decoration: const InputDecoration(labelText: 'Caption (optional)'),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _tags,
            decoration: const InputDecoration(
              labelText: 'Tags (comma separated)',
            ),
          ),
        ],
      ),
    );
  }
}

class PhotoViewerScreen extends ConsumerWidget {
  const PhotoViewerScreen({
    super.key,
    required this.entries,
    required this.initialIndex,
  });

  final List<PhotoEntry> entries;
  final int initialIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = PageController(initialPage: initialIndex);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text('Photo'),
      ),
      body: PageView.builder(
        controller: controller,
        itemCount: entries.length,
        itemBuilder: (context, i) {
          final p = entries[i];
          return Column(
            children: [
              Expanded(
                child: InteractiveViewer(
                  child: Center(
                    child: Image.file(
                      File(p.photoLocalPath),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.black87,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      [
                        DateFormat.yMMMEd().format(p.date),
                        if (p.journeyDayNumber != null)
                          'Day ${p.journeyDayNumber}',
                      ].join(' · '),
                      style: const TextStyle(color: Colors.white),
                    ),
                    if (p.caption?.isNotEmpty ?? false)
                      Text(
                        p.caption!,
                        style: const TextStyle(color: Colors.white70),
                      ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => PhotoEditorScreen(existing: p),
                              ),
                            );
                          },
                          child: const Text('Edit'),
                        ),
                        TextButton(
                          onPressed: () async {
                            final ok = await TjConfirmDialog.show(
                              context,
                              title: 'Delete photo?',
                              message: 'The photo file will be removed from this device.',
                              confirmLabel: 'Delete',
                              isDestructive: true,
                            );
                            if (!ok) return;
                            await ref
                                .read(repositoriesProvider)
                                .deletePhoto(p.id);
                            if (context.mounted) Navigator.pop(context);
                          },
                          child: const Text('Delete'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
