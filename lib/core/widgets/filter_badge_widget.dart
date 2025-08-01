import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:flutter/widgets.dart';

class FilterBadgeWidget extends StatelessWidget {
  const FilterBadgeWidget({
    super.key,
    required this.badge,
    required this.color,
  });
  final String badge;
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
        badge,
        style: TextStyle(
          color: AppColors.widgetBackgroundColor,
          fontSize: AppDimensions.sfs,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
