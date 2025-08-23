import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class HeartRateWidget extends StatelessWidget {
  const HeartRateWidget({super.key, required this.heartRate});
  final String heartRate;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0.hp,
      width: 90.0.wp,
      decoration: BoxDecoration(
        color: AppColors.lightBlueColor,
        borderRadius: BorderRadius.circular(AppDimensions.mbr),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  S.current.heart_rate,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 18,
                    color: AppColors.primaryTextColor,
                  ),
                ),
                Text(
                  "$heartRate bpm",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 40,
                    color: AppColors.primaryTextColor,
                  ),
                ),
              ],
            ),
          ),

          Image.asset(
            "assets/images/heart-beat.png",
            width: 35.0.wp,
            height: 20.0.hp,
          ),
        ],
      ),
    );
  }
}
