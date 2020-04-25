import 'package:flutter/material.dart';
import 'package:flutterworkouta/screens/cardio_screen.dart';
import 'package:flutterworkouta/functions/check_diffculty.dart';
import 'package:flutterworkouta/functions/generate_cardio.dart';
import '../constants.dart';
import 'strength_screen.dart';
import '../functions/generate_strength.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int difficulty = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColour,
      appBar: AppBar(
        backgroundColor: kButtonAndBarColour,
        title: Text('COVID-19 WORKOUTS', style: kTitleStyle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              elevation: 100.0,
              color: kButtonAndBarColour,
              child: Text('CARDIO', style: kTitleStyle),
              onPressed: () {
                //NEED TO UPDATE STATE AND HAVE NEW DATA FOR CARDIO SCREEN
                FeedDifficulty cardioDifficulty =
                    FeedDifficulty(difficulty: difficulty);
                GenerateCardio generateCardio =
                    GenerateCardio(difficulty: difficulty);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CardioScreen(
                            cardioDifficulty:
                                cardioDifficulty.checkDifficulty(),
                            cardioWorkout1: generateCardio.cExerciseOne(),
                            cardioWorkout2: generateCardio.cExerciseTwo(),
                            cardioWorkout3: generateCardio.cExerciseThree(),
                            cardioWorkout4: generateCardio.cExerciseFour(),
                            cardioWorkout5: generateCardio.cExerciseFive(),
                          )),
                );
                print('Cardio Pressed');
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              elevation: 100.0,
              color: kButtonAndBarColour,
              child: Text(
                'STRENGTH & ENDURANCE',
                style: kTitleStyle,
              ),
              onPressed: () {
                FeedDifficulty strengthWorkout =
                    FeedDifficulty(difficulty: difficulty);
                GenerateStrength generateStrength =
                    GenerateStrength(difficulty: difficulty);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StrengthScreen(
                      strengthDifficulty: strengthWorkout.checkDifficulty(),
                      strengthWorkout1: generateStrength.sExerciseOne(),
                      strengthWorkout2: generateStrength.sExerciseTwo(),
                      strengthWorkout3: generateStrength.sExerciseThree(),
                      strengthWorkout4: generateStrength.sExerciseFour(),
                      strengthWorkout5: generateStrength.sExerciseFive(),
                    ),
                  ),
                );
//                Navigator.pushNamed(context, '/strength');
                print('Strength Pressed');
              },
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                inactiveTrackColor: Color(0xFF8D8E98),
                activeTrackColor: Colors.white,
                thumbColor: Color(0xFFEB1555),
                overlayColor: Color(0x29EB1555),
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
              ),
              child: Slider(
                value: difficulty.toDouble(),
                min: 1.0,
                max: 3.0,
                onChanged: (double newValue) {
                  setState(() {
                    difficulty = newValue.round();
                    print(difficulty);
                  });
                },
              ),
            ),
            Text(
              difficulty.toString(),
              style: kTitleStyleDark,
            ),
            SizedBox(height: 8.0),
            Text(
              'DIFFICULTY',
              style: kTitleStyleDark,
            ),
          ],
        ),
      ),
    );
  }
}
