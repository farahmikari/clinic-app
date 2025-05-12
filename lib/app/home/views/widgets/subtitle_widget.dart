import 'package:clinic_app/app_colors.dart';
import 'package:clinic_app/core/extentions/extention.dart';
import 'package:flutter/material.dart';

class SubtitleWidget extends StatelessWidget {
  final String title;
  const SubtitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
      child: Text(
        title,
        style: TextStyle(
          color: AppColors.mainTextColor,
          fontSize: 14.0.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
