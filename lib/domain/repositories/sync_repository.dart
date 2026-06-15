abstract interface class SyncRepository {
  Future<void> uploadDatabase(String userId);
  Future<void> downloadDatabase(String userId);
  Future<DateTime?> getLastSyncTime(String userId);
  Future<bool> hasRemoteBackup(String userId);
}
