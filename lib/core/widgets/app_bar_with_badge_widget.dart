import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
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
      actionsPadding: EdgeInsetsDirectional.only(end: AppDimensions.mp),
      title: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).primaryTextColor,
          fontSize: AppDimensions.lfs,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [BadgeWidget(title: badgeTitle, color: badgeColor)],
    );
  }
}
