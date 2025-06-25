import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';

class MedicationNoteWidget extends StatelessWidget {
  const MedicationNoteWidget({super.key, required this.note});
  final String note;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(AppDimensions.sm),
      padding: EdgeInsets.all(AppDimensions.sp),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(AppDimensions.mbr),
      ),
      child: Text(
        note,
        style: TextStyle(
          color: AppColors.mainTextColor,
          fontSize: AppDimensions.sfs,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
