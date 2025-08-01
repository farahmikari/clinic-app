import 'package:clinic_app/app/book_appointment/views/widgets/departments_widget/views/items/shimmer_department_item.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:flutter/widgets.dart';

class ShimmerDepartmentsWidget extends StatelessWidget {
  const ShimmerDepartmentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.0.hp,
      decoration: BoxDecoration(
        color: AppColors.widgetBackgroundColor,
        borderRadius: BorderRadius.circular(AppDimensions.lbr),
        boxShadow: AppShadow.boxShadow,
      ),
      clipBehavior: Clip.hardEdge,
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
    );
  }
}
