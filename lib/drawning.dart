import 'package:crime_investigation/checlist.dart';
import 'package:crime_investigation/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:crime_investigation/UploadCases/BodyMeasurementsPage.dart';
import 'package:crime_investigation/UploadCases/BalisticPage.dart';
import 'package:crime_investigation/AllCasesPage.dart';

class drawning extends StatefulWidget {
  const drawning({Key? key}) : super(key: key);

  @override
  State<drawning> createState() => _drawningState();
}

class _drawningState extends State<drawning> {
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
                  height: MediaQuery.of(context).size.height / 3.8,
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
                                offset: Offset(-75, -28),
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
                                    ' Drowning Investigation Checklist',
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
                  offset: Offset(120, -145),
                  child: SvgPicture.asset(
                    'assets/Checklist-bro.svg',
                  )),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Transform.translate(offset: Offset(0,-90),
                  child: Row(
                    children: [
                      Image.asset('assets/tik.png'),
                      Transform.translate(offset: Offset(-20,0),
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
                            child: Column(mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(' Notes,Notes,Notes!',
                                    style: TextStyle(
                                        color: Color(0xff86898E),

                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  ' -Complete"Basic Information"portion of your ',
                                  style: TextStyle(fontSize: 13,color: Color(0xff86898E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '  notebook.',
                                  style: TextStyle(fontSize: 13,color: Color(0xff86898E)),
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
                child: Transform.translate(offset: Offset(0,-60),
                  child: Row(
                    children: [
                      Image.asset('assets/tik.png'),
                      Transform.translate(offset: Offset(-20,0),
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
                            child: Column(mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('  Photograph the scene and the victim',
                                    style: TextStyle(
                                        color: Color(0xff86898E),

                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  ' -Normally the victim would already be out of  ',
                                  style: TextStyle(fontSize: 13,color: Color(0xff86898E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '  the water. ',
                                  style: TextStyle(fontSize: 13,color: Color(0xff86898E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  ' -Photograph any injuries with and without a ',
                                  style: TextStyle(fontSize: 13,color: Color(0xff86898E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '  rular. ',
                                  style: TextStyle(fontSize: 13,color: Color(0xff86898E)),
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
              SizedBox(height: 20,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Transform.translate(offset: Offset(0,-50),
                  child: Row(
                    children: [
                      Image.asset('assets/white tick.png'),
                      Transform.translate(offset: Offset(-20,0),
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
                            child: Column(mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('  Measure',
                                    style: TextStyle(
                                        color: Color(0xff86898E),

                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  " -If it's a pool,measure the lengh and width of ",
                                  style: TextStyle(fontSize: 13,color: Color(0xff86898E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "  the pool",
                                  style: TextStyle(fontSize: 13,color: Color(0xff86898E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                "  -If it's a lake,obtain the approximate GPS ",
                                  style: TextStyle(fontSize: 13,color: Color(0xff86898E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "  coordinates",
                                  style: TextStyle(fontSize: 13,color: Color(0xff86898E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "  Where the body is/was",
                                  style: TextStyle(fontSize: 13,color: Color(0xff86898E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  " -Obtain the depth of approximate location of ",
                                  style: TextStyle(fontSize: 13,color: Color(0xff86898E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  " the body.",
                                  style: TextStyle(fontSize: 13,color: Color(0xff86898E)),
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
              SizedBox(height: 20,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Transform.translate(offset: Offset(0,-40),
                  child: Row(
                    children: [
                      Image.asset('assets/white tick.png'),
                      Transform.translate(offset: Offset(-15,0),
                        child: Container(
                          height: 200,
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
                            child: Column(mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('  Collect',
                                    style: TextStyle(
                                        color: Color(0xff86898E),

                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  " -Collect the water temperature",
                                  style: TextStyle(fontSize: 13,color: Color(0xff86898E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  " -Collect the water sample",
                                  style: TextStyle(fontSize: 13,color: Color(0xff86898E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  " -Collect any item of evidence from the victim's  ",
                                  style: TextStyle(fontSize: 13,color: Color(0xff86898E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "  pockets or around the victim Such as",
                                  style: TextStyle(fontSize: 13,color: Color(0xff86898E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "  a wallet ID etc.",
                                  style: TextStyle(fontSize: 13,color: Color(0xff86898E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  " -Stay Organized, Stay Focused, Stay Geek,d!",
                                  style: TextStyle(fontSize: 13,color: Color(0xff86898E)),
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
                            MaterialPageRoute(
                                builder: (context) => AllCases(id: '',)),
                          );
                        },
                        child: InkWell(onTap:() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>checklist()),
                          );
                        },
                          child: Text(
                            'Save',
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ]
        )
    );
  }
}
