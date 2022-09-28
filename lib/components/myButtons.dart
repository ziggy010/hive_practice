import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Color buttonColor;
  final String buttonText;
  VoidCallback onTap;

  MyButton({
    required this.buttonColor,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'poppins',
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}
