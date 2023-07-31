import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'StartingScreens/StartingPageOne.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = "pk_test_51MwR8TAKJqb8m8FnzPItMaBA4LVkjLVRbDOOPeEWbAYQZYVuSJcFJvXlPxkHiAoZsAQEhHzRY4XtnZm1llQvRuLj00yoKZ45vL";
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
  // NotificationService notificationService  = NotificationService();
  @override
  void initState(){
    super.initState();
    // notificationService.requestNotPermission();
    // notificationService.firebaseInit();
    // // notificationService.isTokenRefresh();
    // notificationService.getDeviceToken().then((value) => {
    //   print( "Device Token : $value"),
    // });
    setState(() {
      initialize();
    });
  }
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
        body:StartingPageOne()
    );
  }
}
