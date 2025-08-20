import 'package:clinic_app/app/offers/views/widgets/shimmer_offer_widget.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLatestOffersWidget extends StatelessWidget {
  const ShimmerLatestOffersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).shadowColor,
      highlightColor: AppColors.shimmerHighlightColor,
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
          itemCount: 5,
        ),
      ),
    );
  }
}
