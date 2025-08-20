import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({super.key, required this.price, required this.priceColor});
  final String price;
  final Color priceColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppDimensions.mp),
      alignment: Alignment.center,
      constraints: BoxConstraints(minWidth: 25.0.wp),
      decoration: BoxDecoration(
        color: AppColors.widgetBackgroundColor,
        borderRadius: BorderRadius.circular(AppDimensions.lbr),
        boxShadow: AppShadow.boxShadow,
      ),
      child: Text(
        price,
        style: TextStyle(
          color: priceColor,
          fontSize: AppDimensions.mfs,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
