import 'package:clinic_app/app/departments/views/widgets/shimmer_department_widget.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerDepartmentsWidget extends StatelessWidget {
  const ShimmerDepartmentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerBaseColor,
      highlightColor: AppColors.shimmerHighlightColor,
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
