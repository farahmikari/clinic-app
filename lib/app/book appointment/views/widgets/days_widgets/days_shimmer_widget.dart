import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DaysShimmerWidget extends StatelessWidget {
  const DaysShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: 16.5.wp,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.widgetBackgroundColor,
              borderRadius: BorderRadius.circular(AppDimensions.mbr),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(width: AppDimensions.sm);
      },
      itemCount: 5,
    );
  }
}
