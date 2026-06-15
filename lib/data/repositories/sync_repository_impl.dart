import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/constants/app_constants.dart';
import '../../data/datasources/remote/firebase_datasource.dart';
import '../../domain/repositories/sync_repository.dart';

part 'sync_repository_impl.g.dart';

class SyncRepositoryImpl implements SyncRepository {
  const SyncRepositoryImpl(this._datasource);
  final FirebaseDatasource _datasource;

  @override
  Future<void> uploadDatabase(String userId) async {
    _requireFirebase();
    final dbFile = await _dbFile();
    await _datasource.uploadDatabase(userId, dbFile);
  }

  @override
  Future<void> downloadDatabase(String userId) async {
    _requireFirebase();
    final dbFile = await _dbFile();
    await _datasource.downloadDatabase(userId, dbFile);
  }

  @override
  Future<DateTime?> getLastSyncTime(String userId) async {
    if (!kFirebaseAvailable) return null;
    return _datasource.getLastSyncTime(userId);
  }

  @override
  Future<bool> hasRemoteBackup(String userId) async {
    if (!kFirebaseAvailable) return false;
    return _datasource.hasRemoteBackup(userId);
  }

  void _requireFirebase() {
    if (!kFirebaseAvailable) {
      throw const FirebaseUnavailableException(
          'Cannot sync — Firebase not configured.');
    }
  }

  static Future<File> _dbFile() async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/ironlog.db');
  }
}

@riverpod
SyncRepository syncRepository(Ref ref) =>
    SyncRepositoryImpl(const FirebaseDatasource());
