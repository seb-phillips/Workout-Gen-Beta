import 'dart:math';

//CREATE ENUM FOR WORKOUT TYPES - ASSOCIATED WITH A NUMBER SO CAN USE RANDOM NUMBER WHICH RELATES TO A EXERCISE TYPE
class GenerateCardio {
  int rnd;

  GenerateCardio({this.difficulty});
  final int difficulty;
  String workout;
  String ex1;
  String ex2;
  String ex3;
  String ex4;
  String ex5;

//OUTPUT EXERCISE FIRST
  //DIFF BEEN PARSED -> USE TO CREATE WORKOUT
  String cExerciseOne() {
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

  String cExerciseTwo() {
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

  String cExerciseThree() {
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

  String cExerciseFour() {
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

  String cExerciseFive() {
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

  //Get random number between 1 & 10
//  int getRandomNumber() {
//    var num = Random();
//    for (var i = 0; i < 10; i++) {
//      int rnd = (num.nextInt(10));
//    }
//    return rnd;
//  }

  var typeArray = [
    'Star Jumps/Jumpung Jacks',
    'Standard Push Ups',
    'Plank jacks',
    'Squats',
    'Lunges',
    'Jump lunges',
    'Leg Raises',
    'Toe taps',
    'Tuck Jump',
    'Mountain climbers',
    'High knees',
    'Calf Raise',
    'Rotational jacks',
    'Arm Circles',
    'Plank Ski Hops'
  ];

  String getStrengthType() {
    var random = Random();
    var i = random.nextInt(14);
    print(typeArray[i]);
    return typeArray[i];
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
