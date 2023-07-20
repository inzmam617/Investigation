import 'package:crime_investigation/UploadCases/BaseLinePage.dart';
import 'package:crime_investigation/UploadCases/BodyMeasurementsPage.dart';
import 'package:crime_investigation/UploadCases/BalisticPage.dart';
import 'package:crime_investigation/UploadCases/BasicInformationPage.dart';
import 'package:crime_investigation/UploadCases/evidence.dart';
import 'package:crime_investigation/UploadCases/StoryPage.dart';
import 'package:crime_investigation/UploadCases/SceneMeasurementPage.dart';
import 'package:crime_investigation/UploadCases/scenesketch.dart';
import 'package:crime_investigation/UploadCases/WeasponsPage.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class notebook extends StatefulWidget {


   // notebook({Key? key, this.FolderName}) : super(key: key);

  @override
  State<notebook> createState() => _notebookState();
}

class _notebookState extends State<notebook> {


  @override
  void initState() {
    super.initState();
    FolderName = generateRandomFolderName(now);
  }

  DateTime now = DateTime.now();
  late String? FolderName;

  String generateRandomFolderName(DateTime dateTime) {
    Random random = Random();
    String alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
    String numbers = '0123456789';

    // Create a prefix using the hour from the given DateTime
    String prefix = dateTime.hour.toString();

    // Generate a random 4-character string (you can adjust the length as needed)
    String randomString = String.fromCharCodes(Iterable.generate(4, (_) =>
    random.nextInt(2) == 0 ? alphabet.codeUnitAt(random.nextInt(alphabet.length)) :
    numbers.codeUnitAt(random.nextInt(numbers.length))));

    return '$prefix$randomString';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          MaterialPageRoute(builder: (context) => BasicInformationPage(
                            Edited: "null",
                              FolderName: FolderName


                          )),
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
                          MaterialPageRoute(builder: (context) =>StoryPage(
                              FolderName: FolderName,

                          )),
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
                    MaterialPageRoute(builder: (context) => SceneMeasurementPage(
                      FolderName: FolderName,

                    )),
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
                            MaterialPageRoute(builder: (context) => SceneMeasurementPage(
                              FolderName: FolderName,

                            )),
                          );
                        },
                        child: const Text(
                          'Scene Measurements',
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
                    MaterialPageRoute(builder: (context) => BodyMeasurementsPage(
                      FolderName: FolderName,

                    )),
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
                            MaterialPageRoute(builder: (context) => BodyMeasurementsPage(
                              FolderName: FolderName,

                            )),
                          );
                        },
                        child: const Text(
                          'Body Measurements',
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
                    MaterialPageRoute(builder: (context) => WeaponsPage(
                      FolderName: FolderName,


                    )),
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
                            MaterialPageRoute(builder: (context) => WeaponsPage(
                              FolderName: FolderName,

                            )),
                          );
                        },
                        child: const Text(
                          'Weapon Measurements',
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
                    MaterialPageRoute(builder: (context) => BaseLinePage(
                      FolderName: FolderName,

                    )),
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
                            MaterialPageRoute(builder: (context) => BaseLinePage(
                              FolderName: FolderName,

                            )),
                          );
                        },
                        child: const Text(
                          'Baseline Measurements',
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
                    MaterialPageRoute(builder: (context) => BalisticPage(
                      FolderName: FolderName,

                    )),
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
                            MaterialPageRoute(builder: (context) => BalisticPage(
                              FolderName: FolderName,

                            )),
                          );
                        },
                        child: const Text(
                          'Ballistic Measurements',
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
                    MaterialPageRoute(builder: (context) => scenesketch(
                      FolderName: FolderName,

                    )),
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
                    child: const Center(
                      child: Text(
                        'Scene Sketch',
                        style: TextStyle(color: Color(0xff86898E), fontSize: 16),
                      ),
                    ),
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
                    MaterialPageRoute(builder: (context) => evidence(
                      FolderName: FolderName,

                    )),
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
                    child: const Center(
                      child: Text(
                        'Evidence List',
                        style: TextStyle(color: Color(0xff86898E), fontSize: 16),
                      ),
                    ),
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
