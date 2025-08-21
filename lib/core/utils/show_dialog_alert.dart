import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

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
            fontWeight: FontWeight.w700,
            fontFamily: "Montserat",
          ),
        ),
        content: Text(
          content,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: "Montserat",
          ),
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: onPressed,
            child: Text(
              S.current.yes,
              style: TextStyle(
                color: const Color(0xFF047B08),
                fontWeight: FontWeight.w700,
                fontFamily: "Montserat",
              ),
            ),
          ),
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(context),
            isDestructiveAction: true,
            child: Text(
              S.current.No,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: "Montserat",
              ),
            ),
          ),
        ],
      );
    },
  );
}
