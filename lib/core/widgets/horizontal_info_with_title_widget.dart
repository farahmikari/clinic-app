import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';

class HorizontalInfoWithTitleWidget extends StatelessWidget {
  const HorizontalInfoWithTitleWidget({
    super.key,
    required this.title,
    required this.info,
  });
  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: AppDimensions.sp,
      children: [
        Text(
          "$title:",
          style: TextStyle(
            color: Theme.of(context).hintColor,
            fontSize: AppDimensions.sfs,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          info,
          style: TextStyle(
            fontSize: AppDimensions.sfs,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
