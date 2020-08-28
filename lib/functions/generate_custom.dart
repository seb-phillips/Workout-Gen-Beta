import 'dart:math';
import 'dart:async';
import 'package:flutterworkouta/models/exercise.dart';
import 'package:flutterworkouta/utils/database_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutterworkouta/screens/exercise_list.dart';

DatabaseHelper databaseHelper = DatabaseHelper();
List<Exercise> exerciseList;
// Future<List> printExercises() async {
//   databaseHelper.initializeDatabase();
//   exerciseList = await databaseHelper.getExerciseList();
//   print(await databaseHelper.getExerciseList());
//   print(exerciseList);
// }

List typeArray = [
  'Star Jumps/Jumpung Jacks',
  'Standdsaard Push Ups',
  'Plank jacks',
  'Squadsats',
  'Lunges',
  'Jump lsadunges',
  'Leg Raises',
  'Toe tsadaps',
  'Tuck Jsadump',
  'Mountain as',
  'High knees',
  'Calf Raise',
  'Rotational jacks',
  'Arm Circles',
  'Plank Ski Hops'
];

//CREATE ENUM FOR WORKOUT TYPES - ASSOCIATED WITH A NUMBER SO CAN USE RANDOM NUMBER WHICH RELATES TO A EXERCISE TYPE
class GenerateCustom {
  int rnd;
  // NEED TO SET typeArray to values from SQFLITE DB ?
  GenerateCustom({this.difficulty});
  final int difficulty;
  String workout;
  String ex1;
  String ex2;
  String ex3;
  String ex4;
  String ex5;

  String getStrengthType() {
    var random = Random();
    var i = random.nextInt(14);
    print(typeArray[i]);
    return typeArray[i];
  }

  String cuExerciseOne() {
    if (difficulty == 1) {
      workout = ('1: ' +
          getStrengthType() +
          ' ' +
          getRepsEasy() +
          'x' +
          getSetsEasy());
    } else if (difficulty == 2) {
      workout = ('1: ' +
          getStrengthType() +
          ' ' +
          getRepsMedium() +
          'x' +
          getSetsMedium());
    } else {
      workout = ('1: ' +
          getStrengthType() +
          ' ' +
          getRepsHard() +
          'x' +
          getSetsHard());
    }
    return workout;
  }

  String cuExerciseTwo() {
    if (difficulty == 1) {
      workout = ('2: ' +
          getStrengthType() +
          ' ' +
          getRepsEasy() +
          'x' +
          getSetsEasy());
    } else if (difficulty == 2) {
      workout = ('2: ' +
          getStrengthType() +
          ' ' +
          getRepsMedium() +
          'x' +
          getSetsMedium());
    } else {
      workout = ('2: ' +
          getStrengthType() +
          ' ' +
          getRepsHard() +
          'x' +
          getSetsHard());
    }
    return workout;
  }

  String cuExerciseThree() {
    if (difficulty == 1) {
      workout = ('3: ' +
          getStrengthType() +
          ' ' +
          getRepsEasy() +
          'x' +
          getSetsEasy());
    } else if (difficulty == 2) {
      workout = ('3: ' +
          getStrengthType() +
          ' ' +
          getRepsMedium() +
          'x' +
          getSetsMedium());
    } else {
      workout = ('3: ' +
          getStrengthType() +
          ' ' +
          getRepsHard() +
          'x' +
          getSetsHard());
    }
    return workout;
  }

  String cuExerciseFour() {
    if (difficulty == 1) {
      workout = ('4: ' +
          getStrengthType() +
          ' ' +
          getRepsEasy() +
          'x' +
          getSetsEasy());
    } else if (difficulty == 2) {
      workout = ('4: ' +
          getStrengthType() +
          ' ' +
          getRepsMedium() +
          'x' +
          getSetsMedium());
    } else {
      workout = ('4: ' +
          getStrengthType() +
          ' ' +
          getRepsHard() +
          'x' +
          getSetsHard());
    }
    return workout;
  }

  String cuExerciseFive() {
    if (difficulty == 1) {
      workout = ('5: ' +
          getStrengthType() +
          ' ' +
          getRepsEasy() +
          'x' +
          getSetsEasy());
    } else if (difficulty == 2) {
      workout = ('5: ' +
          getStrengthType() +
          ' ' +
          getRepsMedium() +
          'x' +
          getSetsMedium());
    } else {
      workout = ('5: ' +
          getStrengthType() +
          ' ' +
          getRepsHard() +
          'x' +
          getSetsHard());
    }
    return workout;
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
