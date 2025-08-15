import 'package:clinic_app/app/forget_password/views/screens/set_email_screen.dart';
import 'package:clinic_app/app/login/views/screens/login_screen.dart';
import 'package:clinic_app/app/onboarding/views/screens/splash_screen.dart';
import 'package:clinic_app/app/signup/views/screens/email_screen.dart';
import 'package:clinic_app/core/theme/app_theme.dart';
import 'package:clinic_app/core/theme/bloc/theme_bloc/theme_bloc.dart';
import 'package:clinic_app/core/theme/bloc/theme_bloc/theme_event.dart';
import 'package:clinic_app/core/theme/bloc/theme_bloc/theme_state.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeBloc()..add(GetCurrentThemeEvent()),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(

        builder: (context, state) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,

            routes: {
              LoginScreen.id: (context) => LoginScreen(),
              EmailScreen.id: (context) => EmailScreen(),
              SetEmailScreen.id: (context) => SetEmailScreen(),
            },

            theme:state is LoadedThemeState?state.themeData:AppTheme.lightTheme,
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
