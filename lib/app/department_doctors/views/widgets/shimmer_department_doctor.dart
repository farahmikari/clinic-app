import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerDepartmentDoctor extends StatelessWidget {
  const ShimmerDepartmentDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.0.hp,
      padding: EdgeInsets.all(AppDimensions.mp),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Shimmer.fromColors(
                    baseColor: AppColors.shimmerBaseColor,
                    highlightColor: AppColors.shimmerHighlightColor,
                    child: Container(
                      width: 40.0.wp,
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
                    baseColor: AppColors.shimmerBaseColor,
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
                    baseColor: AppColors.shimmerBaseColor,
                    highlightColor: AppColors.shimmerHighlightColor,
                    child: Container(
                      width: 20.0.wp,
                      decoration: BoxDecoration(
                        color: AppColors.shimmerBaseColor,
                        borderRadius: BorderRadius.circular(AppDimensions.mbr),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Shimmer.fromColors(
              baseColor: AppColors.shimmerBaseColor,
              highlightColor: AppColors.shimmerHighlightColor,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.shimmerBaseColor,
                  borderRadius: BorderRadius.circular(AppDimensions.sbr),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
