// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, UserData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _firebaseUidMeta =
      const VerificationMeta('firebaseUid');
  @override
  late final GeneratedColumn<String> firebaseUid = GeneratedColumn<String>(
      'firebase_uid', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
      'age', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _weightKgMeta =
      const VerificationMeta('weightKg');
  @override
  late final GeneratedColumn<double> weightKg = GeneratedColumn<double>(
      'weight_kg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _heightCmMeta =
      const VerificationMeta('heightCm');
  @override
  late final GeneratedColumn<double> heightCm = GeneratedColumn<double>(
      'height_cm', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _goalDescriptionMeta =
      const VerificationMeta('goalDescription');
  @override
  late final GeneratedColumn<String> goalDescription = GeneratedColumn<String>(
      'goal_description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _goalWeightKgMeta =
      const VerificationMeta('goalWeightKg');
  @override
  late final GeneratedColumn<double> goalWeightKg = GeneratedColumn<double>(
      'goal_weight_kg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _preferredUnitMeta =
      const VerificationMeta('preferredUnit');
  @override
  late final GeneratedColumn<String> preferredUnit = GeneratedColumn<String>(
      'preferred_unit', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('kg'));
  static const VerificationMeta _themeModeMeta =
      const VerificationMeta('themeMode');
  @override
  late final GeneratedColumn<String> themeMode = GeneratedColumn<String>(
      'theme_mode', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('dark'));
  static const VerificationMeta _customAccentHexMeta =
      const VerificationMeta('customAccentHex');
  @override
  late final GeneratedColumn<String> customAccentHex = GeneratedColumn<String>(
      'custom_accent_hex', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _frameRateCapMeta =
      const VerificationMeta('frameRateCap');
  @override
  late final GeneratedColumn<int> frameRateCap = GeneratedColumn<int>(
      'frame_rate_cap', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(120));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
      'created_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        firebaseUid,
        name,
        age,
        weightKg,
        heightCm,
        goalDescription,
        goalWeightKg,
        preferredUnit,
        themeMode,
        customAccentHex,
        frameRateCap,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<UserData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('firebase_uid')) {
      context.handle(
          _firebaseUidMeta,
          firebaseUid.isAcceptableOrUnknown(
              data['firebase_uid']!, _firebaseUidMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('age')) {
      context.handle(
          _ageMeta, age.isAcceptableOrUnknown(data['age']!, _ageMeta));
    }
    if (data.containsKey('weight_kg')) {
      context.handle(_weightKgMeta,
          weightKg.isAcceptableOrUnknown(data['weight_kg']!, _weightKgMeta));
    }
    if (data.containsKey('height_cm')) {
      context.handle(_heightCmMeta,
          heightCm.isAcceptableOrUnknown(data['height_cm']!, _heightCmMeta));
    }
    if (data.containsKey('goal_description')) {
      context.handle(
          _goalDescriptionMeta,
          goalDescription.isAcceptableOrUnknown(
              data['goal_description']!, _goalDescriptionMeta));
    }
    if (data.containsKey('goal_weight_kg')) {
      context.handle(
          _goalWeightKgMeta,
          goalWeightKg.isAcceptableOrUnknown(
              data['goal_weight_kg']!, _goalWeightKgMeta));
    }
    if (data.containsKey('preferred_unit')) {
      context.handle(
          _preferredUnitMeta,
          preferredUnit.isAcceptableOrUnknown(
              data['preferred_unit']!, _preferredUnitMeta));
    }
    if (data.containsKey('theme_mode')) {
      context.handle(_themeModeMeta,
          themeMode.isAcceptableOrUnknown(data['theme_mode']!, _themeModeMeta));
    }
    if (data.containsKey('custom_accent_hex')) {
      context.handle(
          _customAccentHexMeta,
          customAccentHex.isAcceptableOrUnknown(
              data['custom_accent_hex']!, _customAccentHexMeta));
    }
    if (data.containsKey('frame_rate_cap')) {
      context.handle(
          _frameRateCapMeta,
          frameRateCap.isAcceptableOrUnknown(
              data['frame_rate_cap']!, _frameRateCapMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      firebaseUid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}firebase_uid']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      age: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}age']),
      weightKg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}weight_kg']),
      heightCm: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}height_cm']),
      goalDescription: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}goal_description']),
      goalWeightKg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}goal_weight_kg']),
      preferredUnit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}preferred_unit'])!,
      themeMode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}theme_mode'])!,
      customAccentHex: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}custom_accent_hex']),
      frameRateCap: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}frame_rate_cap'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class UserData extends DataClass implements Insertable<UserData> {
  final String id;
  final String? firebaseUid;
  final String name;
  final int? age;
  final double? weightKg;
  final double? heightCm;
  final String? goalDescription;
  final double? goalWeightKg;
  final String preferredUnit;
  final String themeMode;
  final String? customAccentHex;
  final int frameRateCap;
  final int createdAt;
  final int updatedAt;
  const UserData(
      {required this.id,
      this.firebaseUid,
      required this.name,
      this.age,
      this.weightKg,
      this.heightCm,
      this.goalDescription,
      this.goalWeightKg,
      required this.preferredUnit,
      required this.themeMode,
      this.customAccentHex,
      required this.frameRateCap,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || firebaseUid != null) {
      map['firebase_uid'] = Variable<String>(firebaseUid);
    }
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || age != null) {
      map['age'] = Variable<int>(age);
    }
    if (!nullToAbsent || weightKg != null) {
      map['weight_kg'] = Variable<double>(weightKg);
    }
    if (!nullToAbsent || heightCm != null) {
      map['height_cm'] = Variable<double>(heightCm);
    }
    if (!nullToAbsent || goalDescription != null) {
      map['goal_description'] = Variable<String>(goalDescription);
    }
    if (!nullToAbsent || goalWeightKg != null) {
      map['goal_weight_kg'] = Variable<double>(goalWeightKg);
    }
    map['preferred_unit'] = Variable<String>(preferredUnit);
    map['theme_mode'] = Variable<String>(themeMode);
    if (!nullToAbsent || customAccentHex != null) {
      map['custom_accent_hex'] = Variable<String>(customAccentHex);
    }
    map['frame_rate_cap'] = Variable<int>(frameRateCap);
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      firebaseUid: firebaseUid == null && nullToAbsent
          ? const Value.absent()
          : Value(firebaseUid),
      name: Value(name),
      age: age == null && nullToAbsent ? const Value.absent() : Value(age),
      weightKg: weightKg == null && nullToAbsent
          ? const Value.absent()
          : Value(weightKg),
      heightCm: heightCm == null && nullToAbsent
          ? const Value.absent()
          : Value(heightCm),
      goalDescription: goalDescription == null && nullToAbsent
          ? const Value.absent()
          : Value(goalDescription),
      goalWeightKg: goalWeightKg == null && nullToAbsent
          ? const Value.absent()
          : Value(goalWeightKg),
      preferredUnit: Value(preferredUnit),
      themeMode: Value(themeMode),
      customAccentHex: customAccentHex == null && nullToAbsent
          ? const Value.absent()
          : Value(customAccentHex),
      frameRateCap: Value(frameRateCap),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory UserData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserData(
      id: serializer.fromJson<String>(json['id']),
      firebaseUid: serializer.fromJson<String?>(json['firebaseUid']),
      name: serializer.fromJson<String>(json['name']),
      age: serializer.fromJson<int?>(json['age']),
      weightKg: serializer.fromJson<double?>(json['weightKg']),
      heightCm: serializer.fromJson<double?>(json['heightCm']),
      goalDescription: serializer.fromJson<String?>(json['goalDescription']),
      goalWeightKg: serializer.fromJson<double?>(json['goalWeightKg']),
      preferredUnit: serializer.fromJson<String>(json['preferredUnit']),
      themeMode: serializer.fromJson<String>(json['themeMode']),
      customAccentHex: serializer.fromJson<String?>(json['customAccentHex']),
      frameRateCap: serializer.fromJson<int>(json['frameRateCap']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'firebaseUid': serializer.toJson<String?>(firebaseUid),
      'name': serializer.toJson<String>(name),
      'age': serializer.toJson<int?>(age),
      'weightKg': serializer.toJson<double?>(weightKg),
      'heightCm': serializer.toJson<double?>(heightCm),
      'goalDescription': serializer.toJson<String?>(goalDescription),
      'goalWeightKg': serializer.toJson<double?>(goalWeightKg),
      'preferredUnit': serializer.toJson<String>(preferredUnit),
      'themeMode': serializer.toJson<String>(themeMode),
      'customAccentHex': serializer.toJson<String?>(customAccentHex),
      'frameRateCap': serializer.toJson<int>(frameRateCap),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  UserData copyWith(
          {String? id,
          Value<String?> firebaseUid = const Value.absent(),
          String? name,
          Value<int?> age = const Value.absent(),
          Value<double?> weightKg = const Value.absent(),
          Value<double?> heightCm = const Value.absent(),
          Value<String?> goalDescription = const Value.absent(),
          Value<double?> goalWeightKg = const Value.absent(),
          String? preferredUnit,
          String? themeMode,
          Value<String?> customAccentHex = const Value.absent(),
          int? frameRateCap,
          int? createdAt,
          int? updatedAt}) =>
      UserData(
        id: id ?? this.id,
        firebaseUid: firebaseUid.present ? firebaseUid.value : this.firebaseUid,
        name: name ?? this.name,
        age: age.present ? age.value : this.age,
        weightKg: weightKg.present ? weightKg.value : this.weightKg,
        heightCm: heightCm.present ? heightCm.value : this.heightCm,
        goalDescription: goalDescription.present
            ? goalDescription.value
            : this.goalDescription,
        goalWeightKg:
            goalWeightKg.present ? goalWeightKg.value : this.goalWeightKg,
        preferredUnit: preferredUnit ?? this.preferredUnit,
        themeMode: themeMode ?? this.themeMode,
        customAccentHex: customAccentHex.present
            ? customAccentHex.value
            : this.customAccentHex,
        frameRateCap: frameRateCap ?? this.frameRateCap,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  UserData copyWithCompanion(UsersCompanion data) {
    return UserData(
      id: data.id.present ? data.id.value : this.id,
      firebaseUid:
          data.firebaseUid.present ? data.firebaseUid.value : this.firebaseUid,
      name: data.name.present ? data.name.value : this.name,
      age: data.age.present ? data.age.value : this.age,
      weightKg: data.weightKg.present ? data.weightKg.value : this.weightKg,
      heightCm: data.heightCm.present ? data.heightCm.value : this.heightCm,
      goalDescription: data.goalDescription.present
          ? data.goalDescription.value
          : this.goalDescription,
      goalWeightKg: data.goalWeightKg.present
          ? data.goalWeightKg.value
          : this.goalWeightKg,
      preferredUnit: data.preferredUnit.present
          ? data.preferredUnit.value
          : this.preferredUnit,
      themeMode: data.themeMode.present ? data.themeMode.value : this.themeMode,
      customAccentHex: data.customAccentHex.present
          ? data.customAccentHex.value
          : this.customAccentHex,
      frameRateCap: data.frameRateCap.present
          ? data.frameRateCap.value
          : this.frameRateCap,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserData(')
          ..write('id: $id, ')
          ..write('firebaseUid: $firebaseUid, ')
          ..write('name: $name, ')
          ..write('age: $age, ')
          ..write('weightKg: $weightKg, ')
          ..write('heightCm: $heightCm, ')
          ..write('goalDescription: $goalDescription, ')
          ..write('goalWeightKg: $goalWeightKg, ')
          ..write('preferredUnit: $preferredUnit, ')
          ..write('themeMode: $themeMode, ')
          ..write('customAccentHex: $customAccentHex, ')
          ..write('frameRateCap: $frameRateCap, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      firebaseUid,
      name,
      age,
      weightKg,
      heightCm,
      goalDescription,
      goalWeightKg,
      preferredUnit,
      themeMode,
      customAccentHex,
      frameRateCap,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserData &&
          other.id == this.id &&
          other.firebaseUid == this.firebaseUid &&
          other.name == this.name &&
          other.age == this.age &&
          other.weightKg == this.weightKg &&
          other.heightCm == this.heightCm &&
          other.goalDescription == this.goalDescription &&
          other.goalWeightKg == this.goalWeightKg &&
          other.preferredUnit == this.preferredUnit &&
          other.themeMode == this.themeMode &&
          other.customAccentHex == this.customAccentHex &&
          other.frameRateCap == this.frameRateCap &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class UsersCompanion extends UpdateCompanion<UserData> {
  final Value<String> id;
  final Value<String?> firebaseUid;
  final Value<String> name;
  final Value<int?> age;
  final Value<double?> weightKg;
  final Value<double?> heightCm;
  final Value<String?> goalDescription;
  final Value<double?> goalWeightKg;
  final Value<String> preferredUnit;
  final Value<String> themeMode;
  final Value<String?> customAccentHex;
  final Value<int> frameRateCap;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int> rowid;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.firebaseUid = const Value.absent(),
    this.name = const Value.absent(),
    this.age = const Value.absent(),
    this.weightKg = const Value.absent(),
    this.heightCm = const Value.absent(),
    this.goalDescription = const Value.absent(),
    this.goalWeightKg = const Value.absent(),
    this.preferredUnit = const Value.absent(),
    this.themeMode = const Value.absent(),
    this.customAccentHex = const Value.absent(),
    this.frameRateCap = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersCompanion.insert({
    required String id,
    this.firebaseUid = const Value.absent(),
    required String name,
    this.age = const Value.absent(),
    this.weightKg = const Value.absent(),
    this.heightCm = const Value.absent(),
    this.goalDescription = const Value.absent(),
    this.goalWeightKg = const Value.absent(),
    this.preferredUnit = const Value.absent(),
    this.themeMode = const Value.absent(),
    this.customAccentHex = const Value.absent(),
    this.frameRateCap = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<UserData> custom({
    Expression<String>? id,
    Expression<String>? firebaseUid,
    Expression<String>? name,
    Expression<int>? age,
    Expression<double>? weightKg,
    Expression<double>? heightCm,
    Expression<String>? goalDescription,
    Expression<double>? goalWeightKg,
    Expression<String>? preferredUnit,
    Expression<String>? themeMode,
    Expression<String>? customAccentHex,
    Expression<int>? frameRateCap,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (firebaseUid != null) 'firebase_uid': firebaseUid,
      if (name != null) 'name': name,
      if (age != null) 'age': age,
      if (weightKg != null) 'weight_kg': weightKg,
      if (heightCm != null) 'height_cm': heightCm,
      if (goalDescription != null) 'goal_description': goalDescription,
      if (goalWeightKg != null) 'goal_weight_kg': goalWeightKg,
      if (preferredUnit != null) 'preferred_unit': preferredUnit,
      if (themeMode != null) 'theme_mode': themeMode,
      if (customAccentHex != null) 'custom_accent_hex': customAccentHex,
      if (frameRateCap != null) 'frame_rate_cap': frameRateCap,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersCompanion copyWith(
      {Value<String>? id,
      Value<String?>? firebaseUid,
      Value<String>? name,
      Value<int?>? age,
      Value<double?>? weightKg,
      Value<double?>? heightCm,
      Value<String?>? goalDescription,
      Value<double?>? goalWeightKg,
      Value<String>? preferredUnit,
      Value<String>? themeMode,
      Value<String?>? customAccentHex,
      Value<int>? frameRateCap,
      Value<int>? createdAt,
      Value<int>? updatedAt,
      Value<int>? rowid}) {
    return UsersCompanion(
      id: id ?? this.id,
      firebaseUid: firebaseUid ?? this.firebaseUid,
      name: name ?? this.name,
      age: age ?? this.age,
      weightKg: weightKg ?? this.weightKg,
      heightCm: heightCm ?? this.heightCm,
      goalDescription: goalDescription ?? this.goalDescription,
      goalWeightKg: goalWeightKg ?? this.goalWeightKg,
      preferredUnit: preferredUnit ?? this.preferredUnit,
      themeMode: themeMode ?? this.themeMode,
      customAccentHex: customAccentHex ?? this.customAccentHex,
      frameRateCap: frameRateCap ?? this.frameRateCap,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (firebaseUid.present) {
      map['firebase_uid'] = Variable<String>(firebaseUid.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (weightKg.present) {
      map['weight_kg'] = Variable<double>(weightKg.value);
    }
    if (heightCm.present) {
      map['height_cm'] = Variable<double>(heightCm.value);
    }
    if (goalDescription.present) {
      map['goal_description'] = Variable<String>(goalDescription.value);
    }
    if (goalWeightKg.present) {
      map['goal_weight_kg'] = Variable<double>(goalWeightKg.value);
    }
    if (preferredUnit.present) {
      map['preferred_unit'] = Variable<String>(preferredUnit.value);
    }
    if (themeMode.present) {
      map['theme_mode'] = Variable<String>(themeMode.value);
    }
    if (customAccentHex.present) {
      map['custom_accent_hex'] = Variable<String>(customAccentHex.value);
    }
    if (frameRateCap.present) {
      map['frame_rate_cap'] = Variable<int>(frameRateCap.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('firebaseUid: $firebaseUid, ')
          ..write('name: $name, ')
          ..write('age: $age, ')
          ..write('weightKg: $weightKg, ')
          ..write('heightCm: $heightCm, ')
          ..write('goalDescription: $goalDescription, ')
          ..write('goalWeightKg: $goalWeightKg, ')
          ..write('preferredUnit: $preferredUnit, ')
          ..write('themeMode: $themeMode, ')
          ..write('customAccentHex: $customAccentHex, ')
          ..write('frameRateCap: $frameRateCap, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ExercisesTable extends Exercises
    with TableInfo<$ExercisesTable, ExerciseData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExercisesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _wgerIdMeta = const VerificationMeta('wgerId');
  @override
  late final GeneratedColumn<int> wgerId = GeneratedColumn<int>(
      'wger_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _primaryMuscleIdMeta =
      const VerificationMeta('primaryMuscleId');
  @override
  late final GeneratedColumn<int> primaryMuscleId = GeneratedColumn<int>(
      'primary_muscle_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _secondaryMuscleIdsMeta =
      const VerificationMeta('secondaryMuscleIds');
  @override
  late final GeneratedColumn<String> secondaryMuscleIds =
      GeneratedColumn<String>('secondary_muscle_ids', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultValue: const Constant('[]'));
  static const VerificationMeta _equipmentMeta =
      const VerificationMeta('equipment');
  @override
  late final GeneratedColumn<String> equipment = GeneratedColumn<String>(
      'equipment', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _isCustomMeta =
      const VerificationMeta('isCustom');
  @override
  late final GeneratedColumn<bool> isCustom = GeneratedColumn<bool>(
      'is_custom', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_custom" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _instructionsMeta =
      const VerificationMeta('instructions');
  @override
  late final GeneratedColumn<String> instructions = GeneratedColumn<String>(
      'instructions', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _aliasesMeta =
      const VerificationMeta('aliases');
  @override
  late final GeneratedColumn<String> aliases = GeneratedColumn<String>(
      'aliases', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
      'created_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        wgerId,
        name,
        description,
        primaryMuscleId,
        secondaryMuscleIds,
        equipment,
        category,
        isCustom,
        instructions,
        aliases,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exercises';
  @override
  VerificationContext validateIntegrity(Insertable<ExerciseData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('wger_id')) {
      context.handle(_wgerIdMeta,
          wgerId.isAcceptableOrUnknown(data['wger_id']!, _wgerIdMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('primary_muscle_id')) {
      context.handle(
          _primaryMuscleIdMeta,
          primaryMuscleId.isAcceptableOrUnknown(
              data['primary_muscle_id']!, _primaryMuscleIdMeta));
    } else if (isInserting) {
      context.missing(_primaryMuscleIdMeta);
    }
    if (data.containsKey('secondary_muscle_ids')) {
      context.handle(
          _secondaryMuscleIdsMeta,
          secondaryMuscleIds.isAcceptableOrUnknown(
              data['secondary_muscle_ids']!, _secondaryMuscleIdsMeta));
    }
    if (data.containsKey('equipment')) {
      context.handle(_equipmentMeta,
          equipment.isAcceptableOrUnknown(data['equipment']!, _equipmentMeta));
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    }
    if (data.containsKey('is_custom')) {
      context.handle(_isCustomMeta,
          isCustom.isAcceptableOrUnknown(data['is_custom']!, _isCustomMeta));
    }
    if (data.containsKey('instructions')) {
      context.handle(
          _instructionsMeta,
          instructions.isAcceptableOrUnknown(
              data['instructions']!, _instructionsMeta));
    }
    if (data.containsKey('aliases')) {
      context.handle(_aliasesMeta,
          aliases.isAcceptableOrUnknown(data['aliases']!, _aliasesMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExerciseData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExerciseData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      wgerId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}wger_id']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      primaryMuscleId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}primary_muscle_id'])!,
      secondaryMuscleIds: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}secondary_muscle_ids'])!,
      equipment: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}equipment'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      isCustom: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_custom'])!,
      instructions: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}instructions'])!,
      aliases: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}aliases'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $ExercisesTable createAlias(String alias) {
    return $ExercisesTable(attachedDatabase, alias);
  }
}

class ExerciseData extends DataClass implements Insertable<ExerciseData> {
  final int id;
  final int? wgerId;
  final String name;
  final String description;
  final int primaryMuscleId;
  final String secondaryMuscleIds;
  final String equipment;
  final String category;
  final bool isCustom;
  final String instructions;
  final String aliases;
  final int createdAt;
  const ExerciseData(
      {required this.id,
      this.wgerId,
      required this.name,
      required this.description,
      required this.primaryMuscleId,
      required this.secondaryMuscleIds,
      required this.equipment,
      required this.category,
      required this.isCustom,
      required this.instructions,
      required this.aliases,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || wgerId != null) {
      map['wger_id'] = Variable<int>(wgerId);
    }
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['primary_muscle_id'] = Variable<int>(primaryMuscleId);
    map['secondary_muscle_ids'] = Variable<String>(secondaryMuscleIds);
    map['equipment'] = Variable<String>(equipment);
    map['category'] = Variable<String>(category);
    map['is_custom'] = Variable<bool>(isCustom);
    map['instructions'] = Variable<String>(instructions);
    map['aliases'] = Variable<String>(aliases);
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  ExercisesCompanion toCompanion(bool nullToAbsent) {
    return ExercisesCompanion(
      id: Value(id),
      wgerId:
          wgerId == null && nullToAbsent ? const Value.absent() : Value(wgerId),
      name: Value(name),
      description: Value(description),
      primaryMuscleId: Value(primaryMuscleId),
      secondaryMuscleIds: Value(secondaryMuscleIds),
      equipment: Value(equipment),
      category: Value(category),
      isCustom: Value(isCustom),
      instructions: Value(instructions),
      aliases: Value(aliases),
      createdAt: Value(createdAt),
    );
  }

  factory ExerciseData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExerciseData(
      id: serializer.fromJson<int>(json['id']),
      wgerId: serializer.fromJson<int?>(json['wgerId']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      primaryMuscleId: serializer.fromJson<int>(json['primaryMuscleId']),
      secondaryMuscleIds:
          serializer.fromJson<String>(json['secondaryMuscleIds']),
      equipment: serializer.fromJson<String>(json['equipment']),
      category: serializer.fromJson<String>(json['category']),
      isCustom: serializer.fromJson<bool>(json['isCustom']),
      instructions: serializer.fromJson<String>(json['instructions']),
      aliases: serializer.fromJson<String>(json['aliases']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'wgerId': serializer.toJson<int?>(wgerId),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'primaryMuscleId': serializer.toJson<int>(primaryMuscleId),
      'secondaryMuscleIds': serializer.toJson<String>(secondaryMuscleIds),
      'equipment': serializer.toJson<String>(equipment),
      'category': serializer.toJson<String>(category),
      'isCustom': serializer.toJson<bool>(isCustom),
      'instructions': serializer.toJson<String>(instructions),
      'aliases': serializer.toJson<String>(aliases),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  ExerciseData copyWith(
          {int? id,
          Value<int?> wgerId = const Value.absent(),
          String? name,
          String? description,
          int? primaryMuscleId,
          String? secondaryMuscleIds,
          String? equipment,
          String? category,
          bool? isCustom,
          String? instructions,
          String? aliases,
          int? createdAt}) =>
      ExerciseData(
        id: id ?? this.id,
        wgerId: wgerId.present ? wgerId.value : this.wgerId,
        name: name ?? this.name,
        description: description ?? this.description,
        primaryMuscleId: primaryMuscleId ?? this.primaryMuscleId,
        secondaryMuscleIds: secondaryMuscleIds ?? this.secondaryMuscleIds,
        equipment: equipment ?? this.equipment,
        category: category ?? this.category,
        isCustom: isCustom ?? this.isCustom,
        instructions: instructions ?? this.instructions,
        aliases: aliases ?? this.aliases,
        createdAt: createdAt ?? this.createdAt,
      );
  ExerciseData copyWithCompanion(ExercisesCompanion data) {
    return ExerciseData(
      id: data.id.present ? data.id.value : this.id,
      wgerId: data.wgerId.present ? data.wgerId.value : this.wgerId,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      primaryMuscleId: data.primaryMuscleId.present
          ? data.primaryMuscleId.value
          : this.primaryMuscleId,
      secondaryMuscleIds: data.secondaryMuscleIds.present
          ? data.secondaryMuscleIds.value
          : this.secondaryMuscleIds,
      equipment: data.equipment.present ? data.equipment.value : this.equipment,
      category: data.category.present ? data.category.value : this.category,
      isCustom: data.isCustom.present ? data.isCustom.value : this.isCustom,
      instructions: data.instructions.present
          ? data.instructions.value
          : this.instructions,
      aliases: data.aliases.present ? data.aliases.value : this.aliases,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseData(')
          ..write('id: $id, ')
          ..write('wgerId: $wgerId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('primaryMuscleId: $primaryMuscleId, ')
          ..write('secondaryMuscleIds: $secondaryMuscleIds, ')
          ..write('equipment: $equipment, ')
          ..write('category: $category, ')
          ..write('isCustom: $isCustom, ')
          ..write('instructions: $instructions, ')
          ..write('aliases: $aliases, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      wgerId,
      name,
      description,
      primaryMuscleId,
      secondaryMuscleIds,
      equipment,
      category,
      isCustom,
      instructions,
      aliases,
      createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExerciseData &&
          other.id == this.id &&
          other.wgerId == this.wgerId &&
          other.name == this.name &&
          other.description == this.description &&
          other.primaryMuscleId == this.primaryMuscleId &&
          other.secondaryMuscleIds == this.secondaryMuscleIds &&
          other.equipment == this.equipment &&
          other.category == this.category &&
          other.isCustom == this.isCustom &&
          other.instructions == this.instructions &&
          other.aliases == this.aliases &&
          other.createdAt == this.createdAt);
}

class ExercisesCompanion extends UpdateCompanion<ExerciseData> {
  final Value<int> id;
  final Value<int?> wgerId;
  final Value<String> name;
  final Value<String> description;
  final Value<int> primaryMuscleId;
  final Value<String> secondaryMuscleIds;
  final Value<String> equipment;
  final Value<String> category;
  final Value<bool> isCustom;
  final Value<String> instructions;
  final Value<String> aliases;
  final Value<int> createdAt;
  const ExercisesCompanion({
    this.id = const Value.absent(),
    this.wgerId = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.primaryMuscleId = const Value.absent(),
    this.secondaryMuscleIds = const Value.absent(),
    this.equipment = const Value.absent(),
    this.category = const Value.absent(),
    this.isCustom = const Value.absent(),
    this.instructions = const Value.absent(),
    this.aliases = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ExercisesCompanion.insert({
    this.id = const Value.absent(),
    this.wgerId = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    required int primaryMuscleId,
    this.secondaryMuscleIds = const Value.absent(),
    this.equipment = const Value.absent(),
    this.category = const Value.absent(),
    this.isCustom = const Value.absent(),
    this.instructions = const Value.absent(),
    this.aliases = const Value.absent(),
    required int createdAt,
  })  : name = Value(name),
        primaryMuscleId = Value(primaryMuscleId),
        createdAt = Value(createdAt);
  static Insertable<ExerciseData> custom({
    Expression<int>? id,
    Expression<int>? wgerId,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? primaryMuscleId,
    Expression<String>? secondaryMuscleIds,
    Expression<String>? equipment,
    Expression<String>? category,
    Expression<bool>? isCustom,
    Expression<String>? instructions,
    Expression<String>? aliases,
    Expression<int>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (wgerId != null) 'wger_id': wgerId,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (primaryMuscleId != null) 'primary_muscle_id': primaryMuscleId,
      if (secondaryMuscleIds != null)
        'secondary_muscle_ids': secondaryMuscleIds,
      if (equipment != null) 'equipment': equipment,
      if (category != null) 'category': category,
      if (isCustom != null) 'is_custom': isCustom,
      if (instructions != null) 'instructions': instructions,
      if (aliases != null) 'aliases': aliases,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ExercisesCompanion copyWith(
      {Value<int>? id,
      Value<int?>? wgerId,
      Value<String>? name,
      Value<String>? description,
      Value<int>? primaryMuscleId,
      Value<String>? secondaryMuscleIds,
      Value<String>? equipment,
      Value<String>? category,
      Value<bool>? isCustom,
      Value<String>? instructions,
      Value<String>? aliases,
      Value<int>? createdAt}) {
    return ExercisesCompanion(
      id: id ?? this.id,
      wgerId: wgerId ?? this.wgerId,
      name: name ?? this.name,
      description: description ?? this.description,
      primaryMuscleId: primaryMuscleId ?? this.primaryMuscleId,
      secondaryMuscleIds: secondaryMuscleIds ?? this.secondaryMuscleIds,
      equipment: equipment ?? this.equipment,
      category: category ?? this.category,
      isCustom: isCustom ?? this.isCustom,
      instructions: instructions ?? this.instructions,
      aliases: aliases ?? this.aliases,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (wgerId.present) {
      map['wger_id'] = Variable<int>(wgerId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (primaryMuscleId.present) {
      map['primary_muscle_id'] = Variable<int>(primaryMuscleId.value);
    }
    if (secondaryMuscleIds.present) {
      map['secondary_muscle_ids'] = Variable<String>(secondaryMuscleIds.value);
    }
    if (equipment.present) {
      map['equipment'] = Variable<String>(equipment.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (isCustom.present) {
      map['is_custom'] = Variable<bool>(isCustom.value);
    }
    if (instructions.present) {
      map['instructions'] = Variable<String>(instructions.value);
    }
    if (aliases.present) {
      map['aliases'] = Variable<String>(aliases.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExercisesCompanion(')
          ..write('id: $id, ')
          ..write('wgerId: $wgerId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('primaryMuscleId: $primaryMuscleId, ')
          ..write('secondaryMuscleIds: $secondaryMuscleIds, ')
          ..write('equipment: $equipment, ')
          ..write('category: $category, ')
          ..write('isCustom: $isCustom, ')
          ..write('instructions: $instructions, ')
          ..write('aliases: $aliases, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $MuscleGroupsTable extends MuscleGroups
    with TableInfo<$MuscleGroupsTable, MuscleGroupData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MuscleGroupsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _parentIdMeta =
      const VerificationMeta('parentId');
  @override
  late final GeneratedColumn<int> parentId = GeneratedColumn<int>(
      'parent_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _bodyRegionMeta =
      const VerificationMeta('bodyRegion');
  @override
  late final GeneratedColumn<String> bodyRegion = GeneratedColumn<String>(
      'body_region', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _displayOrderMeta =
      const VerificationMeta('displayOrder');
  @override
  late final GeneratedColumn<int> displayOrder = GeneratedColumn<int>(
      'display_order', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, parentId, bodyRegion, displayOrder];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'muscle_groups';
  @override
  VerificationContext validateIntegrity(Insertable<MuscleGroupData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('parent_id')) {
      context.handle(_parentIdMeta,
          parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta));
    }
    if (data.containsKey('body_region')) {
      context.handle(
          _bodyRegionMeta,
          bodyRegion.isAcceptableOrUnknown(
              data['body_region']!, _bodyRegionMeta));
    } else if (isInserting) {
      context.missing(_bodyRegionMeta);
    }
    if (data.containsKey('display_order')) {
      context.handle(
          _displayOrderMeta,
          displayOrder.isAcceptableOrUnknown(
              data['display_order']!, _displayOrderMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MuscleGroupData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MuscleGroupData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      parentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}parent_id']),
      bodyRegion: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}body_region'])!,
      displayOrder: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}display_order'])!,
    );
  }

  @override
  $MuscleGroupsTable createAlias(String alias) {
    return $MuscleGroupsTable(attachedDatabase, alias);
  }
}

class MuscleGroupData extends DataClass implements Insertable<MuscleGroupData> {
  final int id;
  final String name;
  final int? parentId;
  final String bodyRegion;
  final int displayOrder;
  const MuscleGroupData(
      {required this.id,
      required this.name,
      this.parentId,
      required this.bodyRegion,
      required this.displayOrder});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || parentId != null) {
      map['parent_id'] = Variable<int>(parentId);
    }
    map['body_region'] = Variable<String>(bodyRegion);
    map['display_order'] = Variable<int>(displayOrder);
    return map;
  }

  MuscleGroupsCompanion toCompanion(bool nullToAbsent) {
    return MuscleGroupsCompanion(
      id: Value(id),
      name: Value(name),
      parentId: parentId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentId),
      bodyRegion: Value(bodyRegion),
      displayOrder: Value(displayOrder),
    );
  }

  factory MuscleGroupData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MuscleGroupData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      parentId: serializer.fromJson<int?>(json['parentId']),
      bodyRegion: serializer.fromJson<String>(json['bodyRegion']),
      displayOrder: serializer.fromJson<int>(json['displayOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'parentId': serializer.toJson<int?>(parentId),
      'bodyRegion': serializer.toJson<String>(bodyRegion),
      'displayOrder': serializer.toJson<int>(displayOrder),
    };
  }

  MuscleGroupData copyWith(
          {int? id,
          String? name,
          Value<int?> parentId = const Value.absent(),
          String? bodyRegion,
          int? displayOrder}) =>
      MuscleGroupData(
        id: id ?? this.id,
        name: name ?? this.name,
        parentId: parentId.present ? parentId.value : this.parentId,
        bodyRegion: bodyRegion ?? this.bodyRegion,
        displayOrder: displayOrder ?? this.displayOrder,
      );
  MuscleGroupData copyWithCompanion(MuscleGroupsCompanion data) {
    return MuscleGroupData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      bodyRegion:
          data.bodyRegion.present ? data.bodyRegion.value : this.bodyRegion,
      displayOrder: data.displayOrder.present
          ? data.displayOrder.value
          : this.displayOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MuscleGroupData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('parentId: $parentId, ')
          ..write('bodyRegion: $bodyRegion, ')
          ..write('displayOrder: $displayOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, parentId, bodyRegion, displayOrder);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MuscleGroupData &&
          other.id == this.id &&
          other.name == this.name &&
          other.parentId == this.parentId &&
          other.bodyRegion == this.bodyRegion &&
          other.displayOrder == this.displayOrder);
}

class MuscleGroupsCompanion extends UpdateCompanion<MuscleGroupData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int?> parentId;
  final Value<String> bodyRegion;
  final Value<int> displayOrder;
  const MuscleGroupsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.parentId = const Value.absent(),
    this.bodyRegion = const Value.absent(),
    this.displayOrder = const Value.absent(),
  });
  MuscleGroupsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.parentId = const Value.absent(),
    required String bodyRegion,
    this.displayOrder = const Value.absent(),
  })  : name = Value(name),
        bodyRegion = Value(bodyRegion);
  static Insertable<MuscleGroupData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? parentId,
    Expression<String>? bodyRegion,
    Expression<int>? displayOrder,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (parentId != null) 'parent_id': parentId,
      if (bodyRegion != null) 'body_region': bodyRegion,
      if (displayOrder != null) 'display_order': displayOrder,
    });
  }

  MuscleGroupsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int?>? parentId,
      Value<String>? bodyRegion,
      Value<int>? displayOrder}) {
    return MuscleGroupsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      parentId: parentId ?? this.parentId,
      bodyRegion: bodyRegion ?? this.bodyRegion,
      displayOrder: displayOrder ?? this.displayOrder,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<int>(parentId.value);
    }
    if (bodyRegion.present) {
      map['body_region'] = Variable<String>(bodyRegion.value);
    }
    if (displayOrder.present) {
      map['display_order'] = Variable<int>(displayOrder.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MuscleGroupsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('parentId: $parentId, ')
          ..write('bodyRegion: $bodyRegion, ')
          ..write('displayOrder: $displayOrder')
          ..write(')'))
        .toString();
  }
}

class $WorkoutPlansTable extends WorkoutPlans
    with TableInfo<$WorkoutPlansTable, WorkoutPlanData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutPlansTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
      'created_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, userId, name, description, isActive, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workout_plans';
  @override
  VerificationContext validateIntegrity(Insertable<WorkoutPlanData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkoutPlanData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkoutPlanData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $WorkoutPlansTable createAlias(String alias) {
    return $WorkoutPlansTable(attachedDatabase, alias);
  }
}

class WorkoutPlanData extends DataClass implements Insertable<WorkoutPlanData> {
  final String id;
  final String userId;
  final String name;
  final String description;
  final bool isActive;
  final int createdAt;
  final int updatedAt;
  const WorkoutPlanData(
      {required this.id,
      required this.userId,
      required this.name,
      required this.description,
      required this.isActive,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  WorkoutPlansCompanion toCompanion(bool nullToAbsent) {
    return WorkoutPlansCompanion(
      id: Value(id),
      userId: Value(userId),
      name: Value(name),
      description: Value(description),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory WorkoutPlanData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkoutPlanData(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  WorkoutPlanData copyWith(
          {String? id,
          String? userId,
          String? name,
          String? description,
          bool? isActive,
          int? createdAt,
          int? updatedAt}) =>
      WorkoutPlanData(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        name: name ?? this.name,
        description: description ?? this.description,
        isActive: isActive ?? this.isActive,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  WorkoutPlanData copyWithCompanion(WorkoutPlansCompanion data) {
    return WorkoutPlanData(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutPlanData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, userId, name, description, isActive, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkoutPlanData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.name == this.name &&
          other.description == this.description &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class WorkoutPlansCompanion extends UpdateCompanion<WorkoutPlanData> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> name;
  final Value<String> description;
  final Value<bool> isActive;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int> rowid;
  const WorkoutPlansCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkoutPlansCompanion.insert({
    required String id,
    required String userId,
    required String name,
    this.description = const Value.absent(),
    this.isActive = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        userId = Value(userId),
        name = Value(name),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<WorkoutPlanData> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? name,
    Expression<String>? description,
    Expression<bool>? isActive,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WorkoutPlansCompanion copyWith(
      {Value<String>? id,
      Value<String>? userId,
      Value<String>? name,
      Value<String>? description,
      Value<bool>? isActive,
      Value<int>? createdAt,
      Value<int>? updatedAt,
      Value<int>? rowid}) {
    return WorkoutPlansCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      description: description ?? this.description,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutPlansCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WorkoutPlanDaysTable extends WorkoutPlanDays
    with TableInfo<$WorkoutPlanDaysTable, WorkoutPlanDayData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutPlanDaysTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _planIdMeta = const VerificationMeta('planId');
  @override
  late final GeneratedColumn<String> planId = GeneratedColumn<String>(
      'plan_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dayOfWeekMeta =
      const VerificationMeta('dayOfWeek');
  @override
  late final GeneratedColumn<int> dayOfWeek = GeneratedColumn<int>(
      'day_of_week', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _muscleGroupIdsMeta =
      const VerificationMeta('muscleGroupIds');
  @override
  late final GeneratedColumn<String> muscleGroupIds = GeneratedColumn<String>(
      'muscle_group_ids', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  static const VerificationMeta _isRestDayMeta =
      const VerificationMeta('isRestDay');
  @override
  late final GeneratedColumn<bool> isRestDay = GeneratedColumn<bool>(
      'is_rest_day', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_rest_day" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, planId, dayOfWeek, name, muscleGroupIds, isRestDay];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workout_plan_days';
  @override
  VerificationContext validateIntegrity(Insertable<WorkoutPlanDayData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('plan_id')) {
      context.handle(_planIdMeta,
          planId.isAcceptableOrUnknown(data['plan_id']!, _planIdMeta));
    } else if (isInserting) {
      context.missing(_planIdMeta);
    }
    if (data.containsKey('day_of_week')) {
      context.handle(
          _dayOfWeekMeta,
          dayOfWeek.isAcceptableOrUnknown(
              data['day_of_week']!, _dayOfWeekMeta));
    } else if (isInserting) {
      context.missing(_dayOfWeekMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('muscle_group_ids')) {
      context.handle(
          _muscleGroupIdsMeta,
          muscleGroupIds.isAcceptableOrUnknown(
              data['muscle_group_ids']!, _muscleGroupIdsMeta));
    }
    if (data.containsKey('is_rest_day')) {
      context.handle(
          _isRestDayMeta,
          isRestDay.isAcceptableOrUnknown(
              data['is_rest_day']!, _isRestDayMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkoutPlanDayData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkoutPlanDayData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      planId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}plan_id'])!,
      dayOfWeek: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}day_of_week'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      muscleGroupIds: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}muscle_group_ids'])!,
      isRestDay: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_rest_day'])!,
    );
  }

  @override
  $WorkoutPlanDaysTable createAlias(String alias) {
    return $WorkoutPlanDaysTable(attachedDatabase, alias);
  }
}

class WorkoutPlanDayData extends DataClass
    implements Insertable<WorkoutPlanDayData> {
  final int id;
  final String planId;
  final int dayOfWeek;
  final String name;
  final String muscleGroupIds;
  final bool isRestDay;
  const WorkoutPlanDayData(
      {required this.id,
      required this.planId,
      required this.dayOfWeek,
      required this.name,
      required this.muscleGroupIds,
      required this.isRestDay});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['plan_id'] = Variable<String>(planId);
    map['day_of_week'] = Variable<int>(dayOfWeek);
    map['name'] = Variable<String>(name);
    map['muscle_group_ids'] = Variable<String>(muscleGroupIds);
    map['is_rest_day'] = Variable<bool>(isRestDay);
    return map;
  }

  WorkoutPlanDaysCompanion toCompanion(bool nullToAbsent) {
    return WorkoutPlanDaysCompanion(
      id: Value(id),
      planId: Value(planId),
      dayOfWeek: Value(dayOfWeek),
      name: Value(name),
      muscleGroupIds: Value(muscleGroupIds),
      isRestDay: Value(isRestDay),
    );
  }

  factory WorkoutPlanDayData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkoutPlanDayData(
      id: serializer.fromJson<int>(json['id']),
      planId: serializer.fromJson<String>(json['planId']),
      dayOfWeek: serializer.fromJson<int>(json['dayOfWeek']),
      name: serializer.fromJson<String>(json['name']),
      muscleGroupIds: serializer.fromJson<String>(json['muscleGroupIds']),
      isRestDay: serializer.fromJson<bool>(json['isRestDay']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'planId': serializer.toJson<String>(planId),
      'dayOfWeek': serializer.toJson<int>(dayOfWeek),
      'name': serializer.toJson<String>(name),
      'muscleGroupIds': serializer.toJson<String>(muscleGroupIds),
      'isRestDay': serializer.toJson<bool>(isRestDay),
    };
  }

  WorkoutPlanDayData copyWith(
          {int? id,
          String? planId,
          int? dayOfWeek,
          String? name,
          String? muscleGroupIds,
          bool? isRestDay}) =>
      WorkoutPlanDayData(
        id: id ?? this.id,
        planId: planId ?? this.planId,
        dayOfWeek: dayOfWeek ?? this.dayOfWeek,
        name: name ?? this.name,
        muscleGroupIds: muscleGroupIds ?? this.muscleGroupIds,
        isRestDay: isRestDay ?? this.isRestDay,
      );
  WorkoutPlanDayData copyWithCompanion(WorkoutPlanDaysCompanion data) {
    return WorkoutPlanDayData(
      id: data.id.present ? data.id.value : this.id,
      planId: data.planId.present ? data.planId.value : this.planId,
      dayOfWeek: data.dayOfWeek.present ? data.dayOfWeek.value : this.dayOfWeek,
      name: data.name.present ? data.name.value : this.name,
      muscleGroupIds: data.muscleGroupIds.present
          ? data.muscleGroupIds.value
          : this.muscleGroupIds,
      isRestDay: data.isRestDay.present ? data.isRestDay.value : this.isRestDay,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutPlanDayData(')
          ..write('id: $id, ')
          ..write('planId: $planId, ')
          ..write('dayOfWeek: $dayOfWeek, ')
          ..write('name: $name, ')
          ..write('muscleGroupIds: $muscleGroupIds, ')
          ..write('isRestDay: $isRestDay')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, planId, dayOfWeek, name, muscleGroupIds, isRestDay);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkoutPlanDayData &&
          other.id == this.id &&
          other.planId == this.planId &&
          other.dayOfWeek == this.dayOfWeek &&
          other.name == this.name &&
          other.muscleGroupIds == this.muscleGroupIds &&
          other.isRestDay == this.isRestDay);
}

class WorkoutPlanDaysCompanion extends UpdateCompanion<WorkoutPlanDayData> {
  final Value<int> id;
  final Value<String> planId;
  final Value<int> dayOfWeek;
  final Value<String> name;
  final Value<String> muscleGroupIds;
  final Value<bool> isRestDay;
  const WorkoutPlanDaysCompanion({
    this.id = const Value.absent(),
    this.planId = const Value.absent(),
    this.dayOfWeek = const Value.absent(),
    this.name = const Value.absent(),
    this.muscleGroupIds = const Value.absent(),
    this.isRestDay = const Value.absent(),
  });
  WorkoutPlanDaysCompanion.insert({
    this.id = const Value.absent(),
    required String planId,
    required int dayOfWeek,
    required String name,
    this.muscleGroupIds = const Value.absent(),
    this.isRestDay = const Value.absent(),
  })  : planId = Value(planId),
        dayOfWeek = Value(dayOfWeek),
        name = Value(name);
  static Insertable<WorkoutPlanDayData> custom({
    Expression<int>? id,
    Expression<String>? planId,
    Expression<int>? dayOfWeek,
    Expression<String>? name,
    Expression<String>? muscleGroupIds,
    Expression<bool>? isRestDay,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (planId != null) 'plan_id': planId,
      if (dayOfWeek != null) 'day_of_week': dayOfWeek,
      if (name != null) 'name': name,
      if (muscleGroupIds != null) 'muscle_group_ids': muscleGroupIds,
      if (isRestDay != null) 'is_rest_day': isRestDay,
    });
  }

  WorkoutPlanDaysCompanion copyWith(
      {Value<int>? id,
      Value<String>? planId,
      Value<int>? dayOfWeek,
      Value<String>? name,
      Value<String>? muscleGroupIds,
      Value<bool>? isRestDay}) {
    return WorkoutPlanDaysCompanion(
      id: id ?? this.id,
      planId: planId ?? this.planId,
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      name: name ?? this.name,
      muscleGroupIds: muscleGroupIds ?? this.muscleGroupIds,
      isRestDay: isRestDay ?? this.isRestDay,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (planId.present) {
      map['plan_id'] = Variable<String>(planId.value);
    }
    if (dayOfWeek.present) {
      map['day_of_week'] = Variable<int>(dayOfWeek.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (muscleGroupIds.present) {
      map['muscle_group_ids'] = Variable<String>(muscleGroupIds.value);
    }
    if (isRestDay.present) {
      map['is_rest_day'] = Variable<bool>(isRestDay.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutPlanDaysCompanion(')
          ..write('id: $id, ')
          ..write('planId: $planId, ')
          ..write('dayOfWeek: $dayOfWeek, ')
          ..write('name: $name, ')
          ..write('muscleGroupIds: $muscleGroupIds, ')
          ..write('isRestDay: $isRestDay')
          ..write(')'))
        .toString();
  }
}

class $WorkoutsTable extends Workouts
    with TableInfo<$WorkoutsTable, WorkoutData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _planIdMeta = const VerificationMeta('planId');
  @override
  late final GeneratedColumn<String> planId = GeneratedColumn<String>(
      'plan_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _planDayIdMeta =
      const VerificationMeta('planDayId');
  @override
  late final GeneratedColumn<int> planDayId = GeneratedColumn<int>(
      'plan_day_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _startedAtMeta =
      const VerificationMeta('startedAt');
  @override
  late final GeneratedColumn<int> startedAt = GeneratedColumn<int>(
      'started_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _endedAtMeta =
      const VerificationMeta('endedAt');
  @override
  late final GeneratedColumn<int> endedAt = GeneratedColumn<int>(
      'ended_at', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _totalVolumeKgMeta =
      const VerificationMeta('totalVolumeKg');
  @override
  late final GeneratedColumn<double> totalVolumeKg = GeneratedColumn<double>(
      'total_volume_kg', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _isAdHocMeta =
      const VerificationMeta('isAdHoc');
  @override
  late final GeneratedColumn<bool> isAdHoc = GeneratedColumn<bool>(
      'is_ad_hoc', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_ad_hoc" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        planId,
        planDayId,
        name,
        startedAt,
        endedAt,
        notes,
        totalVolumeKg,
        isAdHoc
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workouts';
  @override
  VerificationContext validateIntegrity(Insertable<WorkoutData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('plan_id')) {
      context.handle(_planIdMeta,
          planId.isAcceptableOrUnknown(data['plan_id']!, _planIdMeta));
    }
    if (data.containsKey('plan_day_id')) {
      context.handle(
          _planDayIdMeta,
          planDayId.isAcceptableOrUnknown(
              data['plan_day_id']!, _planDayIdMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('started_at')) {
      context.handle(_startedAtMeta,
          startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta));
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    if (data.containsKey('ended_at')) {
      context.handle(_endedAtMeta,
          endedAt.isAcceptableOrUnknown(data['ended_at']!, _endedAtMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('total_volume_kg')) {
      context.handle(
          _totalVolumeKgMeta,
          totalVolumeKg.isAcceptableOrUnknown(
              data['total_volume_kg']!, _totalVolumeKgMeta));
    }
    if (data.containsKey('is_ad_hoc')) {
      context.handle(_isAdHocMeta,
          isAdHoc.isAcceptableOrUnknown(data['is_ad_hoc']!, _isAdHocMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkoutData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkoutData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      planId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}plan_id']),
      planDayId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}plan_day_id']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      startedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}started_at'])!,
      endedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ended_at']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes'])!,
      totalVolumeKg: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}total_volume_kg'])!,
      isAdHoc: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_ad_hoc'])!,
    );
  }

  @override
  $WorkoutsTable createAlias(String alias) {
    return $WorkoutsTable(attachedDatabase, alias);
  }
}

class WorkoutData extends DataClass implements Insertable<WorkoutData> {
  final String id;
  final String userId;
  final String? planId;
  final int? planDayId;
  final String name;
  final int startedAt;
  final int? endedAt;
  final String notes;
  final double totalVolumeKg;
  final bool isAdHoc;
  const WorkoutData(
      {required this.id,
      required this.userId,
      this.planId,
      this.planDayId,
      required this.name,
      required this.startedAt,
      this.endedAt,
      required this.notes,
      required this.totalVolumeKg,
      required this.isAdHoc});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    if (!nullToAbsent || planId != null) {
      map['plan_id'] = Variable<String>(planId);
    }
    if (!nullToAbsent || planDayId != null) {
      map['plan_day_id'] = Variable<int>(planDayId);
    }
    map['name'] = Variable<String>(name);
    map['started_at'] = Variable<int>(startedAt);
    if (!nullToAbsent || endedAt != null) {
      map['ended_at'] = Variable<int>(endedAt);
    }
    map['notes'] = Variable<String>(notes);
    map['total_volume_kg'] = Variable<double>(totalVolumeKg);
    map['is_ad_hoc'] = Variable<bool>(isAdHoc);
    return map;
  }

  WorkoutsCompanion toCompanion(bool nullToAbsent) {
    return WorkoutsCompanion(
      id: Value(id),
      userId: Value(userId),
      planId:
          planId == null && nullToAbsent ? const Value.absent() : Value(planId),
      planDayId: planDayId == null && nullToAbsent
          ? const Value.absent()
          : Value(planDayId),
      name: Value(name),
      startedAt: Value(startedAt),
      endedAt: endedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(endedAt),
      notes: Value(notes),
      totalVolumeKg: Value(totalVolumeKg),
      isAdHoc: Value(isAdHoc),
    );
  }

  factory WorkoutData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkoutData(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      planId: serializer.fromJson<String?>(json['planId']),
      planDayId: serializer.fromJson<int?>(json['planDayId']),
      name: serializer.fromJson<String>(json['name']),
      startedAt: serializer.fromJson<int>(json['startedAt']),
      endedAt: serializer.fromJson<int?>(json['endedAt']),
      notes: serializer.fromJson<String>(json['notes']),
      totalVolumeKg: serializer.fromJson<double>(json['totalVolumeKg']),
      isAdHoc: serializer.fromJson<bool>(json['isAdHoc']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'planId': serializer.toJson<String?>(planId),
      'planDayId': serializer.toJson<int?>(planDayId),
      'name': serializer.toJson<String>(name),
      'startedAt': serializer.toJson<int>(startedAt),
      'endedAt': serializer.toJson<int?>(endedAt),
      'notes': serializer.toJson<String>(notes),
      'totalVolumeKg': serializer.toJson<double>(totalVolumeKg),
      'isAdHoc': serializer.toJson<bool>(isAdHoc),
    };
  }

  WorkoutData copyWith(
          {String? id,
          String? userId,
          Value<String?> planId = const Value.absent(),
          Value<int?> planDayId = const Value.absent(),
          String? name,
          int? startedAt,
          Value<int?> endedAt = const Value.absent(),
          String? notes,
          double? totalVolumeKg,
          bool? isAdHoc}) =>
      WorkoutData(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        planId: planId.present ? planId.value : this.planId,
        planDayId: planDayId.present ? planDayId.value : this.planDayId,
        name: name ?? this.name,
        startedAt: startedAt ?? this.startedAt,
        endedAt: endedAt.present ? endedAt.value : this.endedAt,
        notes: notes ?? this.notes,
        totalVolumeKg: totalVolumeKg ?? this.totalVolumeKg,
        isAdHoc: isAdHoc ?? this.isAdHoc,
      );
  WorkoutData copyWithCompanion(WorkoutsCompanion data) {
    return WorkoutData(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      planId: data.planId.present ? data.planId.value : this.planId,
      planDayId: data.planDayId.present ? data.planDayId.value : this.planDayId,
      name: data.name.present ? data.name.value : this.name,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      endedAt: data.endedAt.present ? data.endedAt.value : this.endedAt,
      notes: data.notes.present ? data.notes.value : this.notes,
      totalVolumeKg: data.totalVolumeKg.present
          ? data.totalVolumeKg.value
          : this.totalVolumeKg,
      isAdHoc: data.isAdHoc.present ? data.isAdHoc.value : this.isAdHoc,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('planId: $planId, ')
          ..write('planDayId: $planDayId, ')
          ..write('name: $name, ')
          ..write('startedAt: $startedAt, ')
          ..write('endedAt: $endedAt, ')
          ..write('notes: $notes, ')
          ..write('totalVolumeKg: $totalVolumeKg, ')
          ..write('isAdHoc: $isAdHoc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, planId, planDayId, name,
      startedAt, endedAt, notes, totalVolumeKg, isAdHoc);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkoutData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.planId == this.planId &&
          other.planDayId == this.planDayId &&
          other.name == this.name &&
          other.startedAt == this.startedAt &&
          other.endedAt == this.endedAt &&
          other.notes == this.notes &&
          other.totalVolumeKg == this.totalVolumeKg &&
          other.isAdHoc == this.isAdHoc);
}

class WorkoutsCompanion extends UpdateCompanion<WorkoutData> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String?> planId;
  final Value<int?> planDayId;
  final Value<String> name;
  final Value<int> startedAt;
  final Value<int?> endedAt;
  final Value<String> notes;
  final Value<double> totalVolumeKg;
  final Value<bool> isAdHoc;
  final Value<int> rowid;
  const WorkoutsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.planId = const Value.absent(),
    this.planDayId = const Value.absent(),
    this.name = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.endedAt = const Value.absent(),
    this.notes = const Value.absent(),
    this.totalVolumeKg = const Value.absent(),
    this.isAdHoc = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkoutsCompanion.insert({
    required String id,
    required String userId,
    this.planId = const Value.absent(),
    this.planDayId = const Value.absent(),
    required String name,
    required int startedAt,
    this.endedAt = const Value.absent(),
    this.notes = const Value.absent(),
    this.totalVolumeKg = const Value.absent(),
    this.isAdHoc = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        userId = Value(userId),
        name = Value(name),
        startedAt = Value(startedAt);
  static Insertable<WorkoutData> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? planId,
    Expression<int>? planDayId,
    Expression<String>? name,
    Expression<int>? startedAt,
    Expression<int>? endedAt,
    Expression<String>? notes,
    Expression<double>? totalVolumeKg,
    Expression<bool>? isAdHoc,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (planId != null) 'plan_id': planId,
      if (planDayId != null) 'plan_day_id': planDayId,
      if (name != null) 'name': name,
      if (startedAt != null) 'started_at': startedAt,
      if (endedAt != null) 'ended_at': endedAt,
      if (notes != null) 'notes': notes,
      if (totalVolumeKg != null) 'total_volume_kg': totalVolumeKg,
      if (isAdHoc != null) 'is_ad_hoc': isAdHoc,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WorkoutsCompanion copyWith(
      {Value<String>? id,
      Value<String>? userId,
      Value<String?>? planId,
      Value<int?>? planDayId,
      Value<String>? name,
      Value<int>? startedAt,
      Value<int?>? endedAt,
      Value<String>? notes,
      Value<double>? totalVolumeKg,
      Value<bool>? isAdHoc,
      Value<int>? rowid}) {
    return WorkoutsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      planId: planId ?? this.planId,
      planDayId: planDayId ?? this.planDayId,
      name: name ?? this.name,
      startedAt: startedAt ?? this.startedAt,
      endedAt: endedAt ?? this.endedAt,
      notes: notes ?? this.notes,
      totalVolumeKg: totalVolumeKg ?? this.totalVolumeKg,
      isAdHoc: isAdHoc ?? this.isAdHoc,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (planId.present) {
      map['plan_id'] = Variable<String>(planId.value);
    }
    if (planDayId.present) {
      map['plan_day_id'] = Variable<int>(planDayId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<int>(startedAt.value);
    }
    if (endedAt.present) {
      map['ended_at'] = Variable<int>(endedAt.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (totalVolumeKg.present) {
      map['total_volume_kg'] = Variable<double>(totalVolumeKg.value);
    }
    if (isAdHoc.present) {
      map['is_ad_hoc'] = Variable<bool>(isAdHoc.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('planId: $planId, ')
          ..write('planDayId: $planDayId, ')
          ..write('name: $name, ')
          ..write('startedAt: $startedAt, ')
          ..write('endedAt: $endedAt, ')
          ..write('notes: $notes, ')
          ..write('totalVolumeKg: $totalVolumeKg, ')
          ..write('isAdHoc: $isAdHoc, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WorkoutExercisesTable extends WorkoutExercises
    with TableInfo<$WorkoutExercisesTable, WorkoutExerciseData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutExercisesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _workoutIdMeta =
      const VerificationMeta('workoutId');
  @override
  late final GeneratedColumn<String> workoutId = GeneratedColumn<String>(
      'workout_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _exerciseIdMeta =
      const VerificationMeta('exerciseId');
  @override
  late final GeneratedColumn<int> exerciseId = GeneratedColumn<int>(
      'exercise_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _orderIndexMeta =
      const VerificationMeta('orderIndex');
  @override
  late final GeneratedColumn<int> orderIndex = GeneratedColumn<int>(
      'order_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _supersetGroupMeta =
      const VerificationMeta('supersetGroup');
  @override
  late final GeneratedColumn<int> supersetGroup = GeneratedColumn<int>(
      'superset_group', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  @override
  List<GeneratedColumn> get $columns =>
      [id, workoutId, exerciseId, orderIndex, supersetGroup, notes];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workout_exercises';
  @override
  VerificationContext validateIntegrity(
      Insertable<WorkoutExerciseData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('workout_id')) {
      context.handle(_workoutIdMeta,
          workoutId.isAcceptableOrUnknown(data['workout_id']!, _workoutIdMeta));
    } else if (isInserting) {
      context.missing(_workoutIdMeta);
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
          _exerciseIdMeta,
          exerciseId.isAcceptableOrUnknown(
              data['exercise_id']!, _exerciseIdMeta));
    } else if (isInserting) {
      context.missing(_exerciseIdMeta);
    }
    if (data.containsKey('order_index')) {
      context.handle(
          _orderIndexMeta,
          orderIndex.isAcceptableOrUnknown(
              data['order_index']!, _orderIndexMeta));
    } else if (isInserting) {
      context.missing(_orderIndexMeta);
    }
    if (data.containsKey('superset_group')) {
      context.handle(
          _supersetGroupMeta,
          supersetGroup.isAcceptableOrUnknown(
              data['superset_group']!, _supersetGroupMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkoutExerciseData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkoutExerciseData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      workoutId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}workout_id'])!,
      exerciseId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}exercise_id'])!,
      orderIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order_index'])!,
      supersetGroup: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}superset_group']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes'])!,
    );
  }

  @override
  $WorkoutExercisesTable createAlias(String alias) {
    return $WorkoutExercisesTable(attachedDatabase, alias);
  }
}

class WorkoutExerciseData extends DataClass
    implements Insertable<WorkoutExerciseData> {
  final String id;
  final String workoutId;
  final int exerciseId;
  final int orderIndex;
  final int? supersetGroup;
  final String notes;
  const WorkoutExerciseData(
      {required this.id,
      required this.workoutId,
      required this.exerciseId,
      required this.orderIndex,
      this.supersetGroup,
      required this.notes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['workout_id'] = Variable<String>(workoutId);
    map['exercise_id'] = Variable<int>(exerciseId);
    map['order_index'] = Variable<int>(orderIndex);
    if (!nullToAbsent || supersetGroup != null) {
      map['superset_group'] = Variable<int>(supersetGroup);
    }
    map['notes'] = Variable<String>(notes);
    return map;
  }

  WorkoutExercisesCompanion toCompanion(bool nullToAbsent) {
    return WorkoutExercisesCompanion(
      id: Value(id),
      workoutId: Value(workoutId),
      exerciseId: Value(exerciseId),
      orderIndex: Value(orderIndex),
      supersetGroup: supersetGroup == null && nullToAbsent
          ? const Value.absent()
          : Value(supersetGroup),
      notes: Value(notes),
    );
  }

  factory WorkoutExerciseData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkoutExerciseData(
      id: serializer.fromJson<String>(json['id']),
      workoutId: serializer.fromJson<String>(json['workoutId']),
      exerciseId: serializer.fromJson<int>(json['exerciseId']),
      orderIndex: serializer.fromJson<int>(json['orderIndex']),
      supersetGroup: serializer.fromJson<int?>(json['supersetGroup']),
      notes: serializer.fromJson<String>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'workoutId': serializer.toJson<String>(workoutId),
      'exerciseId': serializer.toJson<int>(exerciseId),
      'orderIndex': serializer.toJson<int>(orderIndex),
      'supersetGroup': serializer.toJson<int?>(supersetGroup),
      'notes': serializer.toJson<String>(notes),
    };
  }

  WorkoutExerciseData copyWith(
          {String? id,
          String? workoutId,
          int? exerciseId,
          int? orderIndex,
          Value<int?> supersetGroup = const Value.absent(),
          String? notes}) =>
      WorkoutExerciseData(
        id: id ?? this.id,
        workoutId: workoutId ?? this.workoutId,
        exerciseId: exerciseId ?? this.exerciseId,
        orderIndex: orderIndex ?? this.orderIndex,
        supersetGroup:
            supersetGroup.present ? supersetGroup.value : this.supersetGroup,
        notes: notes ?? this.notes,
      );
  WorkoutExerciseData copyWithCompanion(WorkoutExercisesCompanion data) {
    return WorkoutExerciseData(
      id: data.id.present ? data.id.value : this.id,
      workoutId: data.workoutId.present ? data.workoutId.value : this.workoutId,
      exerciseId:
          data.exerciseId.present ? data.exerciseId.value : this.exerciseId,
      orderIndex:
          data.orderIndex.present ? data.orderIndex.value : this.orderIndex,
      supersetGroup: data.supersetGroup.present
          ? data.supersetGroup.value
          : this.supersetGroup,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutExerciseData(')
          ..write('id: $id, ')
          ..write('workoutId: $workoutId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('supersetGroup: $supersetGroup, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, workoutId, exerciseId, orderIndex, supersetGroup, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkoutExerciseData &&
          other.id == this.id &&
          other.workoutId == this.workoutId &&
          other.exerciseId == this.exerciseId &&
          other.orderIndex == this.orderIndex &&
          other.supersetGroup == this.supersetGroup &&
          other.notes == this.notes);
}

class WorkoutExercisesCompanion extends UpdateCompanion<WorkoutExerciseData> {
  final Value<String> id;
  final Value<String> workoutId;
  final Value<int> exerciseId;
  final Value<int> orderIndex;
  final Value<int?> supersetGroup;
  final Value<String> notes;
  final Value<int> rowid;
  const WorkoutExercisesCompanion({
    this.id = const Value.absent(),
    this.workoutId = const Value.absent(),
    this.exerciseId = const Value.absent(),
    this.orderIndex = const Value.absent(),
    this.supersetGroup = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkoutExercisesCompanion.insert({
    required String id,
    required String workoutId,
    required int exerciseId,
    required int orderIndex,
    this.supersetGroup = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        workoutId = Value(workoutId),
        exerciseId = Value(exerciseId),
        orderIndex = Value(orderIndex);
  static Insertable<WorkoutExerciseData> custom({
    Expression<String>? id,
    Expression<String>? workoutId,
    Expression<int>? exerciseId,
    Expression<int>? orderIndex,
    Expression<int>? supersetGroup,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (workoutId != null) 'workout_id': workoutId,
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (orderIndex != null) 'order_index': orderIndex,
      if (supersetGroup != null) 'superset_group': supersetGroup,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WorkoutExercisesCompanion copyWith(
      {Value<String>? id,
      Value<String>? workoutId,
      Value<int>? exerciseId,
      Value<int>? orderIndex,
      Value<int?>? supersetGroup,
      Value<String>? notes,
      Value<int>? rowid}) {
    return WorkoutExercisesCompanion(
      id: id ?? this.id,
      workoutId: workoutId ?? this.workoutId,
      exerciseId: exerciseId ?? this.exerciseId,
      orderIndex: orderIndex ?? this.orderIndex,
      supersetGroup: supersetGroup ?? this.supersetGroup,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (workoutId.present) {
      map['workout_id'] = Variable<String>(workoutId.value);
    }
    if (exerciseId.present) {
      map['exercise_id'] = Variable<int>(exerciseId.value);
    }
    if (orderIndex.present) {
      map['order_index'] = Variable<int>(orderIndex.value);
    }
    if (supersetGroup.present) {
      map['superset_group'] = Variable<int>(supersetGroup.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutExercisesCompanion(')
          ..write('id: $id, ')
          ..write('workoutId: $workoutId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('supersetGroup: $supersetGroup, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SetsTable extends Sets with TableInfo<$SetsTable, SetData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SetsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _workoutExerciseIdMeta =
      const VerificationMeta('workoutExerciseId');
  @override
  late final GeneratedColumn<String> workoutExerciseId =
      GeneratedColumn<String>('workout_exercise_id', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _setNumberMeta =
      const VerificationMeta('setNumber');
  @override
  late final GeneratedColumn<int> setNumber = GeneratedColumn<int>(
      'set_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _repsMeta = const VerificationMeta('reps');
  @override
  late final GeneratedColumn<int> reps = GeneratedColumn<int>(
      'reps', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
      'weight', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _weightUnitMeta =
      const VerificationMeta('weightUnit');
  @override
  late final GeneratedColumn<String> weightUnit = GeneratedColumn<String>(
      'weight_unit', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _setTypeMeta =
      const VerificationMeta('setType');
  @override
  late final GeneratedColumn<String> setType = GeneratedColumn<String>(
      'set_type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('working'));
  static const VerificationMeta _restSecondsMeta =
      const VerificationMeta('restSeconds');
  @override
  late final GeneratedColumn<int> restSeconds = GeneratedColumn<int>(
      'rest_seconds', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _rpeMeta = const VerificationMeta('rpe');
  @override
  late final GeneratedColumn<double> rpe = GeneratedColumn<double>(
      'rpe', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _completedAtMeta =
      const VerificationMeta('completedAt');
  @override
  late final GeneratedColumn<int> completedAt = GeneratedColumn<int>(
      'completed_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        workoutExerciseId,
        setNumber,
        reps,
        weight,
        weightUnit,
        setType,
        restSeconds,
        rpe,
        notes,
        completedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sets';
  @override
  VerificationContext validateIntegrity(Insertable<SetData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('workout_exercise_id')) {
      context.handle(
          _workoutExerciseIdMeta,
          workoutExerciseId.isAcceptableOrUnknown(
              data['workout_exercise_id']!, _workoutExerciseIdMeta));
    } else if (isInserting) {
      context.missing(_workoutExerciseIdMeta);
    }
    if (data.containsKey('set_number')) {
      context.handle(_setNumberMeta,
          setNumber.isAcceptableOrUnknown(data['set_number']!, _setNumberMeta));
    } else if (isInserting) {
      context.missing(_setNumberMeta);
    }
    if (data.containsKey('reps')) {
      context.handle(
          _repsMeta, reps.isAcceptableOrUnknown(data['reps']!, _repsMeta));
    } else if (isInserting) {
      context.missing(_repsMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    if (data.containsKey('weight_unit')) {
      context.handle(
          _weightUnitMeta,
          weightUnit.isAcceptableOrUnknown(
              data['weight_unit']!, _weightUnitMeta));
    } else if (isInserting) {
      context.missing(_weightUnitMeta);
    }
    if (data.containsKey('set_type')) {
      context.handle(_setTypeMeta,
          setType.isAcceptableOrUnknown(data['set_type']!, _setTypeMeta));
    }
    if (data.containsKey('rest_seconds')) {
      context.handle(
          _restSecondsMeta,
          restSeconds.isAcceptableOrUnknown(
              data['rest_seconds']!, _restSecondsMeta));
    }
    if (data.containsKey('rpe')) {
      context.handle(
          _rpeMeta, rpe.isAcceptableOrUnknown(data['rpe']!, _rpeMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('completed_at')) {
      context.handle(
          _completedAtMeta,
          completedAt.isAcceptableOrUnknown(
              data['completed_at']!, _completedAtMeta));
    } else if (isInserting) {
      context.missing(_completedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SetData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SetData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      workoutExerciseId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}workout_exercise_id'])!,
      setNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}set_number'])!,
      reps: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}reps'])!,
      weight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}weight'])!,
      weightUnit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}weight_unit'])!,
      setType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}set_type'])!,
      restSeconds: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}rest_seconds']),
      rpe: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}rpe']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes'])!,
      completedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}completed_at'])!,
    );
  }

  @override
  $SetsTable createAlias(String alias) {
    return $SetsTable(attachedDatabase, alias);
  }
}

class SetData extends DataClass implements Insertable<SetData> {
  final String id;
  final String workoutExerciseId;
  final int setNumber;
  final int reps;
  final double weight;
  final String weightUnit;
  final String setType;
  final int? restSeconds;
  final double? rpe;
  final String notes;
  final int completedAt;
  const SetData(
      {required this.id,
      required this.workoutExerciseId,
      required this.setNumber,
      required this.reps,
      required this.weight,
      required this.weightUnit,
      required this.setType,
      this.restSeconds,
      this.rpe,
      required this.notes,
      required this.completedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['workout_exercise_id'] = Variable<String>(workoutExerciseId);
    map['set_number'] = Variable<int>(setNumber);
    map['reps'] = Variable<int>(reps);
    map['weight'] = Variable<double>(weight);
    map['weight_unit'] = Variable<String>(weightUnit);
    map['set_type'] = Variable<String>(setType);
    if (!nullToAbsent || restSeconds != null) {
      map['rest_seconds'] = Variable<int>(restSeconds);
    }
    if (!nullToAbsent || rpe != null) {
      map['rpe'] = Variable<double>(rpe);
    }
    map['notes'] = Variable<String>(notes);
    map['completed_at'] = Variable<int>(completedAt);
    return map;
  }

  SetsCompanion toCompanion(bool nullToAbsent) {
    return SetsCompanion(
      id: Value(id),
      workoutExerciseId: Value(workoutExerciseId),
      setNumber: Value(setNumber),
      reps: Value(reps),
      weight: Value(weight),
      weightUnit: Value(weightUnit),
      setType: Value(setType),
      restSeconds: restSeconds == null && nullToAbsent
          ? const Value.absent()
          : Value(restSeconds),
      rpe: rpe == null && nullToAbsent ? const Value.absent() : Value(rpe),
      notes: Value(notes),
      completedAt: Value(completedAt),
    );
  }

  factory SetData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SetData(
      id: serializer.fromJson<String>(json['id']),
      workoutExerciseId: serializer.fromJson<String>(json['workoutExerciseId']),
      setNumber: serializer.fromJson<int>(json['setNumber']),
      reps: serializer.fromJson<int>(json['reps']),
      weight: serializer.fromJson<double>(json['weight']),
      weightUnit: serializer.fromJson<String>(json['weightUnit']),
      setType: serializer.fromJson<String>(json['setType']),
      restSeconds: serializer.fromJson<int?>(json['restSeconds']),
      rpe: serializer.fromJson<double?>(json['rpe']),
      notes: serializer.fromJson<String>(json['notes']),
      completedAt: serializer.fromJson<int>(json['completedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'workoutExerciseId': serializer.toJson<String>(workoutExerciseId),
      'setNumber': serializer.toJson<int>(setNumber),
      'reps': serializer.toJson<int>(reps),
      'weight': serializer.toJson<double>(weight),
      'weightUnit': serializer.toJson<String>(weightUnit),
      'setType': serializer.toJson<String>(setType),
      'restSeconds': serializer.toJson<int?>(restSeconds),
      'rpe': serializer.toJson<double?>(rpe),
      'notes': serializer.toJson<String>(notes),
      'completedAt': serializer.toJson<int>(completedAt),
    };
  }

  SetData copyWith(
          {String? id,
          String? workoutExerciseId,
          int? setNumber,
          int? reps,
          double? weight,
          String? weightUnit,
          String? setType,
          Value<int?> restSeconds = const Value.absent(),
          Value<double?> rpe = const Value.absent(),
          String? notes,
          int? completedAt}) =>
      SetData(
        id: id ?? this.id,
        workoutExerciseId: workoutExerciseId ?? this.workoutExerciseId,
        setNumber: setNumber ?? this.setNumber,
        reps: reps ?? this.reps,
        weight: weight ?? this.weight,
        weightUnit: weightUnit ?? this.weightUnit,
        setType: setType ?? this.setType,
        restSeconds: restSeconds.present ? restSeconds.value : this.restSeconds,
        rpe: rpe.present ? rpe.value : this.rpe,
        notes: notes ?? this.notes,
        completedAt: completedAt ?? this.completedAt,
      );
  SetData copyWithCompanion(SetsCompanion data) {
    return SetData(
      id: data.id.present ? data.id.value : this.id,
      workoutExerciseId: data.workoutExerciseId.present
          ? data.workoutExerciseId.value
          : this.workoutExerciseId,
      setNumber: data.setNumber.present ? data.setNumber.value : this.setNumber,
      reps: data.reps.present ? data.reps.value : this.reps,
      weight: data.weight.present ? data.weight.value : this.weight,
      weightUnit:
          data.weightUnit.present ? data.weightUnit.value : this.weightUnit,
      setType: data.setType.present ? data.setType.value : this.setType,
      restSeconds:
          data.restSeconds.present ? data.restSeconds.value : this.restSeconds,
      rpe: data.rpe.present ? data.rpe.value : this.rpe,
      notes: data.notes.present ? data.notes.value : this.notes,
      completedAt:
          data.completedAt.present ? data.completedAt.value : this.completedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SetData(')
          ..write('id: $id, ')
          ..write('workoutExerciseId: $workoutExerciseId, ')
          ..write('setNumber: $setNumber, ')
          ..write('reps: $reps, ')
          ..write('weight: $weight, ')
          ..write('weightUnit: $weightUnit, ')
          ..write('setType: $setType, ')
          ..write('restSeconds: $restSeconds, ')
          ..write('rpe: $rpe, ')
          ..write('notes: $notes, ')
          ..write('completedAt: $completedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, workoutExerciseId, setNumber, reps,
      weight, weightUnit, setType, restSeconds, rpe, notes, completedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SetData &&
          other.id == this.id &&
          other.workoutExerciseId == this.workoutExerciseId &&
          other.setNumber == this.setNumber &&
          other.reps == this.reps &&
          other.weight == this.weight &&
          other.weightUnit == this.weightUnit &&
          other.setType == this.setType &&
          other.restSeconds == this.restSeconds &&
          other.rpe == this.rpe &&
          other.notes == this.notes &&
          other.completedAt == this.completedAt);
}

class SetsCompanion extends UpdateCompanion<SetData> {
  final Value<String> id;
  final Value<String> workoutExerciseId;
  final Value<int> setNumber;
  final Value<int> reps;
  final Value<double> weight;
  final Value<String> weightUnit;
  final Value<String> setType;
  final Value<int?> restSeconds;
  final Value<double?> rpe;
  final Value<String> notes;
  final Value<int> completedAt;
  final Value<int> rowid;
  const SetsCompanion({
    this.id = const Value.absent(),
    this.workoutExerciseId = const Value.absent(),
    this.setNumber = const Value.absent(),
    this.reps = const Value.absent(),
    this.weight = const Value.absent(),
    this.weightUnit = const Value.absent(),
    this.setType = const Value.absent(),
    this.restSeconds = const Value.absent(),
    this.rpe = const Value.absent(),
    this.notes = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SetsCompanion.insert({
    required String id,
    required String workoutExerciseId,
    required int setNumber,
    required int reps,
    required double weight,
    required String weightUnit,
    this.setType = const Value.absent(),
    this.restSeconds = const Value.absent(),
    this.rpe = const Value.absent(),
    this.notes = const Value.absent(),
    required int completedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        workoutExerciseId = Value(workoutExerciseId),
        setNumber = Value(setNumber),
        reps = Value(reps),
        weight = Value(weight),
        weightUnit = Value(weightUnit),
        completedAt = Value(completedAt);
  static Insertable<SetData> custom({
    Expression<String>? id,
    Expression<String>? workoutExerciseId,
    Expression<int>? setNumber,
    Expression<int>? reps,
    Expression<double>? weight,
    Expression<String>? weightUnit,
    Expression<String>? setType,
    Expression<int>? restSeconds,
    Expression<double>? rpe,
    Expression<String>? notes,
    Expression<int>? completedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (workoutExerciseId != null) 'workout_exercise_id': workoutExerciseId,
      if (setNumber != null) 'set_number': setNumber,
      if (reps != null) 'reps': reps,
      if (weight != null) 'weight': weight,
      if (weightUnit != null) 'weight_unit': weightUnit,
      if (setType != null) 'set_type': setType,
      if (restSeconds != null) 'rest_seconds': restSeconds,
      if (rpe != null) 'rpe': rpe,
      if (notes != null) 'notes': notes,
      if (completedAt != null) 'completed_at': completedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SetsCompanion copyWith(
      {Value<String>? id,
      Value<String>? workoutExerciseId,
      Value<int>? setNumber,
      Value<int>? reps,
      Value<double>? weight,
      Value<String>? weightUnit,
      Value<String>? setType,
      Value<int?>? restSeconds,
      Value<double?>? rpe,
      Value<String>? notes,
      Value<int>? completedAt,
      Value<int>? rowid}) {
    return SetsCompanion(
      id: id ?? this.id,
      workoutExerciseId: workoutExerciseId ?? this.workoutExerciseId,
      setNumber: setNumber ?? this.setNumber,
      reps: reps ?? this.reps,
      weight: weight ?? this.weight,
      weightUnit: weightUnit ?? this.weightUnit,
      setType: setType ?? this.setType,
      restSeconds: restSeconds ?? this.restSeconds,
      rpe: rpe ?? this.rpe,
      notes: notes ?? this.notes,
      completedAt: completedAt ?? this.completedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (workoutExerciseId.present) {
      map['workout_exercise_id'] = Variable<String>(workoutExerciseId.value);
    }
    if (setNumber.present) {
      map['set_number'] = Variable<int>(setNumber.value);
    }
    if (reps.present) {
      map['reps'] = Variable<int>(reps.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (weightUnit.present) {
      map['weight_unit'] = Variable<String>(weightUnit.value);
    }
    if (setType.present) {
      map['set_type'] = Variable<String>(setType.value);
    }
    if (restSeconds.present) {
      map['rest_seconds'] = Variable<int>(restSeconds.value);
    }
    if (rpe.present) {
      map['rpe'] = Variable<double>(rpe.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<int>(completedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SetsCompanion(')
          ..write('id: $id, ')
          ..write('workoutExerciseId: $workoutExerciseId, ')
          ..write('setNumber: $setNumber, ')
          ..write('reps: $reps, ')
          ..write('weight: $weight, ')
          ..write('weightUnit: $weightUnit, ')
          ..write('setType: $setType, ')
          ..write('restSeconds: $restSeconds, ')
          ..write('rpe: $rpe, ')
          ..write('notes: $notes, ')
          ..write('completedAt: $completedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GoalsTable extends Goals with TableInfo<$GoalsTable, GoalData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GoalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _targetValueMeta =
      const VerificationMeta('targetValue');
  @override
  late final GeneratedColumn<double> targetValue = GeneratedColumn<double>(
      'target_value', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _currentValueMeta =
      const VerificationMeta('currentValue');
  @override
  late final GeneratedColumn<double> currentValue = GeneratedColumn<double>(
      'current_value', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _exerciseIdMeta =
      const VerificationMeta('exerciseId');
  @override
  late final GeneratedColumn<int> exerciseId = GeneratedColumn<int>(
      'exercise_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _muscleGroupIdMeta =
      const VerificationMeta('muscleGroupId');
  @override
  late final GeneratedColumn<int> muscleGroupId = GeneratedColumn<int>(
      'muscle_group_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _deadlineMeta =
      const VerificationMeta('deadline');
  @override
  late final GeneratedColumn<int> deadline = GeneratedColumn<int>(
      'deadline', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
      'created_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _achievedAtMeta =
      const VerificationMeta('achievedAt');
  @override
  late final GeneratedColumn<int> achievedAt = GeneratedColumn<int>(
      'achieved_at', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        type,
        description,
        targetValue,
        currentValue,
        exerciseId,
        muscleGroupId,
        deadline,
        createdAt,
        achievedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'goals';
  @override
  VerificationContext validateIntegrity(Insertable<GoalData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('target_value')) {
      context.handle(
          _targetValueMeta,
          targetValue.isAcceptableOrUnknown(
              data['target_value']!, _targetValueMeta));
    } else if (isInserting) {
      context.missing(_targetValueMeta);
    }
    if (data.containsKey('current_value')) {
      context.handle(
          _currentValueMeta,
          currentValue.isAcceptableOrUnknown(
              data['current_value']!, _currentValueMeta));
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
          _exerciseIdMeta,
          exerciseId.isAcceptableOrUnknown(
              data['exercise_id']!, _exerciseIdMeta));
    }
    if (data.containsKey('muscle_group_id')) {
      context.handle(
          _muscleGroupIdMeta,
          muscleGroupId.isAcceptableOrUnknown(
              data['muscle_group_id']!, _muscleGroupIdMeta));
    }
    if (data.containsKey('deadline')) {
      context.handle(_deadlineMeta,
          deadline.isAcceptableOrUnknown(data['deadline']!, _deadlineMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('achieved_at')) {
      context.handle(
          _achievedAtMeta,
          achievedAt.isAcceptableOrUnknown(
              data['achieved_at']!, _achievedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GoalData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GoalData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      targetValue: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}target_value'])!,
      currentValue: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}current_value'])!,
      exerciseId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}exercise_id']),
      muscleGroupId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}muscle_group_id']),
      deadline: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}deadline']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_at'])!,
      achievedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}achieved_at']),
    );
  }

  @override
  $GoalsTable createAlias(String alias) {
    return $GoalsTable(attachedDatabase, alias);
  }
}

class GoalData extends DataClass implements Insertable<GoalData> {
  final String id;
  final String userId;
  final String type;
  final String description;
  final double targetValue;
  final double currentValue;
  final int? exerciseId;
  final int? muscleGroupId;
  final int? deadline;
  final int createdAt;
  final int? achievedAt;
  const GoalData(
      {required this.id,
      required this.userId,
      required this.type,
      required this.description,
      required this.targetValue,
      required this.currentValue,
      this.exerciseId,
      this.muscleGroupId,
      this.deadline,
      required this.createdAt,
      this.achievedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['type'] = Variable<String>(type);
    map['description'] = Variable<String>(description);
    map['target_value'] = Variable<double>(targetValue);
    map['current_value'] = Variable<double>(currentValue);
    if (!nullToAbsent || exerciseId != null) {
      map['exercise_id'] = Variable<int>(exerciseId);
    }
    if (!nullToAbsent || muscleGroupId != null) {
      map['muscle_group_id'] = Variable<int>(muscleGroupId);
    }
    if (!nullToAbsent || deadline != null) {
      map['deadline'] = Variable<int>(deadline);
    }
    map['created_at'] = Variable<int>(createdAt);
    if (!nullToAbsent || achievedAt != null) {
      map['achieved_at'] = Variable<int>(achievedAt);
    }
    return map;
  }

  GoalsCompanion toCompanion(bool nullToAbsent) {
    return GoalsCompanion(
      id: Value(id),
      userId: Value(userId),
      type: Value(type),
      description: Value(description),
      targetValue: Value(targetValue),
      currentValue: Value(currentValue),
      exerciseId: exerciseId == null && nullToAbsent
          ? const Value.absent()
          : Value(exerciseId),
      muscleGroupId: muscleGroupId == null && nullToAbsent
          ? const Value.absent()
          : Value(muscleGroupId),
      deadline: deadline == null && nullToAbsent
          ? const Value.absent()
          : Value(deadline),
      createdAt: Value(createdAt),
      achievedAt: achievedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(achievedAt),
    );
  }

  factory GoalData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GoalData(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      type: serializer.fromJson<String>(json['type']),
      description: serializer.fromJson<String>(json['description']),
      targetValue: serializer.fromJson<double>(json['targetValue']),
      currentValue: serializer.fromJson<double>(json['currentValue']),
      exerciseId: serializer.fromJson<int?>(json['exerciseId']),
      muscleGroupId: serializer.fromJson<int?>(json['muscleGroupId']),
      deadline: serializer.fromJson<int?>(json['deadline']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      achievedAt: serializer.fromJson<int?>(json['achievedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'type': serializer.toJson<String>(type),
      'description': serializer.toJson<String>(description),
      'targetValue': serializer.toJson<double>(targetValue),
      'currentValue': serializer.toJson<double>(currentValue),
      'exerciseId': serializer.toJson<int?>(exerciseId),
      'muscleGroupId': serializer.toJson<int?>(muscleGroupId),
      'deadline': serializer.toJson<int?>(deadline),
      'createdAt': serializer.toJson<int>(createdAt),
      'achievedAt': serializer.toJson<int?>(achievedAt),
    };
  }

  GoalData copyWith(
          {String? id,
          String? userId,
          String? type,
          String? description,
          double? targetValue,
          double? currentValue,
          Value<int?> exerciseId = const Value.absent(),
          Value<int?> muscleGroupId = const Value.absent(),
          Value<int?> deadline = const Value.absent(),
          int? createdAt,
          Value<int?> achievedAt = const Value.absent()}) =>
      GoalData(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        type: type ?? this.type,
        description: description ?? this.description,
        targetValue: targetValue ?? this.targetValue,
        currentValue: currentValue ?? this.currentValue,
        exerciseId: exerciseId.present ? exerciseId.value : this.exerciseId,
        muscleGroupId:
            muscleGroupId.present ? muscleGroupId.value : this.muscleGroupId,
        deadline: deadline.present ? deadline.value : this.deadline,
        createdAt: createdAt ?? this.createdAt,
        achievedAt: achievedAt.present ? achievedAt.value : this.achievedAt,
      );
  GoalData copyWithCompanion(GoalsCompanion data) {
    return GoalData(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      type: data.type.present ? data.type.value : this.type,
      description:
          data.description.present ? data.description.value : this.description,
      targetValue:
          data.targetValue.present ? data.targetValue.value : this.targetValue,
      currentValue: data.currentValue.present
          ? data.currentValue.value
          : this.currentValue,
      exerciseId:
          data.exerciseId.present ? data.exerciseId.value : this.exerciseId,
      muscleGroupId: data.muscleGroupId.present
          ? data.muscleGroupId.value
          : this.muscleGroupId,
      deadline: data.deadline.present ? data.deadline.value : this.deadline,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      achievedAt:
          data.achievedAt.present ? data.achievedAt.value : this.achievedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GoalData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('type: $type, ')
          ..write('description: $description, ')
          ..write('targetValue: $targetValue, ')
          ..write('currentValue: $currentValue, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('muscleGroupId: $muscleGroupId, ')
          ..write('deadline: $deadline, ')
          ..write('createdAt: $createdAt, ')
          ..write('achievedAt: $achievedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, type, description, targetValue,
      currentValue, exerciseId, muscleGroupId, deadline, createdAt, achievedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GoalData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.type == this.type &&
          other.description == this.description &&
          other.targetValue == this.targetValue &&
          other.currentValue == this.currentValue &&
          other.exerciseId == this.exerciseId &&
          other.muscleGroupId == this.muscleGroupId &&
          other.deadline == this.deadline &&
          other.createdAt == this.createdAt &&
          other.achievedAt == this.achievedAt);
}

class GoalsCompanion extends UpdateCompanion<GoalData> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> type;
  final Value<String> description;
  final Value<double> targetValue;
  final Value<double> currentValue;
  final Value<int?> exerciseId;
  final Value<int?> muscleGroupId;
  final Value<int?> deadline;
  final Value<int> createdAt;
  final Value<int?> achievedAt;
  final Value<int> rowid;
  const GoalsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.type = const Value.absent(),
    this.description = const Value.absent(),
    this.targetValue = const Value.absent(),
    this.currentValue = const Value.absent(),
    this.exerciseId = const Value.absent(),
    this.muscleGroupId = const Value.absent(),
    this.deadline = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.achievedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GoalsCompanion.insert({
    required String id,
    required String userId,
    required String type,
    required String description,
    required double targetValue,
    this.currentValue = const Value.absent(),
    this.exerciseId = const Value.absent(),
    this.muscleGroupId = const Value.absent(),
    this.deadline = const Value.absent(),
    required int createdAt,
    this.achievedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        userId = Value(userId),
        type = Value(type),
        description = Value(description),
        targetValue = Value(targetValue),
        createdAt = Value(createdAt);
  static Insertable<GoalData> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? type,
    Expression<String>? description,
    Expression<double>? targetValue,
    Expression<double>? currentValue,
    Expression<int>? exerciseId,
    Expression<int>? muscleGroupId,
    Expression<int>? deadline,
    Expression<int>? createdAt,
    Expression<int>? achievedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (type != null) 'type': type,
      if (description != null) 'description': description,
      if (targetValue != null) 'target_value': targetValue,
      if (currentValue != null) 'current_value': currentValue,
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (muscleGroupId != null) 'muscle_group_id': muscleGroupId,
      if (deadline != null) 'deadline': deadline,
      if (createdAt != null) 'created_at': createdAt,
      if (achievedAt != null) 'achieved_at': achievedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GoalsCompanion copyWith(
      {Value<String>? id,
      Value<String>? userId,
      Value<String>? type,
      Value<String>? description,
      Value<double>? targetValue,
      Value<double>? currentValue,
      Value<int?>? exerciseId,
      Value<int?>? muscleGroupId,
      Value<int?>? deadline,
      Value<int>? createdAt,
      Value<int?>? achievedAt,
      Value<int>? rowid}) {
    return GoalsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      type: type ?? this.type,
      description: description ?? this.description,
      targetValue: targetValue ?? this.targetValue,
      currentValue: currentValue ?? this.currentValue,
      exerciseId: exerciseId ?? this.exerciseId,
      muscleGroupId: muscleGroupId ?? this.muscleGroupId,
      deadline: deadline ?? this.deadline,
      createdAt: createdAt ?? this.createdAt,
      achievedAt: achievedAt ?? this.achievedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (targetValue.present) {
      map['target_value'] = Variable<double>(targetValue.value);
    }
    if (currentValue.present) {
      map['current_value'] = Variable<double>(currentValue.value);
    }
    if (exerciseId.present) {
      map['exercise_id'] = Variable<int>(exerciseId.value);
    }
    if (muscleGroupId.present) {
      map['muscle_group_id'] = Variable<int>(muscleGroupId.value);
    }
    if (deadline.present) {
      map['deadline'] = Variable<int>(deadline.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (achievedAt.present) {
      map['achieved_at'] = Variable<int>(achievedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GoalsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('type: $type, ')
          ..write('description: $description, ')
          ..write('targetValue: $targetValue, ')
          ..write('currentValue: $currentValue, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('muscleGroupId: $muscleGroupId, ')
          ..write('deadline: $deadline, ')
          ..write('createdAt: $createdAt, ')
          ..write('achievedAt: $achievedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BodyMeasurementsTable extends BodyMeasurements
    with TableInfo<$BodyMeasurementsTable, BodyMeasurementData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BodyMeasurementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _weightKgMeta =
      const VerificationMeta('weightKg');
  @override
  late final GeneratedColumn<double> weightKg = GeneratedColumn<double>(
      'weight_kg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _bodyFatPctMeta =
      const VerificationMeta('bodyFatPct');
  @override
  late final GeneratedColumn<double> bodyFatPct = GeneratedColumn<double>(
      'body_fat_pct', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _chestCmMeta =
      const VerificationMeta('chestCm');
  @override
  late final GeneratedColumn<double> chestCm = GeneratedColumn<double>(
      'chest_cm', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _waistCmMeta =
      const VerificationMeta('waistCm');
  @override
  late final GeneratedColumn<double> waistCm = GeneratedColumn<double>(
      'waist_cm', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _hipsCmMeta = const VerificationMeta('hipsCm');
  @override
  late final GeneratedColumn<double> hipsCm = GeneratedColumn<double>(
      'hips_cm', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _bicepCmMeta =
      const VerificationMeta('bicepCm');
  @override
  late final GeneratedColumn<double> bicepCm = GeneratedColumn<double>(
      'bicep_cm', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _thighCmMeta =
      const VerificationMeta('thighCm');
  @override
  late final GeneratedColumn<double> thighCm = GeneratedColumn<double>(
      'thigh_cm', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _measuredAtMeta =
      const VerificationMeta('measuredAt');
  @override
  late final GeneratedColumn<int> measuredAt = GeneratedColumn<int>(
      'measured_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        weightKg,
        bodyFatPct,
        chestCm,
        waistCm,
        hipsCm,
        bicepCm,
        thighCm,
        notes,
        measuredAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'body_measurements';
  @override
  VerificationContext validateIntegrity(
      Insertable<BodyMeasurementData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('weight_kg')) {
      context.handle(_weightKgMeta,
          weightKg.isAcceptableOrUnknown(data['weight_kg']!, _weightKgMeta));
    }
    if (data.containsKey('body_fat_pct')) {
      context.handle(
          _bodyFatPctMeta,
          bodyFatPct.isAcceptableOrUnknown(
              data['body_fat_pct']!, _bodyFatPctMeta));
    }
    if (data.containsKey('chest_cm')) {
      context.handle(_chestCmMeta,
          chestCm.isAcceptableOrUnknown(data['chest_cm']!, _chestCmMeta));
    }
    if (data.containsKey('waist_cm')) {
      context.handle(_waistCmMeta,
          waistCm.isAcceptableOrUnknown(data['waist_cm']!, _waistCmMeta));
    }
    if (data.containsKey('hips_cm')) {
      context.handle(_hipsCmMeta,
          hipsCm.isAcceptableOrUnknown(data['hips_cm']!, _hipsCmMeta));
    }
    if (data.containsKey('bicep_cm')) {
      context.handle(_bicepCmMeta,
          bicepCm.isAcceptableOrUnknown(data['bicep_cm']!, _bicepCmMeta));
    }
    if (data.containsKey('thigh_cm')) {
      context.handle(_thighCmMeta,
          thighCm.isAcceptableOrUnknown(data['thigh_cm']!, _thighCmMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('measured_at')) {
      context.handle(
          _measuredAtMeta,
          measuredAt.isAcceptableOrUnknown(
              data['measured_at']!, _measuredAtMeta));
    } else if (isInserting) {
      context.missing(_measuredAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BodyMeasurementData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BodyMeasurementData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      weightKg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}weight_kg']),
      bodyFatPct: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}body_fat_pct']),
      chestCm: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}chest_cm']),
      waistCm: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}waist_cm']),
      hipsCm: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}hips_cm']),
      bicepCm: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}bicep_cm']),
      thighCm: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}thigh_cm']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes'])!,
      measuredAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}measured_at'])!,
    );
  }

  @override
  $BodyMeasurementsTable createAlias(String alias) {
    return $BodyMeasurementsTable(attachedDatabase, alias);
  }
}

class BodyMeasurementData extends DataClass
    implements Insertable<BodyMeasurementData> {
  final String id;
  final String userId;
  final double? weightKg;
  final double? bodyFatPct;
  final double? chestCm;
  final double? waistCm;
  final double? hipsCm;
  final double? bicepCm;
  final double? thighCm;
  final String notes;
  final int measuredAt;
  const BodyMeasurementData(
      {required this.id,
      required this.userId,
      this.weightKg,
      this.bodyFatPct,
      this.chestCm,
      this.waistCm,
      this.hipsCm,
      this.bicepCm,
      this.thighCm,
      required this.notes,
      required this.measuredAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    if (!nullToAbsent || weightKg != null) {
      map['weight_kg'] = Variable<double>(weightKg);
    }
    if (!nullToAbsent || bodyFatPct != null) {
      map['body_fat_pct'] = Variable<double>(bodyFatPct);
    }
    if (!nullToAbsent || chestCm != null) {
      map['chest_cm'] = Variable<double>(chestCm);
    }
    if (!nullToAbsent || waistCm != null) {
      map['waist_cm'] = Variable<double>(waistCm);
    }
    if (!nullToAbsent || hipsCm != null) {
      map['hips_cm'] = Variable<double>(hipsCm);
    }
    if (!nullToAbsent || bicepCm != null) {
      map['bicep_cm'] = Variable<double>(bicepCm);
    }
    if (!nullToAbsent || thighCm != null) {
      map['thigh_cm'] = Variable<double>(thighCm);
    }
    map['notes'] = Variable<String>(notes);
    map['measured_at'] = Variable<int>(measuredAt);
    return map;
  }

  BodyMeasurementsCompanion toCompanion(bool nullToAbsent) {
    return BodyMeasurementsCompanion(
      id: Value(id),
      userId: Value(userId),
      weightKg: weightKg == null && nullToAbsent
          ? const Value.absent()
          : Value(weightKg),
      bodyFatPct: bodyFatPct == null && nullToAbsent
          ? const Value.absent()
          : Value(bodyFatPct),
      chestCm: chestCm == null && nullToAbsent
          ? const Value.absent()
          : Value(chestCm),
      waistCm: waistCm == null && nullToAbsent
          ? const Value.absent()
          : Value(waistCm),
      hipsCm:
          hipsCm == null && nullToAbsent ? const Value.absent() : Value(hipsCm),
      bicepCm: bicepCm == null && nullToAbsent
          ? const Value.absent()
          : Value(bicepCm),
      thighCm: thighCm == null && nullToAbsent
          ? const Value.absent()
          : Value(thighCm),
      notes: Value(notes),
      measuredAt: Value(measuredAt),
    );
  }

  factory BodyMeasurementData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BodyMeasurementData(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      weightKg: serializer.fromJson<double?>(json['weightKg']),
      bodyFatPct: serializer.fromJson<double?>(json['bodyFatPct']),
      chestCm: serializer.fromJson<double?>(json['chestCm']),
      waistCm: serializer.fromJson<double?>(json['waistCm']),
      hipsCm: serializer.fromJson<double?>(json['hipsCm']),
      bicepCm: serializer.fromJson<double?>(json['bicepCm']),
      thighCm: serializer.fromJson<double?>(json['thighCm']),
      notes: serializer.fromJson<String>(json['notes']),
      measuredAt: serializer.fromJson<int>(json['measuredAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'weightKg': serializer.toJson<double?>(weightKg),
      'bodyFatPct': serializer.toJson<double?>(bodyFatPct),
      'chestCm': serializer.toJson<double?>(chestCm),
      'waistCm': serializer.toJson<double?>(waistCm),
      'hipsCm': serializer.toJson<double?>(hipsCm),
      'bicepCm': serializer.toJson<double?>(bicepCm),
      'thighCm': serializer.toJson<double?>(thighCm),
      'notes': serializer.toJson<String>(notes),
      'measuredAt': serializer.toJson<int>(measuredAt),
    };
  }

  BodyMeasurementData copyWith(
          {String? id,
          String? userId,
          Value<double?> weightKg = const Value.absent(),
          Value<double?> bodyFatPct = const Value.absent(),
          Value<double?> chestCm = const Value.absent(),
          Value<double?> waistCm = const Value.absent(),
          Value<double?> hipsCm = const Value.absent(),
          Value<double?> bicepCm = const Value.absent(),
          Value<double?> thighCm = const Value.absent(),
          String? notes,
          int? measuredAt}) =>
      BodyMeasurementData(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        weightKg: weightKg.present ? weightKg.value : this.weightKg,
        bodyFatPct: bodyFatPct.present ? bodyFatPct.value : this.bodyFatPct,
        chestCm: chestCm.present ? chestCm.value : this.chestCm,
        waistCm: waistCm.present ? waistCm.value : this.waistCm,
        hipsCm: hipsCm.present ? hipsCm.value : this.hipsCm,
        bicepCm: bicepCm.present ? bicepCm.value : this.bicepCm,
        thighCm: thighCm.present ? thighCm.value : this.thighCm,
        notes: notes ?? this.notes,
        measuredAt: measuredAt ?? this.measuredAt,
      );
  BodyMeasurementData copyWithCompanion(BodyMeasurementsCompanion data) {
    return BodyMeasurementData(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      weightKg: data.weightKg.present ? data.weightKg.value : this.weightKg,
      bodyFatPct:
          data.bodyFatPct.present ? data.bodyFatPct.value : this.bodyFatPct,
      chestCm: data.chestCm.present ? data.chestCm.value : this.chestCm,
      waistCm: data.waistCm.present ? data.waistCm.value : this.waistCm,
      hipsCm: data.hipsCm.present ? data.hipsCm.value : this.hipsCm,
      bicepCm: data.bicepCm.present ? data.bicepCm.value : this.bicepCm,
      thighCm: data.thighCm.present ? data.thighCm.value : this.thighCm,
      notes: data.notes.present ? data.notes.value : this.notes,
      measuredAt:
          data.measuredAt.present ? data.measuredAt.value : this.measuredAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BodyMeasurementData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('weightKg: $weightKg, ')
          ..write('bodyFatPct: $bodyFatPct, ')
          ..write('chestCm: $chestCm, ')
          ..write('waistCm: $waistCm, ')
          ..write('hipsCm: $hipsCm, ')
          ..write('bicepCm: $bicepCm, ')
          ..write('thighCm: $thighCm, ')
          ..write('notes: $notes, ')
          ..write('measuredAt: $measuredAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, weightKg, bodyFatPct, chestCm,
      waistCm, hipsCm, bicepCm, thighCm, notes, measuredAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BodyMeasurementData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.weightKg == this.weightKg &&
          other.bodyFatPct == this.bodyFatPct &&
          other.chestCm == this.chestCm &&
          other.waistCm == this.waistCm &&
          other.hipsCm == this.hipsCm &&
          other.bicepCm == this.bicepCm &&
          other.thighCm == this.thighCm &&
          other.notes == this.notes &&
          other.measuredAt == this.measuredAt);
}

class BodyMeasurementsCompanion extends UpdateCompanion<BodyMeasurementData> {
  final Value<String> id;
  final Value<String> userId;
  final Value<double?> weightKg;
  final Value<double?> bodyFatPct;
  final Value<double?> chestCm;
  final Value<double?> waistCm;
  final Value<double?> hipsCm;
  final Value<double?> bicepCm;
  final Value<double?> thighCm;
  final Value<String> notes;
  final Value<int> measuredAt;
  final Value<int> rowid;
  const BodyMeasurementsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.weightKg = const Value.absent(),
    this.bodyFatPct = const Value.absent(),
    this.chestCm = const Value.absent(),
    this.waistCm = const Value.absent(),
    this.hipsCm = const Value.absent(),
    this.bicepCm = const Value.absent(),
    this.thighCm = const Value.absent(),
    this.notes = const Value.absent(),
    this.measuredAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BodyMeasurementsCompanion.insert({
    required String id,
    required String userId,
    this.weightKg = const Value.absent(),
    this.bodyFatPct = const Value.absent(),
    this.chestCm = const Value.absent(),
    this.waistCm = const Value.absent(),
    this.hipsCm = const Value.absent(),
    this.bicepCm = const Value.absent(),
    this.thighCm = const Value.absent(),
    this.notes = const Value.absent(),
    required int measuredAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        userId = Value(userId),
        measuredAt = Value(measuredAt);
  static Insertable<BodyMeasurementData> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<double>? weightKg,
    Expression<double>? bodyFatPct,
    Expression<double>? chestCm,
    Expression<double>? waistCm,
    Expression<double>? hipsCm,
    Expression<double>? bicepCm,
    Expression<double>? thighCm,
    Expression<String>? notes,
    Expression<int>? measuredAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (weightKg != null) 'weight_kg': weightKg,
      if (bodyFatPct != null) 'body_fat_pct': bodyFatPct,
      if (chestCm != null) 'chest_cm': chestCm,
      if (waistCm != null) 'waist_cm': waistCm,
      if (hipsCm != null) 'hips_cm': hipsCm,
      if (bicepCm != null) 'bicep_cm': bicepCm,
      if (thighCm != null) 'thigh_cm': thighCm,
      if (notes != null) 'notes': notes,
      if (measuredAt != null) 'measured_at': measuredAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BodyMeasurementsCompanion copyWith(
      {Value<String>? id,
      Value<String>? userId,
      Value<double?>? weightKg,
      Value<double?>? bodyFatPct,
      Value<double?>? chestCm,
      Value<double?>? waistCm,
      Value<double?>? hipsCm,
      Value<double?>? bicepCm,
      Value<double?>? thighCm,
      Value<String>? notes,
      Value<int>? measuredAt,
      Value<int>? rowid}) {
    return BodyMeasurementsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      weightKg: weightKg ?? this.weightKg,
      bodyFatPct: bodyFatPct ?? this.bodyFatPct,
      chestCm: chestCm ?? this.chestCm,
      waistCm: waistCm ?? this.waistCm,
      hipsCm: hipsCm ?? this.hipsCm,
      bicepCm: bicepCm ?? this.bicepCm,
      thighCm: thighCm ?? this.thighCm,
      notes: notes ?? this.notes,
      measuredAt: measuredAt ?? this.measuredAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (weightKg.present) {
      map['weight_kg'] = Variable<double>(weightKg.value);
    }
    if (bodyFatPct.present) {
      map['body_fat_pct'] = Variable<double>(bodyFatPct.value);
    }
    if (chestCm.present) {
      map['chest_cm'] = Variable<double>(chestCm.value);
    }
    if (waistCm.present) {
      map['waist_cm'] = Variable<double>(waistCm.value);
    }
    if (hipsCm.present) {
      map['hips_cm'] = Variable<double>(hipsCm.value);
    }
    if (bicepCm.present) {
      map['bicep_cm'] = Variable<double>(bicepCm.value);
    }
    if (thighCm.present) {
      map['thigh_cm'] = Variable<double>(thighCm.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (measuredAt.present) {
      map['measured_at'] = Variable<int>(measuredAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BodyMeasurementsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('weightKg: $weightKg, ')
          ..write('bodyFatPct: $bodyFatPct, ')
          ..write('chestCm: $chestCm, ')
          ..write('waistCm: $waistCm, ')
          ..write('hipsCm: $hipsCm, ')
          ..write('bicepCm: $bicepCm, ')
          ..write('thighCm: $thighCm, ')
          ..write('notes: $notes, ')
          ..write('measuredAt: $measuredAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AiNudgesTable extends AiNudges
    with TableInfo<$AiNudgesTable, AiNudgeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AiNudgesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _messageMeta =
      const VerificationMeta('message');
  @override
  late final GeneratedColumn<String> message = GeneratedColumn<String>(
      'message', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _actionDataMeta =
      const VerificationMeta('actionData');
  @override
  late final GeneratedColumn<String> actionData = GeneratedColumn<String>(
      'action_data', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('{}'));
  static const VerificationMeta _isDismissedMeta =
      const VerificationMeta('isDismissed');
  @override
  late final GeneratedColumn<bool> isDismissed = GeneratedColumn<bool>(
      'is_dismissed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_dismissed" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
      'created_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, userId, type, message, actionData, isDismissed, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ai_nudges';
  @override
  VerificationContext validateIntegrity(Insertable<AiNudgeData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('message')) {
      context.handle(_messageMeta,
          message.isAcceptableOrUnknown(data['message']!, _messageMeta));
    } else if (isInserting) {
      context.missing(_messageMeta);
    }
    if (data.containsKey('action_data')) {
      context.handle(
          _actionDataMeta,
          actionData.isAcceptableOrUnknown(
              data['action_data']!, _actionDataMeta));
    }
    if (data.containsKey('is_dismissed')) {
      context.handle(
          _isDismissedMeta,
          isDismissed.isAcceptableOrUnknown(
              data['is_dismissed']!, _isDismissedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AiNudgeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AiNudgeData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      message: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}message'])!,
      actionData: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}action_data'])!,
      isDismissed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_dismissed'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $AiNudgesTable createAlias(String alias) {
    return $AiNudgesTable(attachedDatabase, alias);
  }
}

class AiNudgeData extends DataClass implements Insertable<AiNudgeData> {
  final String id;
  final String userId;
  final String type;
  final String message;
  final String actionData;
  final bool isDismissed;
  final int createdAt;
  const AiNudgeData(
      {required this.id,
      required this.userId,
      required this.type,
      required this.message,
      required this.actionData,
      required this.isDismissed,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['type'] = Variable<String>(type);
    map['message'] = Variable<String>(message);
    map['action_data'] = Variable<String>(actionData);
    map['is_dismissed'] = Variable<bool>(isDismissed);
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  AiNudgesCompanion toCompanion(bool nullToAbsent) {
    return AiNudgesCompanion(
      id: Value(id),
      userId: Value(userId),
      type: Value(type),
      message: Value(message),
      actionData: Value(actionData),
      isDismissed: Value(isDismissed),
      createdAt: Value(createdAt),
    );
  }

  factory AiNudgeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AiNudgeData(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      type: serializer.fromJson<String>(json['type']),
      message: serializer.fromJson<String>(json['message']),
      actionData: serializer.fromJson<String>(json['actionData']),
      isDismissed: serializer.fromJson<bool>(json['isDismissed']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'type': serializer.toJson<String>(type),
      'message': serializer.toJson<String>(message),
      'actionData': serializer.toJson<String>(actionData),
      'isDismissed': serializer.toJson<bool>(isDismissed),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  AiNudgeData copyWith(
          {String? id,
          String? userId,
          String? type,
          String? message,
          String? actionData,
          bool? isDismissed,
          int? createdAt}) =>
      AiNudgeData(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        type: type ?? this.type,
        message: message ?? this.message,
        actionData: actionData ?? this.actionData,
        isDismissed: isDismissed ?? this.isDismissed,
        createdAt: createdAt ?? this.createdAt,
      );
  AiNudgeData copyWithCompanion(AiNudgesCompanion data) {
    return AiNudgeData(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      type: data.type.present ? data.type.value : this.type,
      message: data.message.present ? data.message.value : this.message,
      actionData:
          data.actionData.present ? data.actionData.value : this.actionData,
      isDismissed:
          data.isDismissed.present ? data.isDismissed.value : this.isDismissed,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AiNudgeData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('type: $type, ')
          ..write('message: $message, ')
          ..write('actionData: $actionData, ')
          ..write('isDismissed: $isDismissed, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, userId, type, message, actionData, isDismissed, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AiNudgeData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.type == this.type &&
          other.message == this.message &&
          other.actionData == this.actionData &&
          other.isDismissed == this.isDismissed &&
          other.createdAt == this.createdAt);
}

class AiNudgesCompanion extends UpdateCompanion<AiNudgeData> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> type;
  final Value<String> message;
  final Value<String> actionData;
  final Value<bool> isDismissed;
  final Value<int> createdAt;
  final Value<int> rowid;
  const AiNudgesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.type = const Value.absent(),
    this.message = const Value.absent(),
    this.actionData = const Value.absent(),
    this.isDismissed = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AiNudgesCompanion.insert({
    required String id,
    required String userId,
    required String type,
    required String message,
    this.actionData = const Value.absent(),
    this.isDismissed = const Value.absent(),
    required int createdAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        userId = Value(userId),
        type = Value(type),
        message = Value(message),
        createdAt = Value(createdAt);
  static Insertable<AiNudgeData> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? type,
    Expression<String>? message,
    Expression<String>? actionData,
    Expression<bool>? isDismissed,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (type != null) 'type': type,
      if (message != null) 'message': message,
      if (actionData != null) 'action_data': actionData,
      if (isDismissed != null) 'is_dismissed': isDismissed,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AiNudgesCompanion copyWith(
      {Value<String>? id,
      Value<String>? userId,
      Value<String>? type,
      Value<String>? message,
      Value<String>? actionData,
      Value<bool>? isDismissed,
      Value<int>? createdAt,
      Value<int>? rowid}) {
    return AiNudgesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      type: type ?? this.type,
      message: message ?? this.message,
      actionData: actionData ?? this.actionData,
      isDismissed: isDismissed ?? this.isDismissed,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (actionData.present) {
      map['action_data'] = Variable<String>(actionData.value);
    }
    if (isDismissed.present) {
      map['is_dismissed'] = Variable<bool>(isDismissed.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AiNudgesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('type: $type, ')
          ..write('message: $message, ')
          ..write('actionData: $actionData, ')
          ..write('isDismissed: $isDismissed, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $ExercisesTable exercises = $ExercisesTable(this);
  late final $MuscleGroupsTable muscleGroups = $MuscleGroupsTable(this);
  late final $WorkoutPlansTable workoutPlans = $WorkoutPlansTable(this);
  late final $WorkoutPlanDaysTable workoutPlanDays =
      $WorkoutPlanDaysTable(this);
  late final $WorkoutsTable workouts = $WorkoutsTable(this);
  late final $WorkoutExercisesTable workoutExercises =
      $WorkoutExercisesTable(this);
  late final $SetsTable sets = $SetsTable(this);
  late final $GoalsTable goals = $GoalsTable(this);
  late final $BodyMeasurementsTable bodyMeasurements =
      $BodyMeasurementsTable(this);
  late final $AiNudgesTable aiNudges = $AiNudgesTable(this);
  late final UserDao userDao = UserDao(this as AppDatabase);
  late final ExerciseDao exerciseDao = ExerciseDao(this as AppDatabase);
  late final WorkoutDao workoutDao = WorkoutDao(this as AppDatabase);
  late final SetsDao setsDao = SetsDao(this as AppDatabase);
  late final PlanDao planDao = PlanDao(this as AppDatabase);
  late final AnalyticsDao analyticsDao = AnalyticsDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        users,
        exercises,
        muscleGroups,
        workoutPlans,
        workoutPlanDays,
        workouts,
        workoutExercises,
        sets,
        goals,
        bodyMeasurements,
        aiNudges
      ];
}

typedef $$UsersTableCreateCompanionBuilder = UsersCompanion Function({
  required String id,
  Value<String?> firebaseUid,
  required String name,
  Value<int?> age,
  Value<double?> weightKg,
  Value<double?> heightCm,
  Value<String?> goalDescription,
  Value<double?> goalWeightKg,
  Value<String> preferredUnit,
  Value<String> themeMode,
  Value<String?> customAccentHex,
  Value<int> frameRateCap,
  required int createdAt,
  required int updatedAt,
  Value<int> rowid,
});
typedef $$UsersTableUpdateCompanionBuilder = UsersCompanion Function({
  Value<String> id,
  Value<String?> firebaseUid,
  Value<String> name,
  Value<int?> age,
  Value<double?> weightKg,
  Value<double?> heightCm,
  Value<String?> goalDescription,
  Value<double?> goalWeightKg,
  Value<String> preferredUnit,
  Value<String> themeMode,
  Value<String?> customAccentHex,
  Value<int> frameRateCap,
  Value<int> createdAt,
  Value<int> updatedAt,
  Value<int> rowid,
});

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get firebaseUid => $composableBuilder(
      column: $table.firebaseUid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get age => $composableBuilder(
      column: $table.age, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get weightKg => $composableBuilder(
      column: $table.weightKg, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get heightCm => $composableBuilder(
      column: $table.heightCm, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get goalDescription => $composableBuilder(
      column: $table.goalDescription,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get goalWeightKg => $composableBuilder(
      column: $table.goalWeightKg, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get preferredUnit => $composableBuilder(
      column: $table.preferredUnit, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get themeMode => $composableBuilder(
      column: $table.themeMode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get customAccentHex => $composableBuilder(
      column: $table.customAccentHex,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get frameRateCap => $composableBuilder(
      column: $table.frameRateCap, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get firebaseUid => $composableBuilder(
      column: $table.firebaseUid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get age => $composableBuilder(
      column: $table.age, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get weightKg => $composableBuilder(
      column: $table.weightKg, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get heightCm => $composableBuilder(
      column: $table.heightCm, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get goalDescription => $composableBuilder(
      column: $table.goalDescription,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get goalWeightKg => $composableBuilder(
      column: $table.goalWeightKg,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get preferredUnit => $composableBuilder(
      column: $table.preferredUnit,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get themeMode => $composableBuilder(
      column: $table.themeMode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get customAccentHex => $composableBuilder(
      column: $table.customAccentHex,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get frameRateCap => $composableBuilder(
      column: $table.frameRateCap,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get firebaseUid => $composableBuilder(
      column: $table.firebaseUid, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get age =>
      $composableBuilder(column: $table.age, builder: (column) => column);

  GeneratedColumn<double> get weightKg =>
      $composableBuilder(column: $table.weightKg, builder: (column) => column);

  GeneratedColumn<double> get heightCm =>
      $composableBuilder(column: $table.heightCm, builder: (column) => column);

  GeneratedColumn<String> get goalDescription => $composableBuilder(
      column: $table.goalDescription, builder: (column) => column);

  GeneratedColumn<double> get goalWeightKg => $composableBuilder(
      column: $table.goalWeightKg, builder: (column) => column);

  GeneratedColumn<String> get preferredUnit => $composableBuilder(
      column: $table.preferredUnit, builder: (column) => column);

  GeneratedColumn<String> get themeMode =>
      $composableBuilder(column: $table.themeMode, builder: (column) => column);

  GeneratedColumn<String> get customAccentHex => $composableBuilder(
      column: $table.customAccentHex, builder: (column) => column);

  GeneratedColumn<int> get frameRateCap => $composableBuilder(
      column: $table.frameRateCap, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$UsersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UsersTable,
    UserData,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (UserData, BaseReferences<_$AppDatabase, $UsersTable, UserData>),
    UserData,
    PrefetchHooks Function()> {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String?> firebaseUid = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int?> age = const Value.absent(),
            Value<double?> weightKg = const Value.absent(),
            Value<double?> heightCm = const Value.absent(),
            Value<String?> goalDescription = const Value.absent(),
            Value<double?> goalWeightKg = const Value.absent(),
            Value<String> preferredUnit = const Value.absent(),
            Value<String> themeMode = const Value.absent(),
            Value<String?> customAccentHex = const Value.absent(),
            Value<int> frameRateCap = const Value.absent(),
            Value<int> createdAt = const Value.absent(),
            Value<int> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UsersCompanion(
            id: id,
            firebaseUid: firebaseUid,
            name: name,
            age: age,
            weightKg: weightKg,
            heightCm: heightCm,
            goalDescription: goalDescription,
            goalWeightKg: goalWeightKg,
            preferredUnit: preferredUnit,
            themeMode: themeMode,
            customAccentHex: customAccentHex,
            frameRateCap: frameRateCap,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<String?> firebaseUid = const Value.absent(),
            required String name,
            Value<int?> age = const Value.absent(),
            Value<double?> weightKg = const Value.absent(),
            Value<double?> heightCm = const Value.absent(),
            Value<String?> goalDescription = const Value.absent(),
            Value<double?> goalWeightKg = const Value.absent(),
            Value<String> preferredUnit = const Value.absent(),
            Value<String> themeMode = const Value.absent(),
            Value<String?> customAccentHex = const Value.absent(),
            Value<int> frameRateCap = const Value.absent(),
            required int createdAt,
            required int updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              UsersCompanion.insert(
            id: id,
            firebaseUid: firebaseUid,
            name: name,
            age: age,
            weightKg: weightKg,
            heightCm: heightCm,
            goalDescription: goalDescription,
            goalWeightKg: goalWeightKg,
            preferredUnit: preferredUnit,
            themeMode: themeMode,
            customAccentHex: customAccentHex,
            frameRateCap: frameRateCap,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UsersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UsersTable,
    UserData,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (UserData, BaseReferences<_$AppDatabase, $UsersTable, UserData>),
    UserData,
    PrefetchHooks Function()>;
typedef $$ExercisesTableCreateCompanionBuilder = ExercisesCompanion Function({
  Value<int> id,
  Value<int?> wgerId,
  required String name,
  Value<String> description,
  required int primaryMuscleId,
  Value<String> secondaryMuscleIds,
  Value<String> equipment,
  Value<String> category,
  Value<bool> isCustom,
  Value<String> instructions,
  Value<String> aliases,
  required int createdAt,
});
typedef $$ExercisesTableUpdateCompanionBuilder = ExercisesCompanion Function({
  Value<int> id,
  Value<int?> wgerId,
  Value<String> name,
  Value<String> description,
  Value<int> primaryMuscleId,
  Value<String> secondaryMuscleIds,
  Value<String> equipment,
  Value<String> category,
  Value<bool> isCustom,
  Value<String> instructions,
  Value<String> aliases,
  Value<int> createdAt,
});

class $$ExercisesTableFilterComposer
    extends Composer<_$AppDatabase, $ExercisesTable> {
  $$ExercisesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get wgerId => $composableBuilder(
      column: $table.wgerId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get primaryMuscleId => $composableBuilder(
      column: $table.primaryMuscleId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get secondaryMuscleIds => $composableBuilder(
      column: $table.secondaryMuscleIds,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get equipment => $composableBuilder(
      column: $table.equipment, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isCustom => $composableBuilder(
      column: $table.isCustom, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get instructions => $composableBuilder(
      column: $table.instructions, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get aliases => $composableBuilder(
      column: $table.aliases, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$ExercisesTableOrderingComposer
    extends Composer<_$AppDatabase, $ExercisesTable> {
  $$ExercisesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get wgerId => $composableBuilder(
      column: $table.wgerId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get primaryMuscleId => $composableBuilder(
      column: $table.primaryMuscleId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get secondaryMuscleIds => $composableBuilder(
      column: $table.secondaryMuscleIds,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get equipment => $composableBuilder(
      column: $table.equipment, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isCustom => $composableBuilder(
      column: $table.isCustom, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get instructions => $composableBuilder(
      column: $table.instructions,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get aliases => $composableBuilder(
      column: $table.aliases, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$ExercisesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExercisesTable> {
  $$ExercisesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get wgerId =>
      $composableBuilder(column: $table.wgerId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<int> get primaryMuscleId => $composableBuilder(
      column: $table.primaryMuscleId, builder: (column) => column);

  GeneratedColumn<String> get secondaryMuscleIds => $composableBuilder(
      column: $table.secondaryMuscleIds, builder: (column) => column);

  GeneratedColumn<String> get equipment =>
      $composableBuilder(column: $table.equipment, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<bool> get isCustom =>
      $composableBuilder(column: $table.isCustom, builder: (column) => column);

  GeneratedColumn<String> get instructions => $composableBuilder(
      column: $table.instructions, builder: (column) => column);

  GeneratedColumn<String> get aliases =>
      $composableBuilder(column: $table.aliases, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$ExercisesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ExercisesTable,
    ExerciseData,
    $$ExercisesTableFilterComposer,
    $$ExercisesTableOrderingComposer,
    $$ExercisesTableAnnotationComposer,
    $$ExercisesTableCreateCompanionBuilder,
    $$ExercisesTableUpdateCompanionBuilder,
    (
      ExerciseData,
      BaseReferences<_$AppDatabase, $ExercisesTable, ExerciseData>
    ),
    ExerciseData,
    PrefetchHooks Function()> {
  $$ExercisesTableTableManager(_$AppDatabase db, $ExercisesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExercisesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExercisesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExercisesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> wgerId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<int> primaryMuscleId = const Value.absent(),
            Value<String> secondaryMuscleIds = const Value.absent(),
            Value<String> equipment = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<bool> isCustom = const Value.absent(),
            Value<String> instructions = const Value.absent(),
            Value<String> aliases = const Value.absent(),
            Value<int> createdAt = const Value.absent(),
          }) =>
              ExercisesCompanion(
            id: id,
            wgerId: wgerId,
            name: name,
            description: description,
            primaryMuscleId: primaryMuscleId,
            secondaryMuscleIds: secondaryMuscleIds,
            equipment: equipment,
            category: category,
            isCustom: isCustom,
            instructions: instructions,
            aliases: aliases,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> wgerId = const Value.absent(),
            required String name,
            Value<String> description = const Value.absent(),
            required int primaryMuscleId,
            Value<String> secondaryMuscleIds = const Value.absent(),
            Value<String> equipment = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<bool> isCustom = const Value.absent(),
            Value<String> instructions = const Value.absent(),
            Value<String> aliases = const Value.absent(),
            required int createdAt,
          }) =>
              ExercisesCompanion.insert(
            id: id,
            wgerId: wgerId,
            name: name,
            description: description,
            primaryMuscleId: primaryMuscleId,
            secondaryMuscleIds: secondaryMuscleIds,
            equipment: equipment,
            category: category,
            isCustom: isCustom,
            instructions: instructions,
            aliases: aliases,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ExercisesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ExercisesTable,
    ExerciseData,
    $$ExercisesTableFilterComposer,
    $$ExercisesTableOrderingComposer,
    $$ExercisesTableAnnotationComposer,
    $$ExercisesTableCreateCompanionBuilder,
    $$ExercisesTableUpdateCompanionBuilder,
    (
      ExerciseData,
      BaseReferences<_$AppDatabase, $ExercisesTable, ExerciseData>
    ),
    ExerciseData,
    PrefetchHooks Function()>;
typedef $$MuscleGroupsTableCreateCompanionBuilder = MuscleGroupsCompanion
    Function({
  Value<int> id,
  required String name,
  Value<int?> parentId,
  required String bodyRegion,
  Value<int> displayOrder,
});
typedef $$MuscleGroupsTableUpdateCompanionBuilder = MuscleGroupsCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<int?> parentId,
  Value<String> bodyRegion,
  Value<int> displayOrder,
});

class $$MuscleGroupsTableFilterComposer
    extends Composer<_$AppDatabase, $MuscleGroupsTable> {
  $$MuscleGroupsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get parentId => $composableBuilder(
      column: $table.parentId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get bodyRegion => $composableBuilder(
      column: $table.bodyRegion, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get displayOrder => $composableBuilder(
      column: $table.displayOrder, builder: (column) => ColumnFilters(column));
}

class $$MuscleGroupsTableOrderingComposer
    extends Composer<_$AppDatabase, $MuscleGroupsTable> {
  $$MuscleGroupsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get parentId => $composableBuilder(
      column: $table.parentId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get bodyRegion => $composableBuilder(
      column: $table.bodyRegion, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get displayOrder => $composableBuilder(
      column: $table.displayOrder,
      builder: (column) => ColumnOrderings(column));
}

class $$MuscleGroupsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MuscleGroupsTable> {
  $$MuscleGroupsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get parentId =>
      $composableBuilder(column: $table.parentId, builder: (column) => column);

  GeneratedColumn<String> get bodyRegion => $composableBuilder(
      column: $table.bodyRegion, builder: (column) => column);

  GeneratedColumn<int> get displayOrder => $composableBuilder(
      column: $table.displayOrder, builder: (column) => column);
}

class $$MuscleGroupsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MuscleGroupsTable,
    MuscleGroupData,
    $$MuscleGroupsTableFilterComposer,
    $$MuscleGroupsTableOrderingComposer,
    $$MuscleGroupsTableAnnotationComposer,
    $$MuscleGroupsTableCreateCompanionBuilder,
    $$MuscleGroupsTableUpdateCompanionBuilder,
    (
      MuscleGroupData,
      BaseReferences<_$AppDatabase, $MuscleGroupsTable, MuscleGroupData>
    ),
    MuscleGroupData,
    PrefetchHooks Function()> {
  $$MuscleGroupsTableTableManager(_$AppDatabase db, $MuscleGroupsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MuscleGroupsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MuscleGroupsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MuscleGroupsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int?> parentId = const Value.absent(),
            Value<String> bodyRegion = const Value.absent(),
            Value<int> displayOrder = const Value.absent(),
          }) =>
              MuscleGroupsCompanion(
            id: id,
            name: name,
            parentId: parentId,
            bodyRegion: bodyRegion,
            displayOrder: displayOrder,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<int?> parentId = const Value.absent(),
            required String bodyRegion,
            Value<int> displayOrder = const Value.absent(),
          }) =>
              MuscleGroupsCompanion.insert(
            id: id,
            name: name,
            parentId: parentId,
            bodyRegion: bodyRegion,
            displayOrder: displayOrder,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MuscleGroupsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MuscleGroupsTable,
    MuscleGroupData,
    $$MuscleGroupsTableFilterComposer,
    $$MuscleGroupsTableOrderingComposer,
    $$MuscleGroupsTableAnnotationComposer,
    $$MuscleGroupsTableCreateCompanionBuilder,
    $$MuscleGroupsTableUpdateCompanionBuilder,
    (
      MuscleGroupData,
      BaseReferences<_$AppDatabase, $MuscleGroupsTable, MuscleGroupData>
    ),
    MuscleGroupData,
    PrefetchHooks Function()>;
typedef $$WorkoutPlansTableCreateCompanionBuilder = WorkoutPlansCompanion
    Function({
  required String id,
  required String userId,
  required String name,
  Value<String> description,
  Value<bool> isActive,
  required int createdAt,
  required int updatedAt,
  Value<int> rowid,
});
typedef $$WorkoutPlansTableUpdateCompanionBuilder = WorkoutPlansCompanion
    Function({
  Value<String> id,
  Value<String> userId,
  Value<String> name,
  Value<String> description,
  Value<bool> isActive,
  Value<int> createdAt,
  Value<int> updatedAt,
  Value<int> rowid,
});

class $$WorkoutPlansTableFilterComposer
    extends Composer<_$AppDatabase, $WorkoutPlansTable> {
  $$WorkoutPlansTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$WorkoutPlansTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkoutPlansTable> {
  $$WorkoutPlansTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$WorkoutPlansTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkoutPlansTable> {
  $$WorkoutPlansTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$WorkoutPlansTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WorkoutPlansTable,
    WorkoutPlanData,
    $$WorkoutPlansTableFilterComposer,
    $$WorkoutPlansTableOrderingComposer,
    $$WorkoutPlansTableAnnotationComposer,
    $$WorkoutPlansTableCreateCompanionBuilder,
    $$WorkoutPlansTableUpdateCompanionBuilder,
    (
      WorkoutPlanData,
      BaseReferences<_$AppDatabase, $WorkoutPlansTable, WorkoutPlanData>
    ),
    WorkoutPlanData,
    PrefetchHooks Function()> {
  $$WorkoutPlansTableTableManager(_$AppDatabase db, $WorkoutPlansTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkoutPlansTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkoutPlansTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkoutPlansTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<int> createdAt = const Value.absent(),
            Value<int> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WorkoutPlansCompanion(
            id: id,
            userId: userId,
            name: name,
            description: description,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String userId,
            required String name,
            Value<String> description = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            required int createdAt,
            required int updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              WorkoutPlansCompanion.insert(
            id: id,
            userId: userId,
            name: name,
            description: description,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$WorkoutPlansTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $WorkoutPlansTable,
    WorkoutPlanData,
    $$WorkoutPlansTableFilterComposer,
    $$WorkoutPlansTableOrderingComposer,
    $$WorkoutPlansTableAnnotationComposer,
    $$WorkoutPlansTableCreateCompanionBuilder,
    $$WorkoutPlansTableUpdateCompanionBuilder,
    (
      WorkoutPlanData,
      BaseReferences<_$AppDatabase, $WorkoutPlansTable, WorkoutPlanData>
    ),
    WorkoutPlanData,
    PrefetchHooks Function()>;
typedef $$WorkoutPlanDaysTableCreateCompanionBuilder = WorkoutPlanDaysCompanion
    Function({
  Value<int> id,
  required String planId,
  required int dayOfWeek,
  required String name,
  Value<String> muscleGroupIds,
  Value<bool> isRestDay,
});
typedef $$WorkoutPlanDaysTableUpdateCompanionBuilder = WorkoutPlanDaysCompanion
    Function({
  Value<int> id,
  Value<String> planId,
  Value<int> dayOfWeek,
  Value<String> name,
  Value<String> muscleGroupIds,
  Value<bool> isRestDay,
});

class $$WorkoutPlanDaysTableFilterComposer
    extends Composer<_$AppDatabase, $WorkoutPlanDaysTable> {
  $$WorkoutPlanDaysTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get planId => $composableBuilder(
      column: $table.planId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get dayOfWeek => $composableBuilder(
      column: $table.dayOfWeek, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get muscleGroupIds => $composableBuilder(
      column: $table.muscleGroupIds,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isRestDay => $composableBuilder(
      column: $table.isRestDay, builder: (column) => ColumnFilters(column));
}

class $$WorkoutPlanDaysTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkoutPlanDaysTable> {
  $$WorkoutPlanDaysTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get planId => $composableBuilder(
      column: $table.planId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get dayOfWeek => $composableBuilder(
      column: $table.dayOfWeek, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get muscleGroupIds => $composableBuilder(
      column: $table.muscleGroupIds,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isRestDay => $composableBuilder(
      column: $table.isRestDay, builder: (column) => ColumnOrderings(column));
}

class $$WorkoutPlanDaysTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkoutPlanDaysTable> {
  $$WorkoutPlanDaysTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get planId =>
      $composableBuilder(column: $table.planId, builder: (column) => column);

  GeneratedColumn<int> get dayOfWeek =>
      $composableBuilder(column: $table.dayOfWeek, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get muscleGroupIds => $composableBuilder(
      column: $table.muscleGroupIds, builder: (column) => column);

  GeneratedColumn<bool> get isRestDay =>
      $composableBuilder(column: $table.isRestDay, builder: (column) => column);
}

class $$WorkoutPlanDaysTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WorkoutPlanDaysTable,
    WorkoutPlanDayData,
    $$WorkoutPlanDaysTableFilterComposer,
    $$WorkoutPlanDaysTableOrderingComposer,
    $$WorkoutPlanDaysTableAnnotationComposer,
    $$WorkoutPlanDaysTableCreateCompanionBuilder,
    $$WorkoutPlanDaysTableUpdateCompanionBuilder,
    (
      WorkoutPlanDayData,
      BaseReferences<_$AppDatabase, $WorkoutPlanDaysTable, WorkoutPlanDayData>
    ),
    WorkoutPlanDayData,
    PrefetchHooks Function()> {
  $$WorkoutPlanDaysTableTableManager(
      _$AppDatabase db, $WorkoutPlanDaysTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkoutPlanDaysTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkoutPlanDaysTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkoutPlanDaysTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> planId = const Value.absent(),
            Value<int> dayOfWeek = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> muscleGroupIds = const Value.absent(),
            Value<bool> isRestDay = const Value.absent(),
          }) =>
              WorkoutPlanDaysCompanion(
            id: id,
            planId: planId,
            dayOfWeek: dayOfWeek,
            name: name,
            muscleGroupIds: muscleGroupIds,
            isRestDay: isRestDay,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String planId,
            required int dayOfWeek,
            required String name,
            Value<String> muscleGroupIds = const Value.absent(),
            Value<bool> isRestDay = const Value.absent(),
          }) =>
              WorkoutPlanDaysCompanion.insert(
            id: id,
            planId: planId,
            dayOfWeek: dayOfWeek,
            name: name,
            muscleGroupIds: muscleGroupIds,
            isRestDay: isRestDay,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$WorkoutPlanDaysTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $WorkoutPlanDaysTable,
    WorkoutPlanDayData,
    $$WorkoutPlanDaysTableFilterComposer,
    $$WorkoutPlanDaysTableOrderingComposer,
    $$WorkoutPlanDaysTableAnnotationComposer,
    $$WorkoutPlanDaysTableCreateCompanionBuilder,
    $$WorkoutPlanDaysTableUpdateCompanionBuilder,
    (
      WorkoutPlanDayData,
      BaseReferences<_$AppDatabase, $WorkoutPlanDaysTable, WorkoutPlanDayData>
    ),
    WorkoutPlanDayData,
    PrefetchHooks Function()>;
typedef $$WorkoutsTableCreateCompanionBuilder = WorkoutsCompanion Function({
  required String id,
  required String userId,
  Value<String?> planId,
  Value<int?> planDayId,
  required String name,
  required int startedAt,
  Value<int?> endedAt,
  Value<String> notes,
  Value<double> totalVolumeKg,
  Value<bool> isAdHoc,
  Value<int> rowid,
});
typedef $$WorkoutsTableUpdateCompanionBuilder = WorkoutsCompanion Function({
  Value<String> id,
  Value<String> userId,
  Value<String?> planId,
  Value<int?> planDayId,
  Value<String> name,
  Value<int> startedAt,
  Value<int?> endedAt,
  Value<String> notes,
  Value<double> totalVolumeKg,
  Value<bool> isAdHoc,
  Value<int> rowid,
});

class $$WorkoutsTableFilterComposer
    extends Composer<_$AppDatabase, $WorkoutsTable> {
  $$WorkoutsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get planId => $composableBuilder(
      column: $table.planId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get planDayId => $composableBuilder(
      column: $table.planDayId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get startedAt => $composableBuilder(
      column: $table.startedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get endedAt => $composableBuilder(
      column: $table.endedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get totalVolumeKg => $composableBuilder(
      column: $table.totalVolumeKg, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isAdHoc => $composableBuilder(
      column: $table.isAdHoc, builder: (column) => ColumnFilters(column));
}

class $$WorkoutsTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkoutsTable> {
  $$WorkoutsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get planId => $composableBuilder(
      column: $table.planId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get planDayId => $composableBuilder(
      column: $table.planDayId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get startedAt => $composableBuilder(
      column: $table.startedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get endedAt => $composableBuilder(
      column: $table.endedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get totalVolumeKg => $composableBuilder(
      column: $table.totalVolumeKg,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isAdHoc => $composableBuilder(
      column: $table.isAdHoc, builder: (column) => ColumnOrderings(column));
}

class $$WorkoutsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkoutsTable> {
  $$WorkoutsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get planId =>
      $composableBuilder(column: $table.planId, builder: (column) => column);

  GeneratedColumn<int> get planDayId =>
      $composableBuilder(column: $table.planDayId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<int> get endedAt =>
      $composableBuilder(column: $table.endedAt, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<double> get totalVolumeKg => $composableBuilder(
      column: $table.totalVolumeKg, builder: (column) => column);

  GeneratedColumn<bool> get isAdHoc =>
      $composableBuilder(column: $table.isAdHoc, builder: (column) => column);
}

class $$WorkoutsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WorkoutsTable,
    WorkoutData,
    $$WorkoutsTableFilterComposer,
    $$WorkoutsTableOrderingComposer,
    $$WorkoutsTableAnnotationComposer,
    $$WorkoutsTableCreateCompanionBuilder,
    $$WorkoutsTableUpdateCompanionBuilder,
    (WorkoutData, BaseReferences<_$AppDatabase, $WorkoutsTable, WorkoutData>),
    WorkoutData,
    PrefetchHooks Function()> {
  $$WorkoutsTableTableManager(_$AppDatabase db, $WorkoutsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkoutsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkoutsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkoutsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<String?> planId = const Value.absent(),
            Value<int?> planDayId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> startedAt = const Value.absent(),
            Value<int?> endedAt = const Value.absent(),
            Value<String> notes = const Value.absent(),
            Value<double> totalVolumeKg = const Value.absent(),
            Value<bool> isAdHoc = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WorkoutsCompanion(
            id: id,
            userId: userId,
            planId: planId,
            planDayId: planDayId,
            name: name,
            startedAt: startedAt,
            endedAt: endedAt,
            notes: notes,
            totalVolumeKg: totalVolumeKg,
            isAdHoc: isAdHoc,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String userId,
            Value<String?> planId = const Value.absent(),
            Value<int?> planDayId = const Value.absent(),
            required String name,
            required int startedAt,
            Value<int?> endedAt = const Value.absent(),
            Value<String> notes = const Value.absent(),
            Value<double> totalVolumeKg = const Value.absent(),
            Value<bool> isAdHoc = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WorkoutsCompanion.insert(
            id: id,
            userId: userId,
            planId: planId,
            planDayId: planDayId,
            name: name,
            startedAt: startedAt,
            endedAt: endedAt,
            notes: notes,
            totalVolumeKg: totalVolumeKg,
            isAdHoc: isAdHoc,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$WorkoutsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $WorkoutsTable,
    WorkoutData,
    $$WorkoutsTableFilterComposer,
    $$WorkoutsTableOrderingComposer,
    $$WorkoutsTableAnnotationComposer,
    $$WorkoutsTableCreateCompanionBuilder,
    $$WorkoutsTableUpdateCompanionBuilder,
    (WorkoutData, BaseReferences<_$AppDatabase, $WorkoutsTable, WorkoutData>),
    WorkoutData,
    PrefetchHooks Function()>;
typedef $$WorkoutExercisesTableCreateCompanionBuilder
    = WorkoutExercisesCompanion Function({
  required String id,
  required String workoutId,
  required int exerciseId,
  required int orderIndex,
  Value<int?> supersetGroup,
  Value<String> notes,
  Value<int> rowid,
});
typedef $$WorkoutExercisesTableUpdateCompanionBuilder
    = WorkoutExercisesCompanion Function({
  Value<String> id,
  Value<String> workoutId,
  Value<int> exerciseId,
  Value<int> orderIndex,
  Value<int?> supersetGroup,
  Value<String> notes,
  Value<int> rowid,
});

class $$WorkoutExercisesTableFilterComposer
    extends Composer<_$AppDatabase, $WorkoutExercisesTable> {
  $$WorkoutExercisesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get workoutId => $composableBuilder(
      column: $table.workoutId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get exerciseId => $composableBuilder(
      column: $table.exerciseId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get orderIndex => $composableBuilder(
      column: $table.orderIndex, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get supersetGroup => $composableBuilder(
      column: $table.supersetGroup, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));
}

class $$WorkoutExercisesTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkoutExercisesTable> {
  $$WorkoutExercisesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get workoutId => $composableBuilder(
      column: $table.workoutId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get exerciseId => $composableBuilder(
      column: $table.exerciseId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get orderIndex => $composableBuilder(
      column: $table.orderIndex, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get supersetGroup => $composableBuilder(
      column: $table.supersetGroup,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));
}

class $$WorkoutExercisesTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkoutExercisesTable> {
  $$WorkoutExercisesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get workoutId =>
      $composableBuilder(column: $table.workoutId, builder: (column) => column);

  GeneratedColumn<int> get exerciseId => $composableBuilder(
      column: $table.exerciseId, builder: (column) => column);

  GeneratedColumn<int> get orderIndex => $composableBuilder(
      column: $table.orderIndex, builder: (column) => column);

  GeneratedColumn<int> get supersetGroup => $composableBuilder(
      column: $table.supersetGroup, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$WorkoutExercisesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WorkoutExercisesTable,
    WorkoutExerciseData,
    $$WorkoutExercisesTableFilterComposer,
    $$WorkoutExercisesTableOrderingComposer,
    $$WorkoutExercisesTableAnnotationComposer,
    $$WorkoutExercisesTableCreateCompanionBuilder,
    $$WorkoutExercisesTableUpdateCompanionBuilder,
    (
      WorkoutExerciseData,
      BaseReferences<_$AppDatabase, $WorkoutExercisesTable, WorkoutExerciseData>
    ),
    WorkoutExerciseData,
    PrefetchHooks Function()> {
  $$WorkoutExercisesTableTableManager(
      _$AppDatabase db, $WorkoutExercisesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkoutExercisesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkoutExercisesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkoutExercisesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> workoutId = const Value.absent(),
            Value<int> exerciseId = const Value.absent(),
            Value<int> orderIndex = const Value.absent(),
            Value<int?> supersetGroup = const Value.absent(),
            Value<String> notes = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WorkoutExercisesCompanion(
            id: id,
            workoutId: workoutId,
            exerciseId: exerciseId,
            orderIndex: orderIndex,
            supersetGroup: supersetGroup,
            notes: notes,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String workoutId,
            required int exerciseId,
            required int orderIndex,
            Value<int?> supersetGroup = const Value.absent(),
            Value<String> notes = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WorkoutExercisesCompanion.insert(
            id: id,
            workoutId: workoutId,
            exerciseId: exerciseId,
            orderIndex: orderIndex,
            supersetGroup: supersetGroup,
            notes: notes,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$WorkoutExercisesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $WorkoutExercisesTable,
    WorkoutExerciseData,
    $$WorkoutExercisesTableFilterComposer,
    $$WorkoutExercisesTableOrderingComposer,
    $$WorkoutExercisesTableAnnotationComposer,
    $$WorkoutExercisesTableCreateCompanionBuilder,
    $$WorkoutExercisesTableUpdateCompanionBuilder,
    (
      WorkoutExerciseData,
      BaseReferences<_$AppDatabase, $WorkoutExercisesTable, WorkoutExerciseData>
    ),
    WorkoutExerciseData,
    PrefetchHooks Function()>;
typedef $$SetsTableCreateCompanionBuilder = SetsCompanion Function({
  required String id,
  required String workoutExerciseId,
  required int setNumber,
  required int reps,
  required double weight,
  required String weightUnit,
  Value<String> setType,
  Value<int?> restSeconds,
  Value<double?> rpe,
  Value<String> notes,
  required int completedAt,
  Value<int> rowid,
});
typedef $$SetsTableUpdateCompanionBuilder = SetsCompanion Function({
  Value<String> id,
  Value<String> workoutExerciseId,
  Value<int> setNumber,
  Value<int> reps,
  Value<double> weight,
  Value<String> weightUnit,
  Value<String> setType,
  Value<int?> restSeconds,
  Value<double?> rpe,
  Value<String> notes,
  Value<int> completedAt,
  Value<int> rowid,
});

class $$SetsTableFilterComposer extends Composer<_$AppDatabase, $SetsTable> {
  $$SetsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get workoutExerciseId => $composableBuilder(
      column: $table.workoutExerciseId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get setNumber => $composableBuilder(
      column: $table.setNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get reps => $composableBuilder(
      column: $table.reps, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get weight => $composableBuilder(
      column: $table.weight, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get weightUnit => $composableBuilder(
      column: $table.weightUnit, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get setType => $composableBuilder(
      column: $table.setType, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get restSeconds => $composableBuilder(
      column: $table.restSeconds, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get rpe => $composableBuilder(
      column: $table.rpe, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => ColumnFilters(column));
}

class $$SetsTableOrderingComposer extends Composer<_$AppDatabase, $SetsTable> {
  $$SetsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get workoutExerciseId => $composableBuilder(
      column: $table.workoutExerciseId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get setNumber => $composableBuilder(
      column: $table.setNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get reps => $composableBuilder(
      column: $table.reps, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get weight => $composableBuilder(
      column: $table.weight, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get weightUnit => $composableBuilder(
      column: $table.weightUnit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get setType => $composableBuilder(
      column: $table.setType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get restSeconds => $composableBuilder(
      column: $table.restSeconds, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get rpe => $composableBuilder(
      column: $table.rpe, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => ColumnOrderings(column));
}

class $$SetsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SetsTable> {
  $$SetsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get workoutExerciseId => $composableBuilder(
      column: $table.workoutExerciseId, builder: (column) => column);

  GeneratedColumn<int> get setNumber =>
      $composableBuilder(column: $table.setNumber, builder: (column) => column);

  GeneratedColumn<int> get reps =>
      $composableBuilder(column: $table.reps, builder: (column) => column);

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<String> get weightUnit => $composableBuilder(
      column: $table.weightUnit, builder: (column) => column);

  GeneratedColumn<String> get setType =>
      $composableBuilder(column: $table.setType, builder: (column) => column);

  GeneratedColumn<int> get restSeconds => $composableBuilder(
      column: $table.restSeconds, builder: (column) => column);

  GeneratedColumn<double> get rpe =>
      $composableBuilder(column: $table.rpe, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<int> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => column);
}

class $$SetsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SetsTable,
    SetData,
    $$SetsTableFilterComposer,
    $$SetsTableOrderingComposer,
    $$SetsTableAnnotationComposer,
    $$SetsTableCreateCompanionBuilder,
    $$SetsTableUpdateCompanionBuilder,
    (SetData, BaseReferences<_$AppDatabase, $SetsTable, SetData>),
    SetData,
    PrefetchHooks Function()> {
  $$SetsTableTableManager(_$AppDatabase db, $SetsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SetsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SetsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SetsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> workoutExerciseId = const Value.absent(),
            Value<int> setNumber = const Value.absent(),
            Value<int> reps = const Value.absent(),
            Value<double> weight = const Value.absent(),
            Value<String> weightUnit = const Value.absent(),
            Value<String> setType = const Value.absent(),
            Value<int?> restSeconds = const Value.absent(),
            Value<double?> rpe = const Value.absent(),
            Value<String> notes = const Value.absent(),
            Value<int> completedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SetsCompanion(
            id: id,
            workoutExerciseId: workoutExerciseId,
            setNumber: setNumber,
            reps: reps,
            weight: weight,
            weightUnit: weightUnit,
            setType: setType,
            restSeconds: restSeconds,
            rpe: rpe,
            notes: notes,
            completedAt: completedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String workoutExerciseId,
            required int setNumber,
            required int reps,
            required double weight,
            required String weightUnit,
            Value<String> setType = const Value.absent(),
            Value<int?> restSeconds = const Value.absent(),
            Value<double?> rpe = const Value.absent(),
            Value<String> notes = const Value.absent(),
            required int completedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              SetsCompanion.insert(
            id: id,
            workoutExerciseId: workoutExerciseId,
            setNumber: setNumber,
            reps: reps,
            weight: weight,
            weightUnit: weightUnit,
            setType: setType,
            restSeconds: restSeconds,
            rpe: rpe,
            notes: notes,
            completedAt: completedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SetsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SetsTable,
    SetData,
    $$SetsTableFilterComposer,
    $$SetsTableOrderingComposer,
    $$SetsTableAnnotationComposer,
    $$SetsTableCreateCompanionBuilder,
    $$SetsTableUpdateCompanionBuilder,
    (SetData, BaseReferences<_$AppDatabase, $SetsTable, SetData>),
    SetData,
    PrefetchHooks Function()>;
typedef $$GoalsTableCreateCompanionBuilder = GoalsCompanion Function({
  required String id,
  required String userId,
  required String type,
  required String description,
  required double targetValue,
  Value<double> currentValue,
  Value<int?> exerciseId,
  Value<int?> muscleGroupId,
  Value<int?> deadline,
  required int createdAt,
  Value<int?> achievedAt,
  Value<int> rowid,
});
typedef $$GoalsTableUpdateCompanionBuilder = GoalsCompanion Function({
  Value<String> id,
  Value<String> userId,
  Value<String> type,
  Value<String> description,
  Value<double> targetValue,
  Value<double> currentValue,
  Value<int?> exerciseId,
  Value<int?> muscleGroupId,
  Value<int?> deadline,
  Value<int> createdAt,
  Value<int?> achievedAt,
  Value<int> rowid,
});

class $$GoalsTableFilterComposer extends Composer<_$AppDatabase, $GoalsTable> {
  $$GoalsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get targetValue => $composableBuilder(
      column: $table.targetValue, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get currentValue => $composableBuilder(
      column: $table.currentValue, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get exerciseId => $composableBuilder(
      column: $table.exerciseId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get muscleGroupId => $composableBuilder(
      column: $table.muscleGroupId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get deadline => $composableBuilder(
      column: $table.deadline, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get achievedAt => $composableBuilder(
      column: $table.achievedAt, builder: (column) => ColumnFilters(column));
}

class $$GoalsTableOrderingComposer
    extends Composer<_$AppDatabase, $GoalsTable> {
  $$GoalsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get targetValue => $composableBuilder(
      column: $table.targetValue, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get currentValue => $composableBuilder(
      column: $table.currentValue,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get exerciseId => $composableBuilder(
      column: $table.exerciseId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get muscleGroupId => $composableBuilder(
      column: $table.muscleGroupId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get deadline => $composableBuilder(
      column: $table.deadline, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get achievedAt => $composableBuilder(
      column: $table.achievedAt, builder: (column) => ColumnOrderings(column));
}

class $$GoalsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GoalsTable> {
  $$GoalsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<double> get targetValue => $composableBuilder(
      column: $table.targetValue, builder: (column) => column);

  GeneratedColumn<double> get currentValue => $composableBuilder(
      column: $table.currentValue, builder: (column) => column);

  GeneratedColumn<int> get exerciseId => $composableBuilder(
      column: $table.exerciseId, builder: (column) => column);

  GeneratedColumn<int> get muscleGroupId => $composableBuilder(
      column: $table.muscleGroupId, builder: (column) => column);

  GeneratedColumn<int> get deadline =>
      $composableBuilder(column: $table.deadline, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get achievedAt => $composableBuilder(
      column: $table.achievedAt, builder: (column) => column);
}

class $$GoalsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GoalsTable,
    GoalData,
    $$GoalsTableFilterComposer,
    $$GoalsTableOrderingComposer,
    $$GoalsTableAnnotationComposer,
    $$GoalsTableCreateCompanionBuilder,
    $$GoalsTableUpdateCompanionBuilder,
    (GoalData, BaseReferences<_$AppDatabase, $GoalsTable, GoalData>),
    GoalData,
    PrefetchHooks Function()> {
  $$GoalsTableTableManager(_$AppDatabase db, $GoalsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GoalsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GoalsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GoalsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<double> targetValue = const Value.absent(),
            Value<double> currentValue = const Value.absent(),
            Value<int?> exerciseId = const Value.absent(),
            Value<int?> muscleGroupId = const Value.absent(),
            Value<int?> deadline = const Value.absent(),
            Value<int> createdAt = const Value.absent(),
            Value<int?> achievedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GoalsCompanion(
            id: id,
            userId: userId,
            type: type,
            description: description,
            targetValue: targetValue,
            currentValue: currentValue,
            exerciseId: exerciseId,
            muscleGroupId: muscleGroupId,
            deadline: deadline,
            createdAt: createdAt,
            achievedAt: achievedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String userId,
            required String type,
            required String description,
            required double targetValue,
            Value<double> currentValue = const Value.absent(),
            Value<int?> exerciseId = const Value.absent(),
            Value<int?> muscleGroupId = const Value.absent(),
            Value<int?> deadline = const Value.absent(),
            required int createdAt,
            Value<int?> achievedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GoalsCompanion.insert(
            id: id,
            userId: userId,
            type: type,
            description: description,
            targetValue: targetValue,
            currentValue: currentValue,
            exerciseId: exerciseId,
            muscleGroupId: muscleGroupId,
            deadline: deadline,
            createdAt: createdAt,
            achievedAt: achievedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$GoalsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $GoalsTable,
    GoalData,
    $$GoalsTableFilterComposer,
    $$GoalsTableOrderingComposer,
    $$GoalsTableAnnotationComposer,
    $$GoalsTableCreateCompanionBuilder,
    $$GoalsTableUpdateCompanionBuilder,
    (GoalData, BaseReferences<_$AppDatabase, $GoalsTable, GoalData>),
    GoalData,
    PrefetchHooks Function()>;
typedef $$BodyMeasurementsTableCreateCompanionBuilder
    = BodyMeasurementsCompanion Function({
  required String id,
  required String userId,
  Value<double?> weightKg,
  Value<double?> bodyFatPct,
  Value<double?> chestCm,
  Value<double?> waistCm,
  Value<double?> hipsCm,
  Value<double?> bicepCm,
  Value<double?> thighCm,
  Value<String> notes,
  required int measuredAt,
  Value<int> rowid,
});
typedef $$BodyMeasurementsTableUpdateCompanionBuilder
    = BodyMeasurementsCompanion Function({
  Value<String> id,
  Value<String> userId,
  Value<double?> weightKg,
  Value<double?> bodyFatPct,
  Value<double?> chestCm,
  Value<double?> waistCm,
  Value<double?> hipsCm,
  Value<double?> bicepCm,
  Value<double?> thighCm,
  Value<String> notes,
  Value<int> measuredAt,
  Value<int> rowid,
});

class $$BodyMeasurementsTableFilterComposer
    extends Composer<_$AppDatabase, $BodyMeasurementsTable> {
  $$BodyMeasurementsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get weightKg => $composableBuilder(
      column: $table.weightKg, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get bodyFatPct => $composableBuilder(
      column: $table.bodyFatPct, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get chestCm => $composableBuilder(
      column: $table.chestCm, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get waistCm => $composableBuilder(
      column: $table.waistCm, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get hipsCm => $composableBuilder(
      column: $table.hipsCm, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get bicepCm => $composableBuilder(
      column: $table.bicepCm, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get thighCm => $composableBuilder(
      column: $table.thighCm, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get measuredAt => $composableBuilder(
      column: $table.measuredAt, builder: (column) => ColumnFilters(column));
}

class $$BodyMeasurementsTableOrderingComposer
    extends Composer<_$AppDatabase, $BodyMeasurementsTable> {
  $$BodyMeasurementsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get weightKg => $composableBuilder(
      column: $table.weightKg, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get bodyFatPct => $composableBuilder(
      column: $table.bodyFatPct, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get chestCm => $composableBuilder(
      column: $table.chestCm, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get waistCm => $composableBuilder(
      column: $table.waistCm, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get hipsCm => $composableBuilder(
      column: $table.hipsCm, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get bicepCm => $composableBuilder(
      column: $table.bicepCm, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get thighCm => $composableBuilder(
      column: $table.thighCm, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get measuredAt => $composableBuilder(
      column: $table.measuredAt, builder: (column) => ColumnOrderings(column));
}

class $$BodyMeasurementsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BodyMeasurementsTable> {
  $$BodyMeasurementsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<double> get weightKg =>
      $composableBuilder(column: $table.weightKg, builder: (column) => column);

  GeneratedColumn<double> get bodyFatPct => $composableBuilder(
      column: $table.bodyFatPct, builder: (column) => column);

  GeneratedColumn<double> get chestCm =>
      $composableBuilder(column: $table.chestCm, builder: (column) => column);

  GeneratedColumn<double> get waistCm =>
      $composableBuilder(column: $table.waistCm, builder: (column) => column);

  GeneratedColumn<double> get hipsCm =>
      $composableBuilder(column: $table.hipsCm, builder: (column) => column);

  GeneratedColumn<double> get bicepCm =>
      $composableBuilder(column: $table.bicepCm, builder: (column) => column);

  GeneratedColumn<double> get thighCm =>
      $composableBuilder(column: $table.thighCm, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<int> get measuredAt => $composableBuilder(
      column: $table.measuredAt, builder: (column) => column);
}

class $$BodyMeasurementsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BodyMeasurementsTable,
    BodyMeasurementData,
    $$BodyMeasurementsTableFilterComposer,
    $$BodyMeasurementsTableOrderingComposer,
    $$BodyMeasurementsTableAnnotationComposer,
    $$BodyMeasurementsTableCreateCompanionBuilder,
    $$BodyMeasurementsTableUpdateCompanionBuilder,
    (
      BodyMeasurementData,
      BaseReferences<_$AppDatabase, $BodyMeasurementsTable, BodyMeasurementData>
    ),
    BodyMeasurementData,
    PrefetchHooks Function()> {
  $$BodyMeasurementsTableTableManager(
      _$AppDatabase db, $BodyMeasurementsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BodyMeasurementsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BodyMeasurementsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BodyMeasurementsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<double?> weightKg = const Value.absent(),
            Value<double?> bodyFatPct = const Value.absent(),
            Value<double?> chestCm = const Value.absent(),
            Value<double?> waistCm = const Value.absent(),
            Value<double?> hipsCm = const Value.absent(),
            Value<double?> bicepCm = const Value.absent(),
            Value<double?> thighCm = const Value.absent(),
            Value<String> notes = const Value.absent(),
            Value<int> measuredAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BodyMeasurementsCompanion(
            id: id,
            userId: userId,
            weightKg: weightKg,
            bodyFatPct: bodyFatPct,
            chestCm: chestCm,
            waistCm: waistCm,
            hipsCm: hipsCm,
            bicepCm: bicepCm,
            thighCm: thighCm,
            notes: notes,
            measuredAt: measuredAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String userId,
            Value<double?> weightKg = const Value.absent(),
            Value<double?> bodyFatPct = const Value.absent(),
            Value<double?> chestCm = const Value.absent(),
            Value<double?> waistCm = const Value.absent(),
            Value<double?> hipsCm = const Value.absent(),
            Value<double?> bicepCm = const Value.absent(),
            Value<double?> thighCm = const Value.absent(),
            Value<String> notes = const Value.absent(),
            required int measuredAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              BodyMeasurementsCompanion.insert(
            id: id,
            userId: userId,
            weightKg: weightKg,
            bodyFatPct: bodyFatPct,
            chestCm: chestCm,
            waistCm: waistCm,
            hipsCm: hipsCm,
            bicepCm: bicepCm,
            thighCm: thighCm,
            notes: notes,
            measuredAt: measuredAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$BodyMeasurementsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $BodyMeasurementsTable,
    BodyMeasurementData,
    $$BodyMeasurementsTableFilterComposer,
    $$BodyMeasurementsTableOrderingComposer,
    $$BodyMeasurementsTableAnnotationComposer,
    $$BodyMeasurementsTableCreateCompanionBuilder,
    $$BodyMeasurementsTableUpdateCompanionBuilder,
    (
      BodyMeasurementData,
      BaseReferences<_$AppDatabase, $BodyMeasurementsTable, BodyMeasurementData>
    ),
    BodyMeasurementData,
    PrefetchHooks Function()>;
typedef $$AiNudgesTableCreateCompanionBuilder = AiNudgesCompanion Function({
  required String id,
  required String userId,
  required String type,
  required String message,
  Value<String> actionData,
  Value<bool> isDismissed,
  required int createdAt,
  Value<int> rowid,
});
typedef $$AiNudgesTableUpdateCompanionBuilder = AiNudgesCompanion Function({
  Value<String> id,
  Value<String> userId,
  Value<String> type,
  Value<String> message,
  Value<String> actionData,
  Value<bool> isDismissed,
  Value<int> createdAt,
  Value<int> rowid,
});

class $$AiNudgesTableFilterComposer
    extends Composer<_$AppDatabase, $AiNudgesTable> {
  $$AiNudgesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get message => $composableBuilder(
      column: $table.message, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get actionData => $composableBuilder(
      column: $table.actionData, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDismissed => $composableBuilder(
      column: $table.isDismissed, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$AiNudgesTableOrderingComposer
    extends Composer<_$AppDatabase, $AiNudgesTable> {
  $$AiNudgesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get message => $composableBuilder(
      column: $table.message, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get actionData => $composableBuilder(
      column: $table.actionData, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDismissed => $composableBuilder(
      column: $table.isDismissed, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$AiNudgesTableAnnotationComposer
    extends Composer<_$AppDatabase, $AiNudgesTable> {
  $$AiNudgesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get message =>
      $composableBuilder(column: $table.message, builder: (column) => column);

  GeneratedColumn<String> get actionData => $composableBuilder(
      column: $table.actionData, builder: (column) => column);

  GeneratedColumn<bool> get isDismissed => $composableBuilder(
      column: $table.isDismissed, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$AiNudgesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AiNudgesTable,
    AiNudgeData,
    $$AiNudgesTableFilterComposer,
    $$AiNudgesTableOrderingComposer,
    $$AiNudgesTableAnnotationComposer,
    $$AiNudgesTableCreateCompanionBuilder,
    $$AiNudgesTableUpdateCompanionBuilder,
    (AiNudgeData, BaseReferences<_$AppDatabase, $AiNudgesTable, AiNudgeData>),
    AiNudgeData,
    PrefetchHooks Function()> {
  $$AiNudgesTableTableManager(_$AppDatabase db, $AiNudgesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AiNudgesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AiNudgesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AiNudgesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String> message = const Value.absent(),
            Value<String> actionData = const Value.absent(),
            Value<bool> isDismissed = const Value.absent(),
            Value<int> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AiNudgesCompanion(
            id: id,
            userId: userId,
            type: type,
            message: message,
            actionData: actionData,
            isDismissed: isDismissed,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String userId,
            required String type,
            required String message,
            Value<String> actionData = const Value.absent(),
            Value<bool> isDismissed = const Value.absent(),
            required int createdAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              AiNudgesCompanion.insert(
            id: id,
            userId: userId,
            type: type,
            message: message,
            actionData: actionData,
            isDismissed: isDismissed,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AiNudgesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AiNudgesTable,
    AiNudgeData,
    $$AiNudgesTableFilterComposer,
    $$AiNudgesTableOrderingComposer,
    $$AiNudgesTableAnnotationComposer,
    $$AiNudgesTableCreateCompanionBuilder,
    $$AiNudgesTableUpdateCompanionBuilder,
    (AiNudgeData, BaseReferences<_$AppDatabase, $AiNudgesTable, AiNudgeData>),
    AiNudgeData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$ExercisesTableTableManager get exercises =>
      $$ExercisesTableTableManager(_db, _db.exercises);
  $$MuscleGroupsTableTableManager get muscleGroups =>
      $$MuscleGroupsTableTableManager(_db, _db.muscleGroups);
  $$WorkoutPlansTableTableManager get workoutPlans =>
      $$WorkoutPlansTableTableManager(_db, _db.workoutPlans);
  $$WorkoutPlanDaysTableTableManager get workoutPlanDays =>
      $$WorkoutPlanDaysTableTableManager(_db, _db.workoutPlanDays);
  $$WorkoutsTableTableManager get workouts =>
      $$WorkoutsTableTableManager(_db, _db.workouts);
  $$WorkoutExercisesTableTableManager get workoutExercises =>
      $$WorkoutExercisesTableTableManager(_db, _db.workoutExercises);
  $$SetsTableTableManager get sets => $$SetsTableTableManager(_db, _db.sets);
  $$GoalsTableTableManager get goals =>
      $$GoalsTableTableManager(_db, _db.goals);
  $$BodyMeasurementsTableTableManager get bodyMeasurements =>
      $$BodyMeasurementsTableTableManager(_db, _db.bodyMeasurements);
  $$AiNudgesTableTableManager get aiNudges =>
      $$AiNudgesTableTableManager(_db, _db.aiNudges);
}
