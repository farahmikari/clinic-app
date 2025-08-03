import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:flutter/widgets.dart';

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
            color: AppColors.darkGreyColor,
            fontSize: AppDimensions.sfs,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          info,
          style: TextStyle(
            color: AppColors.mainTextColor,
            fontSize: AppDimensions.sfs,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
