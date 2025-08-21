import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/generated/l10n.dart';
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
      backgroundColor: Theme.of(context).cardColor,
      title: Center(
        child: Text(
          S.current.oops,
          style: TextStyle(
            fontSize: AppDimensions.xlfs,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      content: Text(
        warning,
        style: TextStyle(
          color: Theme.of(context).hintColor,
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
            S.current.ok,
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
