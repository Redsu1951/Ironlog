import 'package:drift/drift.dart';

/// BodyMeasurements — periodic body metrics. See CLAUDE.md §7.
@DataClassName('BodyMeasurementData')
class BodyMeasurements extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text()();
  RealColumn get weightKg => real().nullable()();
  RealColumn get bodyFatPct => real().nullable()();
  RealColumn get chestCm => real().nullable()();
  RealColumn get waistCm => real().nullable()();
  RealColumn get hipsCm => real().nullable()();
  RealColumn get bicepCm => real().nullable()();
  RealColumn get thighCm => real().nullable()();
  TextColumn get notes => text().withDefault(const Constant(''))();
  IntColumn get measuredAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
