import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

extension ThemeShimmerColors on ThemeData {
  Color get shimmerBaseColor =>
      brightness == Brightness.dark
          ? DarkColors.shimmerBaseColor
          : LightColors.shimmerBaseColor;
  Color get shimmerHighlightColor =>
      brightness == Brightness.dark
          ? DarkColors.shimmerHighlightColor
          : LightColors.shimmerHighlightColor;
}
