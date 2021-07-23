import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tracktion/bloc/workout/workout_bloc.dart';
import 'package:tracktion/models/app/index.dart';
import 'package:tracktion/screens/analysis/workout-analysis-screen.dart';
import 'package:tracktion/widgets/Drawer.dart';
import 'package:tracktion/widgets/inputs/DatePicker.dart';
import 'package:tracktion/widgets/items/WorkoutItem.dart';
import 'package:tracktion/widgets/modals/NoteInput.dart';
import 'package:tracktion/widgets/ui/IconDropDown.dart';
import 'package:tracktion/widgets/ui/WorkoutEmpty.dart';

import '../../colors/custom_colors.dart';
import '../index.dart';

class WorkOutScreen extends StatefulWidget {
  static const routeName = "/workout";

  @override
  _WorkOutScreenState createState() => _WorkOutScreenState();
}

class _WorkOutScreenState extends State<WorkOutScreen>
    with TickerProviderStateMixin {
  AnimationController? _pageController;
  Animation<double>? animation;
  bool direction = true;
  DateTime currentDate = DateTime.now();
  var delitionMode = false;
  List<SetWorkout> selectedSets = [];
  List<int> orderSets = [];
  var sortMode = false;
  var analysisMode = false;
  var init = false;

  @override
  void initState() {
    _pageController =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this)
          ..addListener(() => setState(() {}));
    // animation = Tween(begin: 0.0, end: 500.0).animate(_pageController);
    Future.delayed(Duration.zero).then((_) {
      BlocProvider.of<WorkoutBloc>(context).add(FetchWorkout());
    });
    super.initState();
  }

  void viewCommentHandler(Rep rep, SetWorkout set) async {
    if (delitionMode) return selectItemHandler(set);

    var isNew = rep.notes == "";
    var updatedRep = await noteRepModal(context: context, rep: rep);

    if (updatedRep == null && !isNew) {
      updatedRep = Rep(
          id: rep.id,
          notes: "",
          reps: rep.reps,
          rpe: rep.rpe,
          weight: rep.weight,
          setId: rep.setId);
    }

    if (updatedRep != null && updatedRep.notes != rep.notes)
      BlocProvider.of<WorkoutBloc>(context).add(SaveRep(rep: updatedRep));
  }

  void changeDateHandler(bool isRight) {
    // isRight ? _pageController.forward() : _pageController.reverse();
    setState(() {
      direction = isRight;
      currentDate = DateTime(currentDate.year, currentDate.month,
          currentDate.day + (isRight ? 1 : -1));
    });
    BlocProvider.of<WorkoutBloc>(context).add(FetchWorkout(date: currentDate));
  }

  void showSetDetails({required int setId, required List<SetWorkout> sets}) {
    var idxWorkout = sets.indexWhere((e) => e.id == setId);

    if (idxWorkout == -1) return;

    var exerciseWorkout = sets[idxWorkout];

    Navigator.of(context).pushNamed(ExerciseWorkOut.routeName, arguments: {
      "exercise": exerciseWorkout.exercise,
      "reps": exerciseWorkout.reps,
      "setId": exerciseWorkout.id,
      "fromWorkout": true,
    });
  }

  void selectItemHandler(SetWorkout set) {
    setState(() {
      final indexSet = selectedSets.indexWhere((st) => st.id == set.id);

      if (indexSet != -1)
        selectedSets.removeAt(indexSet);
      else
        selectedSets.add(set);
    });
  }

  void deleteSetsHandler() {
    if (selectedSets.length > 0) {
      BlocProvider.of<WorkoutBloc>(context).add(DeleteSets(selectedSets));
      setState(() {
        selectedSets = [];
        delitionMode = false;
      });
    }
  }

  void orderSetsHandler(int prev, int next, List<SetWorkout> sets) {
    var ids = orderSets;

    init() {
      for (final set in sets) {
        if (set.id != null) ids.add(set.id!);
      }
    }

    if (ids.length == 0) init();

    if (next >= orderSets.length) next = orderSets.length - 1;
    final item = ids.removeAt(prev);
    ids.insert(next, item);
    setState(() {
      orderSets = ids;
    });
  }

  Widget buildSet(SetWorkout set, List<SetWorkout> sets) => InkWell(
        key: ValueKey(set.id),
        onLongPress: sortMode
            ? null
            : () {
                if (delitionMode) return;
                setState(() {
                  delitionMode = true;
                });
              },
        highlightColor: Colors.red,
        splashColor: Colors.red.withOpacity(0.3),
        onTap: () {
          if (sortMode) return;
          if (!delitionMode && set.id != null)
            return showSetDetails(setId: set.id!, sets: sets);

          selectItemHandler(set);
        },
        child: Padding(
          padding: EdgeInsets.all(10),
          child: WorkoutItem(
            isSortMode: sortMode,
            delitionMode: delitionMode,
            isSelected: selectedSets.contains(set),
            onViewComment: (rep) => viewCommentHandler(rep, set),
            set: set,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            actions: (delitionMode | sortMode)
                ? [
                    if (!sortMode)
                      IconButton(
                          icon: FaIcon(
                            FontAwesomeIcons.trash,
                            size: 24,
                          ),
                          onPressed: deleteSetsHandler),
                    IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.times,
                          size: 24,
                        ),
                        onPressed: () {
                          setState(() {
                            delitionMode = false;
                            sortMode = false;
                          });
                        }),
                  ]
                : [
                    IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.sort,
                          size: 30,
                        ),
                        onPressed: () {
                          setState(() {
                            sortMode = !sortMode;
                          });
                        }),
                    IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.plusCircle,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                              BodyPartsScreen.routeName,
                              arguments: {"pushed": true});
                        }),
                    Container(
                        child: IconDropDown(
                      icons: [
                        Icon(Icons.timeline),
                        Icon(Icons.view_agenda),
                        Icon(Icons.settings),
                      ],
                      backgroundColor: Theme.of(context).colorScheme.analysis,
                      iconColor: Colors.white,
                      onChange: (index) {
                        if (index == 0) {
                          setState(() {
                            analysisMode = !analysisMode;
                          });
                        }
                        print(index);
                      },
                    )),
                  ],
          ),
          drawer: MainDrawer(),
          body: Column(
            children: [
              BlocListener<WorkoutBloc, WorkoutState>(
                listener: (context, state) {
                  if (state is WorkoutSets) {
                    setState(() {
                      currentDate = state.date;
                    });
                  }
                },
                child: DatePicker(
                  changeDate: changeDateHandler,
                  currentDate: currentDate,
                ),
              ),
              Expanded(
                child: AnimatedBuilder(
                  animation: _pageController!,
                  builder: (context, _) => Transform.translate(
                    offset: Offset(0.0 * (direction ? 1 : -1), 0.0),
                    child: BlocBuilder<WorkoutBloc, WorkoutState>(
                      builder: (context, state) {
                        if (state is WorkoutSets) {
                          return StreamBuilder(
                            builder: (context, sts) {
                              if (sts.connectionState ==
                                  ConnectionState.active) {
                                List<SetWorkout> sets = sts.data != null
                                    ? sts.data as List<SetWorkout>
                                    : [];

                                if (sets.isEmpty)
                                  return WorkoutEmpty(
                                    currentDate: state.date,
                                  );

                                sets.sort((a, b) => orderSets
                                    .indexOf(a.id!)
                                    .compareTo(orderSets.indexOf(b.id!)));

                                if (analysisMode)
                                  return WorkoutAnalysisScreen(sets);

                                return !sortMode
                                    ? ListView.builder(
                                        itemCount: sets.length,
                                        itemBuilder: (context, i) =>
                                            buildSet(sets[i], sets),
                                      )
                                    : ReorderableListView(
                                        onReorder: (prev, next) =>
                                            orderSetsHandler(prev, next, sets),
                                        children: [
                                            for (final set in sets)
                                              buildSet(set, sets)
                                          ]
                                        // itemCount: sets.length,
                                        );
                              }

                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                            stream: state.sets,
                          );
                        }

                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
