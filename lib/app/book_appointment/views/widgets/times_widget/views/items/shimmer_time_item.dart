import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_shimmer_colors_extension.dart';
import 'package:flutter/material.dart';

class ShimmerTimeItem extends StatelessWidget {
  const ShimmerTimeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).shimmerBaseColor,
        borderRadius: BorderRadius.circular(AppDimensions.mbr),
      ),
    );
  }
}
