import 'package:clinic_app/app/offers/views/widgets/shimmer_offer_widget.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_shimmer_colors_extension.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerOffersWidget extends StatelessWidget {
  const ShimmerOffersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).shimmerBaseColor,
      highlightColor: Theme.of(context).shimmerHighlightColor,
      child: ListView.separated(
        clipBehavior: Clip.none,
        padding: EdgeInsets.all(AppDimensions.mp),
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
