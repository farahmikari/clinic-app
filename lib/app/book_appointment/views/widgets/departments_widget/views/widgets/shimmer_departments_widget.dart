import 'package:clinic_app/app/book_appointment/views/widgets/departments_widget/views/items/shimmer_department_item.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_background_colors_extension.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_shimmer_colors_extension.dart';
import 'package:clinic_app/core/extentions/dimensions_extensions/percent_sized_extension.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerDepartmentsWidget extends StatelessWidget {
  const ShimmerDepartmentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.0.hp,
      decoration: BoxDecoration(
        color: Theme.of(context).accentBackgroundColor,
        borderRadius: BorderRadius.circular(AppDimensions.lbr),
        boxShadow: AppShadow.boxShadow,
      ),
      clipBehavior: Clip.hardEdge,
      child: Shimmer.fromColors(
        baseColor: Theme.of(context).shimmerBaseColor,
        highlightColor: Theme.of(context).shimmerHighlightColor,
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: AppDimensions.sp),
          scrollDirection: Axis.horizontal,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return ShimmerDepartmentItem();
          },
          separatorBuilder: (context, index) {
            return SizedBox(width: AppDimensions.sm);
          },
          itemCount: 7,
        ),
      ),
    );
  }
}
