import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';

class CustomDialogWidget extends StatelessWidget {
  const CustomDialogWidget({
    super.key,
    required this.title,
    required this.content,
    required this.buttonTitle,
    required this.onPressed,
  });
  final String title;
  final String content;
  final String buttonTitle;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.widgetBackgroundColor,
      title: Center(
        child: Text(
          title,
          style: TextStyle(
            color: AppColors.mainTextColor,
            fontSize: AppDimensions.xlfs,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      content: Text(
        content,
        style: TextStyle(
          color: AppColors.hintTextColor,
          fontSize: AppDimensions.sfs,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
            overlayColor: WidgetStatePropertyAll(Colors.transparent),
          ),
          child: Text(
            buttonTitle,
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: AppDimensions.mfs,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
