import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoutineForm extends StatefulWidget {
  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<RoutineForm> {
  final name = TextEditingController();
  final duration = TextEditingController();
  final rest = TextEditingController();
  final numEx = TextEditingController();
  @override
  void dispose() {
    name.dispose();
    duration.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[400],
        title: Text("Build Routine"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
            child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Routine Name",
                  style: TextStyle(fontSize: 25),
                ),
                TextField(
                  controller: name,
                ),
                SizedBox(height: 30),
                Text(
                  "How many exercises?",
                  style: TextStyle(fontSize: 25),
                ),
                TextField(
                  controller: numEx,
                ),
                SizedBox(height: 30),
                Text(
                  "Duration of each exercise?",
                  style: TextStyle(fontSize: 25),
                ),
                TextField(controller: duration),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Duration of rest between?",
                  style: TextStyle(fontSize: 25),
                ),
                TextField(
                  controller: rest,
                ),
              ],
            ),
          ),
        )),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange[600],
        child: Icon(
          Icons.save,
        ),
        onPressed: () {
          //Navigator.pop(context);
          Navigator.pushReplacementNamed(context, '/home', arguments: {
            'name': name.text,
            'duration': int.parse(duration.text),
            'exercises': 10,
            'rest': 10,
          });
        },
      ),
    ));
  }
}
