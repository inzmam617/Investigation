import 'package:crime_investigation/StartingScreens/StartingPageThree.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:crime_investigation/StartingScreens/StartingPageTwo.dart';
import 'package:crime_investigation/login.dart';

import 'StartingScreens/StartingPageOne.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: StartingPageOne()
    );
  }
}
