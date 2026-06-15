// Pure Dart — zero Flutter / Firebase imports (CLAUDE.md §6).
class Workout {
  const Workout({
    required this.id,
    required this.userId,
    required this.name,
    required this.startedAt,
    this.planId,
    this.planDayId,
    this.endedAt,
    this.notes = '',
    this.totalVolumeKg = 0.0,
    this.isAdHoc = false,
  });

  final String id;
  final String userId;
  final String? planId;
  final int? planDayId;
  final String name;
  final DateTime startedAt;
  final DateTime? endedAt;
  final String notes;
  final double totalVolumeKg;
  final bool isAdHoc;

  bool get isComplete => endedAt != null;

  Duration get elapsed => endedAt != null
      ? endedAt!.difference(startedAt)
      : DateTime.now().difference(startedAt);

  @override
  bool operator ==(Object other) => other is Workout && other.id == id;

  @override
  int get hashCode => id.hashCode;
}
