import 'package:drift/drift.dart';

/// Users — local profile. `firebaseUid` links to Google Sign-In when present.
/// See CLAUDE.md §7.
@DataClassName('UserData')
class Users extends Table {
  TextColumn get id => text()(); // UUID v4 PRIMARY KEY
  TextColumn get firebaseUid => text().nullable()();
  TextColumn get name => text()();
  IntColumn get age => integer().nullable()();
  RealColumn get weightKg => real().nullable()();
  RealColumn get heightCm => real().nullable()();
  TextColumn get goalDescription => text().nullable()();
  RealColumn get goalWeightKg => real().nullable()();
  TextColumn get preferredUnit =>
      text().withDefault(const Constant('kg'))(); // 'kg' | 'lbs'
  TextColumn get themeMode => text().withDefault(const Constant('dark'))();
  TextColumn get customAccentHex => text().nullable()(); // e.g. '#E8FF47'
  IntColumn get frameRateCap =>
      integer().withDefault(const Constant(120))(); // 60/90/120/144
  IntColumn get createdAt => integer()(); // Unix ms
  IntColumn get updatedAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
