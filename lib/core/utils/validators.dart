/// Form-field validators used across the onboarding and workout screens.
abstract final class Validators {
  static String? reps(String? v) {
    if (v == null || v.isEmpty) return 'Required';
    final n = int.tryParse(v);
    if (n == null || n <= 0) return 'Must be > 0';
    return null;
  }

  static String? weight(String? v) {
    if (v == null || v.isEmpty) return 'Required';
    final n = double.tryParse(v);
    if (n == null || n < 0) return 'Must be ≥ 0';
    return null;
  }

  static String? nonEmpty(String? v, [String label = 'Field']) {
    if (v == null || v.trim().isEmpty) return '$label is required';
    return null;
  }

  static String? age(String? v) {
    if (v == null || v.isEmpty) return null;
    final n = int.tryParse(v);
    if (n == null || n < 10 || n > 100) return 'Age must be 10–100';
    return null;
  }

  static String? bodyWeight(String? v) {
    if (v == null || v.isEmpty) return null;
    final n = double.tryParse(v);
    if (n == null || n < 20 || n > 400) return 'Enter a valid weight';
    return null;
  }
}
