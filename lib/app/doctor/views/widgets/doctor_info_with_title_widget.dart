import 'package:clinic_app/core/errors/constants/app_colors.dart';
import 'package:clinic_app/core/errors/constants/app_dimensions.dart';
import 'package:flutter/material.dart';

class DoctorInfoWithTitleWidget extends StatelessWidget {
  const DoctorInfoWithTitleWidget({
    super.key,
    required this.title,
    required this.info,
    required this.mainAxisAlignment,
  });

  final String title;
  final String info;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppColors.darkGreyColor,
              fontSize: AppDimensions.sfs,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: AppDimensions.sm),
          Text(
            info,
            style: TextStyle(
              color: AppColors.mainTextColor,
              fontSize: AppDimensions.sfs,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
