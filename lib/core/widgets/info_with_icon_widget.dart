import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class InfoWithIconWidget extends StatelessWidget {
  const InfoWithIconWidget({
    super.key,
    required this.icon,
    required this.info,
    required this.infoSize,
  });
  final String icon;
  final String info;
  final double infoSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: AppDimensions.sp,
      children: [
        SvgPicture.asset(
          icon,
          width: AppDimensions.sis,
          height: AppDimensions.sis,
          color: AppColors.primaryColor,
        ),
        Text(
          info,
          style: TextStyle(
            color: AppColors.darkGreyColor,
            fontSize: infoSize,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
