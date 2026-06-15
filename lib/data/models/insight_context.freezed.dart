// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'insight_context.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InsightContext {
  String get goalDescription;
  int get weeksTraining;
  String get weeklyJson;
  double get totalVolumeThisWeek;
  double get totalVolumeLastWeek;
  String get unit;
  Map<String, double> get volumeByMuscle;

  /// Create a copy of InsightContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InsightContextCopyWith<InsightContext> get copyWith =>
      _$InsightContextCopyWithImpl<InsightContext>(
          this as InsightContext, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InsightContext &&
            (identical(other.goalDescription, goalDescription) ||
                other.goalDescription == goalDescription) &&
            (identical(other.weeksTraining, weeksTraining) ||
                other.weeksTraining == weeksTraining) &&
            (identical(other.weeklyJson, weeklyJson) ||
                other.weeklyJson == weeklyJson) &&
            (identical(other.totalVolumeThisWeek, totalVolumeThisWeek) ||
                other.totalVolumeThisWeek == totalVolumeThisWeek) &&
            (identical(other.totalVolumeLastWeek, totalVolumeLastWeek) ||
                other.totalVolumeLastWeek == totalVolumeLastWeek) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            const DeepCollectionEquality()
                .equals(other.volumeByMuscle, volumeByMuscle));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      goalDescription,
      weeksTraining,
      weeklyJson,
      totalVolumeThisWeek,
      totalVolumeLastWeek,
      unit,
      const DeepCollectionEquality().hash(volumeByMuscle));

  @override
  String toString() {
    return 'InsightContext(goalDescription: $goalDescription, weeksTraining: $weeksTraining, weeklyJson: $weeklyJson, totalVolumeThisWeek: $totalVolumeThisWeek, totalVolumeLastWeek: $totalVolumeLastWeek, unit: $unit, volumeByMuscle: $volumeByMuscle)';
  }
}

/// @nodoc
abstract mixin class $InsightContextCopyWith<$Res> {
  factory $InsightContextCopyWith(
          InsightContext value, $Res Function(InsightContext) _then) =
      _$InsightContextCopyWithImpl;
  @useResult
  $Res call(
      {String goalDescription,
      int weeksTraining,
      String weeklyJson,
      double totalVolumeThisWeek,
      double totalVolumeLastWeek,
      String unit,
      Map<String, double> volumeByMuscle});
}

/// @nodoc
class _$InsightContextCopyWithImpl<$Res>
    implements $InsightContextCopyWith<$Res> {
  _$InsightContextCopyWithImpl(this._self, this._then);

  final InsightContext _self;
  final $Res Function(InsightContext) _then;

  /// Create a copy of InsightContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? goalDescription = null,
    Object? weeksTraining = null,
    Object? weeklyJson = null,
    Object? totalVolumeThisWeek = null,
    Object? totalVolumeLastWeek = null,
    Object? unit = null,
    Object? volumeByMuscle = null,
  }) {
    return _then(_self.copyWith(
      goalDescription: null == goalDescription
          ? _self.goalDescription
          : goalDescription // ignore: cast_nullable_to_non_nullable
              as String,
      weeksTraining: null == weeksTraining
          ? _self.weeksTraining
          : weeksTraining // ignore: cast_nullable_to_non_nullable
              as int,
      weeklyJson: null == weeklyJson
          ? _self.weeklyJson
          : weeklyJson // ignore: cast_nullable_to_non_nullable
              as String,
      totalVolumeThisWeek: null == totalVolumeThisWeek
          ? _self.totalVolumeThisWeek
          : totalVolumeThisWeek // ignore: cast_nullable_to_non_nullable
              as double,
      totalVolumeLastWeek: null == totalVolumeLastWeek
          ? _self.totalVolumeLastWeek
          : totalVolumeLastWeek // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _self.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      volumeByMuscle: null == volumeByMuscle
          ? _self.volumeByMuscle
          : volumeByMuscle // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
    ));
  }
}

/// Adds pattern-matching-related methods to [InsightContext].
extension InsightContextPatterns on InsightContext {
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
    TResult Function(_InsightContext value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InsightContext() when $default != null:
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
    TResult Function(_InsightContext value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InsightContext():
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
    TResult? Function(_InsightContext value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InsightContext() when $default != null:
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
            String goalDescription,
            int weeksTraining,
            String weeklyJson,
            double totalVolumeThisWeek,
            double totalVolumeLastWeek,
            String unit,
            Map<String, double> volumeByMuscle)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InsightContext() when $default != null:
        return $default(
            _that.goalDescription,
            _that.weeksTraining,
            _that.weeklyJson,
            _that.totalVolumeThisWeek,
            _that.totalVolumeLastWeek,
            _that.unit,
            _that.volumeByMuscle);
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
            String goalDescription,
            int weeksTraining,
            String weeklyJson,
            double totalVolumeThisWeek,
            double totalVolumeLastWeek,
            String unit,
            Map<String, double> volumeByMuscle)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InsightContext():
        return $default(
            _that.goalDescription,
            _that.weeksTraining,
            _that.weeklyJson,
            _that.totalVolumeThisWeek,
            _that.totalVolumeLastWeek,
            _that.unit,
            _that.volumeByMuscle);
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
            String goalDescription,
            int weeksTraining,
            String weeklyJson,
            double totalVolumeThisWeek,
            double totalVolumeLastWeek,
            String unit,
            Map<String, double> volumeByMuscle)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InsightContext() when $default != null:
        return $default(
            _that.goalDescription,
            _that.weeksTraining,
            _that.weeklyJson,
            _that.totalVolumeThisWeek,
            _that.totalVolumeLastWeek,
            _that.unit,
            _that.volumeByMuscle);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _InsightContext implements InsightContext {
  const _InsightContext(
      {required this.goalDescription,
      required this.weeksTraining,
      required this.weeklyJson,
      this.totalVolumeThisWeek = 0.0,
      this.totalVolumeLastWeek = 0.0,
      this.unit = 'kg',
      final Map<String, double> volumeByMuscle = const <String, double>{}})
      : _volumeByMuscle = volumeByMuscle;

  @override
  final String goalDescription;
  @override
  final int weeksTraining;
  @override
  final String weeklyJson;
  @override
  @JsonKey()
  final double totalVolumeThisWeek;
  @override
  @JsonKey()
  final double totalVolumeLastWeek;
  @override
  @JsonKey()
  final String unit;
  final Map<String, double> _volumeByMuscle;
  @override
  @JsonKey()
  Map<String, double> get volumeByMuscle {
    if (_volumeByMuscle is EqualUnmodifiableMapView) return _volumeByMuscle;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_volumeByMuscle);
  }

  /// Create a copy of InsightContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InsightContextCopyWith<_InsightContext> get copyWith =>
      __$InsightContextCopyWithImpl<_InsightContext>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InsightContext &&
            (identical(other.goalDescription, goalDescription) ||
                other.goalDescription == goalDescription) &&
            (identical(other.weeksTraining, weeksTraining) ||
                other.weeksTraining == weeksTraining) &&
            (identical(other.weeklyJson, weeklyJson) ||
                other.weeklyJson == weeklyJson) &&
            (identical(other.totalVolumeThisWeek, totalVolumeThisWeek) ||
                other.totalVolumeThisWeek == totalVolumeThisWeek) &&
            (identical(other.totalVolumeLastWeek, totalVolumeLastWeek) ||
                other.totalVolumeLastWeek == totalVolumeLastWeek) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            const DeepCollectionEquality()
                .equals(other._volumeByMuscle, _volumeByMuscle));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      goalDescription,
      weeksTraining,
      weeklyJson,
      totalVolumeThisWeek,
      totalVolumeLastWeek,
      unit,
      const DeepCollectionEquality().hash(_volumeByMuscle));

  @override
  String toString() {
    return 'InsightContext(goalDescription: $goalDescription, weeksTraining: $weeksTraining, weeklyJson: $weeklyJson, totalVolumeThisWeek: $totalVolumeThisWeek, totalVolumeLastWeek: $totalVolumeLastWeek, unit: $unit, volumeByMuscle: $volumeByMuscle)';
  }
}

/// @nodoc
abstract mixin class _$InsightContextCopyWith<$Res>
    implements $InsightContextCopyWith<$Res> {
  factory _$InsightContextCopyWith(
          _InsightContext value, $Res Function(_InsightContext) _then) =
      __$InsightContextCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String goalDescription,
      int weeksTraining,
      String weeklyJson,
      double totalVolumeThisWeek,
      double totalVolumeLastWeek,
      String unit,
      Map<String, double> volumeByMuscle});
}

/// @nodoc
class __$InsightContextCopyWithImpl<$Res>
    implements _$InsightContextCopyWith<$Res> {
  __$InsightContextCopyWithImpl(this._self, this._then);

  final _InsightContext _self;
  final $Res Function(_InsightContext) _then;

  /// Create a copy of InsightContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? goalDescription = null,
    Object? weeksTraining = null,
    Object? weeklyJson = null,
    Object? totalVolumeThisWeek = null,
    Object? totalVolumeLastWeek = null,
    Object? unit = null,
    Object? volumeByMuscle = null,
  }) {
    return _then(_InsightContext(
      goalDescription: null == goalDescription
          ? _self.goalDescription
          : goalDescription // ignore: cast_nullable_to_non_nullable
              as String,
      weeksTraining: null == weeksTraining
          ? _self.weeksTraining
          : weeksTraining // ignore: cast_nullable_to_non_nullable
              as int,
      weeklyJson: null == weeklyJson
          ? _self.weeklyJson
          : weeklyJson // ignore: cast_nullable_to_non_nullable
              as String,
      totalVolumeThisWeek: null == totalVolumeThisWeek
          ? _self.totalVolumeThisWeek
          : totalVolumeThisWeek // ignore: cast_nullable_to_non_nullable
              as double,
      totalVolumeLastWeek: null == totalVolumeLastWeek
          ? _self.totalVolumeLastWeek
          : totalVolumeLastWeek // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _self.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      volumeByMuscle: null == volumeByMuscle
          ? _self._volumeByMuscle
          : volumeByMuscle // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
    ));
  }
}

// dart format on
