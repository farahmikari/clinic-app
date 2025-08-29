import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: LightColors.primaryBackgroundColor,
      surfaceTintColor: LightColors.primaryBackgroundColor,
    ),
    scaffoldBackgroundColor: LightColors.primaryBackgroundColor,
    primaryColor: AppColors.primaryColor,
    useMaterial3: true,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      backgroundColor: DarkColors.primaryBackgroundColor,
      surfaceTintColor: DarkColors.primaryBackgroundColor,
    ),
    scaffoldBackgroundColor: DarkColors.primaryBackgroundColor,
    primaryColor: AppColors.primaryColor,
    useMaterial3: true,
  );
}
