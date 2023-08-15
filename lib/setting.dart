import 'dart:io';

import 'package:crime_investigation/AllCasesPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:crime_investigation/checlist.dart';
import 'package:crime_investigation/courtdate.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'PaymentPage/PaymentPage.dart';
import 'SignIn_SignUp/SignInPage.dart';

class setting extends StatefulWidget {
  const setting({Key? key}) : super(key: key);

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {
  List<String> textValues = [];

  bool _loading = false;

  File? _image;

  Future<void> _getImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _getImageFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _loading,
      child: Scaffold(
        body: Column(children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                )),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            )),
                        width: MediaQuery.of(context).size.width / 3,
                        height: 30,
                        child: const Text(
                          "Settings",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                          textAlign: TextAlign.center,
                        )),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ClipOval(
                      child: _image == null
                          ? Image.asset(
                  'assets/glas.png',
                  // Replace with your image URL
                  width: 100.0,
                  height: 100.0,
                  fit: BoxFit.cover,
                )
                          : Image.file(_image!,height: 100,width: 100,fit: BoxFit.cover,),


                    ),

                    TextButton(
                        onPressed: () {
                          _getImageFromGallery();
                        },
                        child: Text("Change Profile Picture")),
                    const Text('Sheely Crime Investigator',
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const checklist()),
              );
            },
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2.5)],
                  borderRadius: BorderRadius.zero),
              child: Row(children: [
                const SizedBox(
                  width: 30,
                ),
                SvgPicture.asset('assets/success-green-check-mark-icon.svg'),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const checklist()),
                    );
                  },
                  child: const Text(
                    'Check',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                )
              ]),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              _showDialog(context);
            },
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2.5)],
                  borderRadius: BorderRadius.zero),
              child: Row(children: [
                const SizedBox(
                  width: 30,
                ),
                SvgPicture.asset('assets/contact-us-icon.svg'),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  'Contact us',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                )
              ]),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () async {
              setState(() {
                _loading = true;
              });
              final FirebaseAuth _auth = FirebaseAuth.instance;
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();

              await _auth.signOut().then((value) => {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return SignInPage();
                    })),
                    prefs.remove("name"),
                    prefs.remove("id"),
                  });
              setState(() {
                _loading = false;
              });
            },
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2.5)],
                  borderRadius: BorderRadius.zero),
              child: Row(children: [
                const SizedBox(
                  width: 30,
                ),
                SvgPicture.asset('assets/export-share-icon.svg'),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  'Logout',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                )
              ]),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () async {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return Paymentpage();
              }));
            },
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2.5)],
                  borderRadius: BorderRadius.zero),
              child: Row(children: const [
                SizedBox(
                  width: 30,
                ),
                Icon(Icons.payments_outlined),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Subscription',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                )
              ]),
            ),
          ),
        ]),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Contact Us'),
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width ,

            // width: double.infinity,
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Transform.scale(
                          scale: 0.5,
                          child: SvgPicture.asset('assets/icons8-gmail.svg')),
                      // const SizedBox(
                      //   width: 20,
                      // ),

                      Text(
                        'crimescenegeeks@gmail.com',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                    ]),
                SizedBox(
                  height: 10,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        'assets/instagram.png',
                        height: 22,
                        width: 22,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Crimescenegeeks',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                    ]),
              ],
            ),
          ),
          // actions: [
          //   SizedBox()
          // ],
        );
      },
    );
  }
}
