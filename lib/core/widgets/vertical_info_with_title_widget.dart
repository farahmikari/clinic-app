import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class VerticalInfoWithTitleWidget extends StatelessWidget {
  const VerticalInfoWithTitleWidget({
    super.key,
    required this.title,
    required this.info,
    required this.mainAxisAlignment,
    required this.crossAxisAlignment,
    required this.titleSize,
    required this.infoSize,
  });

  final String title;
  final String info;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final double titleSize;
  final double infoSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.darkGreyColor,
            fontSize: titleSize,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          info,
          style: TextStyle(
            color: AppColors.mainTextColor,
            fontSize: infoSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
