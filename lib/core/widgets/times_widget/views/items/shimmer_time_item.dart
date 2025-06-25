import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerTimeItem extends StatelessWidget {
  const ShimmerTimeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerBaseColor,
      highlightColor: AppColors.shimmerHighlightColor,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.shimmerBaseColor,
          borderRadius: BorderRadius.circular(AppDimensions.mbr),
        ),
      ),
    );
  }
}
