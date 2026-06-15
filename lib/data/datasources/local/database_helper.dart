import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../database/app_database.dart';

part 'database_helper.g.dart';

/// On-disk SQLite filename (git-ignored — see CLAUDE.md §16).
const String kDatabaseFileName = 'ironlog.db';

/// Resolves the database file path under the app documents directory.
Future<File> databaseFile() async {
  final dir = await getApplicationDocumentsDirectory();
  return File(p.join(dir.path, kDatabaseFileName));
}

/// Opens the Drift connection lazily on a background isolate, enabling WAL
/// journal mode for write throughput and foreign-key enforcement.
QueryExecutor openConnection() {
  return LazyDatabase(() async {
    final file = await databaseFile();
    return NativeDatabase.createInBackground(
      file,
      setup: (raw) {
        raw.execute('PRAGMA journal_mode=WAL;');
        raw.execute('PRAGMA foreign_keys=ON;');
      },
    );
  });
}

/// Global, app-lifetime database instance. Kept alive (not autoDispose) per
/// CLAUDE.md §10 — it is a true singleton resource.
@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) {
  final db = AppDatabase(openConnection());
  ref.onDispose(db.close);
  return db;
}
