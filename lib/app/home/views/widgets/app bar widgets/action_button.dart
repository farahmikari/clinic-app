import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({super.key, required this.icon, required this.onPressed});

  final String icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.0.wp,
      width: 10.0.wp,
      margin: EdgeInsets.only(right: AppDimensions.mm),
      decoration: BoxDecoration(
        color: AppColors.widgetBackgroundColor,
        borderRadius: BorderRadius.circular(AppDimensions.sbr),
        boxShadow: AppShadow.boxShadow,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: SvgPicture.asset(
          icon,
          height: AppDimensions.sis,
          width: AppDimensions.sis,
          color:AppColors.darkGreyColor ,
        ),
      ),
    );
  }
}
