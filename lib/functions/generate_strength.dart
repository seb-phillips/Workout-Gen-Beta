import 'dart:math';

//CREATE ENUM FOR WORKOUT TYPES - ASSOCIATED WITH A NUMBER SO CAN USE RANDOM NUMBER WHICH RELATES TO A EXERCISE TYPE
class GenerateStrength {
  int rnd;

  GenerateStrength({this.difficulty});
  final int difficulty;
  String sWorkout;
  String ex1;
  String ex2;
  String ex3;
  String ex4;
  String ex5;

//OUTPUT EXERCISE FIRST
  //DIFF BEEN PARSED -> USE TO CREATE WORKOUT
  String sExerciseOne() {
    if (difficulty == 1) {
      sWorkout = ('1: ' +
          getStrengthType() +
          ' ' +
          getRepsEasy() +
          'x' +
          getSetsEasy());
    } else if (difficulty == 2) {
      sWorkout = ('1: ' +
          getStrengthType() +
          ' ' +
          getRepsMedium() +
          'x' +
          getSetsMedium());
    } else {
      sWorkout = ('1: ' +
          getStrengthType() +
          ' ' +
          getRepsHard() +
          'x' +
          getSetsHard());
    }
    return sWorkout;
  }

  String sExerciseTwo() {
    if (difficulty == 1) {
      sWorkout = ('2: ' +
          getStrengthType() +
          ' ' +
          getRepsEasy() +
          'x' +
          getSetsEasy());
    } else if (difficulty == 2) {
      sWorkout = ('2: ' +
          getStrengthType() +
          ' ' +
          getRepsMedium() +
          'x' +
          getSetsMedium());
    } else {
      sWorkout = ('2: ' +
          getStrengthType() +
          ' ' +
          getRepsHard() +
          'x' +
          getSetsHard());
    }
    return sWorkout;
  }

  String sExerciseThree() {
    if (difficulty == 1) {
      sWorkout = ('3: ' +
          getStrengthType() +
          ' ' +
          getRepsEasy() +
          'x' +
          getSetsEasy());
    } else if (difficulty == 2) {
      sWorkout = ('3: ' +
          getStrengthType() +
          ' ' +
          getRepsMedium() +
          'x' +
          getSetsMedium());
    } else {
      sWorkout = ('3: ' +
          getStrengthType() +
          ' ' +
          getRepsHard() +
          'x' +
          getSetsHard());
    }
    return sWorkout;
  }

  String sExerciseFour() {
    if (difficulty == 1) {
      sWorkout = ('4: ' +
          getStrengthType() +
          ' ' +
          getRepsEasy() +
          'x' +
          getSetsEasy());
    } else if (difficulty == 2) {
      sWorkout = ('4: ' +
          getStrengthType() +
          ' ' +
          getRepsMedium() +
          'x' +
          getSetsMedium());
    } else {
      sWorkout = ('4: ' +
          getStrengthType() +
          ' ' +
          getRepsHard() +
          'x' +
          getSetsHard());
    }
    return sWorkout;
  }

  String sExerciseFive() {
    if (difficulty == 1) {
      sWorkout = ('5: ' +
          getStrengthType() +
          ' ' +
          getRepsEasy() +
          'x' +
          getSetsEasy());
    } else if (difficulty == 2) {
      sWorkout = ('5: ' +
          getStrengthType() +
          ' ' +
          getRepsMedium() +
          'x' +
          getSetsMedium());
    } else {
      sWorkout = ('5: ' +
          getStrengthType() +
          ' ' +
          getRepsHard() +
          'x' +
          getSetsHard());
    }
    return sWorkout;
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
    'Wide Push Ups',
    'Standard Push Ups',
    'Sit Ups',
    'Squats',
    'Lunges',
    'Diamond Push Ups',
    'Leg Raises',
    'Russian Twists',
    'Tuck Jump',
    'Burpees',
    'Plank to Push Up',
    'Calf Raise',
    'Close Grip Pushup',
    'Arm Circles',
    'Crunches'
  ];

  String getStrengthType() {
    var random = Random();
    var i = random.nextInt(14);
    print(typeArray[i]);
    return typeArray[i];
  }

  String getRepsEasy() {
    var random = Random();
    var i = random.nextInt(4) + 6;
    return i.toString();
  }

  String getRepsMedium() {
    var random = Random();
    var i = random.nextInt(13) + 12;
    return i.toString();
  }

  String getRepsHard() {
    var random = Random();
    var i = random.nextInt(20) + 20;
    return i.toString();
  }

  String getSetsEasy() {
    var random = Random();
    var i = random.nextInt(2) + 1;
    return i.toString();
  }

  String getSetsMedium() {
    var random = Random();
    var i = random.nextInt(3) + 2;
    return i.toString();
  }

  String getSetsHard() {
    var random = Random();
    var i = random.nextInt(4) + 3;
    return i.toString();
  }
}
