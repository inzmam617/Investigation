import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:crime_investigation/UploadCases/BodyMeasurementsPage.dart';
import 'package:crime_investigation/UploadCases/evidence.dart';
import 'package:crime_investigation/notebook.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../AllCasesPage.dart';

class BodyMeasurementsPage extends StatefulWidget {
  const BodyMeasurementsPage({Key? key}) : super(key: key);

  @override
  State<BodyMeasurementsPage> createState() => _BodyMeasurementsPageState();
}

class _BodyMeasurementsPageState extends State<BodyMeasurementsPage> {
  @override
  void initState() {
    super.initState();
    initialize();
    setState(() {
      textValues.add('');
      controllers.add([TextEditingController(), TextEditingController(), TextEditingController()]);
      errorMessages.add(['', '', '']);
      textValues1.add('');
      controllers1.add([TextEditingController(), TextEditingController(), TextEditingController()]);
      errorMessages1.add(['', '', '']);
    });
    initialize();

  }
  List<List<String>> tableData = [];

  String id = " ";
  Future<void> initialize() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    id =  prefs.getString("id").toString();
    print(id);

  }


  List<String> textValues = [];
  List<List<String>> errorMessages = [];
  List<List<TextEditingController>> controllers = [];
  List<String> textValues1 = [];
  List<List<String>> errorMessages1 = [];
  List<List<TextEditingController>> controllers1 = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Transform.translate(
              offset: const Offset(0, 10),
              child: SvgPicture.asset('assets/Component 12 – 1.svg'),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Transform.translate(
              offset: const Offset(0, -20),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.black,
                )),
                child: SizedBox(
                  height: 25,
                  width: 25,
                  child: Transform.scale(
                    scale: 2,
                    child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Transform.translate(
                          offset: const Offset(0, 0),
                          child: const Icon(
                            Icons.add,
                            color: Colors.black,
                            size: 25,
                          ),
                        )),
                  ),
                ),
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Transform.translate(
                offset: const Offset(0, 10),
                child: Image.asset('assets/Iconly-Bold-Setting.png')),
            label: '',
          ),
        ],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
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
                      image: DecorationImage(
                          image: AssetImage('assets/run.png'),
                          alignment: Alignment.centerRight),
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60, right: 100),
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
                                offset: const Offset(-60, -28),
                                child: SizedBox(
                                  height: 26,
                                  width: 26,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const notebook()),
                                      );
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: Colors.black,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const notebook()),
                                          );
                                        },
                                        child: const Icon(
                                            Icons.arrow_back_ios_new_outlined,
                                            size: 16),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Transform.translate(
                                  offset: const Offset(40, -52),
                                  child: const Text(
                                    'Body Measurement',
                                    style: TextStyle(
                                        fontSize: 18, color: Color(0xff86898E)),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: TextField(
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(),
                      hintText: '                                  Add Title',
                      hintStyle: TextStyle(fontSize: 14),
                      border: UnderlineInputBorder()),
                ),
              ),
              const SizedBox(
                height: 60,
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 23.0),
            child: Text('Body 1 :'),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Transform.translate(
                offset: const Offset(0, 0),
                child: DataTable(
                  columns: [
                    DataColumn(
                        label: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 3.5,
                          decoration: const BoxDecoration(
                            color: Color(0xff86898E),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(0),
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                                topLeft: Radius.circular(25)),
                          ),
                          child: const Center(
                              child: Text(
                            '',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 3.5,
                          decoration: const BoxDecoration(
                            color: Color(0xff86898E),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(0),
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                                topLeft: Radius.circular(0)),
                          ),
                          child: const Center(
                              child: Text(
                            'Name :----',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 3.5,
                          decoration: const BoxDecoration(
                              color: Color(0xff86898E),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(25),
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(0))),
                          child: const Center(
                              child: Text(
                            '',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ],
                    ))
                  ],
                  rows: List<DataRow>.generate(
                    textValues.length,
                        (index) => DataRow(
                      cells: [
                        DataCell(Row(
                          children: <Widget>[
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 3.5,
                              child:  TextField(
                                controller: controllers[index][0],
                                decoration: const InputDecoration(
                                  isDense: true,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1.0),
                                  ),
                                  hintText: '',
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 3.5,
                              child:  TextField(
                                controller: controllers[index][1],
                                decoration: const InputDecoration(
                                  isDense: true,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1.0),
                                  ),
                                  hintText: '',
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 3.5,
                              child:  TextField(
                                controller: controllers[index][2],
                                decoration: const InputDecoration(
                                  isDense: true,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1.0),
                                  ),
                                  hintText: '',
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        )),

                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
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
                        width: 140,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        topLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                        topRight: Radius.circular(20)))),
                            onPressed: () {
                              setState(() {
                                textValues.add('');
                                controllers.add([TextEditingController(), TextEditingController(), TextEditingController()]);
                                errorMessages.add(['', '', '']);// Add an empty value to the list
                              });
                            },
                            child: const Text(
                              'Add',
                              style: TextStyle(color: Colors.black),
                            )),
                      ),
                    ),
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
                        width: 140,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        topLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                        topRight: Radius.circular(20)))),
                            onPressed: () {
                              setState(() {
                                textValues.remove(
                                    ''); // Add an empty value to the list
                              });
                            },
                            child: const Text(
                              'Delete',
                              style: TextStyle(color: Colors.black),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),

              Transform.translate(
                offset: const Offset(0, -20),
                child: Padding(
                  padding: const EdgeInsets.only(left: 23.0),
                  child: Row(
                    children: [
                      const Text('Body 2 :'),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Transform.translate(
                offset: const Offset(0, -20),
                child: DataTable(
                  columns: [
                    DataColumn(
                        label: Row(
                      children: [
                        Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width / 3.5,
                          decoration: const BoxDecoration(
                            color: Color(0xff86898E),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(0),
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                                topLeft: Radius.circular(25)),
                          ),
                          child: const Center(
                              child: Text(
                            '',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                        Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width / 3.5,
                          decoration: const BoxDecoration(
                            color: Color(0xff86898E),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(0),
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                                topLeft: Radius.circular(0)),
                          ),
                          child: const Center(
                              child: Text(
                            'Name :----',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                        Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width / 3.5,
                          decoration: const BoxDecoration(
                              color: Color(0xff86898E),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(25),
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(0))),
                          child: const Center(
                              child: Text(
                            '',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ],
                    ))
                  ],
                  rows: List<DataRow>.generate(
                    textValues1.length,
                        (index) => DataRow(
                      cells: [
                        DataCell(Row(
                          children: <Widget>[
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 3.5,
                              child:  TextField(
                                controller: controllers1[index][0],
                                decoration: const InputDecoration(
                                  isDense: true,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1.0),
                                  ),
                                  hintText: '',
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 3.5,
                              child:  TextField(
                                controller: controllers1[index][1],
                                decoration: const InputDecoration(
                                  isDense: true,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1.0),
                                  ),
                                  hintText: '',
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 3.5,
                              child:  TextField(
                                controller: controllers1[index][2],
                                decoration: const InputDecoration(
                                  isDense: true,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1.0),
                                  ),
                                  hintText: '',
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        )),

                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
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
                        width: 140,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        topLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                        topRight: Radius.circular(20)))),
                            onPressed: () {
                              setState(() {
                                textValues1.add('');
                                controllers1.add([TextEditingController(), TextEditingController(), TextEditingController()]);
                                errorMessages1.add(['', '', '']);
                              });
                            },
                            child: const Text(
                              'Add',
                              style: TextStyle(color: Colors.black),
                            )),
                      ),
                    ),
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
                        width: 140,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        topLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                        topRight: Radius.circular(20)))),
                            onPressed: () {
                              setState(() {
                                textValues1.remove(
                                    ''); // Add an empty value to the list
                              });
                            },
                            child: const Text(
                              'Delete',
                              style: TextStyle(color: Colors.black),
                            )),
                      ),
                    ),
                  ),
                ],
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
                      color: Colors.black,
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

                          List<Map<String, dynamic>> BodyOne = [];
                          List<Map<String, dynamic>> BodyTwo = [];

                          Map<String, dynamic> data = {
                            "Type" : "Body",
                            "Title" : "Body",

                          };
                          for (int i = 0; i < textValues.length; i++) {
                            var rowControllers = controllers[i];
                            String partOne = rowControllers[0].text;
                            String partTwo = rowControllers[1].text;
                            String partThree = rowControllers[2].text;

                            if (partOne.isNotEmpty && partTwo.isNotEmpty && partThree.isNotEmpty) {
                              Map<String, dynamic>  rowDataa = {
                                'partOne 1': partOne,
                                'partTwo 2': partTwo,
                                'partThree 3': partThree,
                              };
                              BodyOne.add(rowDataa);
                            } else {
                              // Show SnackBar with error message
                              print('Field values cannot be empty');
                              return; // Stop further processing
                            }
                          }
                          for (int i = 0; i < textValues1.length; i++) {
                            var rowControllers = controllers1[i];
                            String partOne = rowControllers[0].text;
                            String partTwo = rowControllers[1].text;
                            String partThree = rowControllers[2].text;

                            if (partOne.isNotEmpty && partTwo.isNotEmpty && partThree.isNotEmpty) {
                              Map<String, dynamic>  rowDataa = {
                                'partOne 1': partOne,
                                'partTwo 2': partTwo,
                                'partThree 3': partThree,
                              };
                              BodyTwo.add(rowDataa);
                            } else {
                              // Show SnackBar with error message
                              showErrorMessage('Field values cannot be empty');
                              return; // Stop further processing
                            }
                          }

                          data['BodyOne'] = BodyOne;
                          data['BodyTwo'] = BodyTwo;
                          print(data);
                          CollectionReference casesCollection = FirebaseFirestore.instance.collection('Cases');


                          DocumentReference newCaseRef = casesCollection.doc(id).collection('Allcaes').doc();
                          newCaseRef.set(data).then((value) {
                            Navigator.push(context,MaterialPageRoute(builder: (context) =>  AllCases(id: id,)),
                            );
                          });


                        },
                        child: const Text(
                          'Save',
                        )),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ],
      ),
    );
  }
  void showErrorMessage(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
