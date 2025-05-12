import 'package:clinic_app/app_colors.dart';
import 'package:clinic_app/core/extentions/extention.dart';
import 'package:flutter/material.dart';

class MainReservationInfoWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const MainReservationInfoWidget({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Icon(icon, size: 12.0.sp, color: AppColors.primaryColor),
            ),
          ),
          Expanded(
            flex: 9,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: TextStyle(
                  color: AppColors.darkGreyColor,
                  fontSize: 10.0.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
