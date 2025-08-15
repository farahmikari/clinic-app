import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

void showSnackBar(
    BuildContext context, {
    required String title,
    required String message,
    required ContentType contentType,
  }) {
    ScaffoldMessenger.of(context)..removeCurrentSnackBar()..showSnackBar(
      SnackBar(
        elevation: 0,
        duration: Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: title,
          message: message,
          contentType: contentType,
          key: UniqueKey(),
        ),
      ),
    );
  }