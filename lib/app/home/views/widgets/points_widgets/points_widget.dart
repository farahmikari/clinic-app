import 'package:clinic_app/app/home/models/user_points_model.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class PointsWidget extends StatelessWidget {
  const PointsWidget({super.key, required this.userPoints});

  final UserPointsModel userPoints;

  @override
  Widget build(BuildContext context) {
    String specifyPointsUnit() {
      return userPoints.points > 1
          ? S.current.points_unit
          : S.current.point_unit;
    }

    return Container(
      height: 35.0.wp,
      width: 92.0.wp,
      padding: EdgeInsets.all(AppDimensions.sp),
      margin: EdgeInsets.symmetric(horizontal: AppDimensions.mp),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: AppColors.transparentPrimaryColor,
        borderRadius: BorderRadius.circular(AppDimensions.mbr),
        boxShadow: AppShadow.boxShadow,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Image(image: AssetImage("assets/images/offers.png")),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      S.current.points_title,
                      style: TextStyle(
                        color: AppColors.accentBackgroundColor,
                        fontSize: AppDimensions.mfs,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDimensions.mp,
                        vertical: AppDimensions.sp,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.accentBackgroundColor,
                        borderRadius: BorderRadius.circular(AppDimensions.lbr),
                      ),
                      child: Text(
                        "${userPoints.points} ${specifyPointsUnit()}",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: AppDimensions.sfs,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
