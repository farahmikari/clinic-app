import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const baseTextTheme = TextTheme(
    titleLarge: TextStyle(
      fontSize: 23,
      fontWeight: FontWeight.w700,
      fontFamily: "Montserat",
    ),
    titleSmall: TextStyle(
      fontFamily: "Montserat",
      fontSize: 15,
      fontWeight: FontWeight.w700,
      height: 1.8,
    ),
    
  );
  /////////////////////light///////////////////////////
  static ThemeData lightTheme = ThemeData(
    textTheme: baseTextTheme.copyWith(
      titleLarge: TextStyle(color: AppColors.mainTextColor),
    ),
    appBarTheme: AppBarTheme(backgroundColor: Colors.white),
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    cardColor: AppColors.widgetBackgroundColor,
    iconTheme: IconThemeData(color:AppColors.darkGreyColor ),
    shadowColor: AppColors.shimmerBaseColor,
    hintColor: AppColors.darkGreyColor,
    useMaterial3: true,
   //fontFamily: "Montserat",
  );
  //////////////////////dark/////////////////////////////
  static ThemeData darkTheme = ThemeData(
    textTheme: baseTextTheme.copyWith(
      titleLarge: TextStyle(color: Colors.white),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFF515151),
    ),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF262626),
    cardColor:const Color(0xFF515151) ,
    iconTheme: IconThemeData(color:Colors.white),
    shadowColor:const Color(0xFF515151),
    hintColor:const Color(0xFFD6D6D9),
    useMaterial3: true,
   // fontFamily: "Montserat",
  );
}
