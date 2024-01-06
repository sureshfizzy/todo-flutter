import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class todoDatabase {
  //TodoList
  List todoList = [];

  //Reference our box
  final _mybox = Hive.box('mybox');

  //Create these files only if this is the first time of opening the app
  void InitialData () {
    todoList = [
      ["Fortine Time", false],
      ["Coding", false],
    ];
  }

  //Load Data
  void loadData () {
    todoList = _mybox.get("TODOLIST");
  }

  //Update Data
  void updateData () {
    _mybox.put("TODOLIST", todoList);
  }
}