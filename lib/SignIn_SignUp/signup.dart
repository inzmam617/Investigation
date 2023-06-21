import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crime_investigation/FirebaseClass/FireabaseAuthClass.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:crime_investigation/CreatePage.dart';

import 'SignInPage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController email = TextEditingController(text: "15312321321@gmail.com");
  TextEditingController name = TextEditingController(text: "Zeeshan");
  TextEditingController password = TextEditingController(text: "12304567");
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String generatedDocId = FirebaseFirestore.instance.collection('Users').doc().id;

  Future<void> registerUser(String email, String password, String name) async {
    try {
      // Create the user with email and password
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Get the authenticated user's UID
      String uid = userCredential.user!.uid;

      // Create a new user document with the UID as the document ID
      await FirebaseFirestore.instance.collection('Users').doc(uid).set({
        'name': name,
        'email': email,
        'docId': uid,
      });

      print('User registered successfully!');
    } catch (e) {
      print('Error registering user: $e');
      // Handle the error accordingly
    }
  }
  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Container(
                height: MediaQuery.of(context).size.height / 2.6,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/WhatsApp Image 2023-04-12 at 8.31.02 PM.png'),
                        alignment: Alignment.bottomCenter),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 3.5,
                      )
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                            child: Row(
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(0),
                                            topRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(0),
                                            bottomRight: Radius.circular(10))),
                                    backgroundColor: const Color(0xffEBEBEB)),
                                onPressed: () {},
                                child: Transform.translate(
                                    offset: const Offset(10, 0),
                                    child: const Text(
                                      'Sign Up',
                                      style: TextStyle(color: Color(0xff86898E)),
                                    ))),
                            Transform.translate(
                                offset: const Offset(-70, 0),
                                child: const Icon(
                                  Icons.arrow_back_ios_new,
                                  size: 12,
                                ))
                          ],
                        )),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(color: Colors.grey, blurRadius: 2)
                        ]),
                    height: 40,
                    child: Container(
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(color: Colors.white, blurRadius: 2.0)
                      ]),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Name',
                            hintStyle:
                                const TextStyle(fontSize: 11, color: Colors.grey),
                            contentPadding: const EdgeInsets.all(10),
                            prefixIcon: Image.asset(
                              'assets/Profile.png',
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(30)),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(color: Colors.grey, blurRadius: 3.6)
                        ]),
                    height: 40,
                    child: Container(
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(color: Colors.white, blurRadius: 2)
                      ]),
                      child: TextField(
                        controller: email,
                        decoration: InputDecoration(
                            hintText: 'johnsondoe@nomail.com',
                            hintStyle:
                                const TextStyle(fontSize: 11, color: Colors.grey),
                            contentPadding: const EdgeInsets.all(10),
                            prefixIcon: Image.asset(
                              'assets/mail.png',
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(30)),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 2)],
                    ),
                    height: 40,
                    child: Container(
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(color: Colors.white, blurRadius: 4.0)
                      ]),
                      child: TextField(
                        controller: password,
                        decoration: InputDecoration(
                            hintText: '..............',
                            hintStyle: const TextStyle(fontSize: 18),
                            contentPadding: const EdgeInsets.all(10),
                            prefixIcon: Image.asset('assets/Lock.png'),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(30)),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 2)],
                    ),
                    height: 40,
                    child: Container(
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(color: Colors.white, blurRadius: 2.0)
                      ]),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: '..............',
                            hintStyle: const TextStyle(fontSize: 18),
                            contentPadding: const EdgeInsets.all(10),
                            prefixIcon: Image.asset('assets/Lock.png'),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(30)),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  width: 180,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: ElevatedButton(
                      onPressed: () {


                        registerUser(email.text, password.text,name.text);

                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: const Text('Next'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 0.5,
                    width: MediaQuery.of(context).size.width / 2.1,
                    color: Colors.grey,
                  ),
                  const Text(
                    'OR',
                    style: TextStyle( fontSize: 11),
                  ),
                  Container(
                    height: 0.5,
                    width: MediaQuery.of(context).size.width / 2.1,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Already have an Account?',
                    style: TextStyle( fontSize: 11)),
                const SizedBox(
                  width: 5,
                ),
                InkWell(onTap: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>const SignInPage()),
                  );
                },
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 12),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
