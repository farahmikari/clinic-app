import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
import 'package:flutter/material.dart';

class DoctorNameWidget extends StatelessWidget {
  const DoctorNameWidget({super.key, required this.name, required this.size});
  final String name;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      "Dr.$name",
      style: TextStyle(
        color: Theme.of(context).primaryTextColor,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}
