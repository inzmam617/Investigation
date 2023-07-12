import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crime_investigation/StartingScreens/StartingPageThree.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:crime_investigation/StartingScreens/StartingPageTwo.dart';
import 'package:crime_investigation/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'AllCasesPage.dart';
import 'CreatePage.dart';
import 'StartingScreens/StartingPageOne.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(const MaterialApp(
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
    return  Scaffold(
      body:  StartingPageOne()
    );
  }

}



