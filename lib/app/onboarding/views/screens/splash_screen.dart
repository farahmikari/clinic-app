import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:clinic_app/app/onboarding/views/widgets/splash_decision_widget.dart';
import 'package:clinic_app/core/constants/app_logo.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static String id = "Splash";

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return AnimatedSplashScreen(
      backgroundColor: Colors.white,
      splash: Center(child: Image.asset(AppLogo.logoBackground)),
      nextScreen: SplashDecisionWidget(),
      splashIconSize: size.width * 0.6,
      duration: 4000,
    );
  }
}
