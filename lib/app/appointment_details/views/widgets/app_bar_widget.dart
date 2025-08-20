import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/widgets/filter_badge_widget.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key, required this.status});
  final String status;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    Color specifyBadgeColor() {
      return status == "Pending"
          ? AppColors.transparentGreen
          : AppColors.transparentYellow;
    }

    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      surfaceTintColor: AppColors.backgroundColor,
      actionsPadding: EdgeInsets.only(right: AppDimensions.mp),
      title: Text(
        "Appointment Details",
        style: TextStyle(
          color: AppColors.mainTextColor,
          fontSize: AppDimensions.lfs,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [BadgeWidget(title: status, color: specifyBadgeColor())],
    );
  }
}
