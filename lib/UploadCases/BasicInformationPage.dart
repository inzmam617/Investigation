import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:crime_investigation/notebook.dart';

import '../AllCasesPage.dart';

class BasicInformationPage extends StatefulWidget {
  const BasicInformationPage({Key? key}) : super(key: key);

  @override
  State<BasicInformationPage> createState() => _BasicInformationPageState();
}

class _BasicInformationPageState extends State<BasicInformationPage> {
  List<List<TextEditingController>> controllers = [];
  List<List<TextEditingController>> controllers2 = [];


  TextEditingController title = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController Case = TextEditingController();
  TextEditingController Scene = TextEditingController();
  TextEditingController Offense = TextEditingController();
  TextEditingController Address = TextEditingController();
  TextEditingController Csi_ID = TextEditingController();
  TextEditingController Time_arivel = TextEditingController();
  TextEditingController Time_clear_the_call = TextEditingController();
  TextEditingController Time_call_recieved = TextEditingController();
  TextEditingController Primary_detective_ID = TextEditingController();
  TextEditingController Priamry_officer_Deputy_ID = TextEditingController();
  @override
  void initState() {
    super.initState();
    setState(() {
      textValues.add('');
      textValues1.add('');
      textValues.add('');
      textValues1.add('');
      textValues1.add('');
      textValues.add('');
      textValues1.add('');
      textValues.add('');

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
    controllers2 = List.generate(
      textValues1.length,
          (_) => List.generate(
        2, // Number of columns
            (_) => TextEditingController(),
      ),
    );
  }

  DatabaseReference databaseReference = FirebaseDatabase.instance.reference();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
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
                  child: Image.asset('assets/vvv.png')),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Transform.translate(
                  offset: const Offset(0, 10),
                  child: InkWell(onTap: () {
                    Navigator.of(context).pop();

                  },


                      child: Image.asset('assets/Iconly-Bold-Setting.png'))),
              label: '',
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
            height: MediaQuery.of(context).size.height / 4,
            decoration: const BoxDecoration(

                color: Colors.black,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(40))),
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Container(
                    height: 30,
                    width: 140,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30),
                            topRight: Radius.circular(30))),
                  ),
                  Transform.translate(
                    offset: const Offset(-130, 0),
                    child: SizedBox(
                        height: 30,
                        width: 30,
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
                                        builder: (context) => const notebook()),
                                  );
                                },
                                child: const Icon(Icons.arrow_back_ios, size: 14)),
                          ),
                        )),
                  ),
                  Transform.translate(
                    offset: const Offset(-115, 0),
                    child: InkWell(
                      onTap: () {},
                      child: const Text(
                        'Court date',
                      ),
                    ),
                  ),
                  Transform.translate(
                      offset: const Offset(0, 10),
                      child: Image.asset('assets/court.png'))
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 830,
            decoration: const BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 3.5)],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: Column(children: [
              const Padding(
                padding: EdgeInsets.only(left: 40, right: 20),
                child: SizedBox(
                  height: 30,
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        hintText:
                            'Add Title',
                        hintStyle: TextStyle(
                          fontSize: 12,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20)))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 24),
                child: TextField(
                  decoration: InputDecoration(
                      label: Row(children: const [
                        Text('Date:', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                      ]),
                      border: const UnderlineInputBorder()),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 24),
                  child: TextField(
                    decoration: InputDecoration(
                        label: Row(children: const [
                          Text('Case:', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                        ]),
                        border: const UnderlineInputBorder()),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 24),
                    child: TextField(
                      decoration: InputDecoration(
                          label: Row(children: const [
                            Text('Scene:',
                                style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                          ]),
                          border: const UnderlineInputBorder()),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 24),
                      child: TextField(
                        decoration: InputDecoration(
                            label: Row(children: const [
                              Text('Offense',
                                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                            ]),
                            border: const UnderlineInputBorder()),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40, right: 24),
                        child: TextField(
                          decoration: InputDecoration(
                              label: Row(children: const [
                                Text('Address:',
                                    style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                              ]),
                              border: const UnderlineInputBorder()),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 40, right: 24),
                          child: TextField(
                            decoration: InputDecoration(
                                label: Row(children: const [
                                  Text('CSI and ID:',
                                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                                ]),
                                border: const UnderlineInputBorder()),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 40, right: 24),
                            child: TextField(
                              decoration: InputDecoration(
                                  label: Row(children: const [
                                    Text('Time of Arrival:',
                                        style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                                  ]),
                                  border: const UnderlineInputBorder()),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 40, right: 24),
                              child: TextField(
                                decoration: InputDecoration(
                                    label: Row(children: const [
                                      Text('Time I Cleared the Call:',
                                          style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                                    ]),
                                    border: const UnderlineInputBorder()),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 40, right: 24),
                                child: TextField(
                                  decoration: InputDecoration(
                                      label: Row(children: const [
                                        Text('Time Call was Received:',
                                            style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                                      ]),
                                      border: const UnderlineInputBorder()),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 40, right: 24),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          label: Row(children: const [
                                            Text(
                                                'Primary Detective and ID:',
                                                style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                                          ]),
                                          border: const UnderlineInputBorder()),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 40, right: 24),
                                        child: TextField(
                                          decoration: InputDecoration(
                                              label: SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(children: const [
                                                  Text(
                                                      'Primary Officer/Deputy and ID:',
                                                      style: TextStyle(
                                                          fontSize: 14,fontWeight: FontWeight.bold)),
                                                ]),
                                              ),
                                              border:
                                                  const UnderlineInputBorder()),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ])
                          ])
                        ])
                      ])
                    ])
                  ]),
                ])
              ]),
            ]),
          ),
          const SizedBox(
            height: 60,
          ),
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
                          'Victim(s):',
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
                          'DOB',
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
                                  'Suspect(s):',
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
                                  'DOB',
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
                      DataCell(
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2.5,
                                child: TextField(
                                  controller: controllers2[index][0], // Use the first column controller
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
                                  controller: controllers2[index][1], // Use the second column controller
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
                              textValues1.add('');
                              controllers2.add(List.generate(
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
                              textValues1.removeLast();
                              controllers2.removeLast();
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
                        saveTableData();
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
             
        ])));
  }
  void saveTableData() {
    Map<String, dynamic> data = {
      "Type" : "Basic",
      'Title': 'John Doe',
      'Date': 25,
      'Case': 'asd@example.com',
      'Scene': 'asd@example.com',
      'Offense': 'asd@example.com',
      'address': 'asd@exaasdmple.com',
      'CSI_ID': 'johndoe@sdf.com',
      'Time_Arrival': 'johndoe@esdfsdfxample.com',
      'Time_Call_Received': 'johndsdfoe@example.com',
      'Primary_Detective_Id': 'f@example.com',
      'Primary_Officer/Deputy_Id': 'adfsdf@example.com',
    };

    List<Map<String, dynamic>> victimsData = [];
    List<Map<String, dynamic>> suspectData = [];


    for (int i = 0; i < textValues.length; i++) {
      var rowControllers = controllers[i];
      String victim = rowControllers[0].text;
      String dob = rowControllers[1].text;

      // Check if both victim and dob are not empty
      if (victim.isNotEmpty && dob.isNotEmpty) {
        Map<String, dynamic> rowData = {
          'Victim': victim,
          'DOB': dob,
        };
        victimsData.add(rowData);
      }
      else {
        // Show SnackBar with error message
        showErrorMessage('Suspect and DOB fields cannot be empty');
        return; // Stop further processing
      }
    }
    for (int i = 0; i < textValues.length; i++) {
      var rowControllers = controllers2[i];
      String suspect = rowControllers[0].text;
      String dob = rowControllers[1].text;

      if (suspect.isNotEmpty && dob.isNotEmpty) {
        Map<String, dynamic> rowData = {
          'Suspects': suspect,
          'DOB': dob,
        };
        suspectData.add(rowData);
      }
      else  if(suspect.isEmpty && dob.isEmpty){
        // Show SnackBar with error message
        showErrorMessage('Suspect and DOB fields cannot be empty');
        return; // Stop further processing
      }
    }
    data['Victims'] = victimsData;
    data['Suspects'] = suspectData;
    FirebaseFirestore.instance.collection('Cases').doc().set(data).then((value) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AllCases()),
      );
    });
  }
  void showErrorMessage(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

