import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AdviceWidget extends StatelessWidget {
  const AdviceWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(AppDimensions.mp),
      leading: SvgPicture.asset(
        AppIcons.advice,
        width: AppDimensions.sis,
        height: AppDimensions.sis,
        color: AppColors.primaryColor,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: AppColors.darkGreyColor,
          fontSize: AppDimensions.sfs,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
