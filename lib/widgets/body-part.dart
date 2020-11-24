import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tracktion/models/body-parts.dart';
import '../colors/custom_colors.dart';

class BodyPartWidget extends StatelessWidget {
  final double width;
  final double height;
  final BodyPart bodyPart;
  final bool withTitle;
  final bool active;
  final Color textColor;
  final Color bgColor;
  BodyPartWidget(this.bodyPart,
      {this.withTitle = true,
      this.width = 110,
      this.height = 110,
      this.active = false,
      this.textColor = Colors.white,
      this.bgColor});

  @override
  Widget build(BuildContext context) {
    var file = 'assets/vectors/';

    switch (bodyPart) {
      case BodyPart.Abs:
        file += 'abs';
        break;
      case BodyPart.Back:
        file += 'back';
        break;
      case BodyPart.GLUTEUS:
        file += 'butt';
        break;
      case BodyPart.Calfs:
        file += 'calfs';
        break;
      case BodyPart.Chest:
        file += 'chest';
        break;
      case BodyPart.Hamstrings:
        file += 'hamstrings';
        break;
      case BodyPart.Legs:
        file += 'legs';
        break;
      case BodyPart.Quadriceps:
        file += 'quads';
        break;
      case BodyPart.Shoulders:
        file += 'shoulders';
        break;
      case BodyPart.Arms:
        file += 'arms';
        break;
    }

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
          decoration: BoxDecoration(
              color: active
                  ? bgColor != null
                      ? bgColor
                      : Theme.of(context).colorScheme.routinesLight
                  : textColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  width: 0.5, color: Theme.of(context).colorScheme.exercise)),
          padding: EdgeInsets.all(8),
          width: width,
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                '${file}.svg',
                width: width * 0.6,
                height: height * 0.6,
                color: active ? textColor : Colors.black,
              ),
              SizedBox(
                height: 5,
              ),
              if (withTitle)
                Text(
                  bodyPart.toString().split('.')[1],
                  style: TextStyle(
                      color: active
                          ? textColor
                          : Theme.of(context).colorScheme.exerciseLight),
                )
            ],
          )),
    );
  }
}
