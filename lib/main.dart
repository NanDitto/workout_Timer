import 'package:flutter/material.dart';
import 'package:workout_timer/pages/loading.dart';
import 'package:workout_timer/pages/home.dart';
import 'package:workout_timer/pages/routineForm.dart';
import 'package:workout_timer/pages/timer.dart';
import 'package:workout_timer/pages/workouts.dart';

void main() => runApp(MaterialApp(initialRoute: '/', routes: {
      '/': (context) => Loading(),
      '/home': (context) => MyHomePage(),
      '/form': (context) => RoutineForm(),
      '/timer': (context) => TimerStart(),
    }));
