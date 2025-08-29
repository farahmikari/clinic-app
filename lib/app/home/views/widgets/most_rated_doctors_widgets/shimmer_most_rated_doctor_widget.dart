import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_shimmer_colors_extension.dart';
import 'package:clinic_app/core/extentions/dimensions_extensions/percent_sized_extension.dart';
import 'package:flutter/material.dart';

class ShimmerMostRatedDoctorWidget extends StatelessWidget {
  const ShimmerMostRatedDoctorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45.0.wp,
      height: 62.0.wp,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppDimensions.sp,
        children: [
          Container(
            height: 45.0.wp,
            width: 45.0.wp,
            decoration: BoxDecoration(
              color: Theme.of(context).shimmerBaseColor,
              borderRadius: BorderRadius.circular(AppDimensions.mbr),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AppDimensions.sp,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    width: 35.0.wp,
                    decoration: BoxDecoration(
                      color: Theme.of(context).shimmerBaseColor,
                      borderRadius: BorderRadius.circular(AppDimensions.mbr),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: 25.0.wp,
                    decoration: BoxDecoration(
                      color: Theme.of(context).shimmerBaseColor,
                      borderRadius: BorderRadius.circular(AppDimensions.mbr),
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
