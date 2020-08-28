import 'package:flutter/material.dart';
import 'package:flutterworkouta/screens/exercise_detail.dart';
import 'dart:async';
import 'package:flutterworkouta/models/exercise.dart';
import 'package:flutterworkouta/utils/database_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:math';

class ExerciseList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ExerciseListState();
  }
}

class ExerciseListState extends State<ExerciseList> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Exercise> exerciseList;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (exerciseList == null) {
      exerciseList = List<Exercise>();
      updateListView();
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Exercise List'),
        ),
        body: getExerciseListView(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            printExercises();
            debugPrint('FAB clicked');
            navigateToDetail(Exercise(''), 'Add Exercise');
          },
          tooltip: 'Add Exercise',
          child: Icon(Icons.add),
        ));
  }

  ListView getExerciseListView() {
    TextStyle titleStyle = Theme.of(context).textTheme.subhead;

    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
            color: Colors.white,
            elevation: 3.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red,
                child: Icon(Icons.keyboard_arrow_right),
              ),
              title: Text(
                this.exerciseList[position].title,
                style: titleStyle,
              ),
              trailing: GestureDetector(
                child: Icon(
                  Icons.delete,
                  color: Colors.grey,
                ),
                onTap: () {
                  _delete(context, exerciseList[position]);
                },
              ),
              onTap: () {
                debugPrint("ListTitle Tapped");
                navigateToDetail(this.exerciseList[position], 'Edit Exercise');
              },
            ));
      },
    );
  }

  void _delete(BuildContext context, Exercise exercise) async {
    int result = await databaseHelper.deleteExercise(exercise.id);
    if (result != 0) {
      _showSnackBar(context, 'Exercise Successfully Deleted');
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void navigateToDetail(Exercise exercise, String title) async {
    bool result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ExerciseDetail(exercise, title);
    }));
    //if true update list view
    if (result == true) {
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Exercise>> exerciseListFuture =
          databaseHelper.getExerciseList();
      exerciseListFuture.then((exerciseList) {
        setState(() {
          this.exerciseList = exerciseList;
          this.count = exerciseList.length;
        });
      });
    });
  }

  void printExercises() async {
    databaseHelper.initializeDatabase();
    print(await databaseHelper.getExerciseMapList());
  }
}
