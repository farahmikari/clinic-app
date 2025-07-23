import 'package:clinic_app/app/forget_password/views/screens/reset_password.dart';
import 'package:clinic_app/app/forget_password/views/screens/set_email_screen.dart';
import 'package:clinic_app/app/login/views/screens/login_screen.dart';
import 'package:clinic_app/app/onboarding/views/screens/splash_screen.dart';
import 'package:clinic_app/app/signup/views/screens/email_screen.dart';
import 'package:clinic_app/app/signup/views/screens/sign_up_screen.dart';
import 'package:clinic_app/app/user_drawer/views/screen/drawer_screen.dart';
import 'package:clinic_app/app/verification/views/screen/verification_screen.dart';
import 'package:clinic_app/service_locator.dart';

import 'package:clinic_app/core/services/app_bloc_observer.dart';
import 'package:clinic_app/core/services/local_notification_service.dart';
import 'package:clinic_app/core/services/push_notifications_service.dart';
import 'package:clinic_app/firebase_options.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


void main() async {
  Get.put<MyDrawerController>(MyDrawerController());
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
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
        EmailScreen.id: (context) => EmailScreen(),
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
      home: SplashScreen(),
    );
  }
}
