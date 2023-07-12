import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crime_investigation/SignIn_SignUp/SignInPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:crime_investigation/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../AllCasesPage.dart';
import '../CreatePage.dart';
import 'StartingPageTwo.dart';




class StartingPageThree extends StatefulWidget {
  const StartingPageThree({Key? key}) : super(key: key);

  @override
  State<StartingPageThree> createState() => _StartingPageThreeState();
}


class _StartingPageThreeState extends State<StartingPageThree> {
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
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 1.6,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 3.5)],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(80),
                      bottomLeft: Radius.circular(80),
                    )),
                child:
              Center(child: SvgPicture.asset('assets/Group 5193.svg')),
              ),
              Transform.translate(
                  offset: const Offset(0, -35),
                  child: Image.asset('assets/Component 11 – 1.png')),
              const SizedBox(
                height: 30,
              ),
              const Text('Lorem ipsum dollar sitam',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      color: Colors.white)),
              const SizedBox(
                height: 10,
              ),
              const Text('et consectur',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      color: Colors.white)),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'lorem ipsum dollar sit amet,consectetu',
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
              const Text(
                'elit,sed do eiusmod tempor',
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 140,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    onPressed: () {
                      if(id != ""){
                        FirebaseFirestore.instance.collection('Cases').doc(id).collection('Allcaes').get().then((value) => {
                          print("this is the data${value.docs.length}"),
                          if(value.docs.length == 0){
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (BuildContext context) {
                                  return const CreatePage();
                                })),

                          }
                          else if(value.docs.length != 0){
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (BuildContext context) {
                                  return  AllCases(id: id,);
                                })),

                          }
                        });
                      }else {
                        Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInPage(),
                        ),
                      );
                      }

                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => const login ()),
                      // );
                    },
                    child: const Text(
                      'start',
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
