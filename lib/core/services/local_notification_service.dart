import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static StreamController<NotificationResponse> streamController =
      StreamController();

  static onTap(NotificationResponse notificationResponse) {
    streamController.add(notificationResponse);
  }

  static Future init() async {
    InitializationSettings settings = InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
      iOS: DarwinInitializationSettings(),
    );
    flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: onTap,
      onDidReceiveBackgroundNotificationResponse: onTap,
    );
  }

  //basic notification

  static void showBasicNotification(RemoteMessage message) async {
    final String? imageUrl = message.notification?.android?.imageUrl;
    final String? title = message.notification?.title;
    final String? body = message.notification?.body;
    final AndroidNotificationDetails androidDetails;

    if (imageUrl != null) {
      androidDetails = await _buildBigPictureStyleNotification(imageUrl);
    } else {
      androidDetails = _buildBasicNotification();
    }

    final notificationDetails = NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      notificationDetails,
    );
  }

  static AndroidNotificationDetails _buildBasicNotification() {
    return AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      sound: RawResourceAndroidNotificationSound(
        'clinic_app_notification_sound'.split('.').first,
      ),
    );
  }

  static Future<AndroidNotificationDetails> _buildBigPictureStyleNotification(
    String imageUrl,
  ) async {
    try {
      final response = await http.get(Uri.parse(imageUrl));
      final imageBytes = response.bodyBytes;
      final base64Image = base64Encode(imageBytes);
      final style = BigPictureStyleInformation(
        ByteArrayAndroidBitmap.fromBase64String(base64Image),
        largeIcon: ByteArrayAndroidBitmap.fromBase64String(base64Image),
      );

      return AndroidNotificationDetails(
        'channel_id',
        'channel_name',
        importance: Importance.max,
        priority: Priority.high,
        styleInformation: style,
        playSound: true,
        sound: RawResourceAndroidNotificationSound(
          'clinic_app_notification_sound'.split('.').first,
        ),
      );
    } catch (e, stack) {
      log('Error loading notification image: $e', stackTrace: stack);
      return _buildBasicNotification();
    }
  }
}
