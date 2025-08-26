import 'package:clinic_app/app/home/models/user_points_model.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_colors_extension.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
import 'package:clinic_app/core/extentions/dimensions_extensions/percent_sized_extension.dart';
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
        color: Theme.of(context).transparentPrimaryColor,
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
                        color: Theme.of(context).foregroundColor,
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
                        color: Theme.of(context).foregroundColor,
                        borderRadius: BorderRadius.circular(AppDimensions.lbr),
                      ),
                      child: Text(
                        "${userPoints.points} ${specifyPointsUnit()}",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
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
