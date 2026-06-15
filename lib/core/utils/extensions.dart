extension DateTimeExtensions on DateTime {
  DateTime get startOfDay => DateTime(year, month, day);

  /// Monday 00:00 of the ISO week containing this instant.
  DateTime get startOfWeek {
    final d = startOfDay;
    return d.subtract(Duration(days: d.weekday - 1));
  }

  /// Human-readable label for workout lists: "Today", "Yesterday", or "Jun 14".
  String get workoutLabel {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final d = DateTime(year, month, day);
    if (d == today) return 'Today';
    if (d == today.subtract(const Duration(days: 1))) return 'Yesterday';
    return '${_month[month - 1]} $day';
  }

  static const _month = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
  ];
}

extension StringExtensions on String {
  String get capitalizeFirst =>
      isEmpty ? '' : '${this[0].toUpperCase()}${substring(1)}';

  String get titleCase =>
      split(' ').map((w) => w.capitalizeFirst).join(' ');

  bool get isBlank => trim().isEmpty;
}

extension NumExtensions on num {
  /// "100" or "100.5" — no trailing zero for whole numbers.
  String get compact {
    final d = toDouble();
    return d == d.roundToDouble() ? toStringAsFixed(0) : toStringAsFixed(1);
  }
}

extension ListExtensions<T> on List<T> {
  T? get firstOrNull => isEmpty ? null : first;
  T? get lastOrNull => isEmpty ? null : last;
}
