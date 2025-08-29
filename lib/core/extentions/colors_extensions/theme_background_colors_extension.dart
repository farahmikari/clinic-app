import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

extension ThemeBackgroundColors on ThemeData {
  Color get primaryBackgroundColor =>
      brightness == Brightness.dark
          ? DarkColors.primaryBackgroundColor
          : LightColors.primaryBackgroundColor;
  Color get accentBackgroundColor =>
      brightness == Brightness.dark
          ? DarkColors.accentBackgroundColor
          : LightColors.accentBackgroundColor;
}
