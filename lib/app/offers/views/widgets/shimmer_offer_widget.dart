import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_shimmer_colors_extension.dart';
import 'package:clinic_app/core/extentions/dimensions_extensions/percent_sized_extension.dart';

import 'package:flutter/material.dart';

class ShimmerOfferWidget extends StatelessWidget {
  const ShimmerOfferWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52.0.wp,
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
    );
  }
}
