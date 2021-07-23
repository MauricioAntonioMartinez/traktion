// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Exercise extends DataClass implements Insertable<Exercise> {
  final int? id;
  final String name;
  final String lastWorkouts;
  final double? maxVolume;
  final double? maxWeigth;
  final int? maxWeigthSetId;
  final int? maxVolumeSetId;
  final String? notes;
  final Difficulty difficulty;
  Exercise(
      {this.id,
      required this.name,
      required this.lastWorkouts,
      this.maxVolume,
      this.maxWeigth,
      this.maxWeigthSetId,
      this.maxVolumeSetId,
      this.notes,
      required this.difficulty});
  factory Exercise.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    return Exercise(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      lastWorkouts: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}last_workouts']),
      maxVolume: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}max_volume']),
      maxWeigth: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}max_weigth']),
      maxWeigthSetId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}max_weigth_set_id']),
      maxVolumeSetId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}max_volume_set_id']),
      notes:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}notes']),
      difficulty: $ExercisesTable.$converter0.mapToDart(intType
          .mapFromDatabaseResponse(data['${effectivePrefix}difficulty'])),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || lastWorkouts != null) {
      map['last_workouts'] = Variable<String>(lastWorkouts);
    }
    if (!nullToAbsent || maxVolume != null) {
      map['max_volume'] = Variable<double>(maxVolume);
    }
    if (!nullToAbsent || maxWeigth != null) {
      map['max_weigth'] = Variable<double>(maxWeigth);
    }
    if (!nullToAbsent || maxWeigthSetId != null) {
      map['max_weigth_set_id'] = Variable<int>(maxWeigthSetId);
    }
    if (!nullToAbsent || maxVolumeSetId != null) {
      map['max_volume_set_id'] = Variable<int>(maxVolumeSetId);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || difficulty != null) {
      final converter = $ExercisesTable.$converter0;
      map['difficulty'] = Variable<int>(converter.mapToSql(difficulty));
    }
    return map;
  }

  ExercisesCompanion toCompanion(bool nullToAbsent) {
    return ExercisesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      lastWorkouts: lastWorkouts == null && nullToAbsent
          ? const Value.absent()
          : Value(lastWorkouts),
      maxVolume: maxVolume == null && nullToAbsent
          ? const Value.absent()
          : Value(maxVolume),
      maxWeigth: maxWeigth == null && nullToAbsent
          ? const Value.absent()
          : Value(maxWeigth),
      maxWeigthSetId: maxWeigthSetId == null && nullToAbsent
          ? const Value.absent()
          : Value(maxWeigthSetId),
      maxVolumeSetId: maxVolumeSetId == null && nullToAbsent
          ? const Value.absent()
          : Value(maxVolumeSetId),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      difficulty: difficulty == null && nullToAbsent
          ? const Value.absent()
          : Value(difficulty),
    );
  }

  factory Exercise.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Exercise(
      id: serializer.fromJson<int?>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      lastWorkouts: serializer.fromJson<String>(json['lastWorkouts']),
      maxVolume: serializer.fromJson<double?>(json['maxVolume']),
      maxWeigth: serializer.fromJson<double?>(json['maxWeigth']),
      maxWeigthSetId: serializer.fromJson<int?>(json['maxWeigthSetId']),
      maxVolumeSetId: serializer.fromJson<int?>(json['maxVolumeSetId']),
      notes: serializer.fromJson<String?>(json['notes']),
      difficulty: serializer.fromJson<Difficulty>(json['difficulty']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'name': serializer.toJson<String>(name),
      'lastWorkouts': serializer.toJson<String>(lastWorkouts),
      'maxVolume': serializer.toJson<double?>(maxVolume),
      'maxWeigth': serializer.toJson<double?>(maxWeigth),
      'maxWeigthSetId': serializer.toJson<int?>(maxWeigthSetId),
      'maxVolumeSetId': serializer.toJson<int?>(maxVolumeSetId),
      'notes': serializer.toJson<String?>(notes),
      'difficulty': serializer.toJson<Difficulty>(difficulty),
    };
  }

  Exercise copyWith(
          {int? id,
          String? name,
          String? lastWorkouts,
          double? maxVolume,
          double? maxWeigth,
          int? maxWeigthSetId,
          int? maxVolumeSetId,
          String? notes,
          Difficulty? difficulty}) =>
      Exercise(
        id: id ?? this.id,
        name: name ?? this.name,
        lastWorkouts: lastWorkouts ?? this.lastWorkouts,
        maxVolume: maxVolume ?? this.maxVolume,
        maxWeigth: maxWeigth ?? this.maxWeigth,
        maxWeigthSetId: maxWeigthSetId ?? this.maxWeigthSetId,
        maxVolumeSetId: maxVolumeSetId ?? this.maxVolumeSetId,
        notes: notes ?? this.notes,
        difficulty: difficulty ?? this.difficulty,
      );
  @override
  String toString() {
    return (StringBuffer('Exercise(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('lastWorkouts: $lastWorkouts, ')
          ..write('maxVolume: $maxVolume, ')
          ..write('maxWeigth: $maxWeigth, ')
          ..write('maxWeigthSetId: $maxWeigthSetId, ')
          ..write('maxVolumeSetId: $maxVolumeSetId, ')
          ..write('notes: $notes, ')
          ..write('difficulty: $difficulty')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              lastWorkouts.hashCode,
              $mrjc(
                  maxVolume.hashCode,
                  $mrjc(
                      maxWeigth.hashCode,
                      $mrjc(
                          maxWeigthSetId.hashCode,
                          $mrjc(
                              maxVolumeSetId.hashCode,
                              $mrjc(
                                  notes.hashCode, difficulty.hashCode)))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Exercise &&
          other.id == this.id &&
          other.name == this.name &&
          other.lastWorkouts == this.lastWorkouts &&
          other.maxVolume == this.maxVolume &&
          other.maxWeigth == this.maxWeigth &&
          other.maxWeigthSetId == this.maxWeigthSetId &&
          other.maxVolumeSetId == this.maxVolumeSetId &&
          other.notes == this.notes &&
          other.difficulty == this.difficulty);
}

class ExercisesCompanion extends UpdateCompanion<Exercise> {
  final Value<int?> id;
  final Value<String> name;
  final Value<String> lastWorkouts;
  final Value<double?> maxVolume;
  final Value<double?> maxWeigth;
  final Value<int?> maxWeigthSetId;
  final Value<int?> maxVolumeSetId;
  final Value<String?> notes;
  final Value<Difficulty> difficulty;
  const ExercisesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.lastWorkouts = const Value.absent(),
    this.maxVolume = const Value.absent(),
    this.maxWeigth = const Value.absent(),
    this.maxWeigthSetId = const Value.absent(),
    this.maxVolumeSetId = const Value.absent(),
    this.notes = const Value.absent(),
    this.difficulty = const Value.absent(),
  });
  ExercisesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String lastWorkouts,
    this.maxVolume = const Value.absent(),
    this.maxWeigth = const Value.absent(),
    this.maxWeigthSetId = const Value.absent(),
    this.maxVolumeSetId = const Value.absent(),
    this.notes = const Value.absent(),
    required Difficulty difficulty,
  })   : name = Value(name),
        lastWorkouts = Value(lastWorkouts),
        difficulty = Value(difficulty);
  static Insertable<Exercise> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? lastWorkouts,
    Expression<double>? maxVolume,
    Expression<double>? maxWeigth,
    Expression<int>? maxWeigthSetId,
    Expression<int>? maxVolumeSetId,
    Expression<String>? notes,
    Expression<int>? difficulty,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (lastWorkouts != null) 'last_workouts': lastWorkouts,
      if (maxVolume != null) 'max_volume': maxVolume,
      if (maxWeigth != null) 'max_weigth': maxWeigth,
      if (maxWeigthSetId != null) 'max_weigth_set_id': maxWeigthSetId,
      if (maxVolumeSetId != null) 'max_volume_set_id': maxVolumeSetId,
      if (notes != null) 'notes': notes,
      if (difficulty != null) 'difficulty': difficulty,
    });
  }

  ExercisesCompanion copyWith(
      {Value<int?>? id,
      Value<String>? name,
      Value<String>? lastWorkouts,
      Value<double?>? maxVolume,
      Value<double?>? maxWeigth,
      Value<int?>? maxWeigthSetId,
      Value<int?>? maxVolumeSetId,
      Value<String?>? notes,
      Value<Difficulty>? difficulty}) {
    return ExercisesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      lastWorkouts: lastWorkouts ?? this.lastWorkouts,
      maxVolume: maxVolume ?? this.maxVolume,
      maxWeigth: maxWeigth ?? this.maxWeigth,
      maxWeigthSetId: maxWeigthSetId ?? this.maxWeigthSetId,
      maxVolumeSetId: maxVolumeSetId ?? this.maxVolumeSetId,
      notes: notes ?? this.notes,
      difficulty: difficulty ?? this.difficulty,
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
    if (lastWorkouts.present) {
      map['last_workouts'] = Variable<String>(lastWorkouts.value);
    }
    if (maxVolume.present) {
      map['max_volume'] = Variable<double>(maxVolume.value);
    }
    if (maxWeigth.present) {
      map['max_weigth'] = Variable<double>(maxWeigth.value);
    }
    if (maxWeigthSetId.present) {
      map['max_weigth_set_id'] = Variable<int>(maxWeigthSetId.value);
    }
    if (maxVolumeSetId.present) {
      map['max_volume_set_id'] = Variable<int>(maxVolumeSetId.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (difficulty.present) {
      final converter = $ExercisesTable.$converter0;
      map['difficulty'] = Variable<int>(converter.mapToSql(difficulty.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExercisesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('lastWorkouts: $lastWorkouts, ')
          ..write('maxVolume: $maxVolume, ')
          ..write('maxWeigth: $maxWeigth, ')
          ..write('maxWeigthSetId: $maxWeigthSetId, ')
          ..write('maxVolumeSetId: $maxVolumeSetId, ')
          ..write('notes: $notes, ')
          ..write('difficulty: $difficulty')
          ..write(')'))
        .toString();
  }
}

class $ExercisesTable extends Exercises
    with TableInfo<$ExercisesTable, Exercise> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ExercisesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, true,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedTextColumn name = _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _lastWorkoutsMeta =
      const VerificationMeta('lastWorkouts');
  @override
  late final GeneratedTextColumn lastWorkouts = _constructLastWorkouts();
  GeneratedTextColumn _constructLastWorkouts() {
    return GeneratedTextColumn(
      'last_workouts',
      $tableName,
      false,
    );
  }

  final VerificationMeta _maxVolumeMeta = const VerificationMeta('maxVolume');
  @override
  late final GeneratedRealColumn maxVolume = _constructMaxVolume();
  GeneratedRealColumn _constructMaxVolume() {
    return GeneratedRealColumn('max_volume', $tableName, true,
        defaultValue: const Constant(0.0));
  }

  final VerificationMeta _maxWeigthMeta = const VerificationMeta('maxWeigth');
  @override
  late final GeneratedRealColumn maxWeigth = _constructMaxWeigth();
  GeneratedRealColumn _constructMaxWeigth() {
    return GeneratedRealColumn('max_weigth', $tableName, true,
        defaultValue: const Constant(0.0));
  }

  final VerificationMeta _maxWeigthSetIdMeta =
      const VerificationMeta('maxWeigthSetId');
  @override
  late final GeneratedIntColumn maxWeigthSetId = _constructMaxWeigthSetId();
  GeneratedIntColumn _constructMaxWeigthSetId() {
    return GeneratedIntColumn(
      'max_weigth_set_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _maxVolumeSetIdMeta =
      const VerificationMeta('maxVolumeSetId');
  @override
  late final GeneratedIntColumn maxVolumeSetId = _constructMaxVolumeSetId();
  GeneratedIntColumn _constructMaxVolumeSetId() {
    return GeneratedIntColumn(
      'max_volume_set_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedTextColumn notes = _constructNotes();
  GeneratedTextColumn _constructNotes() {
    return GeneratedTextColumn('notes', $tableName, true, maxTextLength: 200);
  }

  final VerificationMeta _difficultyMeta = const VerificationMeta('difficulty');
  @override
  late final GeneratedIntColumn difficulty = _constructDifficulty();
  GeneratedIntColumn _constructDifficulty() {
    return GeneratedIntColumn(
      'difficulty',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        lastWorkouts,
        maxVolume,
        maxWeigth,
        maxWeigthSetId,
        maxVolumeSetId,
        notes,
        difficulty
      ];
  @override
  $ExercisesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'exercises';
  @override
  final String actualTableName = 'exercises';
  @override
  VerificationContext validateIntegrity(Insertable<Exercise> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('last_workouts')) {
      context.handle(
          _lastWorkoutsMeta,
          lastWorkouts.isAcceptableOrUnknown(
              data['last_workouts'], _lastWorkoutsMeta));
    } else if (isInserting) {
      context.missing(_lastWorkoutsMeta);
    }
    if (data.containsKey('max_volume')) {
      context.handle(_maxVolumeMeta,
          maxVolume.isAcceptableOrUnknown(data['max_volume'], _maxVolumeMeta));
    }
    if (data.containsKey('max_weigth')) {
      context.handle(_maxWeigthMeta,
          maxWeigth.isAcceptableOrUnknown(data['max_weigth'], _maxWeigthMeta));
    }
    if (data.containsKey('max_weigth_set_id')) {
      context.handle(
          _maxWeigthSetIdMeta,
          maxWeigthSetId.isAcceptableOrUnknown(
              data['max_weigth_set_id'], _maxWeigthSetIdMeta));
    }
    if (data.containsKey('max_volume_set_id')) {
      context.handle(
          _maxVolumeSetIdMeta,
          maxVolumeSetId.isAcceptableOrUnknown(
              data['max_volume_set_id'], _maxVolumeSetIdMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes'], _notesMeta));
    }
    context.handle(_difficultyMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Exercise map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Exercise.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ExercisesTable createAlias(String alias) {
    return $ExercisesTable(_db, alias);
  }

  static TypeConverter<Difficulty, int> $converter0 =
      const EnumIndexConverter<Difficulty>(Difficulty.values);
}

class ExerciseBodyPart extends DataClass
    implements Insertable<ExerciseBodyPart> {
  final int exerciseId;
  final BodyPartEnum bodyPart;
  ExerciseBodyPart({required this.exerciseId, required this.bodyPart});
  factory ExerciseBodyPart.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    return ExerciseBodyPart(
      exerciseId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}exercise_id']),
      bodyPart: $ExerciseBodyPartsTable.$converter0.mapToDart(
          intType.mapFromDatabaseResponse(data['${effectivePrefix}body_part'])),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || exerciseId != null) {
      map['exercise_id'] = Variable<int>(exerciseId);
    }
    if (!nullToAbsent || bodyPart != null) {
      final converter = $ExerciseBodyPartsTable.$converter0;
      map['body_part'] = Variable<int>(converter.mapToSql(bodyPart));
    }
    return map;
  }

  ExerciseBodyPartsCompanion toCompanion(bool nullToAbsent) {
    return ExerciseBodyPartsCompanion(
      exerciseId: exerciseId == null && nullToAbsent
          ? const Value.absent()
          : Value(exerciseId),
      bodyPart: bodyPart == null && nullToAbsent
          ? const Value.absent()
          : Value(bodyPart),
    );
  }

  factory ExerciseBodyPart.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ExerciseBodyPart(
      exerciseId: serializer.fromJson<int>(json['exerciseId']),
      bodyPart: serializer.fromJson<BodyPartEnum>(json['bodyPart']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'exerciseId': serializer.toJson<int>(exerciseId),
      'bodyPart': serializer.toJson<BodyPartEnum>(bodyPart),
    };
  }

  ExerciseBodyPart copyWith({int? exerciseId, BodyPartEnum? bodyPart}) =>
      ExerciseBodyPart(
        exerciseId: exerciseId ?? this.exerciseId,
        bodyPart: bodyPart ?? this.bodyPart,
      );
  @override
  String toString() {
    return (StringBuffer('ExerciseBodyPart(')
          ..write('exerciseId: $exerciseId, ')
          ..write('bodyPart: $bodyPart')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(exerciseId.hashCode, bodyPart.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ExerciseBodyPart &&
          other.exerciseId == this.exerciseId &&
          other.bodyPart == this.bodyPart);
}

class ExerciseBodyPartsCompanion extends UpdateCompanion<ExerciseBodyPart> {
  final Value<int> exerciseId;
  final Value<BodyPartEnum> bodyPart;
  const ExerciseBodyPartsCompanion({
    this.exerciseId = const Value.absent(),
    this.bodyPart = const Value.absent(),
  });
  ExerciseBodyPartsCompanion.insert({
    required int exerciseId,
    required BodyPartEnum bodyPart,
  })   : exerciseId = Value(exerciseId),
        bodyPart = Value(bodyPart);
  static Insertable<ExerciseBodyPart> custom({
    Expression<int>? exerciseId,
    Expression<int>? bodyPart,
  }) {
    return RawValuesInsertable({
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (bodyPart != null) 'body_part': bodyPart,
    });
  }

  ExerciseBodyPartsCompanion copyWith(
      {Value<int>? exerciseId, Value<BodyPartEnum>? bodyPart}) {
    return ExerciseBodyPartsCompanion(
      exerciseId: exerciseId ?? this.exerciseId,
      bodyPart: bodyPart ?? this.bodyPart,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (exerciseId.present) {
      map['exercise_id'] = Variable<int>(exerciseId.value);
    }
    if (bodyPart.present) {
      final converter = $ExerciseBodyPartsTable.$converter0;
      map['body_part'] = Variable<int>(converter.mapToSql(bodyPart.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseBodyPartsCompanion(')
          ..write('exerciseId: $exerciseId, ')
          ..write('bodyPart: $bodyPart')
          ..write(')'))
        .toString();
  }
}

class $ExerciseBodyPartsTable extends ExerciseBodyParts
    with TableInfo<$ExerciseBodyPartsTable, ExerciseBodyPart> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ExerciseBodyPartsTable(this._db, [this._alias]);
  final VerificationMeta _exerciseIdMeta = const VerificationMeta('exerciseId');
  @override
  late final GeneratedIntColumn exerciseId = _constructExerciseId();
  GeneratedIntColumn _constructExerciseId() {
    return GeneratedIntColumn('exercise_id', $tableName, false,
        $customConstraints: 'NOT NULL REFERENCES exercises (id)');
  }

  final VerificationMeta _bodyPartMeta = const VerificationMeta('bodyPart');
  @override
  late final GeneratedIntColumn bodyPart = _constructBodyPart();
  GeneratedIntColumn _constructBodyPart() {
    return GeneratedIntColumn(
      'body_part',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [exerciseId, bodyPart];
  @override
  $ExerciseBodyPartsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'exercise_body_parts';
  @override
  final String actualTableName = 'exercise_body_parts';
  @override
  VerificationContext validateIntegrity(Insertable<ExerciseBodyPart> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('exercise_id')) {
      context.handle(
          _exerciseIdMeta,
          exerciseId.isAcceptableOrUnknown(
              data['exercise_id'], _exerciseIdMeta));
    } else if (isInserting) {
      context.missing(_exerciseIdMeta);
    }
    context.handle(_bodyPartMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  ExerciseBodyPart map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ExerciseBodyPart.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ExerciseBodyPartsTable createAlias(String alias) {
    return $ExerciseBodyPartsTable(_db, alias);
  }

  static TypeConverter<BodyPartEnum, int> $converter0 =
      const EnumIndexConverter<BodyPartEnum>(BodyPartEnum.values);
}

class Migration extends DataClass implements Insertable<Migration> {
  final int? id;
  final String endPoint;
  final String payload;
  final String verb;
  Migration(
      {this.id,
      required this.endPoint,
      required this.payload,
      required this.verb});
  factory Migration.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Migration(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      endPoint: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}end_point']),
      payload:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}payload']),
      verb: stringType.mapFromDatabaseResponse(data['${effectivePrefix}verb']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || endPoint != null) {
      map['end_point'] = Variable<String>(endPoint);
    }
    if (!nullToAbsent || payload != null) {
      map['payload'] = Variable<String>(payload);
    }
    if (!nullToAbsent || verb != null) {
      map['verb'] = Variable<String>(verb);
    }
    return map;
  }

  MigrationsCompanion toCompanion(bool nullToAbsent) {
    return MigrationsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      endPoint: endPoint == null && nullToAbsent
          ? const Value.absent()
          : Value(endPoint),
      payload: payload == null && nullToAbsent
          ? const Value.absent()
          : Value(payload),
      verb: verb == null && nullToAbsent ? const Value.absent() : Value(verb),
    );
  }

  factory Migration.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Migration(
      id: serializer.fromJson<int?>(json['id']),
      endPoint: serializer.fromJson<String>(json['endPoint']),
      payload: serializer.fromJson<String>(json['payload']),
      verb: serializer.fromJson<String>(json['verb']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'endPoint': serializer.toJson<String>(endPoint),
      'payload': serializer.toJson<String>(payload),
      'verb': serializer.toJson<String>(verb),
    };
  }

  Migration copyWith(
          {int? id, String? endPoint, String? payload, String? verb}) =>
      Migration(
        id: id ?? this.id,
        endPoint: endPoint ?? this.endPoint,
        payload: payload ?? this.payload,
        verb: verb ?? this.verb,
      );
  @override
  String toString() {
    return (StringBuffer('Migration(')
          ..write('id: $id, ')
          ..write('endPoint: $endPoint, ')
          ..write('payload: $payload, ')
          ..write('verb: $verb')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(endPoint.hashCode, $mrjc(payload.hashCode, verb.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Migration &&
          other.id == this.id &&
          other.endPoint == this.endPoint &&
          other.payload == this.payload &&
          other.verb == this.verb);
}

class MigrationsCompanion extends UpdateCompanion<Migration> {
  final Value<int?> id;
  final Value<String> endPoint;
  final Value<String> payload;
  final Value<String> verb;
  const MigrationsCompanion({
    this.id = const Value.absent(),
    this.endPoint = const Value.absent(),
    this.payload = const Value.absent(),
    this.verb = const Value.absent(),
  });
  MigrationsCompanion.insert({
    this.id = const Value.absent(),
    required String endPoint,
    required String payload,
    required String verb,
  })   : endPoint = Value(endPoint),
        payload = Value(payload),
        verb = Value(verb);
  static Insertable<Migration> custom({
    Expression<int>? id,
    Expression<String>? endPoint,
    Expression<String>? payload,
    Expression<String>? verb,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (endPoint != null) 'end_point': endPoint,
      if (payload != null) 'payload': payload,
      if (verb != null) 'verb': verb,
    });
  }

  MigrationsCompanion copyWith(
      {Value<int?>? id,
      Value<String>? endPoint,
      Value<String>? payload,
      Value<String>? verb}) {
    return MigrationsCompanion(
      id: id ?? this.id,
      endPoint: endPoint ?? this.endPoint,
      payload: payload ?? this.payload,
      verb: verb ?? this.verb,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (endPoint.present) {
      map['end_point'] = Variable<String>(endPoint.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (verb.present) {
      map['verb'] = Variable<String>(verb.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MigrationsCompanion(')
          ..write('id: $id, ')
          ..write('endPoint: $endPoint, ')
          ..write('payload: $payload, ')
          ..write('verb: $verb')
          ..write(')'))
        .toString();
  }
}

class $MigrationsTable extends Migrations
    with TableInfo<$MigrationsTable, Migration> {
  final GeneratedDatabase _db;
  final String? _alias;
  $MigrationsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, true,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _endPointMeta = const VerificationMeta('endPoint');
  @override
  late final GeneratedTextColumn endPoint = _constructEndPoint();
  GeneratedTextColumn _constructEndPoint() {
    return GeneratedTextColumn(
      'end_point',
      $tableName,
      false,
    );
  }

  final VerificationMeta _payloadMeta = const VerificationMeta('payload');
  @override
  late final GeneratedTextColumn payload = _constructPayload();
  GeneratedTextColumn _constructPayload() {
    return GeneratedTextColumn(
      'payload',
      $tableName,
      false,
    );
  }

  final VerificationMeta _verbMeta = const VerificationMeta('verb');
  @override
  late final GeneratedTextColumn verb = _constructVerb();
  GeneratedTextColumn _constructVerb() {
    return GeneratedTextColumn(
      'verb',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, endPoint, payload, verb];
  @override
  $MigrationsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'migrations';
  @override
  final String actualTableName = 'migrations';
  @override
  VerificationContext validateIntegrity(Insertable<Migration> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('end_point')) {
      context.handle(_endPointMeta,
          endPoint.isAcceptableOrUnknown(data['end_point'], _endPointMeta));
    } else if (isInserting) {
      context.missing(_endPointMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(_payloadMeta,
          payload.isAcceptableOrUnknown(data['payload'], _payloadMeta));
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('verb')) {
      context.handle(
          _verbMeta, verb.isAcceptableOrUnknown(data['verb'], _verbMeta));
    } else if (isInserting) {
      context.missing(_verbMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Migration map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Migration.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $MigrationsTable createAlias(String alias) {
    return $MigrationsTable(_db, alias);
  }
}

class SetWorkout extends DataClass implements Insertable<SetWorkout> {
  final int? id;
  final double volume;
  final double maxWeigth;
  final int workOutId;
  final int exerciseId;
  SetWorkout(
      {this.id,
      required this.volume,
      required this.maxWeigth,
      required this.workOutId,
      required this.exerciseId});
  factory SetWorkout.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final doubleType = db.typeSystem.forDartType<double>();
    return SetWorkout(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      volume:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}volume']),
      maxWeigth: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}max_weigth']),
      workOutId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}work_out_id']),
      exerciseId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}exercise_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || volume != null) {
      map['volume'] = Variable<double>(volume);
    }
    if (!nullToAbsent || maxWeigth != null) {
      map['max_weigth'] = Variable<double>(maxWeigth);
    }
    if (!nullToAbsent || workOutId != null) {
      map['work_out_id'] = Variable<int>(workOutId);
    }
    if (!nullToAbsent || exerciseId != null) {
      map['exercise_id'] = Variable<int>(exerciseId);
    }
    return map;
  }

  SetWorkoutsCompanion toCompanion(bool nullToAbsent) {
    return SetWorkoutsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      volume:
          volume == null && nullToAbsent ? const Value.absent() : Value(volume),
      maxWeigth: maxWeigth == null && nullToAbsent
          ? const Value.absent()
          : Value(maxWeigth),
      workOutId: workOutId == null && nullToAbsent
          ? const Value.absent()
          : Value(workOutId),
      exerciseId: exerciseId == null && nullToAbsent
          ? const Value.absent()
          : Value(exerciseId),
    );
  }

  factory SetWorkout.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return SetWorkout(
      id: serializer.fromJson<int?>(json['id']),
      volume: serializer.fromJson<double>(json['volume']),
      maxWeigth: serializer.fromJson<double>(json['maxWeigth']),
      workOutId: serializer.fromJson<int>(json['workOutId']),
      exerciseId: serializer.fromJson<int>(json['exerciseId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'volume': serializer.toJson<double>(volume),
      'maxWeigth': serializer.toJson<double>(maxWeigth),
      'workOutId': serializer.toJson<int>(workOutId),
      'exerciseId': serializer.toJson<int>(exerciseId),
    };
  }

  SetWorkout copyWith(
          {int? id,
          double? volume,
          double? maxWeigth,
          int? workOutId,
          int? exerciseId}) =>
      SetWorkout(
        id: id ?? this.id,
        volume: volume ?? this.volume,
        maxWeigth: maxWeigth ?? this.maxWeigth,
        workOutId: workOutId ?? this.workOutId,
        exerciseId: exerciseId ?? this.exerciseId,
      );
  @override
  String toString() {
    return (StringBuffer('SetWorkout(')
          ..write('id: $id, ')
          ..write('volume: $volume, ')
          ..write('maxWeigth: $maxWeigth, ')
          ..write('workOutId: $workOutId, ')
          ..write('exerciseId: $exerciseId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          volume.hashCode,
          $mrjc(maxWeigth.hashCode,
              $mrjc(workOutId.hashCode, exerciseId.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is SetWorkout &&
          other.id == this.id &&
          other.volume == this.volume &&
          other.maxWeigth == this.maxWeigth &&
          other.workOutId == this.workOutId &&
          other.exerciseId == this.exerciseId);
}

class SetWorkoutsCompanion extends UpdateCompanion<SetWorkout> {
  final Value<int?> id;
  final Value<double> volume;
  final Value<double> maxWeigth;
  final Value<int> workOutId;
  final Value<int> exerciseId;
  const SetWorkoutsCompanion({
    this.id = const Value.absent(),
    this.volume = const Value.absent(),
    this.maxWeigth = const Value.absent(),
    this.workOutId = const Value.absent(),
    this.exerciseId = const Value.absent(),
  });
  SetWorkoutsCompanion.insert({
    this.id = const Value.absent(),
    required double volume,
    required double maxWeigth,
    required int workOutId,
    required int exerciseId,
  })   : volume = Value(volume),
        maxWeigth = Value(maxWeigth),
        workOutId = Value(workOutId),
        exerciseId = Value(exerciseId);
  static Insertable<SetWorkout> custom({
    Expression<int>? id,
    Expression<double>? volume,
    Expression<double>? maxWeigth,
    Expression<int>? workOutId,
    Expression<int>? exerciseId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (volume != null) 'volume': volume,
      if (maxWeigth != null) 'max_weigth': maxWeigth,
      if (workOutId != null) 'work_out_id': workOutId,
      if (exerciseId != null) 'exercise_id': exerciseId,
    });
  }

  SetWorkoutsCompanion copyWith(
      {Value<int?>? id,
      Value<double>? volume,
      Value<double>? maxWeigth,
      Value<int>? workOutId,
      Value<int>? exerciseId}) {
    return SetWorkoutsCompanion(
      id: id ?? this.id,
      volume: volume ?? this.volume,
      maxWeigth: maxWeigth ?? this.maxWeigth,
      workOutId: workOutId ?? this.workOutId,
      exerciseId: exerciseId ?? this.exerciseId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (volume.present) {
      map['volume'] = Variable<double>(volume.value);
    }
    if (maxWeigth.present) {
      map['max_weigth'] = Variable<double>(maxWeigth.value);
    }
    if (workOutId.present) {
      map['work_out_id'] = Variable<int>(workOutId.value);
    }
    if (exerciseId.present) {
      map['exercise_id'] = Variable<int>(exerciseId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SetWorkoutsCompanion(')
          ..write('id: $id, ')
          ..write('volume: $volume, ')
          ..write('maxWeigth: $maxWeigth, ')
          ..write('workOutId: $workOutId, ')
          ..write('exerciseId: $exerciseId')
          ..write(')'))
        .toString();
  }
}

class $SetWorkoutsTable extends SetWorkouts
    with TableInfo<$SetWorkoutsTable, SetWorkout> {
  final GeneratedDatabase _db;
  final String? _alias;
  $SetWorkoutsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, true,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _volumeMeta = const VerificationMeta('volume');
  @override
  late final GeneratedRealColumn volume = _constructVolume();
  GeneratedRealColumn _constructVolume() {
    return GeneratedRealColumn(
      'volume',
      $tableName,
      false,
    );
  }

  final VerificationMeta _maxWeigthMeta = const VerificationMeta('maxWeigth');
  @override
  late final GeneratedRealColumn maxWeigth = _constructMaxWeigth();
  GeneratedRealColumn _constructMaxWeigth() {
    return GeneratedRealColumn(
      'max_weigth',
      $tableName,
      false,
    );
  }

  final VerificationMeta _workOutIdMeta = const VerificationMeta('workOutId');
  @override
  late final GeneratedIntColumn workOutId = _constructWorkOutId();
  GeneratedIntColumn _constructWorkOutId() {
    return GeneratedIntColumn('work_out_id', $tableName, false,
        $customConstraints: 'NOT NULL REFERENCES workouts (id)');
  }

  final VerificationMeta _exerciseIdMeta = const VerificationMeta('exerciseId');
  @override
  late final GeneratedIntColumn exerciseId = _constructExerciseId();
  GeneratedIntColumn _constructExerciseId() {
    return GeneratedIntColumn('exercise_id', $tableName, false,
        $customConstraints: 'NOT NULL REFERENCES exercises (id)');
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, volume, maxWeigth, workOutId, exerciseId];
  @override
  $SetWorkoutsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'set_workouts';
  @override
  final String actualTableName = 'set_workouts';
  @override
  VerificationContext validateIntegrity(Insertable<SetWorkout> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('volume')) {
      context.handle(_volumeMeta,
          volume.isAcceptableOrUnknown(data['volume'], _volumeMeta));
    } else if (isInserting) {
      context.missing(_volumeMeta);
    }
    if (data.containsKey('max_weigth')) {
      context.handle(_maxWeigthMeta,
          maxWeigth.isAcceptableOrUnknown(data['max_weigth'], _maxWeigthMeta));
    } else if (isInserting) {
      context.missing(_maxWeigthMeta);
    }
    if (data.containsKey('work_out_id')) {
      context.handle(_workOutIdMeta,
          workOutId.isAcceptableOrUnknown(data['work_out_id'], _workOutIdMeta));
    } else if (isInserting) {
      context.missing(_workOutIdMeta);
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
          _exerciseIdMeta,
          exerciseId.isAcceptableOrUnknown(
              data['exercise_id'], _exerciseIdMeta));
    } else if (isInserting) {
      context.missing(_exerciseIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SetWorkout map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return SetWorkout.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $SetWorkoutsTable createAlias(String alias) {
    return $SetWorkoutsTable(_db, alias);
  }
}

class Workout extends DataClass implements Insertable<Workout> {
  final int? id;
  final DateTime date;
  Workout({this.id, required this.date});
  factory Workout.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Workout(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    return map;
  }

  WorkoutsCompanion toCompanion(bool nullToAbsent) {
    return WorkoutsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
    );
  }

  factory Workout.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Workout(
      id: serializer.fromJson<int?>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  Workout copyWith({int? id, DateTime? date}) => Workout(
        id: id ?? this.id,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('Workout(')
          ..write('id: $id, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, date.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Workout && other.id == this.id && other.date == this.date);
}

class WorkoutsCompanion extends UpdateCompanion<Workout> {
  final Value<int?> id;
  final Value<DateTime> date;
  const WorkoutsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
  });
  WorkoutsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
  }) : date = Value(date);
  static Insertable<Workout> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
    });
  }

  WorkoutsCompanion copyWith({Value<int?>? id, Value<DateTime>? date}) {
    return WorkoutsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

class $WorkoutsTable extends Workouts with TableInfo<$WorkoutsTable, Workout> {
  final GeneratedDatabase _db;
  final String? _alias;
  $WorkoutsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, true,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedDateTimeColumn date = _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, date];
  @override
  $WorkoutsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'workouts';
  @override
  final String actualTableName = 'workouts';
  @override
  VerificationContext validateIntegrity(Insertable<Workout> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date'], _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Workout map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Workout.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $WorkoutsTable createAlias(String alias) {
    return $WorkoutsTable(_db, alias);
  }
}

class Rep extends DataClass implements Insertable<Rep> {
  final int? id;
  final double weight;
  final int reps;
  final int rpe;
  final String note;
  final int setId;
  Rep(
      {this.id,
      required this.weight,
      required this.reps,
      required this.rpe,
      required this.note,
      required this.setId});
  factory Rep.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final doubleType = db.typeSystem.forDartType<double>();
    final stringType = db.typeSystem.forDartType<String>();
    return Rep(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      weight:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}weight']),
      reps: intType.mapFromDatabaseResponse(data['${effectivePrefix}reps']),
      rpe: intType.mapFromDatabaseResponse(data['${effectivePrefix}rpe']),
      note: stringType.mapFromDatabaseResponse(data['${effectivePrefix}note']),
      setId: intType.mapFromDatabaseResponse(data['${effectivePrefix}set_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || weight != null) {
      map['weight'] = Variable<double>(weight);
    }
    if (!nullToAbsent || reps != null) {
      map['reps'] = Variable<int>(reps);
    }
    if (!nullToAbsent || rpe != null) {
      map['rpe'] = Variable<int>(rpe);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    if (!nullToAbsent || setId != null) {
      map['set_id'] = Variable<int>(setId);
    }
    return map;
  }

  RepsCompanion toCompanion(bool nullToAbsent) {
    return RepsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      weight:
          weight == null && nullToAbsent ? const Value.absent() : Value(weight),
      reps: reps == null && nullToAbsent ? const Value.absent() : Value(reps),
      rpe: rpe == null && nullToAbsent ? const Value.absent() : Value(rpe),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      setId:
          setId == null && nullToAbsent ? const Value.absent() : Value(setId),
    );
  }

  factory Rep.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Rep(
      id: serializer.fromJson<int?>(json['id']),
      weight: serializer.fromJson<double>(json['weight']),
      reps: serializer.fromJson<int>(json['reps']),
      rpe: serializer.fromJson<int>(json['rpe']),
      note: serializer.fromJson<String>(json['note']),
      setId: serializer.fromJson<int>(json['setId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'weight': serializer.toJson<double>(weight),
      'reps': serializer.toJson<int>(reps),
      'rpe': serializer.toJson<int>(rpe),
      'note': serializer.toJson<String>(note),
      'setId': serializer.toJson<int>(setId),
    };
  }

  Rep copyWith(
          {int? id,
          double? weight,
          int? reps,
          int? rpe,
          String? note,
          int? setId}) =>
      Rep(
        id: id ?? this.id,
        weight: weight ?? this.weight,
        reps: reps ?? this.reps,
        rpe: rpe ?? this.rpe,
        note: note ?? this.note,
        setId: setId ?? this.setId,
      );
  @override
  String toString() {
    return (StringBuffer('Rep(')
          ..write('id: $id, ')
          ..write('weight: $weight, ')
          ..write('reps: $reps, ')
          ..write('rpe: $rpe, ')
          ..write('note: $note, ')
          ..write('setId: $setId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          weight.hashCode,
          $mrjc(reps.hashCode,
              $mrjc(rpe.hashCode, $mrjc(note.hashCode, setId.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Rep &&
          other.id == this.id &&
          other.weight == this.weight &&
          other.reps == this.reps &&
          other.rpe == this.rpe &&
          other.note == this.note &&
          other.setId == this.setId);
}

class RepsCompanion extends UpdateCompanion<Rep> {
  final Value<int?> id;
  final Value<double> weight;
  final Value<int> reps;
  final Value<int> rpe;
  final Value<String> note;
  final Value<int> setId;
  const RepsCompanion({
    this.id = const Value.absent(),
    this.weight = const Value.absent(),
    this.reps = const Value.absent(),
    this.rpe = const Value.absent(),
    this.note = const Value.absent(),
    this.setId = const Value.absent(),
  });
  RepsCompanion.insert({
    this.id = const Value.absent(),
    required double weight,
    required int reps,
    required int rpe,
    this.note = const Value.absent(),
    required int setId,
  })   : weight = Value(weight),
        reps = Value(reps),
        rpe = Value(rpe),
        setId = Value(setId);
  static Insertable<Rep> custom({
    Expression<int>? id,
    Expression<double>? weight,
    Expression<int>? reps,
    Expression<int>? rpe,
    Expression<String>? note,
    Expression<int>? setId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (weight != null) 'weight': weight,
      if (reps != null) 'reps': reps,
      if (rpe != null) 'rpe': rpe,
      if (note != null) 'note': note,
      if (setId != null) 'set_id': setId,
    });
  }

  RepsCompanion copyWith(
      {Value<int?>? id,
      Value<double>? weight,
      Value<int>? reps,
      Value<int>? rpe,
      Value<String>? note,
      Value<int>? setId}) {
    return RepsCompanion(
      id: id ?? this.id,
      weight: weight ?? this.weight,
      reps: reps ?? this.reps,
      rpe: rpe ?? this.rpe,
      note: note ?? this.note,
      setId: setId ?? this.setId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (reps.present) {
      map['reps'] = Variable<int>(reps.value);
    }
    if (rpe.present) {
      map['rpe'] = Variable<int>(rpe.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (setId.present) {
      map['set_id'] = Variable<int>(setId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RepsCompanion(')
          ..write('id: $id, ')
          ..write('weight: $weight, ')
          ..write('reps: $reps, ')
          ..write('rpe: $rpe, ')
          ..write('note: $note, ')
          ..write('setId: $setId')
          ..write(')'))
        .toString();
  }
}

class $RepsTable extends Reps with TableInfo<$RepsTable, Rep> {
  final GeneratedDatabase _db;
  final String? _alias;
  $RepsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, true,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedRealColumn weight = _constructWeight();
  GeneratedRealColumn _constructWeight() {
    return GeneratedRealColumn(
      'weight',
      $tableName,
      false,
    );
  }

  final VerificationMeta _repsMeta = const VerificationMeta('reps');
  @override
  late final GeneratedIntColumn reps = _constructReps();
  GeneratedIntColumn _constructReps() {
    return GeneratedIntColumn(
      'reps',
      $tableName,
      false,
    );
  }

  final VerificationMeta _rpeMeta = const VerificationMeta('rpe');
  @override
  late final GeneratedIntColumn rpe = _constructRpe();
  GeneratedIntColumn _constructRpe() {
    return GeneratedIntColumn(
      'rpe',
      $tableName,
      false,
    );
  }

  final VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedTextColumn note = _constructNote();
  GeneratedTextColumn _constructNote() {
    return GeneratedTextColumn('note', $tableName, false,
        maxTextLength: 155, defaultValue: const Constant(""));
  }

  final VerificationMeta _setIdMeta = const VerificationMeta('setId');
  @override
  late final GeneratedIntColumn setId = _constructSetId();
  GeneratedIntColumn _constructSetId() {
    return GeneratedIntColumn('set_id', $tableName, false,
        $customConstraints: 'NOT NULL REFERENCES sets (id)');
  }

  @override
  List<GeneratedColumn> get $columns => [id, weight, reps, rpe, note, setId];
  @override
  $RepsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'reps';
  @override
  final String actualTableName = 'reps';
  @override
  VerificationContext validateIntegrity(Insertable<Rep> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight'], _weightMeta));
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    if (data.containsKey('reps')) {
      context.handle(
          _repsMeta, reps.isAcceptableOrUnknown(data['reps'], _repsMeta));
    } else if (isInserting) {
      context.missing(_repsMeta);
    }
    if (data.containsKey('rpe')) {
      context.handle(
          _rpeMeta, rpe.isAcceptableOrUnknown(data['rpe'], _rpeMeta));
    } else if (isInserting) {
      context.missing(_rpeMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note'], _noteMeta));
    }
    if (data.containsKey('set_id')) {
      context.handle(
          _setIdMeta, setId.isAcceptableOrUnknown(data['set_id'], _setIdMeta));
    } else if (isInserting) {
      context.missing(_setIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Rep map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Rep.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $RepsTable createAlias(String alias) {
    return $RepsTable(_db, alias);
  }
}

class RoutineGroupData extends DataClass
    implements Insertable<RoutineGroupData> {
  final int id;
  final String name;
  final String description;
  final Level level;
  RoutineGroupData(
      {required this.id,
      required this.name,
      required this.description,
      required this.level});
  factory RoutineGroupData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return RoutineGroupData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      level: $RoutineGroupTable.$converter0.mapToDart(
          intType.mapFromDatabaseResponse(data['${effectivePrefix}level'])),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || level != null) {
      final converter = $RoutineGroupTable.$converter0;
      map['level'] = Variable<int>(converter.mapToSql(level));
    }
    return map;
  }

  RoutineGroupCompanion toCompanion(bool nullToAbsent) {
    return RoutineGroupCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      level:
          level == null && nullToAbsent ? const Value.absent() : Value(level),
    );
  }

  factory RoutineGroupData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return RoutineGroupData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      level: serializer.fromJson<Level>(json['level']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'level': serializer.toJson<Level>(level),
    };
  }

  RoutineGroupData copyWith(
          {int? id, String? name, String? description, Level? level}) =>
      RoutineGroupData(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        level: level ?? this.level,
      );
  @override
  String toString() {
    return (StringBuffer('RoutineGroupData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('level: $level')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(name.hashCode, $mrjc(description.hashCode, level.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is RoutineGroupData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.level == this.level);
}

class RoutineGroupCompanion extends UpdateCompanion<RoutineGroupData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<Level> level;
  const RoutineGroupCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.level = const Value.absent(),
  });
  RoutineGroupCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String description,
    required Level level,
  })   : name = Value(name),
        description = Value(description),
        level = Value(level);
  static Insertable<RoutineGroupData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? level,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (level != null) 'level': level,
    });
  }

  RoutineGroupCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? description,
      Value<Level>? level}) {
    return RoutineGroupCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      level: level ?? this.level,
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
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (level.present) {
      final converter = $RoutineGroupTable.$converter0;
      map['level'] = Variable<int>(converter.mapToSql(level.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoutineGroupCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('level: $level')
          ..write(')'))
        .toString();
  }
}

class $RoutineGroupTable extends RoutineGroup
    with TableInfo<$RoutineGroupTable, RoutineGroupData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $RoutineGroupTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedTextColumn name = _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedTextColumn description = _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn('description', $tableName, false,
        minTextLength: 0, maxTextLength: 250);
  }

  final VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedIntColumn level = _constructLevel();
  GeneratedIntColumn _constructLevel() {
    return GeneratedIntColumn(
      'level',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, description, level];
  @override
  $RoutineGroupTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'routine_group';
  @override
  final String actualTableName = 'routine_group';
  @override
  VerificationContext validateIntegrity(Insertable<RoutineGroupData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    context.handle(_levelMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoutineGroupData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return RoutineGroupData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $RoutineGroupTable createAlias(String alias) {
    return $RoutineGroupTable(_db, alias);
  }

  static TypeConverter<Level, int> $converter0 =
      const EnumIndexConverter<Level>(Level.values);
}

class RoutineData extends DataClass implements Insertable<RoutineData> {
  final int id;
  final int groupId;
  final String name;
  final String notes;
  RoutineData(
      {required this.id,
      required this.groupId,
      required this.name,
      required this.notes});
  factory RoutineData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return RoutineData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      groupId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}group_id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      notes:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}notes']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || groupId != null) {
      map['group_id'] = Variable<int>(groupId);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  RoutineCompanion toCompanion(bool nullToAbsent) {
    return RoutineCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      groupId: groupId == null && nullToAbsent
          ? const Value.absent()
          : Value(groupId),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory RoutineData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return RoutineData(
      id: serializer.fromJson<int>(json['id']),
      groupId: serializer.fromJson<int>(json['groupId']),
      name: serializer.fromJson<String>(json['name']),
      notes: serializer.fromJson<String>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'groupId': serializer.toJson<int>(groupId),
      'name': serializer.toJson<String>(name),
      'notes': serializer.toJson<String>(notes),
    };
  }

  RoutineData copyWith({int? id, int? groupId, String? name, String? notes}) =>
      RoutineData(
        id: id ?? this.id,
        groupId: groupId ?? this.groupId,
        name: name ?? this.name,
        notes: notes ?? this.notes,
      );
  @override
  String toString() {
    return (StringBuffer('RoutineData(')
          ..write('id: $id, ')
          ..write('groupId: $groupId, ')
          ..write('name: $name, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(groupId.hashCode, $mrjc(name.hashCode, notes.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is RoutineData &&
          other.id == this.id &&
          other.groupId == this.groupId &&
          other.name == this.name &&
          other.notes == this.notes);
}

class RoutineCompanion extends UpdateCompanion<RoutineData> {
  final Value<int> id;
  final Value<int> groupId;
  final Value<String> name;
  final Value<String> notes;
  const RoutineCompanion({
    this.id = const Value.absent(),
    this.groupId = const Value.absent(),
    this.name = const Value.absent(),
    this.notes = const Value.absent(),
  });
  RoutineCompanion.insert({
    this.id = const Value.absent(),
    required int groupId,
    required String name,
    this.notes = const Value.absent(),
  })  : groupId = Value(groupId),
        name = Value(name);
  static Insertable<RoutineData> custom({
    Expression<int>? id,
    Expression<int>? groupId,
    Expression<String>? name,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (groupId != null) 'group_id': groupId,
      if (name != null) 'name': name,
      if (notes != null) 'notes': notes,
    });
  }

  RoutineCompanion copyWith(
      {Value<int>? id,
      Value<int>? groupId,
      Value<String>? name,
      Value<String>? notes}) {
    return RoutineCompanion(
      id: id ?? this.id,
      groupId: groupId ?? this.groupId,
      name: name ?? this.name,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (groupId.present) {
      map['group_id'] = Variable<int>(groupId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoutineCompanion(')
          ..write('id: $id, ')
          ..write('groupId: $groupId, ')
          ..write('name: $name, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

class $RoutineTable extends Routine with TableInfo<$RoutineTable, RoutineData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $RoutineTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _groupIdMeta = const VerificationMeta('groupId');
  @override
  late final GeneratedIntColumn groupId = _constructGroupId();
  GeneratedIntColumn _constructGroupId() {
    return GeneratedIntColumn('group_id', $tableName, false,
        $customConstraints: 'NOT NULL REFERENCES grouproutines (id)');
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedTextColumn name = _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedTextColumn notes = _constructNotes();
  GeneratedTextColumn _constructNotes() {
    return GeneratedTextColumn('notes', $tableName, false,
        maxTextLength: 155, defaultValue: const Constant(""));
  }

  @override
  List<GeneratedColumn> get $columns => [id, groupId, name, notes];
  @override
  $RoutineTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'routine';
  @override
  final String actualTableName = 'routine';
  @override
  VerificationContext validateIntegrity(Insertable<RoutineData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('group_id')) {
      context.handle(_groupIdMeta,
          groupId.isAcceptableOrUnknown(data['group_id'], _groupIdMeta));
    } else if (isInserting) {
      context.missing(_groupIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes'], _notesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoutineData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return RoutineData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $RoutineTable createAlias(String alias) {
    return $RoutineTable(_db, alias);
  }
}

class RoutineSetData extends DataClass implements Insertable<RoutineSetData> {
  final int id;
  final String exerciseName;
  final int exerciseId;
  final int routineId;
  final int reps;
  final CopyMethod copyMethod;
  final int targetRpe;
  final String notes;
  RoutineSetData(
      {required this.id,
      required this.exerciseName,
      required this.exerciseId,
      required this.routineId,
      required this.reps,
      required this.copyMethod,
      required this.targetRpe,
      required this.notes});
  factory RoutineSetData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return RoutineSetData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      exerciseName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}exercise_name']),
      exerciseId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}exercise_id']),
      routineId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}routine_id']),
      reps: intType.mapFromDatabaseResponse(data['${effectivePrefix}reps']),
      copyMethod: $RoutineSetTable.$converter0.mapToDart(intType
          .mapFromDatabaseResponse(data['${effectivePrefix}copy_method'])),
      targetRpe:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}target_rpe']),
      notes:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}notes']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || exerciseName != null) {
      map['exercise_name'] = Variable<String>(exerciseName);
    }
    if (!nullToAbsent || exerciseId != null) {
      map['exercise_id'] = Variable<int>(exerciseId);
    }
    if (!nullToAbsent || routineId != null) {
      map['routine_id'] = Variable<int>(routineId);
    }
    if (!nullToAbsent || reps != null) {
      map['reps'] = Variable<int>(reps);
    }
    if (!nullToAbsent || copyMethod != null) {
      final converter = $RoutineSetTable.$converter0;
      map['copy_method'] = Variable<int>(converter.mapToSql(copyMethod));
    }
    if (!nullToAbsent || targetRpe != null) {
      map['target_rpe'] = Variable<int>(targetRpe);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  RoutineSetCompanion toCompanion(bool nullToAbsent) {
    return RoutineSetCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      exerciseName: exerciseName == null && nullToAbsent
          ? const Value.absent()
          : Value(exerciseName),
      exerciseId: exerciseId == null && nullToAbsent
          ? const Value.absent()
          : Value(exerciseId),
      routineId: routineId == null && nullToAbsent
          ? const Value.absent()
          : Value(routineId),
      reps: reps == null && nullToAbsent ? const Value.absent() : Value(reps),
      copyMethod: copyMethod == null && nullToAbsent
          ? const Value.absent()
          : Value(copyMethod),
      targetRpe: targetRpe == null && nullToAbsent
          ? const Value.absent()
          : Value(targetRpe),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory RoutineSetData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return RoutineSetData(
      id: serializer.fromJson<int>(json['id']),
      exerciseName: serializer.fromJson<String>(json['exerciseName']),
      exerciseId: serializer.fromJson<int>(json['exerciseId']),
      routineId: serializer.fromJson<int>(json['routineId']),
      reps: serializer.fromJson<int>(json['reps']),
      copyMethod: serializer.fromJson<CopyMethod>(json['copyMethod']),
      targetRpe: serializer.fromJson<int>(json['targetRpe']),
      notes: serializer.fromJson<String>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'exerciseName': serializer.toJson<String>(exerciseName),
      'exerciseId': serializer.toJson<int>(exerciseId),
      'routineId': serializer.toJson<int>(routineId),
      'reps': serializer.toJson<int>(reps),
      'copyMethod': serializer.toJson<CopyMethod>(copyMethod),
      'targetRpe': serializer.toJson<int>(targetRpe),
      'notes': serializer.toJson<String>(notes),
    };
  }

  RoutineSetData copyWith(
          {int? id,
          String? exerciseName,
          int? exerciseId,
          int? routineId,
          int? reps,
          CopyMethod? copyMethod,
          int? targetRpe,
          String? notes}) =>
      RoutineSetData(
        id: id ?? this.id,
        exerciseName: exerciseName ?? this.exerciseName,
        exerciseId: exerciseId ?? this.exerciseId,
        routineId: routineId ?? this.routineId,
        reps: reps ?? this.reps,
        copyMethod: copyMethod ?? this.copyMethod,
        targetRpe: targetRpe ?? this.targetRpe,
        notes: notes ?? this.notes,
      );
  @override
  String toString() {
    return (StringBuffer('RoutineSetData(')
          ..write('id: $id, ')
          ..write('exerciseName: $exerciseName, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('routineId: $routineId, ')
          ..write('reps: $reps, ')
          ..write('copyMethod: $copyMethod, ')
          ..write('targetRpe: $targetRpe, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          exerciseName.hashCode,
          $mrjc(
              exerciseId.hashCode,
              $mrjc(
                  routineId.hashCode,
                  $mrjc(
                      reps.hashCode,
                      $mrjc(copyMethod.hashCode,
                          $mrjc(targetRpe.hashCode, notes.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is RoutineSetData &&
          other.id == this.id &&
          other.exerciseName == this.exerciseName &&
          other.exerciseId == this.exerciseId &&
          other.routineId == this.routineId &&
          other.reps == this.reps &&
          other.copyMethod == this.copyMethod &&
          other.targetRpe == this.targetRpe &&
          other.notes == this.notes);
}

class RoutineSetCompanion extends UpdateCompanion<RoutineSetData> {
  final Value<int> id;
  final Value<String> exerciseName;
  final Value<int> exerciseId;
  final Value<int> routineId;
  final Value<int> reps;
  final Value<CopyMethod> copyMethod;
  final Value<int> targetRpe;
  final Value<String> notes;
  const RoutineSetCompanion({
    this.id = const Value.absent(),
    this.exerciseName = const Value.absent(),
    this.exerciseId = const Value.absent(),
    this.routineId = const Value.absent(),
    this.reps = const Value.absent(),
    this.copyMethod = const Value.absent(),
    this.targetRpe = const Value.absent(),
    this.notes = const Value.absent(),
  });
  RoutineSetCompanion.insert({
    this.id = const Value.absent(),
    required String exerciseName,
    required int exerciseId,
    required int routineId,
    required int reps,
    required CopyMethod copyMethod,
    required int targetRpe,
    this.notes = const Value.absent(),
  })  : exerciseName = Value(exerciseName),
        exerciseId = Value(exerciseId),
        routineId = Value(routineId),
        reps = Value(reps),
        copyMethod = Value(copyMethod),
        targetRpe = Value(targetRpe);
  static Insertable<RoutineSetData> custom({
    Expression<int>? id,
    Expression<String>? exerciseName,
    Expression<int>? exerciseId,
    Expression<int>? routineId,
    Expression<int>? reps,
    Expression<int>? copyMethod,
    Expression<int>? targetRpe,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (exerciseName != null) 'exercise_name': exerciseName,
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (routineId != null) 'routine_id': routineId,
      if (reps != null) 'reps': reps,
      if (copyMethod != null) 'copy_method': copyMethod,
      if (targetRpe != null) 'target_rpe': targetRpe,
      if (notes != null) 'notes': notes,
    });
  }

  RoutineSetCompanion copyWith(
      {Value<int>? id,
      Value<String>? exerciseName,
      Value<int>? exerciseId,
      Value<int>? routineId,
      Value<int>? reps,
      Value<CopyMethod>? copyMethod,
      Value<int>? targetRpe,
      Value<String>? notes}) {
    return RoutineSetCompanion(
      id: id ?? this.id,
      exerciseName: exerciseName ?? this.exerciseName,
      exerciseId: exerciseId ?? this.exerciseId,
      routineId: routineId ?? this.routineId,
      reps: reps ?? this.reps,
      copyMethod: copyMethod ?? this.copyMethod,
      targetRpe: targetRpe ?? this.targetRpe,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (exerciseName.present) {
      map['exercise_name'] = Variable<String>(exerciseName.value);
    }
    if (exerciseId.present) {
      map['exercise_id'] = Variable<int>(exerciseId.value);
    }
    if (routineId.present) {
      map['routine_id'] = Variable<int>(routineId.value);
    }
    if (reps.present) {
      map['reps'] = Variable<int>(reps.value);
    }
    if (copyMethod.present) {
      final converter = $RoutineSetTable.$converter0;
      map['copy_method'] = Variable<int>(converter.mapToSql(copyMethod.value));
    }
    if (targetRpe.present) {
      map['target_rpe'] = Variable<int>(targetRpe.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoutineSetCompanion(')
          ..write('id: $id, ')
          ..write('exerciseName: $exerciseName, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('routineId: $routineId, ')
          ..write('reps: $reps, ')
          ..write('copyMethod: $copyMethod, ')
          ..write('targetRpe: $targetRpe, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

class $RoutineSetTable extends RoutineSet
    with TableInfo<$RoutineSetTable, RoutineSetData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $RoutineSetTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _exerciseNameMeta =
      const VerificationMeta('exerciseName');
  @override
  late final GeneratedTextColumn exerciseName = _constructExerciseName();
  GeneratedTextColumn _constructExerciseName() {
    return GeneratedTextColumn(
      'exercise_name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _exerciseIdMeta = const VerificationMeta('exerciseId');
  @override
  late final GeneratedIntColumn exerciseId = _constructExerciseId();
  GeneratedIntColumn _constructExerciseId() {
    return GeneratedIntColumn('exercise_id', $tableName, false,
        $customConstraints: 'NOT NULL REFERENCES exercises (id)');
  }

  final VerificationMeta _routineIdMeta = const VerificationMeta('routineId');
  @override
  late final GeneratedIntColumn routineId = _constructRoutineId();
  GeneratedIntColumn _constructRoutineId() {
    return GeneratedIntColumn('routine_id', $tableName, false,
        $customConstraints: 'NOT NULL REFERENCES routines (id)');
  }

  final VerificationMeta _repsMeta = const VerificationMeta('reps');
  @override
  late final GeneratedIntColumn reps = _constructReps();
  GeneratedIntColumn _constructReps() {
    return GeneratedIntColumn(
      'reps',
      $tableName,
      false,
    );
  }

  final VerificationMeta _copyMethodMeta = const VerificationMeta('copyMethod');
  @override
  late final GeneratedIntColumn copyMethod = _constructCopyMethod();
  GeneratedIntColumn _constructCopyMethod() {
    return GeneratedIntColumn(
      'copy_method',
      $tableName,
      false,
    );
  }

  final VerificationMeta _targetRpeMeta = const VerificationMeta('targetRpe');
  @override
  late final GeneratedIntColumn targetRpe = _constructTargetRpe();
  GeneratedIntColumn _constructTargetRpe() {
    return GeneratedIntColumn(
      'target_rpe',
      $tableName,
      false,
    );
  }

  final VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedTextColumn notes = _constructNotes();
  GeneratedTextColumn _constructNotes() {
    return GeneratedTextColumn('notes', $tableName, false,
        maxTextLength: 155, defaultValue: const Constant(""));
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        exerciseName,
        exerciseId,
        routineId,
        reps,
        copyMethod,
        targetRpe,
        notes
      ];
  @override
  $RoutineSetTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'routine_set';
  @override
  final String actualTableName = 'routine_set';
  @override
  VerificationContext validateIntegrity(Insertable<RoutineSetData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('exercise_name')) {
      context.handle(
          _exerciseNameMeta,
          exerciseName.isAcceptableOrUnknown(
              data['exercise_name'], _exerciseNameMeta));
    } else if (isInserting) {
      context.missing(_exerciseNameMeta);
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
          _exerciseIdMeta,
          exerciseId.isAcceptableOrUnknown(
              data['exercise_id'], _exerciseIdMeta));
    } else if (isInserting) {
      context.missing(_exerciseIdMeta);
    }
    if (data.containsKey('routine_id')) {
      context.handle(_routineIdMeta,
          routineId.isAcceptableOrUnknown(data['routine_id'], _routineIdMeta));
    } else if (isInserting) {
      context.missing(_routineIdMeta);
    }
    if (data.containsKey('reps')) {
      context.handle(
          _repsMeta, reps.isAcceptableOrUnknown(data['reps'], _repsMeta));
    } else if (isInserting) {
      context.missing(_repsMeta);
    }
    context.handle(_copyMethodMeta, const VerificationResult.success());
    if (data.containsKey('target_rpe')) {
      context.handle(_targetRpeMeta,
          targetRpe.isAcceptableOrUnknown(data['target_rpe'], _targetRpeMeta));
    } else if (isInserting) {
      context.missing(_targetRpeMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes'], _notesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoutineSetData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return RoutineSetData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $RoutineSetTable createAlias(String alias) {
    return $RoutineSetTable(_db, alias);
  }

  static TypeConverter<CopyMethod, int> $converter0 =
      const EnumIndexConverter<CopyMethod>(CopyMethod.values);
}

abstract class _$SQLDatabase extends GeneratedDatabase {
  _$SQLDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ExercisesTable exercises = $ExercisesTable(this);
  late final $ExerciseBodyPartsTable exerciseBodyParts =
      $ExerciseBodyPartsTable(this);
  late final $MigrationsTable migrations = $MigrationsTable(this);
  late final $SetWorkoutsTable setWorkouts = $SetWorkoutsTable(this);
  late final $WorkoutsTable workouts = $WorkoutsTable(this);
  late final $RepsTable reps = $RepsTable(this);
  late final $RoutineGroupTable routineGroup = $RoutineGroupTable(this);
  late final $RoutineTable routine = $RoutineTable(this);
  late final $RoutineSetTable routineSet = $RoutineSetTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        exercises,
        exerciseBodyParts,
        migrations,
        setWorkouts,
        workouts,
        reps,
        routineGroup,
        routine,
        routineSet
      ];
}
