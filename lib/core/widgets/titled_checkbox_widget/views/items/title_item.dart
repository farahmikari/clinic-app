import 'package:clinic_app/core/errors/constants/app_colors.dart';
import 'package:clinic_app/core/errors/constants/app_dimensions.dart';
import 'package:flutter/material.dart';

class TitleItem extends StatelessWidget {
  const TitleItem({super.key, required this.title, required this.color});

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: AppColors.mainTextColor,
        fontSize: AppDimensions.mfs,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
