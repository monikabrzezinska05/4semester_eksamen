import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:mob_dev/main_page.dart';

import 'notification_screen.dart';

class NotificationController {
  static onMessage(RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
    MainPage.navigatorKey.currentState?.pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => NotificationScreen(message),
      ),
          (route) => route.isFirst,
    );
  }

  static Future<void> onBackgroundMessage(RemoteMessage message) async {

    print("Handling a background message: ${message.messageId}");
  }
}