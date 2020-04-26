import 'package:flutter/material.dart';
import 'package:flutterworkouta/constants.dart';
import 'dart:async';
import 'package:flutterworkouta/models/exercise.dart';
import 'package:flutterworkouta/utils/database_helper.dart';
import 'package:intl/intl.dart';

class ExerciseDetail extends StatefulWidget {
  final String appBarTitle;
  final Exercise exercise;
  ExerciseDetail(this.exercise, this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    return ExerciseDetailState(this.exercise, this.appBarTitle);
  }
}

class ExerciseDetailState extends State<ExerciseDetail> {
  DatabaseHelper helper = DatabaseHelper();

  String appBarTitle;
  Exercise exercise;
  TextEditingController titleController = TextEditingController();

  ExerciseDetailState(this.exercise, this.appBarTitle);

  @override
  Widget build(BuildContext context) {
    titleController.text = exercise.title;

    return WillPopScope(
        onWillPop: () {
          moveToLastScreen();
        },
        child: Scaffold(
            appBar: AppBar(
              title: Text(appBarTitle),
              leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    moveToLastScreen();
                  }),
            ),
            body: Padding(
                padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                child: ListView(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                        child: TextField(
                          controller: titleController,
                          style: kMainTextStyledDark,
                          onChanged: (value) {
                            debugPrint('Change in txtField');
                            updateTitle();
                          },
                          decoration: InputDecoration(
                              labelText: 'Name',
                              labelStyle: kMainTextStyledDark,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        )),
                    Padding(
                        padding:
                            EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: RaisedButton(
                                color: Theme.of(context).primaryColorDark,
                                textColor: Theme.of(context).primaryColorLight,
                                child: Text(
                                  'Save',
                                  textScaleFactor: 1.5,
                                ),
                                onPressed: () {
                                  setState(() {
                                    debugPrint('Save Pressed');
                                    _save();
                                  });
                                },
                              ),
                            ),
                            Container(
                              width: 5.0,
                            ),
                            Expanded(
                                child: RaisedButton(
                              color: Theme.of(context).primaryColorDark,
                              textColor: Theme.of(context).primaryColorLight,
                              child: Text(
                                'Delete',
                                textScaleFactor: 1.5,
                              ),
                              onPressed: () {
                                setState(() {
                                  debugPrint('Delete Pressed');
                                  _delete();
                                });
                              },
                            ))
                          ],
                        ))
                  ],
                ))));
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  void updateTitle() {
    exercise.title = titleController.text;
  }

  void _save() async {
    moveToLastScreen();
    int result;
    if (exercise.id != null) {
      result = await helper.updateExercise(exercise);
    } else {
      result = await helper.insertExercise(exercise);
    }

    if (result != 0) {
      //success
      _showAlterDialog('Status', 'Exercise Saved Successfully');
    } else {
      //failure
      _showAlterDialog('Status', 'Issue Saving Exercise');
    }
  }

  void _delete() async {
    moveToLastScreen();
    //case 1 user trying to delete the new exercise - pressed floating action btn
    if (exercise.id == null) {
      _showAlterDialog('Status', 'Exercise not deleted');
      return;
    }
    //case 2 user trying to delete old exercise that already has a valid ID
    int result = await helper.deleteExercise(exercise.id);
    if (result != 0) {
      //success
      _showAlterDialog('Status', 'Exercise Deleted Successfully');
    } else {
      //failure
      _showAlterDialog('Status', 'Issue Deleting Exercise');
    }
  }

  void _showAlterDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }
}
