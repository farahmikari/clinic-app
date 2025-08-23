import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:flutter/widgets.dart';

class BadgeWidget extends StatelessWidget {
  const BadgeWidget({super.key, required this.title, required this.color});
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.sp,
        vertical: 1.0.wp,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(AppDimensions.mbr),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: AppColors.accentBackgroundColor,
          fontSize: AppDimensions.sfs,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
