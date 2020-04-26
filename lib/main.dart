import 'package:flutter/material.dart';
import 'screens/cardio_screen.dart';
import 'screens/strength_screen.dart';
import 'screens/menu_screen.dart';
import 'screens/custom_screen.dart';
import 'screens/exercise_list.dart';
import 'screens/exercise_detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COVID-19 WORKOUT',
      theme: ThemeData(),
      initialRoute: '/menu',
      routes: {
        '/menu': (context) => MenuScreen(),
        '/cardio': (context) => CardioScreen(),
        '/strength': (context) => StrengthScreen(),
        '/exerciseList': (context) => ExerciseList(),
      },
    );
  }
}
