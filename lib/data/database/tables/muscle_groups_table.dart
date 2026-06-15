import 'package:drift/drift.dart';

/// MuscleGroups — hierarchical (parentId self-FK). See CLAUDE.md §7.
@DataClassName('MuscleGroupData')
class MuscleGroups extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()(); // e.g. 'Upper Chest', 'Quads'
  IntColumn get parentId => integer().nullable()(); // FK → muscle_groups.id
  TextColumn get bodyRegion =>
      text()(); // 'push'/'pull'/'legs'/'core'/'full'
  IntColumn get displayOrder => integer().withDefault(const Constant(0))();
}
