import 'dart:math';

import 'package:clinic_app/app/offers/models/offer_model.dart';
import 'package:clinic_app/app/offers/views/widgets/offer_widget.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:flutter/widgets.dart';

class LatestOffersWidget extends StatelessWidget {
  const LatestOffersWidget({super.key, required this.offers});

  final List<OfferModel> offers;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52.0.wp,
      child: ListView.separated(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.mp),
        itemBuilder: (context, index) {
          return OfferWidget(offer: offers[index]);
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: AppDimensions.sp);
        },
        itemCount: min(3, offers.length),
      ),
    );
  }
}
