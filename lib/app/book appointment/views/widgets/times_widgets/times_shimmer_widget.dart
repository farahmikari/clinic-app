import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TimesShimmerWidget extends StatelessWidget {
  const TimesShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(AppDimensions.mp),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: AppDimensions.sm,
        mainAxisSpacing: AppDimensions.sm,
        mainAxisExtent: 6.0.hp,
      ),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.widgetBackgroundColor,
              borderRadius: BorderRadius.circular(AppDimensions.mbr),
            ),
          ),
        );
      },
      itemCount: 6,
    );
  }
}
