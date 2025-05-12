import 'package:clinic_app/app_colors.dart';
import 'package:clinic_app/core/extentions/extention.dart';
import 'package:flutter/material.dart';

class BioWidget extends StatelessWidget {
  final String bio;
  const BioWidget({super.key, required this.bio});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.0.wp),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(20.0.sp),
        border: Border.all(color: AppColors.primaryColor, width: 1.0.wp),
      ),
      child: Container(
        margin: EdgeInsets.all(1.0.wp),
        padding: EdgeInsets.all(4.0.wp),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(15.0.sp),
        ),
        child: Text(
          bio,
          style: TextStyle(
            color: AppColors.widgetBackgroundColor,
            fontSize: 10.0.sp,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
