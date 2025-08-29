import 'package:clinic_app/app/auth_prompt/controllers/check_user_authentication_bloc/check_user_authentication_bloc.dart';
import 'package:clinic_app/app/onboarding/views/screens/splash_screen.dart';
import 'package:clinic_app/app/settings/controllers/localization_bloc/localization_bloc.dart';
import 'package:clinic_app/app/settings/controllers/theme_bloc/theme_bloc.dart';
import 'package:clinic_app/core/constants/app_theme.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:clinic_app/service_locator.dart';
import 'package:clinic_app/core/services/app_bloc_observer.dart';
import 'package:clinic_app/core/services/local_notification_service.dart';
import 'package:clinic_app/core/services/push_notifications_service.dart';
import 'package:clinic_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  getIt<CheckUserAuthenticationBloc>()
                    ..add(UserAuthenticationIsChecked()),
        ),
        BlocProvider(
          create: (context) => ThemeBloc()..add(SavedThemeModeIsFetched()),
        ),
        BlocProvider(
          create:
              (context) =>
                  LocalizationBloc()..add(SavedLocalizationModeIsFetched()),
        ),
      ],
      child: const ClinicApp(),
    ),
  );
}

class ClinicApp extends StatelessWidget {
  const ClinicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        ThemeState themeState = context.select(
          (ThemeBloc bloc) => (bloc.state),
        );
        LocalizationState localizationState = context.select(
          (LocalizationBloc bloc) => (bloc.state),
        );
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeState.themeMode,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: localizationState.locale,
          home: SplashScreen(),
        );
      },
    );
  }
}
