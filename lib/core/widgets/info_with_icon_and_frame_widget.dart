import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InfoWithIconAndFrameWidget extends StatelessWidget {
  const InfoWithIconAndFrameWidget({
    super.key,
    required this.title,
    required this.icon,
  });
  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(AppDimensions.lbr),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
              title,
              style: TextStyle(
                color: AppColors.mainTextColor,
                fontSize: AppDimensions.sfs,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
