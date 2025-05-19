import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

class DepartmentsShimmerWidget extends StatelessWidget {
  const DepartmentsShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.sp),
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: 8.0.hp,
            width: 28.0.wp,
            margin: EdgeInsets.symmetric(vertical: AppDimensions.sm),
            decoration: BoxDecoration(
              color: AppColors.widgetBackgroundColor,
              borderRadius: BorderRadius.circular(AppDimensions.lbr),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(width: AppDimensions.sm);
      },
      itemCount: 3,
    );
  }
}
