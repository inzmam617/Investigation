import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:crime_investigation/notebook.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../AllCasesPage.dart';

class evidence extends StatefulWidget {
  const evidence({Key? key}) : super(key: key);

  @override
  State<evidence> createState() => _evidenceState();
}

class _evidenceState extends State<evidence> {
  List<List<TextEditingController>> controllers = [];
  List<List<TextEditingController>> controllers2 = [];
  TextEditingController title =TextEditingController();


  @override
  void initState() {
    super.initState();
    initialize();
    setState(() {
      textValues.add(''); // Add an empty value to the list
      textValues1.add('');
      textValues.add(''); // Add an empty value to the list
      textValues1.add('');
      textValues.add(''); // Add an empty value to the list
      textValues1.add('');
      textValues.add(''); // Add an empty value to the list
      textValues1.add('');// Add an empty value to the list//// Add an empty value to the list

    });
    setState(() {    initialize();
    });
    setState(() {});
    // Initialize controllers based on number of rows
    // Initialize controllers based on number of rows and columns
    controllers = List.generate(
      textValues.length,
          (_) => List.generate(
        2, // Number of columns
            (_) => TextEditingController(),
      ),
    );
    for (int i = 0; i < textValues1.length; i++) {
      controllers2.add([
        TextEditingController(),
        TextEditingController(),
        TextEditingController(),


      ]);
    }

  }
  String id = " ";
  Future<void> initialize() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  id =  prefs.getString("id").toString();
  print(id);

}
  List<String> textValues = [];
  List<String> textValues1 = [];

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
                  offset: const Offset(0, 10),
                  child: Image.asset('assets/Iconly-Bold-Setting.png')),
              label: '',
            ),
          ],
        ),
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
                      image: DecorationImage(
                          image: AssetImage('assets/Checklist-bro.png'),alignment: Alignment.centerRight),
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60, right: 120),
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
                                offset: const Offset(-45, -28),
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
                                    'Evidence List',
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
                   Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: TextField(
                    controller: title,
                  decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(),
                  hintText: '                                  Add Title',
                  hintStyle: TextStyle(fontSize: 14),
                  border: UnderlineInputBorder()),
                  ),
                  ),
                  const SizedBox(height: 40,),
              ]
                  ),
          SizedBox(height: 35,),
          Column(children: [
            Transform.translate(
              offset: const Offset(0, -40),
              child: DataTable(
                columns: [
                  DataColumn(
                      label: Row(
                        children: [
                          Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width / 2.5,
                            decoration: const BoxDecoration(
                              color: Color(0xff86898E),
                              borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(25)),
                            ),
                            child: const Center(
                                child: Text(
                                  'What was it?',
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                          Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width / 2.1,
                            decoration: const BoxDecoration(
                              color: Color(0xff86898E),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(25),
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(0)),
                            ),
                            child: const Center(
                                child: Text(
                                  'Where was it?',
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                        ],
                      ))
                ],
                rows: List<DataRow>.generate(
                  textValues.length,
                  // Generate rows based on the number of text fields
                      (index) => DataRow(
                    cells: [
                      DataCell(
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2.5,
                                child: TextField(
                                  controller: controllers[index][0], // Use the first column controller
                                  decoration: const InputDecoration(
                                    isDense: true,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                                    ),
                                    hintText: '',
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2.1,
                                child: TextField(
                                  controller: controllers[index][1], // Use the second column controller
                                  decoration: const InputDecoration(
                                    isDense: true,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                                    ),
                                    hintText: '',
                                  ),
                                ),
                              ),

                            ],
                          )

                      )
                      ,
                    ],
                  ),
                ),
              ),
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
                      width: 130,
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
                              controllers.add(List.generate(
                                2, // Number of columns
                                    (_) => TextEditingController(),
                              ));
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
                      width: 130,
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
                              textValues.removeLast();
                              controllers.removeLast();
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
              height: 30,
            ),

            const SizedBox(
              height: 40,
            ),
            Transform.translate(
              offset: const Offset(0, -40),
              child:  DataTable(
                columns: [
                  DataColumn(
                      label: Row(
                        children: [
                          Container(
                            height: 100,
                            width: MediaQuery.of(context).size.width / 1.14,
                            decoration: const BoxDecoration(
                              color: Color(0xff86898E),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(25),
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(25)),
                            ),
                            child: const Center(
                                child: Text(
                                  'Notes',
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                        ],
                      ))
                ],
                rows: List<DataRow>.generate(
                  textValues1.length,
                  // Generate rows based on the number of text fields
                      (index) => DataRow(
                    cells: [
                      DataCell(Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.14,
                            child:  TextField(
                              controller: controllers2[index][0],
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
                            ),
                          ),
                        ],
                      )),
                    ],
                  ),
                ),
              ),
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
                      width: 130,
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
                              // textValues.add(''); // Add an empty value to the list
                              controllers2.add([
                                TextEditingController(),
                                TextEditingController(),
                                TextEditingController(),
                                TextEditingController(),
                                TextEditingController(),
                              ]);
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
                      width: 130,
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
              height: 30,
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
                        Map<String, dynamic> data = {
                          "Type" : "Evidence",
                          "Title" : title.text,
                        };

                        if(title.text == ""){
                          showErrorMessage('Title cannot be empty');

                        }
                        List<Map<String, dynamic>> WhatnWhere = [];
                        List<Map<String, dynamic>> Notes = [];


                        for (int i = 0; i < textValues.length; i++) {
                          var rowControllers = controllers[i];
                          String victim = rowControllers[0].text;
                          String dob = rowControllers[1].text;

                          // Check if both victim and dob are not empty
                          if (victim.isNotEmpty && dob.isNotEmpty) {
                            Map<String, dynamic> rowData = {
                              'What': victim,
                              'Where': dob,
                            };
                            WhatnWhere.add(rowData);

                          }
                          else {
                            // Show SnackBar with error message
                            showErrorMessage('Suspect and DOB fields cannot be empty');
                            return; // Stop further processing
                          }
                        }

                        for (int i = 0; i < textValues1.length; i++) {
                          var rowControllers = controllers2[i];
                          String partOne = rowControllers[0].text;

                          if (partOne.isNotEmpty) {
                            Map<String, dynamic> rowDataa = {
                              'Notes ${i+1}': partOne,
                            };
                            Notes.add(rowDataa);

                          } else {
                            // Show SnackBar with error message
                            showErrorMessage('Field values cannot be empty');
                            return; // Stop further processing
                          }
                        }
                          data['WhatnWhere'] = WhatnWhere;
                          data['Notes'] = Notes;
                          CollectionReference casesCollection = FirebaseFirestore.instance.collection('Cases');


                          DocumentReference newCaseRef = casesCollection.doc(id).collection('Allcaes').doc();
                          newCaseRef.set(data).then((value) {
                            Navigator.push(context,MaterialPageRoute(builder: (context) =>  AllCases(id: id,)),
                            );
                          });

                      },
                      child: const Text(
                        'Save',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            )
          ]),
        ]));
  }
  void showErrorMessage(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
