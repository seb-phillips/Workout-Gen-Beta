import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutterworkouta/models/exercise.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;

  String exerciseTable = 'exercise_table';
  String colId = 'id';
  String title = 'title';

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }

    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    //get ios + android dir path
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'exercise.db';

    //Open or create db at path
    var exerciseDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return exerciseDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $exerciseTable ($colId INTEGER PRIMARY KEY, $title TEXT)');
  }

  Future<List<Map<String, dynamic>>> getExerciseMapList() async {
    Database db = await this.database;
    var result = await db.rawQuery('SELECT * FROM $exerciseTable');
    return result;
  }

  //Insert
  Future<int> insertExercise(Exercise exercise) async {
    Database db = await this.database;
    var result = await db.insert(exerciseTable, exercise.toMap());
    return result;
  }

  //Update
  Future<int> updateExercise(Exercise exercise) async {
    var db = await this.database;
    var result = await db.update(exerciseTable, exercise.toMap(),
        where: '$colId = ?', whereArgs: [exercise.id]);
    debugPrint('update called');
    return result;
  }

  //Delete
  Future<int> deleteExercise(int id) async {
    var db = await this.database;
    int result =
        await db.rawDelete('DELETE FROM $exerciseTable WHERE $colId = $id');
    return result;
  }

  //get no of objects in db
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $exerciseTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  //get Map list from db, convert to Exercise List object
  Future<List<Exercise>> getExerciseList() async {
    //get map list and # of entries in db
    var exerciseMapList = await getExerciseMapList();
    int count = exerciseMapList.length;

    List<Exercise> exerciseList = List<Exercise>();
    //Loop to create exercise list from a map list
    for (int i = 0; i < count; i++) {
      exerciseList.add(Exercise.fromMapObject(exerciseMapList[i]));
    }
    return exerciseList;
  }
}
