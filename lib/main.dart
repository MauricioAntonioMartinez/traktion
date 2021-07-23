import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracktion/bloc/auth/auth_cubit.dart';
import 'package:tracktion/bloc/exercise/exercise_bloc.dart';
import 'package:tracktion/bloc/workout-picker/workoutpicker_bloc.dart';
import 'package:tracktion/bloc/workout/workout_bloc.dart';
import 'package:tracktion/models/db/database.dart';
import 'package:tracktion/screens/routine/routine-main-screen.dart';
import 'package:tracktion/screens/routine/routines-screen.dart';

import './screens/index.dart';
import 'bloc/exercise-stream/exercisestream_cubit.dart';
import 'bloc/routine-group/routine_bloc.dart';
import 'bloc/routine/routine_bloc.dart';
import 'bloc/routines/routines_bloc.dart';
import 'plugins/desktop/desktop.dart';
import 'screens/routine/routine-screen.dart';

void main() {
  setTargetPlatformForDesktop();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? _connectivitySubscription;
  bool isAuth = false;

  @override
  void initState() {
    super.initState();
    initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription!.cancel();

    super.dispose();
  }

  Future<void> initConnectivity() async {
    ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
      _updateConnectionStatus(result);
    } on PlatformException catch (e) {
      print(e.toString());
    }
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    if (!isAuth) return;

    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        // ServerMigrator(db: database).migrate();
        break;
      default:
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<SQLDatabase>(
      create: (context) => constructDb(),
      child: BlocProvider(
          create: (BuildContext context) => AuthCubit(),
          child: MultiBlocProvider(
            providers: [
              BlocProvider<ExerciseBloc>(
                create: (BuildContext context) => ExerciseBloc(
                    db: RepositoryProvider.of<SQLDatabase>(context)),
              ),
              BlocProvider<WorkoutBloc>(
                create: (context) => WorkoutBloc(
                    db: RepositoryProvider.of<SQLDatabase>(context)),
              ),
              BlocProvider<WorkoutpickerBloc>(
                create: (context) => WorkoutpickerBloc(
                    db: RepositoryProvider.of<SQLDatabase>(context)),
              ),
              BlocProvider<RoutineBloc>(
                create: (context) =>
                    RoutineBloc(RepositoryProvider.of<SQLDatabase>(context)),
              ),
              BlocProvider<RoutinesBloc>(
                create: (context) =>
                    RoutinesBloc(RepositoryProvider.of<SQLDatabase>(context)),
              ),
              BlocProvider<RoutineGroupBloc>(
                create: (context) => RoutineGroupBloc(
                    RepositoryProvider.of<SQLDatabase>(context)),
              ),
              BlocProvider(
                  create: (BuildContext context) => ExerciseStreamCubit(
                      db: RepositoryProvider.of<SQLDatabase>(context))),
            ],
            child: TracktionApp(changeAuthStatus: (auth) {
              setState(() {
                isAuth = auth;
              });
            }),
          )),
    );
  }
}

class TracktionApp extends StatefulWidget {
  final Function(bool) changeAuthStatus;

  const TracktionApp({
    Key? key,
    required this.changeAuthStatus,
  }) : super(key: key);

  @override
  _TracktionAppState createState() => _TracktionAppState();
}

class _TracktionAppState extends State<TracktionApp> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((_) {
      BlocProvider.of<AuthCubit>(context).checkCredentials();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (BuildContext context, Widget? widget) {
        Widget error = Text('...rendering error...');

        if (widget is Scaffold || widget is Navigator)
          error = Scaffold(body: Center(child: error));

        ErrorWidget.builder = (FlutterErrorDetails errorDetails) => error;

        return widget!;
      },
      theme: ThemeData(
          brightness: WidgetsBinding.instance!.window.platformBrightness,
          fontFamily: 'CarterOne',
          primarySwatch: Colors.red,
          primaryColor: Color(0xFFB71C1C),
          accentColor: Color(0xFF9E9E9E),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(
            headline6: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          buttonTheme: const ButtonThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(4.0),
              ),
            ),
          )),
      home: BlocConsumer<AuthCubit, AuthState>(
        builder: (ctx, state) {
          if (state is AuthSuccess) return MainScreen();
          if (state is AuthFailed) return AuthScreen();
          return LoadingScreen();
        },
        listener: (ctx, state) {
          if (state is AuthSuccess) {
            widget.changeAuthStatus(true);
          }
          if (state is AuthFailed) {
            widget.changeAuthStatus(false);
          }
        },
      ),
      routes: {
        MainScreen.routeName: (ctx) => MainScreen(),
        BodyPartsScreen.routeName: (ctx) => BodyPartsScreen(),
        SearchExercise.routeName: (ctx) => SearchExercise(),
        AddEditBodyPartsScreen.routeName: (ctx) => AddEditBodyPartsScreen(),
        ExerciseWorkOut.routeName: (ctx) => ExerciseWorkOut(),
        WorkOutScreen.routeName: (ctx) => WorkOutScreen(),
        RoutineMainScreen.routeName: (ctx) => RoutineMainScreen(),
        RoutinesScreen.routeName: (ctx) => RoutinesScreen(),
        RoutineScreen.routeName: (ctx) => RoutineScreen(),
      },
    );
  }
}
