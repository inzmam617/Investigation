// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// class NotificationService {
//   FirebaseMessaging messaging = FirebaseMessaging.instance;
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//
//   void requestNotPermission() async {
//     NotificationSettings settings = await messaging.requestPermission(
//       alert: true,
//       announcement: true,
//       badge: true,
//       carPlay: true,
//       criticalAlert: true,
//       provisional: true,
//       sound: true,
//     );
//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       print("User Granted Permission");
//     } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
//       print("User Provisional Permission");
//     } else {
//       print("User Denied Permission");
//     }
//   }
//
//   Future<String> getDeviceToken() async {
//     String? token = await messaging.getToken();
//     return token!;
//   }
//
//   Future<void> initLocalNotifications(BuildContext context, RemoteMessage message) async {
//     var initializationSettingsAndroid = const AndroidInitializationSettings("@mipmap/ic_launcher");
//     var iosInitializationSettingsAndroid = const IOSInitializationSettings();
//     var initializationSettings = InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: iosInitializationSettingsAndroid,
//     );
//     await flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//     );
//   }
//
//   void firebaseInit() {
//     FirebaseMessaging.onMessage.listen((message) {
//       print(message.notification!.title.toString());
//       print(message.notification!.body.toString());
//       showNotification(message.notification!.title.toString(), message.notification!.body.toString());
//     });
//   }
//
//   Future<void> showNotification(String title, String body) async {
//     var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
//       'channel_id',
//       'channel_name',
//       'channel_description',
//       importance: Importance.max,
//       priority: Priority.high,
//       ticker: 'ticker',
//       playSound: true,
//       enableVibration: true,
//     );
//
//     var platformChannelSpecifics =
//     NotificationDetails(android: androidPlatformChannelSpecifics);
//
//     await flutterLocalNotificationsPlugin.show(
//       0,
//       title,
//       body,
//       platformChannelSpecifics,
//       payload: 'Default_Sound',
//     );
//   }
//
//   Future<void> isTokenRefresh() async {
//     messaging.onTokenRefresh.listen((event) {
//       event.toString();
//     });
//     print("Refresh Token");
//   }
// }
