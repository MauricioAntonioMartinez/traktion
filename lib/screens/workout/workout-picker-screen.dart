import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tracktion/bloc/workout-picker/workoutpicker_bloc.dart';
import 'package:tracktion/bloc/workout/workout_bloc.dart';
import 'package:tracktion/models/app/index.dart';
import 'package:tracktion/models/app/set.dart';
import 'package:tracktion/widgets/items/WorkoutItem.dart';
import 'package:tracktion/widgets/modals/RepInputs.dart';
import 'package:tracktion/widgets/modals/confirmationModal.dart';

class WorkoutPickedScreen extends StatefulWidget {
  final DateTime datePicked;
  final DateTime targetDate;

  WorkoutPickedScreen({required this.datePicked, required this.targetDate});

  @override
  _WorkoutPickedScreenState createState() => _WorkoutPickedScreenState();
}

class _WorkoutPickedScreenState extends State<WorkoutPickedScreen> {
  Map<int, dynamic> workoutFilters = {};
  var editMode = false;
  var selectMode = true;

  void changeRepStatusHandler({required int repIndex, int? setId}) {
    final newStatus = {...workoutFilters};
    final repPrevValue = newStatus[setId]["reps"][repIndex];
    newStatus[setId]["reps"][repIndex] = !repPrevValue;
    setState(() {
      workoutFilters = newStatus;
    });
  }

  void changeSetStatusHandler(int? setId) {
    final newStatus = {...workoutFilters};

    final set = newStatus[setId];
    if (set == null) return;

    final prevSetStatus = set["active"];
    set["active"] = !prevSetStatus;
    set["reps"] =
        (set["reps"] as List<bool>).map((e) => !prevSetStatus).toList();
    setState(() {
      workoutFilters = newStatus;
    });
  }

  void setsToStatus(List<SetWorkout> sets) {
    Map<int, dynamic> status = sets.fold({}, (prev, item) {
      if (item.id != null)
        prev[item.id!] = {
          "active": true,
          "reps": item.reps.map((e) {
            return true;
          }).toList()
        };
      return prev;
    });

    setState(() {
      workoutFilters = status;
    });
  }

  deleteSetHandler(int? setId) async {
    if (setId == null) return;

    final shouldDelete = await confirmationModal(
            context: context, message: "Do you want to delete this set?") ??
        false;
    if (shouldDelete) {
      BlocProvider.of<WorkoutpickerBloc>(context).add(DeleteSetPicker(setId));
    }
  }

  void saveRepHandler(
      {required Rep rep, required int setIndex, required int repIndex}) async {
    final updatedRep = await repInputsModal(context, rep);
    BlocProvider.of<WorkoutpickerBloc>(context).add(
        SaveRepPicker(rep: updatedRep, setIndex: setIndex, repIndex: repIndex));
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((_) {
      BlocProvider.of<WorkoutpickerBloc>(context)
          .add(PickWorkout(widget.datePicked));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<WorkoutpickerBloc, WorkoutpickerState>(
      listener: (context, state) {
        if (state is Workout) {
          setsToStatus(state.sets);
        }
      },
      builder: (context, state) {
        if (state is Workout) {
          final sets = state.sets;
          if (sets.length == 0 || workoutFilters.isEmpty)
            return Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FaIcon(
                    FontAwesomeIcons.timesCircle,
                    color: Colors.red,
                    size: 60,
                  ),
                  Text("There are not sets here",
                      style: TextStyle(
                          fontSize: 28, color: Colors.black.withOpacity(0.5))),
                ],
              ),
            );

          return Container(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: ListView.builder(
                        itemCount: sets.length,
                        itemBuilder: (context, i) => WorkoutItem(
                              isSelected: workoutFilters[sets[i].id]["active"],
                              onDeleteSet: deleteSetHandler,
                              onEditRep: (rep, repIndex) => saveRepHandler(
                                  rep: rep, repIndex: repIndex, setIndex: i),
                              editable: editMode,
                              selectable: selectMode,
                              onCheckRep: changeRepStatusHandler,
                              onCheckSet: changeSetStatusHandler,
                              repsSelectors: workoutFilters[sets[i].id]["reps"],
                              set: sets[i],
                            )),
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  padding: EdgeInsets.all(8),
                  height: editMode ? 50 : 70,
                  decoration: BoxDecoration(color: Colors.black),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: editMode
                        ? [
                            IconButton(
                              visualDensity: VisualDensity.compact,
                              icon: FaIcon(
                                FontAwesomeIcons.times,
                              ),
                              onPressed: () {
                                setState(() {
                                  editMode = !editMode;
                                  selectMode = !selectMode;
                                });
                              },
                              color: Colors.white,
                              padding: EdgeInsets.all(0),
                            )
                          ]
                        : [
                            TextButton.icon(
                                onPressed: () async {
                                  final shouldCopy = await confirmationModal(
                                          context: context,
                                          message:
                                              "Do you want to apply this changes?") ??
                                      false;
                                  if (shouldCopy) {
                                    BlocProvider.of<WorkoutBloc>(context).add(
                                        CopySets(
                                            date: widget.targetDate,
                                            sets: sets,
                                            workoutFilters: workoutFilters));
                                    int count = 0;
                                    Navigator.of(context)
                                        .popUntil((_) => count++ >= 2);
                                  }
                                },
                                icon: FaIcon(
                                  FontAwesomeIcons.plus,
                                  size: 12,
                                ),
                                label: Text("Apply")),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 0),
                              child: TextButton.icon(
                                  onPressed: () {
                                    setState(() {
                                      editMode = !editMode;
                                      selectMode = !selectMode;
                                    });
                                  },
                                  icon: FaIcon(
                                    editMode
                                        ? FontAwesomeIcons.check
                                        : FontAwesomeIcons.edit,
                                    size: 12,
                                  ),
                                  label: Text("Edit")),
                            ),
                            TextButton.icon(
                                onPressed: () {
                                  Navigator.of(context).pop(false);
                                },
                                icon: FaIcon(
                                  FontAwesomeIcons.levelUpAlt,
                                  size: 12,
                                ),
                                label: Text("Cancel")),
                          ],
                  ),
                )
              ],
            ),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    ));
  }
}
