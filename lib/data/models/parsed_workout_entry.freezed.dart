// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parsed_workout_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ParsedWorkoutEntry {
  String get exerciseName;
  int? get sets;
  int? get reps;
  double? get weight;
  String? get weightUnit; // 'lbs' | 'kg'
  String? get setType; // 'working' | 'warmup' | 'dropset' | 'amrap' | 'failure'
  double get confidence;
  bool get isRegexFallback;

  /// Create a copy of ParsedWorkoutEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ParsedWorkoutEntryCopyWith<ParsedWorkoutEntry> get copyWith =>
      _$ParsedWorkoutEntryCopyWithImpl<ParsedWorkoutEntry>(
          this as ParsedWorkoutEntry, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ParsedWorkoutEntry &&
            (identical(other.exerciseName, exerciseName) ||
                other.exerciseName == exerciseName) &&
            (identical(other.sets, sets) || other.sets == sets) &&
            (identical(other.reps, reps) || other.reps == reps) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.weightUnit, weightUnit) ||
                other.weightUnit == weightUnit) &&
            (identical(other.setType, setType) || other.setType == setType) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.isRegexFallback, isRegexFallback) ||
                other.isRegexFallback == isRegexFallback));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exerciseName, sets, reps, weight,
      weightUnit, setType, confidence, isRegexFallback);

  @override
  String toString() {
    return 'ParsedWorkoutEntry(exerciseName: $exerciseName, sets: $sets, reps: $reps, weight: $weight, weightUnit: $weightUnit, setType: $setType, confidence: $confidence, isRegexFallback: $isRegexFallback)';
  }
}

/// @nodoc
abstract mixin class $ParsedWorkoutEntryCopyWith<$Res> {
  factory $ParsedWorkoutEntryCopyWith(
          ParsedWorkoutEntry value, $Res Function(ParsedWorkoutEntry) _then) =
      _$ParsedWorkoutEntryCopyWithImpl;
  @useResult
  $Res call(
      {String exerciseName,
      int? sets,
      int? reps,
      double? weight,
      String? weightUnit,
      String? setType,
      double confidence,
      bool isRegexFallback});
}

/// @nodoc
class _$ParsedWorkoutEntryCopyWithImpl<$Res>
    implements $ParsedWorkoutEntryCopyWith<$Res> {
  _$ParsedWorkoutEntryCopyWithImpl(this._self, this._then);

  final ParsedWorkoutEntry _self;
  final $Res Function(ParsedWorkoutEntry) _then;

  /// Create a copy of ParsedWorkoutEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exerciseName = null,
    Object? sets = freezed,
    Object? reps = freezed,
    Object? weight = freezed,
    Object? weightUnit = freezed,
    Object? setType = freezed,
    Object? confidence = null,
    Object? isRegexFallback = null,
  }) {
    return _then(_self.copyWith(
      exerciseName: null == exerciseName
          ? _self.exerciseName
          : exerciseName // ignore: cast_nullable_to_non_nullable
              as String,
      sets: freezed == sets
          ? _self.sets
          : sets // ignore: cast_nullable_to_non_nullable
              as int?,
      reps: freezed == reps
          ? _self.reps
          : reps // ignore: cast_nullable_to_non_nullable
              as int?,
      weight: freezed == weight
          ? _self.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      weightUnit: freezed == weightUnit
          ? _self.weightUnit
          : weightUnit // ignore: cast_nullable_to_non_nullable
              as String?,
      setType: freezed == setType
          ? _self.setType
          : setType // ignore: cast_nullable_to_non_nullable
              as String?,
      confidence: null == confidence
          ? _self.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      isRegexFallback: null == isRegexFallback
          ? _self.isRegexFallback
          : isRegexFallback // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [ParsedWorkoutEntry].
extension ParsedWorkoutEntryPatterns on ParsedWorkoutEntry {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ParsedWorkoutEntry value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ParsedWorkoutEntry() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ParsedWorkoutEntry value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ParsedWorkoutEntry():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ParsedWorkoutEntry value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ParsedWorkoutEntry() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String exerciseName,
            int? sets,
            int? reps,
            double? weight,
            String? weightUnit,
            String? setType,
            double confidence,
            bool isRegexFallback)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ParsedWorkoutEntry() when $default != null:
        return $default(
            _that.exerciseName,
            _that.sets,
            _that.reps,
            _that.weight,
            _that.weightUnit,
            _that.setType,
            _that.confidence,
            _that.isRegexFallback);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String exerciseName,
            int? sets,
            int? reps,
            double? weight,
            String? weightUnit,
            String? setType,
            double confidence,
            bool isRegexFallback)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ParsedWorkoutEntry():
        return $default(
            _that.exerciseName,
            _that.sets,
            _that.reps,
            _that.weight,
            _that.weightUnit,
            _that.setType,
            _that.confidence,
            _that.isRegexFallback);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String exerciseName,
            int? sets,
            int? reps,
            double? weight,
            String? weightUnit,
            String? setType,
            double confidence,
            bool isRegexFallback)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ParsedWorkoutEntry() when $default != null:
        return $default(
            _that.exerciseName,
            _that.sets,
            _that.reps,
            _that.weight,
            _that.weightUnit,
            _that.setType,
            _that.confidence,
            _that.isRegexFallback);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ParsedWorkoutEntry implements ParsedWorkoutEntry {
  const _ParsedWorkoutEntry(
      {required this.exerciseName,
      this.sets,
      this.reps,
      this.weight,
      this.weightUnit,
      this.setType,
      required this.confidence,
      required this.isRegexFallback});

  @override
  final String exerciseName;
  @override
  final int? sets;
  @override
  final int? reps;
  @override
  final double? weight;
  @override
  final String? weightUnit;
// 'lbs' | 'kg'
  @override
  final String? setType;
// 'working' | 'warmup' | 'dropset' | 'amrap' | 'failure'
  @override
  final double confidence;
  @override
  final bool isRegexFallback;

  /// Create a copy of ParsedWorkoutEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ParsedWorkoutEntryCopyWith<_ParsedWorkoutEntry> get copyWith =>
      __$ParsedWorkoutEntryCopyWithImpl<_ParsedWorkoutEntry>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ParsedWorkoutEntry &&
            (identical(other.exerciseName, exerciseName) ||
                other.exerciseName == exerciseName) &&
            (identical(other.sets, sets) || other.sets == sets) &&
            (identical(other.reps, reps) || other.reps == reps) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.weightUnit, weightUnit) ||
                other.weightUnit == weightUnit) &&
            (identical(other.setType, setType) || other.setType == setType) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.isRegexFallback, isRegexFallback) ||
                other.isRegexFallback == isRegexFallback));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exerciseName, sets, reps, weight,
      weightUnit, setType, confidence, isRegexFallback);

  @override
  String toString() {
    return 'ParsedWorkoutEntry(exerciseName: $exerciseName, sets: $sets, reps: $reps, weight: $weight, weightUnit: $weightUnit, setType: $setType, confidence: $confidence, isRegexFallback: $isRegexFallback)';
  }
}

/// @nodoc
abstract mixin class _$ParsedWorkoutEntryCopyWith<$Res>
    implements $ParsedWorkoutEntryCopyWith<$Res> {
  factory _$ParsedWorkoutEntryCopyWith(
          _ParsedWorkoutEntry value, $Res Function(_ParsedWorkoutEntry) _then) =
      __$ParsedWorkoutEntryCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String exerciseName,
      int? sets,
      int? reps,
      double? weight,
      String? weightUnit,
      String? setType,
      double confidence,
      bool isRegexFallback});
}

/// @nodoc
class __$ParsedWorkoutEntryCopyWithImpl<$Res>
    implements _$ParsedWorkoutEntryCopyWith<$Res> {
  __$ParsedWorkoutEntryCopyWithImpl(this._self, this._then);

  final _ParsedWorkoutEntry _self;
  final $Res Function(_ParsedWorkoutEntry) _then;

  /// Create a copy of ParsedWorkoutEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? exerciseName = null,
    Object? sets = freezed,
    Object? reps = freezed,
    Object? weight = freezed,
    Object? weightUnit = freezed,
    Object? setType = freezed,
    Object? confidence = null,
    Object? isRegexFallback = null,
  }) {
    return _then(_ParsedWorkoutEntry(
      exerciseName: null == exerciseName
          ? _self.exerciseName
          : exerciseName // ignore: cast_nullable_to_non_nullable
              as String,
      sets: freezed == sets
          ? _self.sets
          : sets // ignore: cast_nullable_to_non_nullable
              as int?,
      reps: freezed == reps
          ? _self.reps
          : reps // ignore: cast_nullable_to_non_nullable
              as int?,
      weight: freezed == weight
          ? _self.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      weightUnit: freezed == weightUnit
          ? _self.weightUnit
          : weightUnit // ignore: cast_nullable_to_non_nullable
              as String?,
      setType: freezed == setType
          ? _self.setType
          : setType // ignore: cast_nullable_to_non_nullable
              as String?,
      confidence: null == confidence
          ? _self.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      isRegexFallback: null == isRegexFallback
          ? _self.isRegexFallback
          : isRegexFallback // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
