import 'package:flutter/material.dart';
import 'package:tracktion/widgets/forms/SaveGroupRoutine.dart';

class SaveRoutineGroupScreen extends StatelessWidget {
  const SaveRoutineGroupScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SaveGroupRoutineForm(),
    );
  }
}
