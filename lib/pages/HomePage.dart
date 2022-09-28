import 'package:flutter/material.dart';
import 'package:todo_hive/components/todoTile.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  //Method to add task
  void addTask() {
    showDialog(
      context: context,
      builder: (context) {
        return Container();
      },
    );
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
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.deepPurple.shade900,
        child: Icon(Icons.add),
      ),
    );
  }
}
