import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:moor/moor.dart';
import 'package:tracktion/util/analysis/getSetMaxWeigth.dart';
import 'package:tracktion/util/analysis/getSetVolume.dart';
import 'package:tracktion/util/analysis/mergeSetLastWorkout.dart';
import 'package:tracktion/util/toDayDate.dart';

import '../../models/app/index.dart' as modelsApp;
import '../../models/db/database.dart';
import '../../util/mapWithIndex.dart';

part 'workout_event.dart';
part 'workout_state.dart';

class WorkoutBloc extends Bloc<WorkoutEvent, WorkoutState> {
  final SQLDatabase db;
  WorkoutBloc({required this.db}) : super(WorkoutInitial());

  @override
  Stream<WorkoutState> mapEventToState(
    WorkoutEvent event,
  ) async* {
    if (event is FetchWorkout) {
      yield* _fetchWorkout(event);
    } else if (event is DeleteWorkout) {
      yield* _deleteWorkout(event);
    } else if (event is DeleteSet) {
      _deleteSet(event);
    } else if (event is DeleteRep) {
      _deleteRep(event);
    } else if (event is SaveRep) {
      _saveRep(event);
    } else if (event is SaveSet) {
      _saveSet(event);
    } else if (event is DeleteSets) {
      _deleteSets(event);
    } else if (event is CopySets) {
      _copySets(event);
    }
  }

  Stream<WorkoutState> _fetchWorkout(FetchWorkout event) async* {
    DateTime date = toDayDate(DateTime.now());
    if (event.date == null && state is WorkoutSets) {
      date = (state as WorkoutSets).date;
    } else if (event.date != null) date = toDayDate(event.date!);
    yield WorkoutLoading();
    try {
      final sets = this.db.findSetsByDate(date);

      yield WorkoutSets(sets: sets, date: date);
    } catch (e) {
      yield WorkoutTransactionFailed("Cannot fetch this workout");
    }
  }

  Stream<WorkoutState> _deleteWorkout(DeleteWorkout event) async* {
    yield WorkoutLoading();
    try {
      await this.db.deleteWorkout(event.workoutId);
    } catch (e) {}
  }

  Future<void> _deleteSet(DeleteSet event) async {
    try {
      var exe = event.set.exercise.copy();
      var setId = event.set.id;
      if (setId == null) return;

      exe.lastWorkouts.removeWhere((wk) => wk.setId == setId);
      exe = await _verifyMaxWeigth(exe: exe, setId: setId);
      exe = await _verifyMaxVolume(exe: exe, setId: setId);
      exe = consenceMaxes(exe: exe, willDelete: true, setId: setId);
      await _saveExercise(exe);
      await this.db.deleteSet(setId);
    } catch (e) {
      print(e);
    }
  }

  Future<void> _deleteRep(DeleteRep event) async {
    try {
      await this.db.deleteRep(event.rep);
    } catch (e) {
      print(e);
    }
  }

  Future<void> _saveSet(SaveSet event) async {
    try {
      final workout = await this.db.findOrCreateWorkout(event.date);
      var currentExe = event.set.exercise;
      var isCreation = !event.isEdit;

      var exe = currentExe.copy();
      var volume = getSetVolume(event.set.reps);
      var maxWeigth = getSetMaxWeigth(event.set.reps);
      var setId = event.set.id;

      var newOrUpdatedSet = modelsApp.SetResume(
          setId: setId,
          date: event.date,
          maxWeigth: maxWeigth,
          volume: volume,
          reps: event.set.reps.length);

      if (event.isEdit && setId != null) {
        var indexLastWorkout =
            exe.lastWorkouts.indexWhere((set) => set.setId == event.set.id);
        if (indexLastWorkout != -1)
          exe.lastWorkouts[indexLastWorkout] = newOrUpdatedSet;
        exe = await _verifyMaxVolume(
            exe: exe, newSetVolume: newOrUpdatedSet.volume, setId: setId);
        exe = await _verifyMaxWeigth(
            exe: exe, newSetWeigth: newOrUpdatedSet.maxWeigth, setId: setId);
      } else {
        if (exe.lastWorkouts.length >= 12) exe.lastWorkouts.removeAt(11);
        exe.lastWorkouts.insert(0, newOrUpdatedSet);
      }

      exe = consenceMaxes(
          setId: newOrUpdatedSet.setId!,
          exe: exe,
          maxWeigth: maxWeigth,
          volume: volume);

      final setIdSaved = await this.db.saveSet(
          modelsApp.SetWorkout(
              id: event.set.id,
              exercise: exe,
              volume: volume,
              maxWeigth: maxWeigth,
              reps: event.set.reps),
          workout.id!);

      if (isCreation && setIdSaved != null) {
        exe.lastWorkouts[0].setId = setIdSaved;
        if (exe.lastWorkouts.length == 1) {
          exe.maxVolumeSetId = setIdSaved;
          exe.maxWeigthSetId = setIdSaved;
        }
      }

      await _saveExercise(exe);
    } catch (e) {
      print("ERROR:");
      print(e);
    }
  }

  Future<void> _copySets(CopySets event) async {
    try {
      final filters = event.workoutFilters;
      final cleanedSets = event.sets
          .map((set) {
            if (filters[set.id]["active"]) {
              final filteredReps = set.reps.whereIndex((e, i) {
                if (filters[set.id]["reps"][i]) {
                  e.id = null;
                  return true;
                } else
                  return false;
              }).toList();

              return modelsApp.SetWorkout(
                  maxWeigth: set.maxWeigth,
                  volume: set.volume,
                  reps: filteredReps,
                  exercise: set.exercise,
                  id: null);
            }
            return null;
          })
          .where((s) => s != null)
          .toList();

      // for (final set in cleanedSets) {
      await Future.wait(cleanedSets.map((s) =>
          this._saveSet(SaveSet(date: event.date, isEdit: false, set: s!))));
      // await this._saveSet(SaveSet(date: event.date, isEdit: false, set: set));
      // }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _saveRep(SaveRep event) async {
    try {
      print(event.rep.setId);
      final setId = event.rep.setId;

      if (setId == null) return null;

      final rep = RepsCompanion.insert(
          id: Value(event.rep.id),
          note: Value(event.rep.notes),
          weight: event.rep.weight,
          reps: event.rep.reps,
          rpe: event.rep.rpe,
          setId: setId);
      await this.db.saveRep(rep);
    } catch (e) {
      print(e);
    }
  }

  Future<void> _deleteSets(DeleteSets event) async {
    try {
      for (final set in event.sets) await this._deleteSet(DeleteSet(set));
    } catch (e) {
      print(e);
    }
  }

  Future<modelsApp.Exercise> _verifyMaxVolume(
      {required modelsApp.Exercise exe,
      required int setId,
      double? newSetVolume}) async {
    var _exe = exe.copy();
    var delete = newSetVolume == null;

    if (exe.maxVolumeSetId == setId &&
        ((!delete && newSetVolume != null && newSetVolume < exe.maxVolume) ||
            delete)) {
      final results = await this.db.findMaxVolume(exe.id!, setId);
      if (results == null) return _exe;

      final nextMaxVolume = results[1];

      if (!delete && newSetVolume != null && newSetVolume >= nextMaxVolume) {
        _exe.maxVolumeSetId = setId;
        _exe.maxVolume = newSetVolume;
      } else {
        _exe.maxVolumeSetId = results[0];
        _exe.maxVolume = results[1];
      }
    }

    return _exe;
  }

  Future<modelsApp.Exercise> _verifyMaxWeigth(
      {required modelsApp.Exercise exe,
      required int setId,
      double? newSetWeigth}) async {
    var _exe = exe.copy();
    var delete = newSetWeigth == null;

    if (exe.maxWeigthSetId == setId &&
        ((!delete && newSetWeigth != null && newSetWeigth < exe.maxWeigth) ||
            delete)) {
      final results = await this.db.findMaxWeigth(exe.id!, setId);
      if (results == null) return _exe;

      final nextMaxWeigth = results[1];

      if (!delete && newSetWeigth != null && newSetWeigth >= nextMaxWeigth) {
        _exe.maxWeigthSetId = setId;
        _exe.maxWeigth = newSetWeigth;
      } else {
        _exe.maxWeigthSetId = results[0];
        _exe.maxWeigth = results[1];
      }
    }

    return _exe;
  }

  Future<dynamic> _saveExercise(modelsApp.Exercise exe) =>
      this.db.insertExercise(ExercisesCompanion.insert(
          id: Value(exe.id),
          maxVolumeSetId: Value(exe.maxVolumeSetId),
          maxWeigthSetId: Value(exe.maxWeigthSetId),
          difficulty: exe.difficulty,
          lastWorkouts: exe.lastWorkoutsToString(),
          maxVolume: Value(exe.maxVolume),
          maxWeigth: Value(exe.maxWeigth),
          name: exe.name,
          notes: Value(exe.notes)));
}
