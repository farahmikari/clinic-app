import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
import 'package:clinic_app/core/extentions/dimensions_extensions/percent_sized_extension.dart';
import 'package:flutter/material.dart';

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
          color: Theme.of(context).foregroundColor,
          fontSize: AppDimensions.sfs,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
