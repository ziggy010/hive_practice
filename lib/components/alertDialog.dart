import 'package:flutter/material.dart';
import 'package:todo_hive/components/myButtons.dart';

class AlertDialogComponent extends StatelessWidget {
  VoidCallback onSave;
  final controller;

  AlertDialogComponent({
    required this.onSave,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple.shade800,
      content: Container(
        height: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.all(6),
          child: Column(
            children: [
              TextField(
                controller: controller,
                cursorColor: Colors.white,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'poppins',
                ),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Add a new task',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'poppins',
                  ),
                  focusedBorder: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyButton(
                    buttonColor: Colors.red,
                    buttonText: 'Cancel',
                    onTap: () => Navigator.of(context).pop(),
                  ),
                  MyButton(
                    buttonColor: Colors.green,
                    buttonText: 'Save',
                    onTap: onSave,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
