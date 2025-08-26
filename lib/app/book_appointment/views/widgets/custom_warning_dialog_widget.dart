import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_background_colors_extension.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
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
      backgroundColor: Theme.of(context).accentBackgroundColor,
      title: Center(
        child: Text(
          S.current.oops,
          style: TextStyle(
            color: Theme.of(context).primaryTextColor,
            fontSize: AppDimensions.xlfs,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      content: Text(
        warning,
        style: TextStyle(
          color: Theme.of(context).accentTextColor,
          fontSize: AppDimensions.sfs,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
      actions: [
        GestureDetector(
          onTap: onOk,
          child: Text(
            S.current.ok,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: AppDimensions.mfs,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
