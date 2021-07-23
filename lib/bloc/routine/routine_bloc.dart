import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tracktion/models/db/database.dart';

part 'routine_event.dart';
part 'routine_state.dart';

class RoutineBloc extends Bloc<RoutineEvent, RoutineState> {
  final SQLDatabase db;

  RoutineBloc(this.db) : super(RoutineLoading());

  @override
  Stream<RoutineState> mapEventToState(
    RoutineEvent event,
  ) async* {
    if (event is StreamRoutine) {
      yield* _streamRoutine(event);
    } else if (event is DeleteSet) {
      _deleteSet(event);
    } else if (event is SaveSet) {
      _saveSet(event);
    }
  }

  Stream<RoutineState> _streamRoutine(StreamRoutine event) async* {
    yield RoutineLoading();
    try {
      final sets = this.db.findRoutinesSet(event.routineId);
      yield Routine(sets);
    } catch (e) {
      print(e);
      yield RoutineFailure("Something went wrong fetching routine.");
    }
  }

  Stream<RoutineState> _deleteSet(DeleteSet event) async* {
    final sets = (state as Routine).routine;
    try {
      await this.db.deleteRoutineSet(event.setId);
      yield Routine(sets);
    } catch (e) {
      yield RoutineFailure("Something went wrong saving the set");
    }
  }

  Stream<RoutineState> _saveSet(SaveSet event) async* {
    try {
      final routine = (state as Routine).routine;
      await this.db.saveSetRoutine(event.set.toCompanion(true));
      yield RoutineSuccess();
      yield Routine(routine);
    } catch (e) {
      yield RoutineFailure("Cannot save the set");
    }
  }
}
