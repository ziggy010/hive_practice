import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_hive/components/alertDialog.dart';
import 'package:todo_hive/components/todoTile.dart';
import 'package:todo_hive/data/database.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference hive box

  final _mybox = Hive.box('mybox');

  //reference database class

  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    if (_mybox.get("TODOLIST") == null) {
      db.createInitialization();
    } else {
      db.loadTask();
    }

    print(_mybox.get("TODOLIST"));

    super.initState();
  }

  //Textedition controller

  final _controller = TextEditingController();

  //Method for checkbox status changed
  void checkBoxChanged(bool? value, index) {
    setState(() {
      db.ToDoList[index][1] = !db.ToDoList[index][1];
    });
    db.updateDatabase();
  }

  //save new task

  void saveNewTask() {
    setState(() {
      db.ToDoList.add([_controller.text, false]);
      Navigator.of(context).pop();
      _controller.clear();
    });
    db.updateDatabase();
    print(_mybox.get("TODOLIST"));
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
    db.updateDatabase();
  }

  //Method to delete task
  deleteTask(index) {
    setState(() {
      db.ToDoList.removeAt(index);
    });
    db.updateDatabase();
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
          itemCount: db.ToDoList.length,
          itemBuilder: (BuildContext context, int index) {
            return ToDoTile(
              checkBoxStatus: db.ToDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              taskTitle: db.ToDoList[index][0],
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
