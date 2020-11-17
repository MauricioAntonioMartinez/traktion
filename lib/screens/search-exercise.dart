import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracktion/bloc/exercise/exercise_bloc.dart';
import 'package:tracktion/models/body-parts.dart';
import 'package:tracktion/widgets/ErrorMessage.dart';
import 'package:tracktion/widgets/ExerciseItem.dart';
import 'package:tracktion/widgets/InputSearch.dart';
import '../colors/custom_colors.dart';
import 'package:tracktion/shapes/AbstractShape.dart';
import 'package:tracktion/shapes/exercise-search-shape.dart';
import 'package:tracktion/widgets/body-part.dart';
import '../colors/custom_colors.dart';

class SearchExercise extends StatefulWidget {
  static const routeName = '/exercise-search';

  @override
  _SearchExerciseState createState() => _SearchExerciseState();
}

class _SearchExerciseState extends State<SearchExercise> {
  final _controller = TextEditingController();

  void searchHandler(String val) {
    print(val);
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((d) {
      print('CALLED');
      BlocProvider.of<ExerciseBloc>(context).add(FetchExers());
    });
  }

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    final bodyPart = ModalRoute.of(context).settings.arguments as BodyPart;

    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          titleSpacing: 0,
          backgroundColor: Colors.white,
          title: Text(bodyPart.toString().split('.')[1],
              style: TextStyle(
                  color: Theme.of(context).colorScheme.exercise, fontSize: 25)),
          centerTitle: true),
      body: Stack(
        children: [
          AbstractShape(
            width: double.infinity,
            height: query.size.height,
            shape: ExerciseSearchShape(Theme.of(context).colorScheme.routines),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                    child: Hero(
                        tag: bodyPart,
                        child: BodyPartWidget(
                          bodyPart,
                          withTitle: false,
                          width: 200,
                          height: 200,
                        )),
                  ),
                  BlocBuilder<ExerciseBloc, ExerciseState>(
                    builder: (ctx, state) {
                      Widget main;

                      if (state is Exercises) {
                        print(state.exerceies);
                        final exs = state.exerceies;
                        return Container(
                          height: query.size.height * 0.47,
                          width: query.size.width * 0.9,
                          child: ListView.builder(
                            itemBuilder: (ctx, i) => ExerciseItem(exs[i]),
                            itemCount: exs.length,
                          ),
                        );
                      }

                      if (state is ExercisesLoading) {
                        main = Center(
                          child: CircularProgressIndicator(
                            backgroundColor:
                                Theme.of(context).colorScheme.exercise,
                          ),
                        );
                      }

                      if (state is ExerciseFailure) {
                        main = ErrorMessage(
                            primaryColor:
                                Theme.of(context).colorScheme.exercise,
                            secundaryColor:
                                Theme.of(context).colorScheme.exercise,
                            text: state.message);
                      }

                      return Container(
                        height: query.size.height * 0.47,
                        width: query.size.width * 0.9,
                        child: main,
                      );
                    },
                  ),
                  Container(
                    width: 350,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                    child: InputSearch(
                        change: searchHandler,
                        controller: _controller,
                        textColor: Colors.white,
                        fillColor: Colors.transparent),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
