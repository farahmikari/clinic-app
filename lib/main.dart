import 'package:clinic_app/screens/auth_screens/forget_pasword_screens/reset_password.dart';
import 'package:clinic_app/screens/auth_screens/forget_pasword_screens/set_email_screen.dart';
import 'package:clinic_app/screens/auth_screens/login_screen/login_screen.dart';
import 'package:clinic_app/screens/auth_screens/onBoarding_screen/onboarding_screen.dart';
import 'package:clinic_app/screens/auth_screens/sign_up_screen/number_screen.dart';
import 'package:clinic_app/screens/auth_screens/sign_up_screen/sign_up_screen.dart';
import 'package:clinic_app/screens/auth_screens/sign_up_screen/verification_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ClinicApp());
}

class ClinicApp extends StatelessWidget {
  const ClinicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        NumberScreen.id: (context) => NumberScreen(),
        VerificationScreen.id: (context) => VerificationScreen(),
        SignUp.id: (context) => SignUp(),
        SetEmailScreen.id: (context) => SetEmailScreen(),
        ResetPassword.id: (context) => ResetPassword(),
      },

      theme: ThemeData(
        useMaterial3: true,
        textTheme: Theme.of(context).textTheme.copyWith(
          titleLarge: const TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w700,
            color: Colors.black,
            fontFamily: "Montserat",
          ),
          titleSmall: const TextStyle(
            fontFamily: "Montserat",
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Colors.black,
            height: 1.8,
          ),
        ),
      ),
      home: OnboardingScreen(),
    );
  }
}
