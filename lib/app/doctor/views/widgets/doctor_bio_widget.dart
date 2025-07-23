import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:flutter/material.dart';

class DoctorBioWidget extends StatelessWidget {
  const DoctorBioWidget({super.key, required this.bio});

  final String bio;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        margin: EdgeInsets.only(
          bottom: AppDimensions.mm,
          left: AppDimensions.mm,
          right: AppDimensions.mm,
        ),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(AppDimensions.mbr),
          border: Border.all(color: AppColors.primaryColor, width: 1.0.wp),
        ),
        child: Container(
          margin: EdgeInsets.all(1.0.wp),
          padding: EdgeInsets.all(AppDimensions.mp),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(AppDimensions.sbr),
          ),
          child: Text(
            bio,
            style: TextStyle(
              color: AppColors.widgetBackgroundColor,
              fontSize: AppDimensions.sfs,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}
