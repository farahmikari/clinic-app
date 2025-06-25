import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key, required this.status});
  final String status;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    Color specifyStatusBackgroundColor() {
      return status == "Pending"
          ? AppColors.transparentGreen
          : AppColors.transparentYellow;
    }

    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      surfaceTintColor: AppColors.backgroundColor,
      title: Text(
        "Appointment Details",
        style: TextStyle(
          color: AppColors.mainTextColor,
          fontSize: AppDimensions.lfs,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.sp,
            vertical: 1.0.wp,
          ),
          margin: EdgeInsets.only(right: AppDimensions.mp),
          decoration: BoxDecoration(
            color: specifyStatusBackgroundColor(),
            borderRadius: BorderRadius.circular(AppDimensions.mbr),
          ),
          child: Text(
            status,
            style: TextStyle(
              color: AppColors.widgetBackgroundColor,
              fontSize: AppDimensions.sfs,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
