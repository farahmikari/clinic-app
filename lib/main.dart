import 'package:clinic_app/core/services/app_bloc_observer.dart';
import 'package:clinic_app/core/services/local_notification_service.dart';
import 'package:clinic_app/core/services/push_notifications_service.dart';
import 'package:clinic_app/firebase_options.dart';
import 'package:clinic_app/screens/auth_screens/forget_pasword_screens/reset_password.dart';
import 'package:clinic_app/screens/auth_screens/forget_pasword_screens/set_email_screen.dart';
import 'package:clinic_app/screens/auth_screens/login_screen/login_screen.dart';
import 'package:clinic_app/screens/auth_screens/onboarding_screen/onboarding_screen.dart';
import 'package:clinic_app/screens/auth_screens/sign_up_screen/number_screen.dart';
import 'package:clinic_app/screens/auth_screens/sign_up_screen/sign_up_screen.dart';
import 'package:clinic_app/screens/auth_screens/sign_up_screen/verification_screen.dart';
import 'package:clinic_app/core/services/service_locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Future.wait([
    PushNotificationsService.init(),
    LocalNotificationService.init(),
  ]);
  Bloc.observer = AppBlocObserver();
  setup();
  runApp(const ClinicApp());
}

class ClinicApp extends StatelessWidget {
  const ClinicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
