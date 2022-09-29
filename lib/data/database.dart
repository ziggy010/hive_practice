import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ToDoDatabase {
  //reference hive box
  final _mybox = Hive.box('mybox');

  // List of todolist;
  List ToDoList = [];

  //if the app is opened for the first time.
  void createInitialization() {
    ToDoList = [
      ['add 1 task', false],
      ['add another task', false],
    ];
  }

  //load task
  void loadTask() {
    ToDoList = _mybox.get("TODOLIST");
  }

  //update database
  void updateDatabase() {
    _mybox.put("TODOLIST", ToDoList);
  }
}
