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
        duration: Duration(milliseconds: 300),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: Material(
          color: Colors.transparent,
          child: AwesomeSnackbarContent(
            title: title,
            message: message,
            contentType: contentType,
          ),
        ),
      ),
    );
  }