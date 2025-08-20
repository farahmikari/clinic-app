import 'package:clinic_app/app/offers/views/widgets/shimmer_offer_widget.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerOffersWidget extends StatelessWidget {
  const ShimmerOffersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).shadowColor,
      highlightColor: AppColors.shimmerHighlightColor,
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        clipBehavior: Clip.none,
        itemBuilder: (context, index) {
          return ShimmerOfferWidget();
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: AppDimensions.sp);
        },
        itemCount: 5,
      ),
    );
  }
}
