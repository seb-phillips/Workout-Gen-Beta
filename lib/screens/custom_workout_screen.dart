import 'package:flutter/material.dart';
import '../constants.dart';
import '../bottom_button.dart';
import 'package:flutterworkouta/utils/database_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutterworkouta/models/exercise.dart';
import 'dart:math';

class CustomWorkoutScreen extends StatefulWidget {
  CustomWorkoutScreen({this.customDifficulty});
  final String customDifficulty;

  @override
  _CustomWorkoutScreenState createState() => _CustomWorkoutScreenState();
}

class _CustomWorkoutScreenState extends State<CustomWorkoutScreen> {
  var customWorkout1 = "";
  var customWorkout2 = "";
  var customWorkout3 = "";
  var customWorkout4 = "";
  var customWorkout5 = "";
  bool firstRun = true;
  DatabaseHelper databaseHelper = DatabaseHelper();
  // List<Exercise> exerciseList;
  @override
  Widget build(BuildContext context) {
    if (firstRun == true) {
      customWorkout();
    }
    return Scaffold(
      backgroundColor: kBackgroundColour,
      appBar: AppBar(
        backgroundColor: kButtonAndBarColour,
        title: Text('CUSTOM', style: kTitleStyle),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 15.0),
            Expanded(
              child: Text(
                'WORKOUT',
                style: kTitleStyleDark,
              ),
            ),
            Container(
              child: Text(
                'DIFFICULTY: ' + widget.customDifficulty,
                style: kTitleStyleDark,
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10.0),
              child: Column(
                children: <Widget>[
                  Text('READY...GO!', style: kCommentTextStyle),
                  Text(
                    customWorkout1,
                    style: kMainTextStyledDark,
                  ),
                  Text('REST 30s!', style: kCommentTextStyle),
                  Text(
                    customWorkout2,
                    style: kMainTextStyledDark,
                  ),
                  Text('REST 30s!', style: kCommentTextStyle),
                  Text(
                    customWorkout3,
                    style: kMainTextStyledDark,
                  ),
                  Text('REST 30s!', style: kCommentTextStyle),
                  Text(
                    customWorkout4,
                    style: kMainTextStyledDark,
                  ),
                  Text('REST 30s!', style: kCommentTextStyle),
                  Text(
                    customWorkout5,
                    style: kMainTextStyledDark,
                  ),
                  Text('GOOD JOB, REST!', style: kCommentTextStyle),
                  Text('OR GO AGAIN?', style: kCommentTextStyle),
                ],
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            BottomButton(
              buttonTitle: 'NEW WORKOUT',
              onTap: () {
                customWorkout();
              },
            ),
          ],
        ),
      ),
    );
  }

  void customWorkout() async {
    databaseHelper.initializeDatabase();
    // print(await databaseHelper.getExerciseMapList());
    var list = await databaseHelper.getExerciseList();
    var count = await databaseHelper.getCount();
    var random = Random();
    var ia = random.nextInt(count);
    var ib = random.nextInt(count);
    var ic = random.nextInt(count);
    var id = random.nextInt(count);
    var ie = random.nextInt(count);
    if (widget.customDifficulty == "EASY") {
      setState(() {
        firstRun = false;
        customWorkout1 =
            '1: ' + list[ia].title + ' ' + getRepsEasy() + 'X' + getSetsEasy();
        customWorkout2 =
            '2: ' + list[ib].title + ' ' + getRepsEasy() + 'X' + getSetsEasy();
        ;
        customWorkout3 =
            '3: ' + list[ic].title + ' ' + getRepsEasy() + 'X' + getSetsEasy();
        ;
        customWorkout4 =
            '4: ' + list[id].title + ' ' + getRepsEasy() + 'X' + getSetsEasy();
        ;
        customWorkout5 =
            '5: ' + list[ie].title + ' ' + getRepsEasy() + 'X' + getSetsEasy();
        ;
      });
    }
    if (widget.customDifficulty == "MEDIUM") {
      setState(() {
        firstRun = false;
        customWorkout1 = '1: ' +
            list[ia].title +
            ' ' +
            getRepsMedium() +
            'X' +
            getSetsMedium();
        customWorkout2 = '2: ' +
            list[ib].title +
            ' ' +
            getRepsMedium() +
            'X' +
            getSetsMedium();
        ;
        customWorkout3 = '3: ' +
            list[ic].title +
            ' ' +
            getRepsMedium() +
            'X' +
            getSetsMedium();
        ;
        customWorkout4 = '4: ' +
            list[id].title +
            ' ' +
            getRepsMedium() +
            'X' +
            getSetsMedium();
        ;
        customWorkout5 = '5: ' +
            list[ie].title +
            ' ' +
            getRepsMedium() +
            'X' +
            getSetsMedium();
        ;
      });
    }
    if (widget.customDifficulty == "HARD") {
      setState(() {
        firstRun = false;
        customWorkout1 =
            '1: ' + list[ia].title + ' ' + getRepsHard() + 'X' + getSetsHard();
        customWorkout2 =
            '2: ' + list[ib].title + ' ' + getRepsHard() + 'X' + getSetsHard();
        ;
        customWorkout3 =
            '3: ' + list[ic].title + ' ' + getRepsHard() + 'X' + getSetsHard();
        ;
        customWorkout4 =
            '4: ' + list[id].title + ' ' + getRepsHard() + 'X' + getSetsHard();
        ;
        customWorkout5 =
            '5: ' + list[ie].title + ' ' + getRepsHard() + 'X' + getSetsHard();
        ;
      });
    }
  }

  String getRepsEasy() {
    var random = Random();
    var i = random.nextInt(6) + 6;
    return i.toString();
  }

  String getRepsMedium() {
    var random = Random();
    var i = random.nextInt(13) + 17;
    return i.toString();
  }

  String getRepsHard() {
    var random = Random();
    var i = random.nextInt(30) + 20;
    return i.toString();
  }

  String getSetsEasy() {
    var random = Random();
    var i = random.nextInt(2) + 1;
    return i.toString();
  }

  String getSetsMedium() {
    var random = Random();
    var i = random.nextInt(3) + 3;
    return i.toString();
  }

  String getSetsHard() {
    var random = Random();
    var i = random.nextInt(4) + 3;
    return i.toString();
  }
}
