import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerDepartmentWidget extends StatelessWidget {
  const ShimmerDepartmentWidget({super.key});

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
