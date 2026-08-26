import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:transition_journal/domain/models/models.dart';

class ExportBundle {
  const ExportBundle({
    required this.regimens,
    required this.reminders,
    required this.doseLogs,
    required this.photoEntries,
    required this.diaryEntries,
    required this.bloodTestRecords,
  });

  final List<Regimen> regimens;
  final List<Reminder> reminders;
  final List<DoseLog> doseLogs;
  final List<PhotoEntry> photoEntries;
  final List<DiaryEntry> diaryEntries;
  final List<BloodTestRecord> bloodTestRecords;

  Map<String, dynamic> toJson() => {
    'exportedAt': DateTime.now().toIso8601String(),
    'app': 'Transition Journal',
    'version': 1,
    'regimens': regimens.map((e) => e.toJson()).toList(),
    'reminders': reminders.map((e) => e.toJson()).toList(),
    'doseLogs': doseLogs.map((e) => e.toJson()).toList(),
    'photoEntries': photoEntries.map((e) => e.toJson()).toList(),
    'diaryEntries': diaryEntries.map((e) => e.toJson()).toList(),
    'bloodTestRecords': bloodTestRecords.map((e) => e.toJson()).toList(),
  };
}

class ExportService {
  Future<File> writeJson(ExportBundle bundle) async {
    final dir = await getTemporaryDirectory();
    final file = File(
      p.join(
        dir.path,
        'transition_journal_export_${DateTime.now().millisecondsSinceEpoch}.json',
      ),
    );
    const encoder = JsonEncoder.withIndent('  ');
    await file.writeAsString(encoder.convert(bundle.toJson()));
    return file;
  }

  Future<File> writeCsv(ExportBundle bundle) async {
    final dir = await getTemporaryDirectory();
    final file = File(
      p.join(
        dir.path,
        'transition_journal_export_${DateTime.now().millisecondsSinceEpoch}.csv',
      ),
    );
    final buffer = StringBuffer();
    buffer.writeln('section,id,payload_json');
    void addSection(String section, List<Map<String, dynamic>> rows) {
      for (final row in rows) {
        final id = row['id'] ?? '';
        final payload = jsonEncode(row).replaceAll('"', '""');
        buffer.writeln('$section,$id,"$payload"');
      }
    }

    addSection('regimens', bundle.regimens.map((e) => e.toJson()).toList());
    addSection('reminders', bundle.reminders.map((e) => e.toJson()).toList());
    addSection('doseLogs', bundle.doseLogs.map((e) => e.toJson()).toList());
    addSection(
      'photoEntries',
      bundle.photoEntries.map((e) => e.toJson()).toList(),
    );
    addSection(
      'diaryEntries',
      bundle.diaryEntries.map((e) => e.toJson()).toList(),
    );
    addSection(
      'bloodTestRecords',
      bundle.bloodTestRecords.map((e) => e.toJson()).toList(),
    );

    await file.writeAsString(buffer.toString());
    return file;
  }

  Future<void> shareFile(File file) async {
    await SharePlus.instance.share(
      ShareParams(
        files: [XFile(file.path)],
        subject: 'Transition Journal export',
      ),
    );
  }
}
