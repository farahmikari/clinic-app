import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';

class DoctorNameAndSpecialtyWidget extends StatelessWidget {
  const DoctorNameAndSpecialtyWidget({
    super.key,
    required this.name,
    required this.specialty,
  });

  final String name;
  final String specialty;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      //----------------------|Doctor Name|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
      title: Center(
        child: Text(
          name,
          style: TextStyle(
            color: AppColors.mainTextColor,
            fontSize: AppDimensions.lfs,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      //--------------------|Doctor Specialty|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
      subtitle: Center(
        child: Text(
          specialty,
          style: TextStyle(
            color: AppColors.darkGreyColor,
            fontSize: AppDimensions.sfs,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
