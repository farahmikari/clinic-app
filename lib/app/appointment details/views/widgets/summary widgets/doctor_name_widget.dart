import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';

class DoctorNameWidget extends StatelessWidget {
  const DoctorNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Center(
        child: Text(
          "Dr.Layla Hassan",
          style: TextStyle(
            color: AppColors.mainTextColor,
            fontSize: AppDimensions.lfs,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
