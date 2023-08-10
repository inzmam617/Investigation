import 'package:crime_investigation/checlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:crime_investigation/UploadCases/BodyMeasurementsPage.dart';
import 'package:crime_investigation/UploadCases/BalisticPage.dart';
import 'package:crime_investigation/UploadCases/BasicInformationPage.dart';
import 'package:crime_investigation/homicide.dart';
import 'package:crime_investigation/AllCasesPage.dart';

class homicide extends StatefulWidget {
  const homicide({Key? key}) : super(key: key);

  @override
  State<homicide> createState() => _homicideState();
}

class _homicideState extends State<homicide> {
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
                                offset: Offset(-60, -28),
                                child: GestureDetector(
                                  onTap: (){
                                    Navigator.pop(context);

                                  },
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
                              ),
                              Transform.translate(
                                  offset: Offset(40, -50),
                                  child: Text(
                                    'Homicides Investigation',
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
                  offset: Offset(110, -155),
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
                                Text(
                                    ' Notes,Notes,Notes!',
                                    style: TextStyle(
                                        color: Color(0xff86898E),
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '-Complete "Basic Information "portion ',
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  " of your notrbook.",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  " what you're dealing with.",
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
                          height: 120,
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
                                    ' Assess the scene :',
                                    style: TextStyle(
                                        color: Color(0xff86898E),
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  " Look for key items without touching anything.",
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xff86898E),
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  " (Ex:guns,casing,knife etc.) ",
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xff86898E),
                                      fontWeight: FontWeight.bold),
                                ),

                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "-Do not forget your Gunshot Residue kit!",
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
                                Text(' Photograph the scene:',
                                    style: TextStyle(
                                        color: Color(0xff86898E),
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "-Photograph the scene as observed. ",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff86898E),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "-If any one moved an item before you   ",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  " arrived, make note of it in your notebook.",
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
                          height: 1550,
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
                                Text('Measurements:',
                                    style: TextStyle(
                                        color: Color(0xff86898E),
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "-Fill out the 'Body measurement'portion at the notebook. ",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff86898E),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "-Fill out the 'scene measurement'portion of the notebook.",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "-If needed, fill out the 'Base line Measurement'portion of",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "the notebook.",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "-Obtain the following measurements of the scene  before ",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "anything is moved.",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "-For Interior scenes you will measure the room from north to  ",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "south,east to west, etc.(Pray that your room is not in an  ",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "angle! )",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "-locate the nearest two corners of the room that would be  ",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "easy to work with.by easy,we mean nothings in the way ",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "between the item yo're trying to measure and the corner. ",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "(It will be difficult to locate sometimes depending on your ",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "scene) ",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "-Measure from the corner to the object or the victim.Be ",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "sure to measure to the victim's head, right hand, left hand, ",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "waist, right foot and left foot.Measure from the other ",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Corner the same areas listed. ",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "-If you have gun be sure to measure to the butt and ",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Barrel of the gun . ",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  "-For Exterior scene you will have more option .",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  "Triangula- . ",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  "tion,base line, or GPS ,coordinates ",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  "If yo're in the middle of nowhere are a lake,you may used",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  "GPS coordinates to the approximate location of the victim's . ",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  "body or item ",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  "For triangulation,you 'll need two fixed points.Meaning, ",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  "two light poles, two corners of a building, etc. ",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  "You will measure from both fixed points to the item of evid-",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  "ence, or victim's bodt.",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  "If you only find onw fixed item,use Baseline.You will locate",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  "a fixed object to your first reference pints.",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  " For example the middle of the street.or to the side walk.",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  "-Take note of the measurementin your notebook.",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  "-Then you will measure to every item of evidence or victim's",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  "body.Make sure you have a measurement going towards",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  "one direction ,for example:from the reference point.north ",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  "to the victim's waist was 20 feet..",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  "Once you contain that measurement,if the victim was more",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  "toward the east,you will add another measurement from",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  "the reference point,east to the victim's waist hands,feet",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  "etc.",
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
                          height: 110,
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
                                    ' Collect your evidence:',
                                    style: TextStyle(
                                        color: Color(0xff86898E),
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  " Once you finish measuring,you may start ",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff86898E),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  " Collecting your evidence.",
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
                          height: 210,
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
                                Text('Collect your evidence:',
                                    style: TextStyle(
                                        color: Color(0xff86898E),
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "-Once you finish measuring,you may start ",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff86898E),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  " collecting your evidence ",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff86898E),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "-Always wear gloves, and be mindful of how ",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff86898E),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "you're collect-ing your evidence.Is it bodly fluid?",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff86898E),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Is it a gun ? Remember ",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff86898E),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "the proper procedure for each!",
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
                          height: 400,
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
                                Text(' Additional Photographs: ',
                                    style: TextStyle(
                                        color: Color(0xff86898E),
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "-Don't put your camera down just yet!Once the victim is",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff86898E),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  " moved,you may see additional injuries Such as cuts, bru-",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff86898E),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  " ising, gunshot wounds,etc.Make sure to ",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff86898E),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  " photograph each injury with and without  ",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff86898E),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  " a rular. ",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff86898E),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "-As you move things around and collect  ",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff86898E),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  " items,you may find ",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff86898E),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  " more items of evidence.Make sure to take  ",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff86898E),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  " your overall,mid ",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff86898E),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  " range and close-up photos of each item. ",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff86898E),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "-When body removal arrives,makesure to   ",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff86898E),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  " photograph the victim's liver mortis. ",
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
                          height: 300,
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
                                Text(' Checklist of items to look for:  ',
                                    style: TextStyle(
                                        color: Color(0xff86898E),
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "-Weapons",
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xff86898E),fontWeight: FontWeight.bold
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "-Notes(Suicide notes,last wills etc.)",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff86898E),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "-Wallet)",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff86898E),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "-Identification cards)",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff86898E),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "-Money)",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff86898E),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "-Drugs)",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff86898E),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "-Check the pockets and collect anything of ",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff86898E),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "value in his pockets.Be careful with needies!",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff86898E),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "-Stay Organized, Stay Focused,Stay Geek'd!)",
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
