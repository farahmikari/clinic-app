import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_colors_extension.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
import 'package:clinic_app/core/extentions/dimensions_extensions/percent_sized_extension.dart';
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
        color: Theme.of(context).lightBlueColor,
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
                  style: TextStyle(
                    color: Theme.of(context).primaryTextColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "$heartRate bpm",
                  style: TextStyle(
                    color: Theme.of(context).primaryTextColor,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
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
