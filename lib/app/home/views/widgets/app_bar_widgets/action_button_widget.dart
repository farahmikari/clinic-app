import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:flutter/widgets.dart';
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
          color: AppColors.widgetBackgroundColor,
          borderRadius: BorderRadius.circular(AppDimensions.sbr),
          boxShadow: AppShadow.boxShadow,
        ),
        child: SvgPicture.asset(
          icon,
          height: AppDimensions.sis,
          width: AppDimensions.sis,
          color: AppColors.darkGreyColor,
        ),
      ),
    );
  }
}
