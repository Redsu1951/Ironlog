import '../repositories/sync_repository.dart';

class SyncDatabaseUseCase {
  const SyncDatabaseUseCase(this._repository);
  final SyncRepository _repository;

  Future<void> upload(String userId) => _repository.uploadDatabase(userId);
  Future<void> download(String userId) => _repository.downloadDatabase(userId);
  Future<bool> hasBackup(String userId) => _repository.hasRemoteBackup(userId);
  Future<DateTime?> lastSyncTime(String userId) =>
      _repository.getLastSyncTime(userId);
}
