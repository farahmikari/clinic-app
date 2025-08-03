import 'package:clinic_app/app/book_appointment_with_offer/views/screens/book_appointment_with_offer_screen.dart';
import 'package:clinic_app/app/offers/models/offer_model.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfferWidget extends StatelessWidget {
  const OfferWidget({super.key, required this.offer});
  final OfferModel offer;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => BookAppointmentWithOfferScreen(offer: offer),
          transition: Transition.zoom,
        );
      },
      child: Container(
        height: 52.0.wp,
        width: 92.0.wp,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimensions.mbr),
          boxShadow: AppShadow.boxShadow,
        ),
        child: Image(image: AssetImage(offer.image), fit: BoxFit.fill),
      ),
    );
  }
}
