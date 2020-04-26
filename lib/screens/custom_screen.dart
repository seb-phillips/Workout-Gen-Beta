import 'package:flutter/material.dart';
import 'exercise_list.dart';

class CustomScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NoteKeeper',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: ExerciseList(),
    );
  }
}
