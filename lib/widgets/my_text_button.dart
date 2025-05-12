import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    super.key,
    required this.textButton,
    required this.color,
    required this.onPressed,
  });
  final String textButton;
  final Color color;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        textButton,
        style: TextStyle(
          fontSize: 14,
          color: color,
          fontFamily: "Lato",
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
