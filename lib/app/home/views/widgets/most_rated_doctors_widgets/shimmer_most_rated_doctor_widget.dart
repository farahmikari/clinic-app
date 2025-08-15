import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerMostRatedDoctorWidget extends StatelessWidget {
  const ShimmerMostRatedDoctorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45.0.wp,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: Theme.of(context).shadowColor,
            highlightColor: AppColors.shimmerHighlightColor,
            child: Container(
              height: 45.0.wp,
              decoration: BoxDecoration(
                color: AppColors.shimmerBaseColor,
                borderRadius: BorderRadius.circular(AppDimensions.mbr),
              ),
            ),
          ),
          SizedBox(height: AppDimensions.mp),
          Expanded(
            child: Shimmer.fromColors(
              baseColor: Theme.of(context).shadowColor,
              highlightColor: AppColors.shimmerHighlightColor,
              child: Container(
                width: 30.0.wp,
                decoration: BoxDecoration(
                  color: AppColors.shimmerBaseColor,
                  borderRadius: BorderRadius.circular(AppDimensions.mbr),
                ),
              ),
            ),
          ),
          SizedBox(height: AppDimensions.mp),
          Expanded(
            child: Shimmer.fromColors(
              baseColor: Theme.of(context).shadowColor,
              highlightColor: AppColors.shimmerHighlightColor,
              child: Container(
                width: 45.0.wp,
                decoration: BoxDecoration(
                  color: AppColors.shimmerBaseColor,
                  borderRadius: BorderRadius.circular(AppDimensions.mbr),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
