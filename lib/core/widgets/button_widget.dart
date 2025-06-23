import 'package:clinic_app/core/errors/constants/app_dimensions.dart';
import 'package:clinic_app/core/errors/constants/app_shadow.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.titleColor,
    required this.onTap,
  });

  final String title;
  final Color backgroundColor;
  final Color titleColor;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppDimensions.mp),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimensions.lbr),
        child: Container(
          padding: EdgeInsets.all(AppDimensions.mp),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(AppDimensions.lbr),
            boxShadow: AppShadow.boxShadow,
          ),
          child: Text(
            title,
            style: TextStyle(
              color: titleColor,
              fontSize: AppDimensions.lfs,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
