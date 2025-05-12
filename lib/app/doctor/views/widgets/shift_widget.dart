import 'package:clinic_app/app_colors.dart';
import 'package:clinic_app/core/extentions/extention.dart';
import 'package:flutter/material.dart';

class ShiftWidget extends StatelessWidget {
  final String startHour;
  final String endHour;
  const ShiftWidget({
    super.key,
    required this.startHour,
    required this.endHour,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Row(
        children: [
          Icon(Icons.access_time, color: AppColors.primaryColor, size: 15.0.sp),
          SizedBox(width: 2.0.wp),
          Text(
            "$startHour am  -  $endHour pm",
            style: TextStyle(
              color: AppColors.darkGreyColor,
              fontSize: 10.0.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
