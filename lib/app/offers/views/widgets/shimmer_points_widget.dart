import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPointsWidget extends StatelessWidget {
  const ShimmerPointsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).shadowColor,
      highlightColor: AppColors.shimmerHighlightColor,
      child: Container(
        height: 32.0.wp,
        width: 92.0.wp,
        decoration: BoxDecoration(
          color: AppColors.shimmerBaseColor,
          borderRadius: BorderRadius.circular(AppDimensions.mbr),
        ),
      ),
    );
  }
}
