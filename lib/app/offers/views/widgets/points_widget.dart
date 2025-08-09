import 'package:clinic_app/app/offers/models/user_points_model.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:flutter/material.dart';

class PointsWidget extends StatelessWidget {
  const PointsWidget({super.key, required this.userPoints});

  final UserPointsModel userPoints;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.0.wp,
      width: 92.0.wp,
      padding: EdgeInsets.all(AppDimensions.mp),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.mbr),
        boxShadow: AppShadow.boxShadow,
        image: DecorationImage(
          image: AssetImage("assets/images/points_background.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppDimensions.sp,
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                "Well done!\nhere’s your total point balance!",
                style: TextStyle(
                  color: AppColors.widgetBackgroundColor,
                  fontSize: AppDimensions.mfs,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                "${userPoints.points} Points",
                style: TextStyle(
                  color: AppColors.darkGreyColor,
                  fontSize: AppDimensions.xlfs,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
