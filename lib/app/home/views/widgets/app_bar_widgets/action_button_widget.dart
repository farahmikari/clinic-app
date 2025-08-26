import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_background_colors_extension.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
import 'package:clinic_app/core/extentions/dimensions_extensions/percent_sized_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ActionButtonWidget extends StatelessWidget {
  const ActionButtonWidget({
    super.key,
    required this.icon,
    required this.onTap,
  });

  final String icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 10.0.wp,
        width: 10.0.wp,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).accentBackgroundColor,
          borderRadius: BorderRadius.circular(AppDimensions.sbr),
          boxShadow: AppShadow.boxShadow,
        ),
        child: SvgPicture.asset(
          icon,
          height: AppDimensions.sis,
          width: AppDimensions.sis,
          colorFilter: ColorFilter.mode(
            Theme.of(context).accentTextColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
