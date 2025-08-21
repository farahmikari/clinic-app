import 'package:clinic_app/app/book_appointment_with_offer/models/pricing_model.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomPricingDialogWidget extends StatelessWidget {
  const CustomPricingDialogWidget({
    super.key,
    required this.pricing,
    required this.onCancel,
    required this.onKeepGoing,
  });
  final PricingModel pricing;
  final void Function() onCancel;
  final void Function() onKeepGoing;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.widgetBackgroundColor,
      title: Center(
        child: Text(
          S.current.reservation_price,
          style: TextStyle(
            color: AppColors.mainTextColor,
            fontSize: AppDimensions.xlfs,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      content: SizedBox(
        height: 30.0.wp,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: AppDimensions.sp,
          children: [
            Text(
              S.current.know_reservation_price,
              style: TextStyle(
                color: AppColors.hintTextColor,
                fontSize: AppDimensions.sfs,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "${pricing.price} ${pricing.currency}",
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: AppDimensions.lfs,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              S.current.need_booking,
              style: TextStyle(
                color: AppColors.hintTextColor,
                fontSize: AppDimensions.sfs,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      actions: [
        GestureDetector(
          onTap: onCancel,
          child: Text(
            S.current.cancel,
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: AppDimensions.mfs,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(width: AppDimensions.mp),
        GestureDetector(
          onTap: onKeepGoing,
          child: Text(
            S.current.keep_going,
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: AppDimensions.mfs,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
