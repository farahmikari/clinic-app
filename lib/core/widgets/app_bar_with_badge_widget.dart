import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/widgets/filter_badge_widget.dart';
import 'package:flutter/material.dart';

class AppBarWithBadgeWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarWithBadgeWidget({
    super.key,
    required this.title,
    required this.badgeTitle,
    required this.badgeColor,
  });
  final String title;
  final String badgeTitle;
  final Color badgeColor;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      surfaceTintColor: AppColors.backgroundColor,
      actionsPadding: EdgeInsets.only(right: AppDimensions.mp),
      title: Text(
        title,
        style: TextStyle(
          color: AppColors.mainTextColor,
          fontSize: AppDimensions.lfs,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [BadgeWidget(title: badgeTitle, color: badgeColor)],
    );
  }
}
