import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainInfoWidget extends StatelessWidget {
  const MainInfoWidget({super.key, required this.title, required this.icon});

  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: AppDimensions.sp,
      children: [
        SvgPicture.asset(
          icon,
          width: AppDimensions.sis,
          height: AppDimensions.sis,
          colorFilter:ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
        ),
        Text(
          title,
          style: TextStyle(
            color: Theme.of(context).hintColor,
            fontSize: AppDimensions.sfs,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
