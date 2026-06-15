import 'package:drift/drift.dart';

/// WorkoutPlans — a named weekly split. Exactly one may be active per user.
/// See CLAUDE.md §7.
@DataClassName('WorkoutPlanData')
class WorkoutPlans extends Table {
  TextColumn get id => text()(); // UUID
  TextColumn get userId => text()(); // FK → users.id
  TextColumn get name => text()(); // e.g. 'My PPL Split'
  TextColumn get description => text().withDefault(const Constant(''))();
  BoolColumn get isActive => boolean().withDefault(const Constant(false))();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
