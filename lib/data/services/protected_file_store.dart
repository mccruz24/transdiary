import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

/// Stores media in the app sandbox. Android-ready; iOS file protection via channel when available.
abstract class ProtectedFileStore {
  Future<String> saveMedia({
    required File source,
    required String subdirectory,
    String? preferredExtension,
  });

  Future<void> deleteIfExists(String? path);

  Future<void> deleteAllMedia();
}

class LocalProtectedFileStore implements ProtectedFileStore {
  LocalProtectedFileStore({Uuid? uuid}) : _uuid = uuid ?? const Uuid();

  final Uuid _uuid;

  Future<Directory> _mediaRoot() async {
    final docs = await getApplicationDocumentsDirectory();
    final root = Directory(p.join(docs.path, 'media'));
    if (!await root.exists()) {
      await root.create(recursive: true);
    }
    return root;
  }

  @override
  Future<String> saveMedia({
    required File source,
    required String subdirectory,
    String? preferredExtension,
  }) async {
    final root = await _mediaRoot();
    final dir = Directory(p.join(root.path, subdirectory));
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    final ext =
        preferredExtension ??
        p.extension(source.path).replaceFirst('.', '').ifEmpty('jpg');
    final destPath = p.join(dir.path, '${_uuid.v4()}.$ext');
    await source.copy(destPath);
    // Best-effort: attempt iOS file protection via method channel name reserved for later.
    return destPath;
  }

  @override
  Future<void> deleteIfExists(String? path) async {
    if (path == null || path.isEmpty) return;
    final file = File(path);
    if (await file.exists()) {
      await file.delete();
    }
  }

  @override
  Future<void> deleteAllMedia() async {
    final root = await _mediaRoot();
    if (await root.exists()) {
      await root.delete(recursive: true);
    }
  }
}

extension on String {
  String ifEmpty(String fallback) => isEmpty ? fallback : this;
}

/// JSON helpers for list columns stored as text.
List<String> decodeStringList(String raw) {
  try {
    final decoded = jsonDecode(raw);
    if (decoded is List) {
      return decoded.map((e) => e.toString()).toList();
    }
  } catch (_) {}
  return const [];
}

List<int> decodeIntList(String raw) {
  try {
    final decoded = jsonDecode(raw);
    if (decoded is List) {
      return decoded.map((e) => int.tryParse(e.toString()) ?? 0).toList();
    }
  } catch (_) {}
  return const [];
}

String encodeList(List<Object?> values) => jsonEncode(values);
