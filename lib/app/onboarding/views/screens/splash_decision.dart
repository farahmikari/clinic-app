import 'package:clinic_app/app/onboarding/views/screens/onboarding_screen.dart';
import 'package:clinic_app/app/user_drawer/views/screen/drawer_screen.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/services/shared_preferences/shared_pereference_service.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashDecision extends StatelessWidget {
  const SplashDecision({super.key});
  Future<bool> isFindToken() async {
    final token = await SharedPereferenceService.getToken();
    return token != null;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: isFindToken(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: LoadingAnimationWidget.hexagonDots(
                color: AppColors.primaryColor,
                size: 30,
              ),
            ),
          );
        } else {
          if (snapshot.data!) {
            return DrawerScreen();
          } else {
            return OnboardingScreen();
          }
        }
      },
    );
  }
}
