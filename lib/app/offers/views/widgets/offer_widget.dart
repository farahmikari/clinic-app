import 'package:cached_network_image/cached_network_image.dart';
import 'package:clinic_app/app/book_appointment/views/widgets/book_appointment_with_offer_auth_decision_widget.dart';
import 'package:clinic_app/app/offers/models/offer_model.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_background_colors_extension.dart';
import 'package:clinic_app/core/extentions/dimensions_extensions/percent_sized_extension.dart';
import 'package:clinic_app/core/widgets/loading_widget.dart';
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
          () => BookAppointmentWithOfferAuthDecisionWidget(offer: offer),
          transition: Transition.zoom,
        );
      },
      child: Container(
        height: 52.0.wp,
        width: 92.0.wp,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Theme.of(context).accentBackgroundColor,
          borderRadius: BorderRadius.circular(AppDimensions.mbr),
          boxShadow: AppShadow.boxShadow,
        ),
        child: CachedNetworkImage(
          imageUrl: offer.image,
          placeholder: (context, url) => LoadingWidget(),
          errorWidget: (context, url, error) => LoadingWidget(),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
