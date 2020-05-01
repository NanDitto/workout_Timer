import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';

class TimerStart extends StatefulWidget {
  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<TimerStart> {
  Map data = {};

  void startTimer(currentTime, duration) {
    const oneSec = const Duration(seconds: 1);
    currentTime = new Timer.periodic(
      oneSec,
      (currentTime) => setState(() {
        if (duration < 1) {
          currentTime.cancel();
        } else {
          duration = duration - 1;
          print(duration);
        }
      }),
    );
  }

  bool isPaused = true;
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    String title = data['title'];
    int numEx = data['num_ex'];
    int rest = data['rest'];
    int duration = data['duration'];
    Timer currentTime;

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
              duration.toString(),
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
          startTimer(currentTime, duration);
        },
        elevation: 5,
        child: Icon(isPaused ? Icons.play_arrow : Icons.pause),
      ),
    );
  }
}
