import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

extension ThemeTextColors on ThemeData {
  Color get foregroundColor => AppColors.foregroundColor;
  Color get primaryTextColor =>
      brightness == Brightness.dark
          ? DarkColors.primaryTextColor
          : LightColors.primaryTextColor;
  Color get accentTextColor =>
      brightness == Brightness.dark
          ? DarkColors.accentTextColor
          : LightColors.accentTextColor;
  Color get hintTextColor =>
      brightness == Brightness.dark
          ? DarkColors.hintTextColor
          : LightColors.hintTextColor;
}
