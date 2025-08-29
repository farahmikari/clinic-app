import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_shimmer_colors_extension.dart';
import 'package:clinic_app/core/extentions/dimensions_extensions/percent_sized_extension.dart';
import 'package:clinic_app/app/book_appointment/views/widgets/days_widget/views/items/shimmer_day_item.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerDaysWidget extends StatelessWidget {
  const ShimmerDaysWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).shimmerBaseColor,
      highlightColor: Theme.of(context).shimmerHighlightColor,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          crossAxisSpacing: AppDimensions.sm,
          mainAxisSpacing: AppDimensions.sm,
          mainAxisExtent: 20.0.wp,
        ),
        itemBuilder: (context, index) {
          return ShimmerDayItem();
        },
        itemCount: 5,
      ),
    );
  }
}
