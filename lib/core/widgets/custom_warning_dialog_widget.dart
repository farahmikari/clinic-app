import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';

class CustomWarningDialogWidget extends StatelessWidget {
  const CustomWarningDialogWidget({
    super.key,
    required this.warning,
    required this.onOk,
  });
  final String warning;
  final void Function() onOk;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.widgetBackgroundColor,
      title: Center(
        child: Text(
          "Oops",
          style: TextStyle(
            color: AppColors.mainTextColor,
            fontSize: AppDimensions.xlfs,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      content: Text(
        warning,
        style: TextStyle(
          color: AppColors.hintTextColor,
          fontSize: AppDimensions.sfs,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(
          onPressed: onOk,
          style: ButtonStyle(
            overlayColor: WidgetStatePropertyAll(Colors.transparent),
          ),
          child: Text(
            "Ok",
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
