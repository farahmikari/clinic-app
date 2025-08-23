import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.darkBlueColor, AppColors.lightBlueColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(AppDimensions.mbr),
        boxShadow: AppShadow.boxShadow,
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          PositionedDirectional(
            end: -10.0.wp,
            bottom: -10.0.wp,
            child: SizedBox(
              height: 30.0.wp,
              width: 30.0.wp,
              child: Image.asset("assets/images/health_care.png"),
            ),
          ),
          Container(
            margin: EdgeInsets.all(AppDimensions.mm),
            child: ListTile(
              title: Text(
                S.current.card_title,
                style: TextStyle(
                  color: AppColors.accentBackgroundColor,
                  fontSize: AppDimensions.lfs,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                S.current.card_subtitle,
                style: TextStyle(
                  color: AppColors.accentBackgroundColor,
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
