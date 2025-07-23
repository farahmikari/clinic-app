import 'dart:developer';

import 'package:clinic_app/core/services/local_notification_service.dart';
import 'package:clinic_app/service_locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_storage/get_storage.dart';

class PushNotificationsService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  static Future init() async {
    //log(messaging.getToken().toString());
    await messaging.requestPermission();
    await messaging.getToken().then((value) async {
      log(value.toString());
      await getIt<GetStorage>().write('fcm_token', value);
      return;
    });
    messaging.onTokenRefresh.listen((event) {
      // here we should send the token after it refreshed to the back-end
    });
    messaging.subscribeToTopic("All");
    // here we should unsubscribe the patient from the topic after the he/she log out
    messaging.unsubscribeFromTopic("All");
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
