import 'package:clinic_app/app_colors.dart';
import 'package:clinic_app/core/extentions/extention.dart';
import 'package:flutter/material.dart';

class SecondaryReservationInfoWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  const SecondaryReservationInfoWidget({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(30.0.sp),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 14.0.sp, color: AppColors.primaryColor),
            SizedBox(width: 2.0.wp),
            Text(
              title,
              style: TextStyle(
                color: AppColors.darkGreyColor,
                fontSize: 10.0.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
