import 'package:clinic_app/core/extentions/colors_extensions/theme_colors_extension.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showDialogAlert({
  required BuildContext context,
  required String title,
  required String content,
  required void Function() onPressed,
}) {
  showCupertinoDialog(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: Text(
          title,
          style: TextStyle(
            color: Theme.of(context).primaryTextColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          content,
          style: TextStyle(
            color: Theme.of(context).accentTextColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: onPressed,
            child: Text(
              S.current.yes,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(context),
            isDestructiveAction: true,
            child: Text(
              S.current.No,
              style: TextStyle(
                color: Theme.of(context).darkRedColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      );
    },
  );
}
