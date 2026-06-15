// Pure Dart — zero Flutter / Firebase imports (CLAUDE.md §6).
class MuscleGroup {
  const MuscleGroup({
    required this.id,
    required this.name,
    required this.bodyRegion,
    this.parentId,
    this.displayOrder = 0,
  });

  final int id;
  final String name;
  final int? parentId;
  final String bodyRegion;
  final int displayOrder;

  bool get isRoot => parentId == null;

  @override
  bool operator ==(Object other) => other is MuscleGroup && other.id == id;

  @override
  int get hashCode => id.hashCode;
}
