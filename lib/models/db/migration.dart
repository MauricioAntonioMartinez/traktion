import 'package:tracktion/models/app-models.dart';
import 'package:tracktion/models/db/database.dart';
import 'package:tracktion/models/tables/Routines.dart';

List<ExerciseBodyPart> bodyPartsMigration = [
  ExerciseBodyPart(exerciseId: 1, bodyPart: BodyPartEnum.Legs),
  ExerciseBodyPart(exerciseId: 1, bodyPart: BodyPartEnum.Quadriceps),
  ExerciseBodyPart(exerciseId: 2, bodyPart: BodyPartEnum.Chest),
  ExerciseBodyPart(exerciseId: 2, bodyPart: BodyPartEnum.Arms),
  ExerciseBodyPart(exerciseId: 2, bodyPart: BodyPartEnum.Shoulders),
  ExerciseBodyPart(exerciseId: 3, bodyPart: BodyPartEnum.Legs),
  ExerciseBodyPart(exerciseId: 3, bodyPart: BodyPartEnum.Quadriceps),
  ExerciseBodyPart(exerciseId: 3, bodyPart: BodyPartEnum.Gluteus),
  ExerciseBodyPart(exerciseId: 4, bodyPart: BodyPartEnum.Shoulders),
  ExerciseBodyPart(exerciseId: 4, bodyPart: BodyPartEnum.Arms),
  ExerciseBodyPart(exerciseId: 5, bodyPart: BodyPartEnum.Abs),
  ExerciseBodyPart(exerciseId: 6, bodyPart: BodyPartEnum.Chest),
  ExerciseBodyPart(exerciseId: 6, bodyPart: BodyPartEnum.Arms),
  ExerciseBodyPart(exerciseId: 7, bodyPart: BodyPartEnum.Quadriceps),
  ExerciseBodyPart(exerciseId: 8, bodyPart: BodyPartEnum.Back),
  ExerciseBodyPart(exerciseId: 8, bodyPart: BodyPartEnum.Shoulders)
];

List<Exercise> exercisesMigration = [
  Exercise(
      id: 1,
      name: "Deadlift",
      notes: "Protect your lower back when you go up.",
      difficulty: Difficulty.Hard,
      lastWorkouts: "",
      maxWeigth: 0.0,
      maxVolume: 0.0,
      maxVolumeSetId: null,
      maxWeigthSetId: null),
  Exercise(
      id: 2,
      name: "BenchPress",
      notes: "Really good for chest building.",
      difficulty: Difficulty.Hard,
      lastWorkouts: "",
      maxWeigth: 0.0,
      maxVolume: 0.0,
      maxVolumeSetId: null,
      maxWeigthSetId: null),
  Exercise(
      id: 3,
      name: "Squat",
      notes: "Really good for quads and glute.",
      difficulty: Difficulty.Hard,
      lastWorkouts: "",
      maxWeigth: 0.0,
      maxVolume: 0.0,
      maxVolumeSetId: null,
      maxWeigthSetId: null),
  Exercise(
      id: 4,
      name: "OverHeadPress",
      notes: "Shoulders focus",
      difficulty: Difficulty.Hard,
      lastWorkouts: "",
      maxWeigth: 0.0,
      maxVolume: 0.0,
      maxVolumeSetId: null,
      maxWeigthSetId: null),
  Exercise(
      id: 5,
      name: "Leg Rise",
      notes: "Abs dominant",
      difficulty: Difficulty.Hard,
      lastWorkouts: "",
      maxWeigth: 0.0,
      maxVolume: 0.0,
      maxVolumeSetId: null,
      maxWeigthSetId: null),
  Exercise(
      id: 6,
      name: "Incline Dumbell Press",
      notes: "Chest focus",
      difficulty: Difficulty.Normal,
      lastWorkouts: "",
      maxWeigth: 0.0,
      maxVolume: 0.0,
      maxVolumeSetId: null,
      maxWeigthSetId: null),
  Exercise(
      id: 7,
      name: "Front Squad",
      notes: "Heavily use for growth",
      difficulty: Difficulty.Pro,
      lastWorkouts: "",
      maxWeigth: 0.0,
      maxVolume: 0.0,
      maxVolumeSetId: null,
      maxWeigthSetId: null),
  Exercise(
      id: 8,
      name: "Pull Up",
      notes: "Back builder",
      difficulty: Difficulty.Normal,
      lastWorkouts: "",
      maxWeigth: 0.0,
      maxVolume: 0.0,
      maxVolumeSetId: null,
      maxWeigthSetId: null),
];


// TODO: add routines routine sets etc. 