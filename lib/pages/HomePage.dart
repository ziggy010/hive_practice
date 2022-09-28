import 'package:flutter/material.dart';
import 'package:todo_hive/components/alertDialog.dart';
import 'package:todo_hive/components/todoTile.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Textedition controller

  final _controller = TextEditingController();

  // List of todolist;
  List ToDoList = [
    ['Make an app', false],
    ['Complete app', false],
  ];

  //Method for checkbox status changed
  void checkBoxChanged(bool? value, index) {
    setState(() {
      ToDoList[index][1] = !ToDoList[index][1];
    });
  }

  //save new task

  void saveNewTask() {
    setState(() {
      ToDoList.add([_controller.text, false]);
      Navigator.of(context).pop();
      _controller.clear();
    });
  }

  //Method to add task
  void addTask() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialogComponent(
          controller: _controller,
          onSave: saveNewTask,
        );
      },
    );
  }

  //Method to delete task
  deleteTask(index) {
    setState(() {
      ToDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade500,
        elevation: 0,
        title: const Text(
          'Todo List',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'poppins',
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 30, left: 24, right: 24),
        child: ListView.builder(
          itemCount: ToDoList.length,
          itemBuilder: (BuildContext context, int index) {
            return ToDoTile(
              checkBoxStatus: ToDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              taskTitle: ToDoList[index][0],
              onDelete: (context) => deleteTask(index),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addTask,
        backgroundColor: Colors.deepPurple.shade900,
        child: Icon(Icons.add),
      ),
    );
  }
}
