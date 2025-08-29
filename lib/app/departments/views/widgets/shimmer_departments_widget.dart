import 'package:clinic_app/app/departments/views/widgets/shimmer_department_widget.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_shimmer_colors_extension.dart';
import 'package:clinic_app/core/extentions/dimensions_extensions/percent_sized_extension.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerDepartmentsWidget extends StatelessWidget {
  const ShimmerDepartmentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).shimmerBaseColor,
      highlightColor: Theme.of(context).shimmerHighlightColor,
      child: GridView.builder(
        padding: EdgeInsets.all(AppDimensions.mp),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: AppDimensions.sm,
          mainAxisSpacing: AppDimensions.sm,
          mainAxisExtent: 45.0.wp,
        ),
        itemBuilder: (context, index) {
          return ShimmerDepartmentWidget();
        },
        itemCount: 10,
      ),
    );
  }
}
