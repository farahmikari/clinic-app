import 'package:clinic_app/app/offers/views/widgets/shimmer_offer_widget.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_shimmer_colors_extension.dart';
import 'package:clinic_app/core/extentions/dimensions_extensions/percent_sized_extension.dart';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLatestOffersWidget extends StatelessWidget {
  const ShimmerLatestOffersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).shimmerBaseColor,
      highlightColor: Theme.of(context).shimmerHighlightColor,
      child: SizedBox(
        height: 52.0.wp,
        child: ListView.separated(
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: AppDimensions.mp),
          itemBuilder: (context, index) {
            return ShimmerOfferWidget();
          },
          separatorBuilder: (context, index) {
            return SizedBox(width: AppDimensions.sp);
          },
          itemCount: 3,
        ),
      ),
    );
  }
}
