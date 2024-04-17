import 'dart:ffi';

import 'package:chat_app/main.dart';
import 'package:chat_app/view/home/home_page.dart';
import 'package:chat_app/view/notification_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> handleBackgroundMesseage(RemoteMessage message) async {
  print('Titile:${message.notification?.title}');
  print('Body: ${message.notification?.body}');
  print('Payload:${message.data}');
}

void handleMesseage(RemoteMessage message) {
  if (message == null) return;
  navigatorKey.currentState
      ?.pushNamed(NotificationScreen.route, arguments: message);
}

Future initPushNotificaiton() async {
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  // FirebaseMessaging.instance.getInitialMessage().then(handleMesseage);
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();
    final fcMToken = await _firebaseMessaging.getToken();
    print(fcMToken);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMesseage);
  }
}
