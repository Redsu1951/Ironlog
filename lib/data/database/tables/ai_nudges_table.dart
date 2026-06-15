import 'package:drift/drift.dart';

/// AiNudges — persisted AI-generated messages (suggestions, warnings).
/// See CLAUDE.md §7.
@DataClassName('AiNudgeData')
class AiNudges extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text()();
  TextColumn get type => text()();
  // type: 'plan_suggestion'|'plateau_warning'|'safety_warning'|'goal_update'|'adhoc_nudge'
  TextColumn get message => text()(); // Full AI-generated message
  TextColumn get actionData =>
      text().withDefault(const Constant('{}'))(); // JSON extras
  BoolColumn get isDismissed => boolean().withDefault(const Constant(false))();
  IntColumn get createdAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
