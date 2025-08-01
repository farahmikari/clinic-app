import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';

class DoctorDepartmentWidget extends StatelessWidget {
  const DoctorDepartmentWidget({super.key, required this.department});

  final String department;

  @override
  Widget build(BuildContext context) {
    return Text(
      department,
      style: TextStyle(
        color: AppColors.darkGreyColor,
        fontSize: AppDimensions.mfs,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
