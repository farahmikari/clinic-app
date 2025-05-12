import 'package:clinic_app/app_colors.dart';
import 'package:clinic_app/core/extentions/extention.dart';
import 'package:flutter/material.dart';

class ExperienceWidget extends StatelessWidget {
  final int experience;
  const ExperienceWidget({super.key, required this.experience});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        children: [
          Text(
            "Experience : ",
            style: TextStyle(
              color: AppColors.darkGreyColor,
              fontSize: 10.0.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: 2.0.wp),
          Text(
            "$experience Years",
            style: TextStyle(
              color: AppColors.mainTextColor,
              fontSize: 10.0.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
