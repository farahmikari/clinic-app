import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';

class DepartmentWidget extends StatelessWidget {
  const DepartmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Center(
        child: Text(
          "Cardiology Department",
          style: TextStyle(
            color: AppColors.darkGreyColor,
            fontSize: AppDimensions.mfs,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
