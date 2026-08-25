import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as p;
import 'package:transition_journal/data/services/protected_file_store.dart';

class _FakeFileStore implements ProtectedFileStore {
  final deleted = <String?>[];
  bool deletedAll = false;

  @override
  Future<void> deleteAllMedia() async {
    deletedAll = true;
  }

  @override
  Future<void> deleteIfExists(String? path) async {
    deleted.add(path);
    if (path != null) {
      final f = File(path);
      if (await f.exists()) await f.delete();
    }
  }

  @override
  Future<String> saveMedia({
    required File source,
    required String subdirectory,
    String? preferredExtension,
  }) async {
    final dir = Directory.systemTemp.createTempSync('tj_media');
    final dest = File(p.join(dir.path, 'copy.jpg'));
    await source.copy(dest.path);
    return dest.path;
  }
}

void main() {
  test('deleteIfExists removes local file', () async {
    final store = _FakeFileStore();
    final temp = File('${Directory.systemTemp.path}/tj_cleanup_test.jpg')
      ..writeAsStringSync('photo');
    expect(await temp.exists(), isTrue);
    await store.deleteIfExists(temp.path);
    expect(await temp.exists(), isFalse);
    expect(store.deleted, [temp.path]);
  });

  test('deleteIfExists ignores null and missing paths', () async {
    final store = _FakeFileStore();
    await store.deleteIfExists(null);
    await store.deleteIfExists('/tmp/does_not_exist_tj.jpg');
    expect(store.deleted, [null, '/tmp/does_not_exist_tj.jpg']);
  });
}
