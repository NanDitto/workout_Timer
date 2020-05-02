import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';

class TimerStart extends StatefulWidget {
  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<TimerStart> {
  Map data = {};
  String title = "";
  int numEx = 0;
  int rest = 0;
  int duration = 0;
  int temp = 0;
  Timer t;
  bool isPaused = true;
  bool isRest = false;

  void startTimer() {
    if (t != null) {
      t.cancel();
    }
    t = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        //TODO IF EXERCISE IS FINISHED MAYBE ADD A RESTART WORKOUT?
        //TODO MAYBE ADD RESUME WORKOUT FROM ANOTHER PAGE?
        //If the number of exercises is 4, then run the timer from the duration 4 times, and rest 3 times
        if (!isPaused) {
          if (temp > 0) {
            temp--;
          } else if (numEx > 0) {
            numEx--;
            isRest = isRest ? false : true;
            if (isRest) {
              temp = rest;
            } else {
              temp = duration;
            }
          } else {
            t.cancel();
          }
        } else {
          print("Paused");
        }
      });
    });
  }

  @override
  void dispose() {
    if (t != null) t.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    print('$temp');
    if (title == "") {
      title = data['title'];
      numEx = data['num_ex'];
      rest = data['rest'];
      duration = data['duration'];
      temp = duration;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[400],
        elevation: 0,
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 30),
            Text(
              'REMAINING EXERCISES: ${numEx.toString()}',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 200),
            Text(
              temp.toString(),
              style: TextStyle(fontSize: 70, letterSpacing: 3),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        onPressed: () {
          setState(() {
            isPaused = isPaused ? false : true;
          });
          startTimer();
        },
        elevation: 5,
        child: Icon(isPaused ? Icons.play_arrow : Icons.pause),
      ),
    );
  }
}
