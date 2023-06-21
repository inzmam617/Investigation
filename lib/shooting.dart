import 'package:crime_investigation/checlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:crime_investigation/body.dart';
import 'package:crime_investigation/bullets.dart';
import 'package:crime_investigation/death.dart';
import 'package:crime_investigation/UploadCases.dart';

class shooting extends StatefulWidget {
  const shooting({Key? key}) : super(key: key);

  @override
  State<shooting> createState() => _shootingState();
}

class _shootingState extends State<shooting> {
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
                padding: const EdgeInsets.only(top: 60, right: 70),
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
                                            bottomRight: Radius.circular(30),
                                            topLeft: Radius.circular(0)),
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        )),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(0),
                                            bottomRight: Radius.circular(30),
                                            bottomLeft: Radius.circular(0),
                                            topRight: Radius.circular(30))))),
                          ),
                          Transform.translate(
                            offset: Offset(-75, -28),
                            child: SizedBox(
                              height: 26,
                              width: 26,
                              child: CircleAvatar(
                                backgroundColor: Colors.black,
                                child: Icon(Icons.arrow_back_ios_new_outlined,
                                    size: 16),
                              ),
                            ),
                          ),
                          Transform.translate(
                              offset: Offset(40, -50),
                              child: Text(
                                'Shooting Investigation Checklist',
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
              offset: Offset(120, -155),
              child: SvgPicture.asset(
                'assets/Checklist-bro.svg',
                fit: BoxFit.cover,
              )),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Transform.translate(
              offset: Offset(0, -60),
              child: Row(
                children: [
                  Image.asset('assets/tik.png'),
                  Transform.translate(
                    offset: Offset(-15, 0),
                    child: Container(
                      height: 140,
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
                                ' Complete the "Basic Information"portion of ',
                                style: TextStyle(
                                    color: Color(0xff86898E),
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 10,),
                            Text(
                                ' your notebook.',
                                style: TextStyle(
                                    color: Color(0xff86898E),
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height:10,
                            ),
                            Text(
                              '-Make sure you observe the scene and have  ',
                              style: TextStyle(
                                  fontSize: 13, color: Color(0xff86898E)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              " an idea of what you're dealing with.",
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
              offset: Offset(0, -40),
              child: Row(
                children: [
                  Image.asset('assets/white tick.png'),
                  Transform.translate(
                    offset: Offset(-15, 0),
                    child: Container(
                      height: 250,
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
                                ' If the victim(s)or suspect(s are available ',
                                style: TextStyle(
                                    color: Color(0xff86898E),
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              " take care of )",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xff86898E),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "their information and photograph before  ",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xff86898E),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              " they're taken away. ",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xff86898E),
                                  fontWeight: FontWeight.bold),
                            ),

                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "- Do not forget your Gunshot Residue kit!",
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xff86898E),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "-Buccal swabs",
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xff86898E),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "-Ten Inked prints,palm prints",
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xff86898E),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "-Swab fingernails if applicable",
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xff86898E),
                              ),
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
                    offset: Offset(-15, 0),
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
                            Text(' Photograph the scene and possible ',
                                style: TextStyle(
                                    color: Color(0xff86898E),
                                    fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          " evidence. ",
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xff86898E),fontWeight: FontWeight.bold
                          ),),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "-If there's any shoe prints that might be the the ",
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xff86898E),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              " suspects,pho- tograph that and start your  ",
                              style: TextStyle(
                                  fontSize: 13, color: Color(0xff86898E)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              " casting as soon as possible.",
                              style: TextStyle(
                                  fontSize: 13, color: Color(0xff86898E)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              " (Especially if it looks like it's about to rain)",
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
                    offset: Offset(-15, 0),
                    child: Container(
                      height: 260,
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
                            Text(' Locate items of evidence ',
                                style: TextStyle(
                                    color: Color(0xff86898E),
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              " (weapon,casing,projectiles)",
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xff86898E),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "-Photograph without marking them",
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xff86898E),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "-Mark them with stand up numbers are letters",
                              style: TextStyle(
                                  fontSize: 13, color: Color(0xff86898E)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "-Take more photos!",
                              style: TextStyle(
                                  fontSize: 13, color: Color(0xff86898E)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "-Complete the ' Baseline Measurements'portion ",
                              style: TextStyle(
                                  fontSize: 13, color: Color(0xff86898E)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "if needed.",
                              style: TextStyle(
                                  fontSize: 13, color: Color(0xff86898E)),
                            ),

                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "-Complete the 'weapon measurement'portion ",
                              style: TextStyle(
                                  fontSize: 13, color: Color(0xff86898E)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              " if needed.",
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
                    offset: Offset(-15, 0),
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
                            Text(
                                ' After all measurements,collect!',
                                style: TextStyle(
                                    color: Color(0xff86898E),
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "-Remember to use tweezer for casing into a",
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xff86898E),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              " paper back",
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xff86898E),
                              ),
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
                    offset: Offset(-15, 0),
                    child: Container(
                      height: 180,
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
                            Text(' Photograph bullet holes u c on seen.',
                                style: TextStyle(
                                    color: Color(0xff86898E),
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "-Identify each one with adhesive ruler ",
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xff86898E),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              " if you have them. ",
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xff86898E),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "-Complete the 'Bullet hole measurement'portion  ",
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xff86898E),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              " of your notebook.",
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xff86898E),
                              ),
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
                    offset: Offset(-15, 0),
                    child: Container(
                      height: 140,
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
                            Text(' Collect Colect Collect! ',
                                style: TextStyle(
                                    color: Color(0xff86898E),
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "-you may collect any projectiles from the walls.",
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xff86898E),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "-Collect touch DNA if applicable.",
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xff86898E),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "-Collect Weapons",
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xff86898E),
                              ),
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
                    offset: Offset(-15, 0),
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
                            Text(' If a vehicle is being processed,make   ',
                                style: TextStyle(
                                    color: Color(0xff86898E),
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 10,),
                            Text(' sure to collect Vehicle information.  ',
                                style: TextStyle(
                                    color: Color(0xff86898E),
                                    fontWeight: FontWeight.bold)),

                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "-Stay Focused Stay Organized, Stay Geek'd!",
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xff86898E),
                              ),
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
          SizedBox(
            height: 30,
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(blurRadius: 3.5, color: Colors.grey)],
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
                        MaterialPageRoute(builder: (context) =>checklist()),
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
