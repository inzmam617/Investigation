import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tzdata;
import 'StartingScreens/StartingPageOne.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = "pk_test_51MwR8TAKJqb8m8FnzPItMaBA4LVkjLVRbDOOPeEWbAYQZYVuSJcFJvXlPxkHiAoZsAQEhHzRY4XtnZm1llQvRuLj00yoKZ45vL";
  initializeApp();
  final FlutterLocalNotificationsPlugin notifications = FlutterLocalNotificationsPlugin();
  const AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('@mipmap/ic_launcher');
  const InitializationSettings initializationSettings =
  InitializationSettings(android: initializationSettingsAndroid);
  tzdata.initializeTimeZones();
  // tz.setLocalLocation(tz.getLocation('Asia/Karachi'));
  tz.setLocalLocation(tz.getLocation('US/Eastern'));
  await notifications.initialize(initializationSettings);
  await Firebase.initializeApp(); // Initialize Firebase
  runApp( const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String id = "";
  Future<void> initialize() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    id =  prefs.getString("id").toString();
    print(id);
  }
  @override
  void initState(){
    super.initState();
    setState(() {
      initialize();
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: StartingPageOne()
    );
  }
}


Future<void> initializeApp() async {
  print("Initializing");
  final service = FlutterBackgroundService();
  await service.configure(
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,
      isForegroundMode: true,
      autoStart: true,
    ),
    iosConfiguration: IosConfiguration(
      autoStart: false,
      onForeground: onStart,
      onBackground: onIosBackground,
    ),
  );
}

bool onIosBackground(ServiceInstance service) {
  WidgetsFlutterBinding.ensureInitialized();
  print('FLUTTER BACKGROUND FETCH');
  return true;
}

void onStart(ServiceInstance service) {
  DartPluginRegistrant.ensureInitialized();
  service.on('OffService').listen((event) {
    service.stopSelf();
    print('This is the starting');
  });
}