import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

/// Firebase Storage + Firestore datasource for the SQLite backup/restore flow.
/// All methods throw [FirebaseUnavailableException] when Firebase has not been
/// initialised (i.e. [kFirebaseAvailable] is false — no google-services.json).
///
/// The caller (SyncRepositoryImpl) is responsible for checking availability
/// before calling; these methods do NOT silently swallow errors.
class FirebaseDatasource {
  const FirebaseDatasource();

  /// Gzip-compress and upload [dbFile] to
  /// `gs://ironlog-app/{uid}/backups/ironlog.db`.
  Future<void> uploadDatabase(String userId, File dbFile) async {
    final bytes = await dbFile.readAsBytes();
    final gzipped = gzip.encode(bytes);

    final ref = FirebaseStorage.instance.ref('$userId/backups/ironlog.db');
    await ref.putData(
      Uint8List.fromList(gzipped),
      SettableMetadata(
          contentEncoding: 'gzip',
          contentType: 'application/octet-stream'),
    );

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('metadata')
        .doc('sync')
        .set({
      'lastSyncAt': FieldValue.serverTimestamp(),
      'deviceModel': Platform.operatingSystem,
    }, SetOptions(merge: true));
  }

  /// Download and decompress the remote backup into [destFile].
  Future<void> downloadDatabase(String userId, File destFile) async {
    final ref = FirebaseStorage.instance.ref('$userId/backups/ironlog.db');
    final gzipped = await ref.getData();
    if (gzipped == null) {
      throw const FirebaseUnavailableException('No backup found');
    }
    final bytes = gzip.decode(gzipped);
    await destFile.writeAsBytes(bytes, flush: true);
  }

  /// Returns the timestamp of the last successful sync, or null if none.
  Future<DateTime?> getLastSyncTime(String userId) async {
    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('metadata')
        .doc('sync')
        .get();
    final ts = doc.data()?['lastSyncAt'] as Timestamp?;
    return ts?.toDate();
  }

  /// Returns true if a backup file exists in Firebase Storage.
  Future<bool> hasRemoteBackup(String userId) async {
    try {
      final ref = FirebaseStorage.instance.ref('$userId/backups/ironlog.db');
      await ref.getMetadata();
      return true;
    } on FirebaseException {
      return false;
    }
  }
}

class FirebaseUnavailableException implements Exception {
  const FirebaseUnavailableException([this.message = 'Firebase not available']);
  final String message;

  @override
  String toString() => 'FirebaseUnavailableException: $message';
}
