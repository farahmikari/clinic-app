import 'package:flutter/material.dart';

class MyButtonWidget extends StatelessWidget {
  const MyButtonWidget({
    super.key,
    required this.text,
    this.color,
    required this.onPressed,
    this.width = double.infinity,
  });
  final Color? color;
  final String text;
  final double width;
  final void Function()? onPressed;
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
