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
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    name.dispose();
    duration.dispose();
    rest.dispose();
    numEx.dispose();
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
        child: Form(
            key: _formKey,
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
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a name';
                        }
                        return null;
                      },
                      controller: name,
                    ),
                    SizedBox(height: 30),
                    Text(
                      "How many exercises?",
                      style: TextStyle(fontSize: 25),
                    ),
                    TextFormField(
                      controller: numEx,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Duration of each exercise?",
                      style: TextStyle(fontSize: 25),
                    ),
                    TextFormField(
                      controller: duration,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a duration';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Duration of rest between?",
                      style: TextStyle(fontSize: 25),
                    ),
                    TextFormField(
                      controller: rest,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a rest duration';
                        }
                        return null;
                      },
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
          if (_formKey.currentState.validate()) {
            Navigator.pop(context, {
              'name': name.text,
              'duration': int.parse(duration.text),
              'exercises': int.parse(numEx.text),
              'rest': int.parse(rest.text),
            });
          }
        },
      ),
    ));
  }
}
