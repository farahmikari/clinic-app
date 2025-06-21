import 'package:clinic_app/core/errors/constants/app_colors.dart';
import 'package:clinic_app/core/errors/constants/app_dimensions.dart';
import 'package:flutter/material.dart';

class SubtitleWithTextButtonWidget extends StatelessWidget {
  const SubtitleWithTextButtonWidget({
    super.key,
    required this.subtitle,
    required this.buttonTitle,
    required this.onPressed,
  });

  final String subtitle;
  final String buttonTitle;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: AppDimensions.mp,
        vertical: 0,
      ),
      dense: true,
      minTileHeight: 0,
      title: Text(
        subtitle,
        style: TextStyle(
          color: AppColors.mainTextColor,
          fontSize: AppDimensions.lfs,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: TextButton(
        style: ButtonStyle(
          overlayColor: WidgetStatePropertyAll(Colors.transparent),
          padding: WidgetStatePropertyAll(EdgeInsets.all(0)),
        ),

        onPressed: onPressed,
        child: Text(
          buttonTitle,
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: AppDimensions.sfs,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
