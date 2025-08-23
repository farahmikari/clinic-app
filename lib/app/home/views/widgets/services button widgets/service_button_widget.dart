import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ServiceButtonWidget extends StatelessWidget {
  const ServiceButtonWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onPressed,
    required this.backgroundColor,
    required this.iconColor,
    required this.titleColor,
    required this.subTitleColor,
  });

  final String icon;
  final String title;
  final String subtitle;
  final Color backgroundColor;
  final Color iconColor;
  final Color titleColor;
  final Color subTitleColor;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(AppDimensions.mp),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(AppDimensions.mbr),
          boxShadow: AppShadow.boxShadow,
        ),
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional.topStart,
              child: SvgPicture.asset(
                icon,
                height: AppDimensions.lis,
                width: AppDimensions.lis,
                colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.bottomStart,
              child: ListTile(
                contentPadding: const EdgeInsets.all(0),
                title: Text(
                  title,
                  style: TextStyle(
                    color: titleColor,
                    fontSize: AppDimensions.mfs,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  subtitle,
                  style: TextStyle(
                    color: subTitleColor,
                    fontSize: AppDimensions.sfs,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
