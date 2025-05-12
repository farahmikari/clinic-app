import 'package:flutter/material.dart';

class Mybuttonwidget extends StatelessWidget {
  Mybuttonwidget({
    required this.text,
    this.color,
    required this.onPressed,
    this.width = double.infinity,
  });
  Color? color;
  final String text;
  double width;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: width,
        height: 40,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: "Montserat",
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
