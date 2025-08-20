import 'package:clinic_app/app/department_doctors/views/widgets/shimmer_department_doctor.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerDepartmentDoctors extends StatelessWidget {
  const ShimmerDepartmentDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).shadowColor,
      highlightColor: AppColors.shimmerHighlightColor,
      child: ListView.separated(
        padding: EdgeInsets.all(AppDimensions.mp),
        clipBehavior: Clip.none,
        itemBuilder: (context, index) {
          return ShimmerDepartmentDoctor();
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: AppDimensions.sp);
        },
        itemCount: 10,
      ),
    );
  }
}
