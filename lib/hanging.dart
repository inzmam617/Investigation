import 'package:crime_investigation/checlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class hanging extends StatefulWidget {
  const hanging({Key? key}) : super(key: key);

  @override
  State<hanging> createState() => _hangingState();
}

class _hangingState extends State<hanging> {
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
                offset: const Offset(0, -25),
                child: Container(
                  height: MediaQuery.of(context).size.height / 3.5,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60, right: 90),
                    child: Transform.translate(
                      offset: const Offset(-45, 0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(
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
                                offset: const Offset(-50, -28),
                                child: GestureDetector(
                                  onTap: (){
                                    Navigator.pop(context);

                                  },
                                  child: const SizedBox(
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
                              ),
                              Transform.translate(
                                  offset: const Offset(40, -50),
                                  child: const Text(
                                    'Hanging Checklist',
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
                  offset: const Offset(110, -160),
                  child: SvgPicture.asset(
                    'assets/Checklist-bro.svg',
                    fit: BoxFit.cover,
                  )),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Transform.translate(
                  offset: const Offset(0, -60),
                  child: Row(
                    children: [
                      Image.asset('assets/tik.png'),
                      Transform.translate(
                        offset: const Offset(-15, 0),
                        child: Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width / 1.3,
                          decoration: const BoxDecoration(
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
                                const Text(' Notes,Notes,Notes!',
                                    style: TextStyle(
                                        color: Color(0xff86898E),
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  '-Complete"Basic Information"portion of your ',
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
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
                  offset: const Offset(0, -40),
                  child: Row(
                    children: [
                      Image.asset('assets/white tick.png'),
                      Transform.translate(
                        offset: const Offset(-15, 0),
                        child: Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width / 1.3,
                          decoration: const BoxDecoration(
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
                                const Text(
                                    ' Photograph the scene:',
                                    style: TextStyle(
                                        color: Color(0xff86898E),
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  ' Make your to take good photographs of the ',
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  ' knot. ',
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
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Transform.translate(
                  offset: const Offset(0, -40),
                  child: Row(
                    children: [
                      Image.asset('assets/white tick.png'),
                      Transform.translate(
                        offset: const Offset(-15, 0),
                        child: Container(
                          height: 130,
                          width: MediaQuery.of(context).size.width / 1.3,
                          decoration: const BoxDecoration(
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
                                const Text(
                                    ' Measurements',
                                    style: TextStyle(
                                        color: Color(0xff86898E),
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "-Measure from the ground to the knot.",
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xff86898E),
                                      ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "-Complete the'body measurement'portion  ",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  " of your notebook",
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
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Transform.translate(
                  offset: const Offset(0, -40),
                  child: Row(
                    children: [
                      Image.asset('assets/tik.png'),
                      Transform.translate(
                        offset: const Offset(-15, 0),
                        child: Container(
                          height: 180,
                          width: MediaQuery.of(context).size.width / 1.3,
                          decoration: const BoxDecoration(
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
                                const Text(' Collect',
                                    style: TextStyle(
                                        color: Color(0xff86898E),
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "-Collect any items of evidence.",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E),),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  " Search for handwritten notes or letters",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  " Collect the rope if it was already cut before ",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  " your arrival.",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  " Collect what was left of the rope.",
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
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Transform.translate(
                  offset: const Offset(0, -40),
                  child: Row(
                    children: [
                      Image.asset('assets/white tick.png'),
                      Transform.translate(
                        offset: const Offset(-15, 0),
                        child: Container(
                          height: 330,
                          width: MediaQuery.of(context).size.width / 1.3,
                          decoration: const BoxDecoration(
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
                                const Text(' Cut the rope or item that was used for ',
                                    style: TextStyle(
                                        color: Color(0xff86898E),
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  " the hanging",
                                  style: TextStyle(
                                    fontSize: 13, color: Color(0xff86898E),),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  " IF the rope is not cut but still tied, DO ",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E),),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  " NOT UNDO",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  " THE KNOT.",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "-Cut the rope and mark where you cut it,",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "-If possible leave the rope on the victim's ",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  " neck,This allows",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "-Medical Examinar to have a better visual of  ",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  " what may have Happened ",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  " have Happened ",
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
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Transform.translate(
                  offset: const Offset(0, -40),
                  child: Row(
                    children: [
                      Image.asset('assets/tik.png'),
                      Transform.translate(
                        offset: const Offset(-15, 0),
                        child: Container(
                          height: 80,
                          width: MediaQuery.of(context).size.width / 1.3,
                          decoration: const BoxDecoration(
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
                                const Text(' Process for latent prints if applicable',
                                    style: TextStyle(
                                        color: Color(0xff86898E),
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "-Stay focused ,Stay Organized, Stay Geek'd",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff86898E),),
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

              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 30,
                child: Container(
                  decoration: const BoxDecoration(
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
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                    topRight: Radius.circular(20)))),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>const checklist()),
                          );
                        },
                        child: const Text(
                          'Save',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ]));
  }
}
