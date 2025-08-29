import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:clinic_app/app/onboarding/views/widgets/splash_decision_widget.dart';
import 'package:clinic_app/core/constants/app_logo.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_background_colors_extension.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static String id = "Splash";

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return AnimatedSplashScreen(
      backgroundColor: Theme.of(context).primaryBackgroundColor,
      splash: Center(child: Image.asset(AppLogo.logoWithoutBakcground)),
      nextScreen: SplashDecisionWidget(),
      splashIconSize: size.width * 0.6,
      duration: 4000,
    );
  }
}
