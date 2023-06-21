import 'package:crime_investigation/baseline.dart';
import 'package:crime_investigation/body.dart';
import 'package:crime_investigation/bullets.dart';
import 'package:crime_investigation/death.dart';
import 'package:crime_investigation/dob.dart';
import 'package:crime_investigation/drawning.dart';
import 'package:crime_investigation/evidence.dart';
import 'package:crime_investigation/hanging.dart';
import 'package:crime_investigation/homicide.dart';
import 'package:crime_investigation/mystory.dart';
import 'package:crime_investigation/robbery.dart';
import 'package:crime_investigation/savedata.dart';
import 'package:crime_investigation/scene.dart';
import 'package:crime_investigation/scenesketch.dart';
import 'package:crime_investigation/setting.dart';
import 'package:crime_investigation/shooting.dart';
import 'package:crime_investigation/weapon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class notebook extends StatelessWidget {
  const notebook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Colors.black,
      //   items: <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Transform.translate(
      //         offset: Offset(0, 10),
      //         child: SvgPicture.asset('assets/Component 12 – 1.svg'),
      //       ),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Transform.translate(
      //         offset: Offset(0, -20),
      //         child: Container(
      //           decoration: BoxDecoration(
      //               border: Border.all(
      //             color: Colors.black,
      //           )),
      //           child: SizedBox(
      //             height: 25,
      //             width: 25,
      //             child: Transform.scale(
      //               scale: 2,
      //               child: CircleAvatar(
      //                   backgroundColor: Colors.white,
      //                   child: Icon(
      //                     Icons.add,
      //                     color: Colors.black,
      //                     size: 25,
      //                   )),
      //             ),
      //           ),
      //         ),
      //       ),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Transform.translate(
      //           offset: Offset(0, 10),
      //           child: Image.asset('assets/Iconly-Bold-Setting.png')),
      //       label: '',
      //     ),
      //   ],
      // ),
      body: SingleChildScrollView(
scrollDirection: Axis.horizontal,physics: const NeverScrollableScrollPhysics(),
        child: SingleChildScrollView(scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(children: [
                Transform.translate(
                  offset: const Offset(15, 0),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();

                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Icon(Icons.arrow_back_ios_new_outlined),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(-28, 50),
                  child: Container(
                    height: 1,
                    width: 50,
                    decoration: const BoxDecoration(color: Colors.black),
                  ),
                ),
                Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                        )),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 100, top: 60),
                      child: TextField(
                          decoration: InputDecoration(
                              prefixIcon:
                                  Image.asset('assets/Iconly-Bold-Search.png'),
                              contentPadding: const EdgeInsets.all(10),
                              suffixIcon: Image.asset('assets/assa.png'),
                              hintText: 'Search',
                              hintStyle: const TextStyle(),
                              fillColor: Colors.white,
                              filled: true,
                              border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20))))),
                    )),
              ]),
              const SizedBox(height: 50,),
              Transform.translate(
                offset: const Offset(-50, -25),
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width/1.2,
                  decoration: const BoxDecoration(
                      boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>const basic()),
                        );
                      },
                      child: const Text(
                        'Basic Information',
                        style: TextStyle(color: Color(0xff86898E), fontSize: 16),
                      )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Transform.translate(
                offset: const Offset(-50, -25),
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width/1.2,
                  decoration: const BoxDecoration(
                      boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>const mystory()),
                        );
                      },
                      child: const Text(
                        '"My Story"',
                        style: TextStyle(color: Color(0xff86898E), fontSize: 16),
                      )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Transform.translate(
                offset: const Offset(-50, -25),
                child: InkWell(onTap:() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>const scene()),
                  );
                },
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width/1.2,
                    decoration: const BoxDecoration(
                        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30))),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>const scene()),
                          );
                        },
                        child: const Text(
                          'Scene Measurments',
                          style: TextStyle(color: Color(0xff86898E), fontSize: 16),
                        )),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Transform.translate(
                offset: const Offset(-50, -25),
                child: InkWell(onTap:() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>const body()),
                  );
                },
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width/1.2,
                    decoration: const BoxDecoration(
                        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30))),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>const body()),
                          );
                        },
                        child: const Text(
                          'Body Measurments',
                          style: TextStyle(color: Color(0xff86898E), fontSize: 16),
                        )),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Transform.translate(
                offset: const Offset(-50, -25),
                child: InkWell(onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>const weapon()),
                  );
                },
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width/1.2,
                    decoration: const BoxDecoration(
                        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30))),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>const weapon()),
                          );
                        },
                        child: const Text(
                          'Weapon Measurments',
                          style: TextStyle(color: Color(0xff86898E), fontSize: 16),
                        )),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Transform.translate(
                offset: const Offset(-50, -25),
                child: InkWell(onTap:() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>const baseline()),
                  );
                },
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width/1.2,
                    decoration: const BoxDecoration(
                        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30))),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>const baseline()),
                          );
                        },
                        child: const Text(
                          'Baseline Measurments',
                          style: TextStyle(color: Color(0xff86898E), fontSize: 16),
                        )),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Transform.translate(
                offset: const Offset(-50, -25),
                child: InkWell(onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>const bullets()),
                  );
                },
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width/1.2,
                    decoration: const BoxDecoration(
                        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30))),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>const bullets()),
                          );
                        },
                        child: const Text(
                          'Ballistic Measurments',
                          style: TextStyle(color: Color(0xff86898E), fontSize: 16),
                        )),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Transform.translate(
                offset: const Offset(-50, -25),
                child: InkWell(onTap:() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>const scenesketch()),
                  );
                },
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width/1.2,
                    decoration: const BoxDecoration(
                        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30))),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>const scenesketch()),
                          );
                        },
                        child: const Text(
                          'Scene Sketch',
                          style: TextStyle(color: Color(0xff86898E), fontSize: 16),
                        )),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Transform.translate(
                offset: const Offset(-50, -25),
                child: InkWell(onTap:() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>const evidence()),
                  );
                },
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width/1.2,
                    decoration: const BoxDecoration(
                        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30))),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>const evidence()),
                          );
                        },
                        child: const Text(
                          'Evidence List',
                          style: TextStyle(color: Color(0xff86898E), fontSize: 16),
                        )),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
