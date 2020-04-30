import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

//TODO Import Locale Workouts
class _LoadingState extends State<Loading> {
  @override
  void initState() {
    startLoad();
    super.initState();
  }

  startLoad() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[400],
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Workout timeR",
              style: TextStyle(fontSize: 50),
            ),
            SizedBox(height: 100),
            Center(
              child: SpinKitCircle(
                color: Colors.white,
                size: 100.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
