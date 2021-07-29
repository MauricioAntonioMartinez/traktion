import 'package:flutter/material.dart';
import 'package:tracktion/models/app/exercise.dart';
import 'package:tracktion/util/enumToString.dart';

import '../../colors/custom_colors.dart';

class ExerciseItem extends StatelessWidget {
  final Exercise exs;

  ExerciseItem(this.exs);

  @override
  Widget build(BuildContext context) {
    final _bodyParts = exs.bodyParts
        .map((e) => enumToString(e) + " ")
        .join()
        .trim()
        .replaceAll(" ", " - ");

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black45,
              blurRadius: 5,
              spreadRadius: 0,
              offset: Offset(0, 5))
        ],
      ),
      padding: const EdgeInsets.all(4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ListTile(
          visualDensity: VisualDensity.compact,
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
          tileColor: Colors.white,
          title: Text(
            'Difficulty: ${enumToString(exs.difficulty)} }',
            textAlign: TextAlign.end,
            style:
                TextStyle(color: Theme.of(context).colorScheme.exerciseLight),
          ),
          leading: Text(
            exs.name,
            style: TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.start,
          ),
          dense: true,
          subtitle: Text(
            _bodyParts,
            textAlign: TextAlign.end,
            style:
                TextStyle(color: Theme.of(context).colorScheme.routinesLight),
          ),
        ),
      ),
    );
  }
}
