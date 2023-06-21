import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:crime_investigation/CreatePage.dart';
import 'package:crime_investigation/SignIn_SignUp/signup.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../FirebaseClass/FireabaseAuthClass.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}
class _SignInPageState extends State<SignInPage> {
  TextEditingController _emailController = TextEditingController(text: "15312321321@gmail.com");
  TextEditingController _passwordController = TextEditingController(text: "12304567");

  String? created;

  void signInWithEmailAndPasWord(String email, String password) async {
    try {
      await Auth().signInUserWithEmailPassword(email, password);
      String userId = FirebaseAuth.instance.currentUser!.uid;
      FirebaseFirestore.instance.collection('Users').doc(userId).get().then((value) async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();

        if (value.exists) {
          // Access the "title" field from the document data
           String title = value.data()?['name'];
           prefs.setString("name", title);
          print(title);
        } else {
          print('User data does not exist');
        }
      });


        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) {
              return const CreatePage();
            }));




      // User registration successful
      showSnackBar('User Login successful!');
    } catch (e) {
      // User registration failed
      showSnackBar('User Login failed: $e');
    }
  }
  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Container(
                height: MediaQuery.of(context).size.height / 2.4,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/WhatsApp Image 2023-04-12 at 8.31.02 PM.png'),),
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
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(0),
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(10))),
                              backgroundColor: Colors.grey),
                          onPressed: () {
                          },
                          child: const Icon(
                            Icons.arrow_back_ios_new_outlined,
                            size: 16,
                            color: Colors.black,
                          )),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Hello Again!',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: 'Times new Roman'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Crime Scene Investigator',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'times new roman'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                        boxShadow: [
                          const BoxShadow(color: Colors.grey, blurRadius: 3.6)
                        ]),
                    height: 40,
                    child: Container(
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(color: Colors.white, blurRadius: 4.0)
                      ]),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            hintText: 'johnsondoe@nomail.com',
                            hintStyle: const TextStyle(fontSize: 11),
                            contentPadding: const EdgeInsets.all(10),
                            prefixIcon: Transform.scale(scale: 0.4,
                              child: SvgPicture.asset(
                                'assets/mail.svg',
                              ),
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
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: [
                        const BoxShadow(color: Colors.grey, blurRadius: 3.6)
                      ],
                    ),
                    height: 40,
                    child: Container(
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(color: Colors.white, blurRadius: 4.0)
                      ]),
                      child: TextField(
                        obscureText: true,
                        controller: _passwordController,
                        decoration: InputDecoration(
                            hintText: '..............',
                            hintStyle: const TextStyle(fontSize: 18),
                            contentPadding: const EdgeInsets.all(10),
                            prefixIcon: Transform.scale(scale: 0.4,
                                child: SvgPicture.asset('assets/Lock.svg')),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: ElevatedButton(
                      onPressed: () {

                        signInWithEmailAndPasWord(_emailController.text, _passwordController.text);

                      },
                      child: const Text('Next'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
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
                    style: TextStyle(color: Colors.grey, fontSize: 11),
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
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Create new Account?',
                    style: TextStyle(color: Colors.grey, fontSize: 11)),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUpPage()),
                    );
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
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
