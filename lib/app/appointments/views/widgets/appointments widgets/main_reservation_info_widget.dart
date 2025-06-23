import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainReservationInfoWidget extends StatelessWidget {
  const MainReservationInfoWidget({
    super.key,
    required this.icon,
    required this.title,
  });

  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: SvgPicture.asset(
                icon,
                width: AppDimensions.sis,
                height: AppDimensions.sis,
                color:
                  AppColors.primaryColor
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: TextStyle(
                  color: AppColors.darkGreyColor,
                  fontSize: AppDimensions.sfs,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
