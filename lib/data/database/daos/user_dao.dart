import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/users_table.dart';

part 'user_dao.g.dart';

@DriftAccessor(tables: [Users])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  UserDao(super.db);

  Future<UserData?> getUserById(String id) =>
      (select(users)..where((u) => u.id.equals(id))).getSingleOrNull();

  Future<UserData?> getUserByFirebaseUid(String uid) =>
      (select(users)..where((u) => u.firebaseUid.equals(uid))).getSingleOrNull();

  Future<void> upsertUser(UsersCompanion user) =>
      into(users).insertOnConflictUpdate(user);
}
