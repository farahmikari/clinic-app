import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_shimmer_colors_extension.dart';
import 'package:clinic_app/core/extentions/dimensions_extensions/percent_sized_extension.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPointsWidget extends StatelessWidget {
  const ShimmerPointsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).shimmerBaseColor,
      highlightColor: Theme.of(context).shimmerHighlightColor,
      child: Container(
        height: 53.0.wp,
        width: 92.0.wp,
        margin: EdgeInsets.symmetric(horizontal: AppDimensions.mp),
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
                        color: Theme.of(context).shimmerBaseColor,
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
                              color: Theme.of(context).shimmerBaseColor,
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
                              color: Theme.of(context).shimmerBaseColor,
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
                  color: Theme.of(context).shimmerBaseColor,
                  borderRadius: BorderRadius.circular(AppDimensions.mbr),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).shimmerBaseColor,
                  borderRadius: BorderRadius.circular(AppDimensions.mbr),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).shimmerBaseColor,
                  borderRadius: BorderRadius.circular(AppDimensions.mbr),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
