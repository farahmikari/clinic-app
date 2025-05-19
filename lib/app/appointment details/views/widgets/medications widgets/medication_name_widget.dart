import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';

class MedicationNameWidget extends StatelessWidget {
  const MedicationNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.all(AppDimensions.sp),
        decoration: BoxDecoration(
          color: AppColors.transparentGreen,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(AppDimensions.mbr),
            bottomRight: Radius.circular(AppDimensions.mbr),
          ),
        ),
        child: Text(
          "Paracetamol",
          style: TextStyle(
            color: AppColors.widgetBackgroundColor,
            fontSize: AppDimensions.mfs,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
