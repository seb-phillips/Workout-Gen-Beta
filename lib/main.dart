import 'package:flutter/material.dart';
import 'screens/cardio_screen.dart';
import 'screens/strength_screen.dart';
import 'screens/menu_screen.dart';

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
      },
    );
  }
}
