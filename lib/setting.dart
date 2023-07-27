import 'package:crime_investigation/AllCasesPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:crime_investigation/checlist.dart';
import 'package:crime_investigation/courtdate.dart';
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
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _loading,
      child: Scaffold(

        body: Column(

            children: [
              Container(
                height: MediaQuery.of(context).size.height / 3.5,
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
                          )
                        ),
                        width: MediaQuery.of(context).size.width / 3,
                        height: 30,
                          child: const Text("Settings",style: TextStyle(color: Colors.black,fontSize: 20),textAlign: TextAlign.center,)),
                    ),
                  ),


                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,

                      children: [
                        Image.asset('assets/glas.png'),
                        SizedBox(height: 10,),
                        const Text('Sheely Crime Investigator',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),

              InkWell(onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>const checklist()),
                );
              },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.grey, blurRadius: 2.5)
                      ],
                      borderRadius: BorderRadius.zero),
                  child: Row(children: [
                    const SizedBox(
                      width: 30,
                    ),
                    SvgPicture.asset(
                        'assets/success-green-check-mark-icon.svg'),
                    const SizedBox(
                      width: 20,
                    ),
                    InkWell(onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>const checklist()),
                      );
                    },
                      child: const Text(
                        'Check',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    )
                  ]),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.grey, blurRadius: 2.5)
                    ],
                    borderRadius: BorderRadius.zero),
                child: Row(children: [
                  const SizedBox(
                    width: 30,
                  ),
                  SvgPicture.asset(
                      'assets/question-mark-round-line-icon.svg'),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    'Help',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  )
                ]),
              ),
              const SizedBox(height: 20,),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.grey, blurRadius: 2.5)
                    ],
                    borderRadius: BorderRadius.zero),
                child: Row(children: [
                  const SizedBox(
                    width: 30,
                  ),
                  SvgPicture.asset(
                      'assets/contact-us-icon.svg'),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    'Contact us',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  )
                ]),
              ),
            const SizedBox(height: 20,),
              InkWell(
                onTap: () async {
                  setState(() {

                    _loading = true;
                  });
                  final FirebaseAuth _auth = FirebaseAuth.instance;
                  final SharedPreferences prefs = await SharedPreferences.getInstance();


                  await _auth.signOut().then((value) => {
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
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
                      boxShadow: [
                        BoxShadow(color: Colors.grey, blurRadius: 2.5)
                      ],
                      borderRadius: BorderRadius.zero),
                  child: Row(children: [
                    const SizedBox(
                      width: 30,
                    ),
                    SvgPicture.asset(
                        'assets/export-share-icon.svg'),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      'Logout',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )
                  ]),
                ),
              ),
              const SizedBox(height: 20,),
              InkWell(
                onTap: () async {
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                    return  Paymentpage();
                  }));

                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.grey, blurRadius: 2.5)
                      ],
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
                      'Payment',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )
                  ]),
                ),
              ),
            ]),
      ),
    );
  }

}
