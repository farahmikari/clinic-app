import 'package:clinic_app/core/errors/constants/app_colors.dart';
import 'package:clinic_app/core/errors/constants/app_dimensions.dart';
import 'package:flutter/material.dart';

class PatientNameWidget extends StatelessWidget {
  const PatientNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      title: Text(
        "Patient Profile",
        style: TextStyle(
          color: AppColors.hintTextColor,
          fontSize: AppDimensions.mfs,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        "Junior Garcia",
        style: TextStyle(
          color: AppColors.mainTextColor,
          fontSize: AppDimensions.xlfs,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
