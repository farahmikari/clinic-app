import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/core/extentions/responsive_text_extention.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBillWidget extends StatelessWidget {
  const ShimmerBillWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerBaseColor,
      highlightColor: AppColors.shimmerHighlightColor,
      child: Container(
        padding: EdgeInsets.all(AppDimensions.mp),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(AppDimensions.mbr),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  baseColor: AppColors.shimmerBaseColor,
                  highlightColor: AppColors.shimmerHighlightColor,
                  child: Container(
                    width: 30.0.wp,
                    height: 26.0.sp,
                    decoration: BoxDecoration(
                      color: AppColors.shimmerBaseColor,
                      borderRadius: BorderRadius.circular(AppDimensions.mbr),
                    ),
                  ),
                ),
                Shimmer.fromColors(
                  baseColor: AppColors.shimmerBaseColor,
                  highlightColor: AppColors.shimmerHighlightColor,
                  child: Container(
                    width: 15.0.wp,
                    height: 4.0.hp,
                    decoration: BoxDecoration(
                      color: AppColors.shimmerBaseColor,
                      borderRadius: BorderRadius.circular(AppDimensions.mbr),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: AppDimensions.mp),
            Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Shimmer.fromColors(
                      baseColor: AppColors.shimmerBaseColor,
                      highlightColor: AppColors.shimmerHighlightColor,
                      child: Container(
                        width: 20.0.wp,
                        height: 22.0.sp,
                        decoration: BoxDecoration(
                          color: AppColors.shimmerBaseColor,
                          borderRadius: BorderRadius.circular(
                            AppDimensions.mbr,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: AppDimensions.sp),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Shimmer.fromColors(
                      baseColor: AppColors.shimmerBaseColor,
                      highlightColor: AppColors.shimmerHighlightColor,
                      child: Container(
                        width: 20.0.wp,
                        height: 22.0.sp,
                        decoration: BoxDecoration(
                          color: AppColors.shimmerBaseColor,
                          borderRadius: BorderRadius.circular(
                            AppDimensions.mbr,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: AppDimensions.sp),
            Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Shimmer.fromColors(
                      baseColor: AppColors.shimmerBaseColor,
                      highlightColor: AppColors.shimmerHighlightColor,
                      child: Container(
                        width: 30.0.wp,
                        height: 22.0.sp,
                        decoration: BoxDecoration(
                          color: AppColors.shimmerBaseColor,
                          borderRadius: BorderRadius.circular(
                            AppDimensions.mbr,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: AppDimensions.sp),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Shimmer.fromColors(
                      baseColor: AppColors.shimmerBaseColor,
                      highlightColor: AppColors.shimmerHighlightColor,
                      child: Container(
                        width: 30.0.wp,
                        height: 22.0.sp,
                        decoration: BoxDecoration(
                          color: AppColors.shimmerBaseColor,
                          borderRadius: BorderRadius.circular(
                            AppDimensions.mbr,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
