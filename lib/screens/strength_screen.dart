import 'package:flutter/material.dart';
import 'package:flutterworkouta/functions/check_diffculty.dart';
import '../constants.dart';
import '../bottom_button.dart';
import 'menu_screen.dart';
import '../functions/check_diffculty.dart';
import '../functions/generate_strength.dart';

class StrengthScreen extends StatelessWidget {
  StrengthScreen(
      {this.strengthWorkout1,
      this.strengthWorkout2,
      this.strengthWorkout3,
      this.strengthWorkout4,
      this.strengthWorkout5,
      this.strengthDifficulty});
  final String strengthDifficulty;
  final String strengthWorkout1;
  final String strengthWorkout2;
  final String strengthWorkout3;
  final String strengthWorkout4;
  final String strengthWorkout5;

//  String strengthWorkout;

  @override
  Widget build(BuildContext context) {
    print('StrengthScreen Called');
//    CalculatedWorkout();
    return Scaffold(
      backgroundColor: kBackgroundColour,
      appBar: AppBar(
        backgroundColor: kButtonAndBarColour,
        title: Text('COVID STRENGTH'),
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
                'DIFFICULTY: ' + strengthDifficulty,
                style: kTitleStyleDark,
              ),
            ),
            SizedBox(
              height: 25.0,
            ),

            //CONTAIN HEAD & RESULTS
            Container(
              margin: EdgeInsets.only(bottom: 10.0),
              child: Column(
                children: <Widget>[
                  Text('READY...GO!', style: kCommentTextStyle),
                  Text(
                    strengthWorkout1,
                    style: kMainTextStyledDark,
                  ),
                  Text('REST 30s!', style: kCommentTextStyle),
                  Text(
                    strengthWorkout2,
                    style: kMainTextStyledDark,
                  ),
                  Text('REST 30s!', style: kCommentTextStyle),
                  Text(
                    strengthWorkout3,
                    style: kMainTextStyledDark,
                  ),
                  Text('REST 30s!', style: kCommentTextStyle),
                  Text(
                    strengthWorkout4,
                    style: kMainTextStyledDark,
                  ),
                  Text('REST 30s!', style: kCommentTextStyle),
                  Text(
                    strengthWorkout5,
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
              },
            ),
          ],
        ),
      ),
    );
  }
}
