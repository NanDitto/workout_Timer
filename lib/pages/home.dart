import 'package:flutter/material.dart';
import 'workouts.dart';

List<Workout> routines = [
  Workout(
      title: "Morning Workout",
      numberExercises: 4,
      durationExercise: 30,
      rest: 15),
  Workout(
      title: "Afternoon Workout",
      numberExercises: 7,
      durationExercise: 45,
      rest: 10),
];

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map data = {};

  void addToList(result) {
    setState(() {
      routines.add(
        Workout(
            title: result['name'],
            numberExercises: result['exercises'],
            durationExercise: result['duration'],
            rest: result['rest']),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    try {
      data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    } catch (e) {
      print("Data is null");
    }

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("Routines"),
        centerTitle: true,
        leading: Icon(Icons.home),
        elevation: 3,
        backgroundColor: Colors.deepOrange[400],
      ),
      body: Center(
        child: Listview(),
      ),
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton(
          backgroundColor: Colors.deepOrange[400],
          onPressed: () async {
            dynamic result = await Navigator.pushNamed(context, '/form');
            print(result);
            if (result != null) {
              addToList(result);
            } else {
              print("Nothing returned");
            }
          },
          tooltip: 'Add New Workout',
          child: Icon(
            Icons.add_alarm,
          ),
        ),
      ),
    );
  }
}

class Listview extends StatefulWidget {
  @override
  _ListviewState createState() => _ListviewState();
}

class _ListviewState extends State<Listview> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: routines.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onLongPress: () {
            //TODO EDIT WORKOUT FORM
            print('$index');
          },
          child: Container(
            height: 150,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    routines[index].title,
                    style: TextStyle(fontSize: 40),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      'Exercise Duration: ${routines[index].durationExercise} seconds'),
                  Text('Rest Duration: ${routines[index].rest} seconds'),
                  Text(
                      'Number of exercises: ${routines[index].numberExercises}'),
                  GestureDetector(
                    onTap: () {
                      //Pass data to the timer
                      print("start");
                      Navigator.pushNamed(context, '/timer', arguments: {
                        'title': routines[index].title,
                        'duration': routines[index].durationExercise,
                        'rest': routines[index].rest,
                        'num_ex': routines[index].numberExercises,
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "START",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
