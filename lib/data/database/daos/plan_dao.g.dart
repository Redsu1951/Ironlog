// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_dao.dart';

// ignore_for_file: type=lint
mixin _$PlanDaoMixin on DatabaseAccessor<AppDatabase> {
  $WorkoutPlansTable get workoutPlans => attachedDatabase.workoutPlans;
  $WorkoutPlanDaysTable get workoutPlanDays => attachedDatabase.workoutPlanDays;
  PlanDaoManager get managers => PlanDaoManager(this);
}

class PlanDaoManager {
  final _$PlanDaoMixin _db;
  PlanDaoManager(this._db);
  $$WorkoutPlansTableTableManager get workoutPlans =>
      $$WorkoutPlansTableTableManager(_db.attachedDatabase, _db.workoutPlans);
  $$WorkoutPlanDaysTableTableManager get workoutPlanDays =>
      $$WorkoutPlanDaysTableTableManager(
          _db.attachedDatabase, _db.workoutPlanDays);
}
