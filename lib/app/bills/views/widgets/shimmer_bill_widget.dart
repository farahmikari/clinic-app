import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:flutter/material.dart';

class ShimmerBillWidget extends StatelessWidget {
  const ShimmerBillWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0.wp,
      width: 92.0.wp,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppDimensions.sp,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AppDimensions.sp,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.shimmerBaseColor,
                      borderRadius: BorderRadius.circular(AppDimensions.mbr),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: AppDimensions.sp,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.shimmerBaseColor,
                            borderRadius: BorderRadius.circular(
                              AppDimensions.mbr,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.shimmerBaseColor,
                            borderRadius: BorderRadius.circular(
                              AppDimensions.mbr,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.shimmerBaseColor,
                borderRadius: BorderRadius.circular(AppDimensions.mbr),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.shimmerBaseColor,
                borderRadius: BorderRadius.circular(AppDimensions.mbr),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.shimmerBaseColor,
                borderRadius: BorderRadius.circular(AppDimensions.mbr),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
