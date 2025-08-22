import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';

class ShimmerDayItem extends StatelessWidget {
  const ShimmerDayItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.shimmerBaseColor,
        borderRadius: BorderRadius.circular(AppDimensions.mbr),
      ),
    );
  }
}
