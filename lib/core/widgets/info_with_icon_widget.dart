import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InfoWithIconWidget extends StatelessWidget {
  const InfoWithIconWidget({
    super.key,
    required this.icon,
    required this.info,
    required this.infoSize,
  });
  final String icon;
  final String info;
  final double infoSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: AppDimensions.sp,
      children: [
        SvgPicture.asset(
          icon,
          width: AppDimensions.sis,
          height: AppDimensions.sis,
          colorFilter: ColorFilter.mode(
            Theme.of(context).primaryColor,
            BlendMode.srcIn,
          ),
        ),
        Text(
          info,
          style: TextStyle(
            color: Theme.of(context).accentTextColor,
            fontSize: infoSize,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
