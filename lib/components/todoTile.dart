import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final bool checkBoxStatus;
  Function(bool?)? onChanged;
  final String taskTitle;

  ToDoTile({
    required this.checkBoxStatus,
    required this.onChanged,
    required this.taskTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 17),
      child: Container(
        padding: EdgeInsets.all(12),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.deepPurple.shade900,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Checkbox(
              value: checkBoxStatus,
              onChanged: onChanged,
              fillColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.green.withOpacity(.32);
                }
                return Colors.green;
              }),
            ),
            Text(
              taskTitle,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'poppins',
                fontSize: 15,
                decoration: checkBoxStatus
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                decorationThickness: 2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
