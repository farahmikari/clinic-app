import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
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
    );
  }
}
