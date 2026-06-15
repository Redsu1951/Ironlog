import 'package:drift/drift.dart';

/// Exercises — seeded from wger. JSON-encoded list columns stored as TEXT.
/// See CLAUDE.md §7.
@DataClassName('ExerciseData')
class Exercises extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get wgerId => integer().nullable()(); // Source ID from wger API
  TextColumn get name => text()();
  TextColumn get description => text().withDefault(const Constant(''))();
  IntColumn get primaryMuscleId => integer()(); // FK → muscle_groups.id
  TextColumn get secondaryMuscleIds =>
      text().withDefault(const Constant('[]'))(); // JSON int array
  TextColumn get equipment =>
      text().withDefault(const Constant('[]'))(); // JSON string array
  TextColumn get category => text().withDefault(const Constant(''))();
  BoolColumn get isCustom => boolean().withDefault(const Constant(false))();
  TextColumn get instructions => text().withDefault(const Constant(''))();
  TextColumn get aliases =>
      text().withDefault(const Constant('[]'))(); // Alternate names
  IntColumn get createdAt => integer()();
}
