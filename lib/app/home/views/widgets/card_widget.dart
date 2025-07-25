import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.all(AppDimensions.mp),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.darkBlueColor, AppColors.lightBlueColor],
        ),
        borderRadius: BorderRadius.circular(AppDimensions.mbr),
        boxShadow: AppShadow.boxShadow,
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Positioned(
            right: -35,
            bottom: -35,
            child: SizedBox(
              height: 30.0.wp,
              width: 30.0.wp,
              child: Image.asset("assets/images/health_care.png"),
            ),
          ),
          Container(
            margin: EdgeInsets.all(AppDimensions.mm),
            alignment: Alignment.centerLeft,
            child: ListTile(
              title: Text(
                "Discover Your Wellbeing",
                style: TextStyle(
                  color: AppColors.widgetBackgroundColor,
                  fontSize: AppDimensions.lfs,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "Your path to better health starts here !",
                style: TextStyle(
                  color: AppColors.widgetBackgroundColor,
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
