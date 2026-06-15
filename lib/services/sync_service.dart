import 'package:firebase_storage/firebase_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core/constants/app_constants.dart';
import '../data/datasources/remote/firebase_datasource.dart';
import '../data/repositories/sync_repository_impl.dart';

part 'sync_service.g.dart';

enum SyncStatus { idle, syncing, success, error }

class SyncState {
  const SyncState({
    this.status = SyncStatus.idle,
    this.lastSyncAt,
    this.error,
  });

  final SyncStatus status;
  final DateTime? lastSyncAt;
  final String? error;
}

@Riverpod(keepAlive: true)
class SyncNotifier extends _$SyncNotifier {
  @override
  SyncState build() => const SyncState();

  Future<void> upload(String userId) async {
    if (!kFirebaseAvailable) {
      state = const SyncState(
        status: SyncStatus.error,
        error: 'Cloud sync requires Firebase — not configured on this build.',
      );
      return;
    }

    state = const SyncState(status: SyncStatus.syncing);
    try {
      await ref.read(syncRepositoryProvider).uploadDatabase(userId);
      final lastSync =
          await ref.read(syncRepositoryProvider).getLastSyncTime(userId);
      state = SyncState(status: SyncStatus.success, lastSyncAt: lastSync);
    } on FirebaseUnavailableException catch (e) {
      state = SyncState(status: SyncStatus.error, error: e.message);
    } on FirebaseException catch (e) {
      state = SyncState(
          status: SyncStatus.error, error: _storageMessage(e));
    } catch (e) {
      state = SyncState(
          status: SyncStatus.error,
          error: e.toString().split('\n').first);
    }
  }

  Future<void> download(String userId) async {
    if (!kFirebaseAvailable) {
      state = const SyncState(
        status: SyncStatus.error,
        error: 'Cloud sync requires Firebase — not configured on this build.',
      );
      return;
    }

    state = const SyncState(status: SyncStatus.syncing);
    try {
      await ref.read(syncRepositoryProvider).downloadDatabase(userId);
      state = const SyncState(status: SyncStatus.success, lastSyncAt: null);
    } on FirebaseUnavailableException catch (e) {
      state = SyncState(status: SyncStatus.error, error: e.message);
    } on FirebaseException catch (e) {
      state = SyncState(
          status: SyncStatus.error, error: _storageMessage(e));
    } catch (e) {
      state = SyncState(
          status: SyncStatus.error,
          error: e.toString().split('\n').first);
    }
  }

  /// Maps Firebase Storage error codes to user-readable messages.
  static String _storageMessage(FirebaseException e) {
    switch (e.code) {
      case 'object-not-found':
        return 'No backup found yet. Try "Backup Now" first.';
      case 'storage/object-not-found':
        return 'No backup found yet. Try "Backup Now" first.';
      case 'unauthorized':
      case 'storage/unauthorized':
        return 'Storage permission denied. Check Firebase Storage rules in your console.';
      case 'unauthenticated':
        return 'Please sign in before backing up.';
      case 'storage/quota-exceeded':
        return 'Firebase Storage quota exceeded. Check your Firebase plan.';
      default:
        // If the bucket doesn't exist yet, Storage returns odd errors.
        // Guide the user to enable it.
        return 'Storage error (${e.code}). Go to Firebase Console → Storage and '
            'click "Get Started" to enable it (free on Spark plan).';
    }
  }
}
