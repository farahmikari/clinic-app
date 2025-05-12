import 'package:clinic_app/app_colors.dart';
import 'package:clinic_app/core/extentions/extention.dart';
import 'package:flutter/material.dart';

class RateWidget extends StatelessWidget {
  final num rate;
  const RateWidget({super.key, required this.rate});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(
            Icons.star_rounded,
            color: AppColors.primaryColor,
            size: 15.0.sp,
          ),
          SizedBox(width: 2.0.wp),
          Text(
            rate.toString(),
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
