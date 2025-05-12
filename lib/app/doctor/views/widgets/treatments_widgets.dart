import 'package:clinic_app/app_colors.dart';
import 'package:clinic_app/core/extentions/extention.dart';
import 'package:flutter/material.dart';

class TreatmentsWidgets extends StatelessWidget {
  final int treatments;
  const TreatmentsWidgets({super.key, required this.treatments});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Treatments : ",
            style: TextStyle(
              color: AppColors.darkGreyColor,
              fontSize: 10.0.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: 2.0.wp),
          Text(
            "$treatments Patient",
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
