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

// class Dialog extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController customController = TextEditingController();
//     return showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text("New Workout", textAlign: TextAlign.center),
//             contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//             titlePadding: EdgeInsets.symmetric(vertical: 10),
//             content: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 Text("Enter Workout's Name"),
//                 TextField(
//                   controller: customController,
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text("How many exercises?"),
//                 TextField(
//                   controller: customController,
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text("How long is your workout?"),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text("How long are your rests?"),
//                 //Add a time selecting Widget,
//                 //What are your rest intervals and active intervals?
//               ],
//             ),
//             actions: <Widget>[
//               MaterialButton(
//                 elevation: 5.0,
//                 child: Text('Submit'),
//                 onPressed: () {
//                   Navigator.of(context).pop(customController.text.toString());
//                 },
//               ),
//             ],
//           );
//   }
// }
