import 'dart:developer';

import 'package:clinic_app/app/auth_prompt/controllers/check_user_authentication_bloc/check_user_authentication_bloc.dart';
import 'package:clinic_app/core/api/dio_consumer.dart';
import 'package:clinic_app/core/api/end_points.dart';
import 'package:clinic_app/core/services/local_notification_service.dart';
import 'package:clinic_app/core/services/shared_preferences/shared_pereference_service.dart';
import 'package:clinic_app/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  DioConsumer api = DioConsumer(dio: Dio());
  static Future init() async {
    await messaging.requestPermission();
    await messaging.getToken().then((token) async {
      if (token != null) {
        log(token.toString());
        await SharedPreferencesService.saveFcm(token);
      }
      return;
    });
    messaging.onTokenRefresh.listen((token) async {
      DioConsumer api = DioConsumer(dio: Dio());
      CheckUserAuthenticationState state =
          getIt<CheckUserAuthenticationBloc>().state;
      if (state is UserAuthenticated) {
        await api.post(
          EndPoints.refreshToken,
          isFormData: true,
          data: {ApiKey.fcmToken: token},
        );
      }
    });
    FirebaseMessaging.onBackgroundMessage(handlebackgroundMessage);
    handleForegroundMessage();
  }

  static Future<void> handlebackgroundMessage(RemoteMessage message) async {
    await Firebase.initializeApp();
  }

  static void handleForegroundMessage() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      LocalNotificationService.showBasicNotification(message);
    });
  }
}
