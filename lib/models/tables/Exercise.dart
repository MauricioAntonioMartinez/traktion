import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:tracktion/models/app/body-parts.dart';
import 'package:tracktion/models/tables/Routines.dart';

class Migrations extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get endPoint => text()();
  TextColumn get payload => text()();
  TextColumn get verb => text()();
}

class Exercises extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  TextColumn get lastWorkouts => text()();
  RealColumn get maxVolume => real()();
  RealColumn get maxWeight => real()();
  IntColumn get maxWeightSetId => integer().nullable()();
  IntColumn get maxVolumeSetId => integer().nullable()();
  TextColumn get notes => text().withLength(max: 200).nullable()();
  IntColumn get difficulty => intEnum<Difficulty>()();
}

class ExerciseBodyParts extends Table {
  IntColumn get exerciseId => integer()();
  IntColumn get bodyPart => intEnum<BodyPartEnum>()();
}
