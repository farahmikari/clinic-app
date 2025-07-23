import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/core/widgets/times_widget/views/items/shimmer_time_item.dart';
import 'package:flutter/material.dart';

class ShimmerTimesWidget extends StatelessWidget {
  const ShimmerTimesWidget({super.key});

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
        return ShimmerTimeItem();
      },
      itemCount: 6,
    );
  }
}
