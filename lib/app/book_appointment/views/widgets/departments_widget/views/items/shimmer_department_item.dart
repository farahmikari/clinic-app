import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_shimmer_colors_extension.dart';
import 'package:clinic_app/core/extentions/dimensions_extensions/percent_sized_extension.dart';
import 'package:flutter/material.dart';

class ShimmerDepartmentItem extends StatelessWidget {
  const ShimmerDepartmentItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: AppDimensions.sm),
      width: 28.0.wp,
      decoration: BoxDecoration(
        color: Theme.of(context).shimmerBaseColor,
        borderRadius: BorderRadius.circular(AppDimensions.lbr),
      ),
    );
  }
}
