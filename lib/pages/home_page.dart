import 'package:flutter/material.dart';
import 'package:todo/util/dialog_box.dart';
import 'package:todo/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //Controller Text
  final _controller = TextEditingController();

  //Todo List
  List todoList = [
    ["Make tutorial", false],
    ["Gaming", false],
    ["Fortnite time", true],
  ];

  //Checkbox
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  //Create Newtask
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: SaveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      });
  }
  
  //Save Newtask
  void SaveNewTask() {
    setState(() {
      todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text("To Do"),
        centerTitle: true,
        elevation: 0,
        ),

        //floating button
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: Icon(Icons.add),
          backgroundColor: Colors.yellow,
        ),

        body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return TodoTile(
              taskName: todoList[index][0],
              taskCompleted: todoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              );
          },
        ),
    );
  }
}