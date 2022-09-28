import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final bool checkBoxStatus;
  Function(bool?)? onChanged;

  ToDoTile({required this.checkBoxStatus, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          ),
          Text(
            'Do exercise',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'poppins',
              fontSize: 18,
              decoration: checkBoxStatus
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          )
        ],
      ),
    );
  }
}
