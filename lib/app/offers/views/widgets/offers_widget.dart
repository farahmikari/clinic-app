import 'package:clinic_app/app/offers/models/offer_model.dart';
import 'package:clinic_app/app/offers/views/widgets/offer_widget.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';

class OffersWidget extends StatelessWidget {
  const OffersWidget({super.key, required this.offers});
  final List<OfferModel> offers;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      clipBehavior: Clip.none,
      itemBuilder: (context, index) {
        return OfferWidget(offer: offers[index]);
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: AppDimensions.sp);
      },
      itemCount: offers.length,
    );
  }
}
