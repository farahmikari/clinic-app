import 'package:clinic_app/core/errors/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/core/widgets/days_widget/views/items/shimmer_day_item.dart';
import 'package:flutter/material.dart';

class ShimmerDaysWidget extends StatelessWidget {
  const ShimmerDaysWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(AppDimensions.mp),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        crossAxisSpacing: AppDimensions.sm,
        mainAxisSpacing: AppDimensions.sm,
        mainAxisExtent: 10.0.hp,
      ),
      itemBuilder: (context, index) {
        return ShimmerDayItem();
      },
      itemCount: 5,
    );
  }
}
