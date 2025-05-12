import 'package:flutter/material.dart';

class Mytextbutton extends StatelessWidget {
  Mytextbutton({required this.textButton, required this.color,required this.onPressed});
  String textButton;
  Color color;
  void Function()? onPressed;
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
