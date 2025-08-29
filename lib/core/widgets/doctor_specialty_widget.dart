import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
import 'package:flutter/material.dart';

class DoctorSpecialtyWidget extends StatelessWidget {
  const DoctorSpecialtyWidget({super.key, required this.specialty});

  final String specialty;

  @override
  Widget build(BuildContext context) {
    return Text(
      specialty,
      style: TextStyle(
        color: Theme.of(context).accentTextColor,
        fontSize: AppDimensions.mfs,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
