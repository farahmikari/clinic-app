import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';

class DoctorSpecialtyWidget extends StatelessWidget {
  const DoctorSpecialtyWidget({super.key, required this.specialty});

  final String specialty;

  @override
  Widget build(BuildContext context) {
    return Text(
      specialty,
      style: TextStyle(
        color: AppColors.accentTextColor,
        fontSize: AppDimensions.mfs,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
