import 'package:crime_investigation/checlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:crime_investigation/body.dart';
import 'package:crime_investigation/bullets.dart';
import 'package:crime_investigation/hanging.dart';
import 'package:crime_investigation/savedata.dart';

class robbery extends StatefulWidget {
  const robbery({Key? key}) : super(key: key);

  @override
  State<robbery> createState() => _robberyState();
}

class _robberyState extends State<robbery> {
  List<String> textValues = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.translate(
                offset: Offset(0, -25),
                child: Container(
                  height: MediaQuery.of(context).size.height / 3.5,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60, right: 90),
                    child: Transform.translate(
                      offset: Offset(-45, 0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30,
                                child: TextField(
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(30),
                                                bottomLeft: Radius.circular(0),
                                                bottomRight:
                                                    Radius.circular(30),
                                                topLeft: Radius.circular(0)),
                                            borderSide: BorderSide(
                                              color: Colors.white,
                                            )),
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(0),
                                                bottomRight:
                                                    Radius.circular(30),
                                                bottomLeft: Radius.circular(0),
                                                topRight:
                                                    Radius.circular(30))))),
                              ),
                              Transform.translate(
                                offset: Offset(-60, -28),
                                child: SizedBox(
                                  height: 26,
                                  width: 26,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.black,
                                    child: Icon(
                                        Icons.arrow_back_ios_new_outlined,
                                        size: 16),
                                  ),
                                ),
                              ),
                              Transform.translate(
                                  offset: Offset(40, -50),
                                  child: Text(
                                    'Burglary/Robbery',
                                    style: TextStyle(color: Color(0xff86898E)),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Transform.translate(
                  offset: Offset(110, -160),
                  child: SvgPicture.asset(
                    'assets/Checklist-bro.svg',
                    fit: BoxFit.cover,
                  )),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Transform.translate(
                  offset: Offset(0, -80),
                  child: Row(
                    children: [
                      Image.asset('assets/tik.png'),
                      Transform.translate(
                        offset: Offset(-20, 0),
                        child: Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width / 1.3,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(blurRadius: 2.5, color: Colors.grey)
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('  Notes,Notes,Notes!',
                                    style: TextStyle(
                                        color: Color(0xff86898E),
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  ' -Complete"Basic Information"portion of your ',
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  ' notebook.',
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Transform.translate(
                  offset: Offset(0, -60),
                  child: Row(
                    children: [
                      Image.asset('assets/white tick.png'),
                      Transform.translate(
                        offset: Offset(-20, 0),
                        child: Container(
                          height: 170,
                          width: MediaQuery.of(context).size.width / 1.3,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(blurRadius: 2.5, color: Colors.grey)
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    '  Watch out for possiblesuspects shoe ',
                                    style: TextStyle(
                                        color: Color(0xff86898E),
                                        fontWeight: FontWeight.bold)),

                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '  prints!',
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E),fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  '-Sometimes we get carried away taking photos ',
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '  everywhere.',
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  ' Just be careful not to step on anything of ',
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '  value.',
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Transform.translate(
                offset: Offset(0, -60),
                child: SingleChildScrollView(
                  child: Row(
                    children: [
                      Image.asset('assets/white tick.png'),
                      Transform.translate(
                        offset: Offset(-17, 0),
                        child: Container(
                          height: 220,
                          width: MediaQuery.of(context).size.width / 1.3,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(blurRadius: 2.5, color: Colors.grey)
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    ' Get an idea by the business owner or ',
                                    style: TextStyle(
                                        color: Color(0xff86898E),
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  " Homeowner how they last remember the ",
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xff86898E),
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  ' home or the business.',
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E),fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "-This  way,you know that you 're taking closer ",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  " photographs of.",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "-If a glass is broken be sure to take a glass ",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "sample and observe for any apparent blood.",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Transform.translate(
                  offset: Offset(0, -40),
                  child: Row(
                    children: [
                      Image.asset('assets/white tick.png'),
                      Transform.translate(
                        offset: Offset(-20, 0),
                        child: Container(
                          height: 130,
                          width: MediaQuery.of(context).size.width / 1.3,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(blurRadius: 2.5, color: Colors.grey)
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(' Collect possible DNA swabs of areas ',
                                    style: TextStyle(
                                        color: Color(0xff86898E),
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  " that the suspect may have touched",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E),fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  " Be careful though, if the area is solid,you can ",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  " possibly get latent prints.",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Transform.translate(
                  offset: Offset(0, -40),
                  child: Row(
                    children: [
                      Image.asset('assets/tik.png'),
                      Transform.translate(
                        offset: Offset(-20, 0),
                        child: Container(
                          height: 130,
                          width: MediaQuery.of(context).size.width / 1.3,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(blurRadius: 2.5, color: Colors.grey)
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(' Collect possible DNA swabs of areas ',
                                    style: TextStyle(
                                        color: Color(0xff86898E),
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  " that the suspect may have touched",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E),fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  " Be careful though, if the area is solid,you can ",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  " possibly get latent prints.",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Transform.translate(
                  offset: Offset(0, -40),
                  child: Row(
                    children: [
                      Image.asset('assets/tik.png'),
                      Transform.translate(
                        offset: Offset(-20, 0),
                        child: Container(
                          height:150,
                          width: MediaQuery.of(context).size.width / 1.3,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(blurRadius: 2.5, color: Colors.grey)
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(' Collect items that were mostly likely  ',
                                    style: TextStyle(
                                        color: Color(0xff86898E),
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  " touched by the suspect,or process the items ",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E),fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  " on scene for latent prints.",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E),fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  " Remember that powder will contaminate the ",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  " DNA that you may find.",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Transform.translate(
                  offset: Offset(0, -20),
                  child: Row(
                    children: [
                      Image.asset('assets/tik.png'),
                      Transform.translate(
                        offset: Offset(-20, 0),
                        child: Container(
                          height: 90,
                          width: MediaQuery.of(context).size.width / 1.3,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(blurRadius: 2.5, color: Colors.grey)
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(' Remember to obtain photographs with and ',
                                    style: TextStyle(
                                        color: Color(0xff86898E),
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  " without a rular.",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "-Stay Organized , Stay Focused, Stay Geek'd",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 30,
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(blurRadius: 3.5, color: Colors.grey)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20))),
                  child: SizedBox(
                    width: 160,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                    topRight: Radius.circular(20)))),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => checklist()),
                          );
                        },
                        child: Text(
                          'Save',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ]));
  }
}
