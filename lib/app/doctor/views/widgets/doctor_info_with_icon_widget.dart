import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DoctorInfoWithIconWidget extends StatelessWidget {
  const DoctorInfoWithIconWidget({
    super.key,
    required this.icon,
    required this.info,
    required this.mainAxisAlignment,
  });

  final String icon;
  final String info;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          SvgPicture.asset(
            icon,
            height: AppDimensions.sis,
            width: AppDimensions.sis,
            colorFilter: ColorFilter.mode(
              AppColors.primaryColor,
              BlendMode.srcIn,
            ),
          ),
          SizedBox(width: AppDimensions.sm),
          Text(
            info,
            style: TextStyle(
              color: AppColors.darkGreyColor,
              fontSize: AppDimensions.sfs,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
