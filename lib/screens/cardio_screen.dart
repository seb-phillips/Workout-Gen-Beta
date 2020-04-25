import 'package:flutter/material.dart';
import 'package:flutterworkouta/functions/check_diffculty.dart';
import '../constants.dart';
import '../bottom_button.dart';
import 'menu_screen.dart';
import '../functions/generate_cardio.dart';

class CardioScreen extends StatelessWidget {
  CardioScreen(
      {this.cardioDifficulty,
      this.cardioWorkout1,
      this.cardioWorkout2,
      this.cardioWorkout3,
      this.cardioWorkout4,
      this.cardioWorkout5});
  final String cardioDifficulty;
  final String cardioWorkout1;
  final String cardioWorkout2;
  final String cardioWorkout3;
  final String cardioWorkout4;
  final String cardioWorkout5;
  @override
  Widget build(BuildContext context) {
    print('CardioScreen Called');
//    CalculatedWorkout();
    return Scaffold(
      backgroundColor: kBackgroundColour,
      appBar: AppBar(
        backgroundColor: kButtonAndBarColour,
        title: Text('COVID CARDIO', style: kTitleStyle),
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
                'DIFFICULTY: ' + cardioDifficulty,
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
                    cardioWorkout1,
                    style: kMainTextStyledDark,
                  ),
                  Text('REST 30s!', style: kCommentTextStyle),
                  Text(
                    cardioWorkout2,
                    style: kMainTextStyledDark,
                  ),
                  Text('REST 30s!', style: kCommentTextStyle),
                  Text(
                    cardioWorkout3,
                    style: kMainTextStyledDark,
                  ),
                  Text('REST 30s!', style: kCommentTextStyle),
                  Text(
                    cardioWorkout4,
                    style: kMainTextStyledDark,
                  ),
                  Text('REST 30s!', style: kCommentTextStyle),
                  Text(
                    cardioWorkout5,
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
                Navigator.pop(context);
//                GenerateWorkout cardWorkout = GenerateWorkout();
////                Navigator.push(context, MaterialPageRoute(
////                  builder: (context) =>
////                  cardioResult:
//                cardWorkout.checkDifficulty();
              },
            ),
          ],
        ),
      ),
    );
  }
}
