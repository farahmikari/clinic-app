import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          subtitle,
          style: TextStyle(
            color: Theme.of(context).primaryTextColor,
            fontSize: AppDimensions.lfs,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: onPressed,
          child: Text(
            buttonTitle,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: AppDimensions.sfs,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
