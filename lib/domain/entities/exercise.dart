// Pure Dart — zero Flutter / Firebase imports (CLAUDE.md §6).
class Exercise {
  const Exercise({
    required this.id,
    required this.name,
    required this.primaryMuscleId,
    this.wgerId,
    this.description = '',
    this.secondaryMuscleIds = const [],
    this.equipment = const [],
    this.category = '',
    this.isCustom = false,
    this.instructions = '',
    this.aliases = const [],
  });

  final int id;
  final int? wgerId;
  final String name;
  final String description;
  final int primaryMuscleId;
  final List<int> secondaryMuscleIds;
  final List<String> equipment;
  final String category;
  final bool isCustom;
  final String instructions;
  final List<String> aliases;

  @override
  bool operator ==(Object other) => other is Exercise && other.id == id;

  @override
  int get hashCode => id.hashCode;
}
