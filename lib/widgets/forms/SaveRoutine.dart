import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracktion/bloc/routine-group/routine_bloc.dart';
import 'package:tracktion/colors/custom_colors.dart';
import 'package:tracktion/models/db/database.dart';
import 'package:tracktion/models/tables/Routines.dart';
import 'package:tracktion/widgets/inputs/input.dart';

class SaveRoutineForm extends StatefulWidget {
  @override
  _SaveRoutineFormState createState() => _SaveRoutineFormState();
}

class _SaveRoutineFormState extends State<SaveRoutineForm> {
  final form = GlobalKey<FormState>();

  final fields = {};

  String isRequired(String value) {
    if (value == "") return "Field must be set.";
    return null;
  }

  void onSubmit() {
    var isValid = form.currentState.validate();

    if (isValid) {
      print(fields);
      BlocProvider.of<RoutineGroupBloc>(context).add(SaveGroupRoutine(
          RoutineGroupData(
              id: null,
              name: fields["name"],
              description: fields["description"],
              imageUrl: "test",
              theme: ThemeGroup.Blue)));
    }
  }

  void changeHandler(String key, String value) {
    fields[key] = value;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RoutineGroupBloc, RoutineGroupState>(
      listener: (context, state) {
        if (state is RoutinesGroupSuccess) {
          Navigator.of(context).pop();
        }
        if (state is RoutineGroupFailure) {}
      },
      child: Form(
        key: form,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Name",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.analysis,
                    fontSize: 23),
              ),
              TracktionInput(
                validator: isRequired,
                autoFocus: true,
                hint: "Push Pull Legs",
                change: (val) => changeHandler("name", val),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Description",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.analysis,
                    fontSize: 23),
              ),
              TracktionInput(
                validator: isRequired,
                change: (val) => changeHandler("description", val),
                hint: "No pain no gain.",
                maxlines: 5,
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                    onPressed: onSubmit,
                    style: TextButton.styleFrom(
                        primary: Colors.white, backgroundColor: Colors.black),
                    child: Text("Save")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
