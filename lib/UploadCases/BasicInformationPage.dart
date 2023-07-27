import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:crime_investigation/notebook.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../AllCasesPage.dart';
import '../BottomBarPage/BottomBarPage.dart';
import '../Homepage/HomePage.dart';

class BasicInformationPage extends StatefulWidget {
  final String? Edited;
  final String? FolderName;
  final String? id;
  final String? Csid;
  final String? Case;
  final String? Date;
  final String? Offense;
  final String? Primary_detective;
  final String? Primary_Office;
  final String? Scene;
  final String? TimeArrival;
  final String? TimeCall;
  final String? Title;
  final String? address;
  final List<dynamic>? Suspects;
  final List<dynamic>? Victims;
  const BasicInformationPage({
    Key? key,
    this.Csid,
    this.Case,
    this.Date,
    this.Offense,
    this.Primary_detective,
    this.Primary_Office,
    this.Scene,
    this.TimeArrival,
    this.TimeCall,
    this.Title,
    this.address,
    this.Suspects,
    this.Victims,
    this.Edited,
    this.id, this.FolderName,
  }) : super(key: key);

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
  String id = " ";

  Future<void> initialize() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    id = prefs.getString("id").toString();
    print(id);
  }

  @override
  void initState() {
    super.initState();
    initialize();
    print("folder name: ${widget.FolderName!}");

    title.text = widget.Title ?? '';
    date.text = widget.Date ?? '';
    Case.text = widget.Case ?? '';
    Scene.text = widget.Scene ?? '';
    Offense.text = widget.Offense ?? '';
    Address.text = widget.address ?? '';
    Csi_ID.text = widget.Csid ?? '';
    Time_arivel.text = widget.TimeArrival ?? '';
    Time_clear_the_call.text = widget.TimeCall ?? '';
    Time_call_recieved.text = widget.Title ?? '';
    Primary_detective_ID.text = widget.Primary_detective ?? '';
    Priamry_officer_Deputy_ID.text = widget.Primary_Office ?? '';
  print(widget.FolderName);
    setState(() {
      initialize();
    });

    setState(() {
      widget.Edited != "true"
          ? controllers = List.generate(
              textValues1.length,
              (_) => List.generate(
                2, // Number of columns
                (_) => TextEditingController(),
              ),
            )
          : setState(() {
              final int suspectLength = widget.Suspects?.length ?? 0;
              final int textValuesLength = textValues1.length;
              if (suspectLength > textValuesLength) {
                for (int i = 0; i < suspectLength - textValuesLength; i++) {
                  textValues1.add('');
                }
              }
              controllers2 = (widget.Suspects ?? [])
                  .map<List<TextEditingController>>((dynamic suspect) {
                List<TextEditingController> rowControllers = [];
                for (int i = 0; i < textValues1.length; i++) {
                  String Suspectsvalue = suspect['Suspects'] ?? '';
                  String dobvalue = suspect['DOB'] ?? '';
                  TextEditingController Suspectscontroller =
                      TextEditingController(text: Suspectsvalue);
                  TextEditingController DOBcontroller =
                      TextEditingController(text: dobvalue);
                  rowControllers.add(Suspectscontroller);
                  rowControllers.add(DOBcontroller);
                }
                return rowControllers;
              }).toList();
            });
    });

    widget.Edited != "true"
        ? controllers2 = List.generate(
            textValues.length,
            (_) => List.generate(
              2, // Number of columns
              (_) => TextEditingController(),
            ),
          )
        : setState(() {
            final int victimsLength = widget.Victims?.length ?? 0;
            final int textValuesLength = textValues.length;
            if (victimsLength > textValuesLength) {
              for (int i = 0; i < victimsLength - textValuesLength; i++) {
                textValues.add('');
              }
            }
            controllers = (widget.Victims ?? [])
                .map<List<TextEditingController>>((dynamic victim) {
              List<TextEditingController> rowControllers = [];
              for (int i = 0; i < textValues.length; i++) {
                String victimValue = victim['Victim'] ?? '';
                String dobValue = victim['DOB'] ?? '';

                TextEditingController victimController =
                    TextEditingController(text: victimValue);
                TextEditingController dobController =
                    TextEditingController(text: dobValue);

                rowControllers.add(victimController);
                rowControllers.add(dobController);
              }
              return rowControllers;
            }).toList();
          });

    print(widget.Victims);
  }

  DatabaseReference databaseReference = FirebaseDatabase.instance.reference();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<String> textValues = [];
  List<String> textValues1 = [];
bool _loading =false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
        inAsyncCall: _loading,
      child: Scaffold(
          body: SingleChildScrollView(
              child: Column(children: [
        Container(
          height: MediaQuery.of(context).size.height / 4,
          decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40))),
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 30,
                    width: 180,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      
                      children: const [
                        SizedBox(
                            height: 30,
                            width: 30,
                            child: CircleAvatar(
                              backgroundColor: Colors.black,
                              child: Icon(Icons.arrow_back_ios, size: 14),
                            )),
                        SizedBox(width:10),
                        Text(
                          'Basic Information',
                        ),
                      ]
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
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 20),
              child: SizedBox(
                height: 30,
                child: TextField(
                  controller: title,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: 'Add Title',
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
                controller: date,
                decoration: InputDecoration(
                    label: Row(children: const [
                      Text('Date:',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
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
                  controller: Case,
                  decoration: InputDecoration(
                      label: Row(children: const [
                        Text('Case:',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
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
                    controller: Scene,
                    decoration: InputDecoration(
                        label: Row(children: const [
                          Text('Scene:',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
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
                      controller: Offense,
                      decoration: InputDecoration(
                          label: Row(children: const [
                            Text('Offense',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
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
                        controller: Address,
                        decoration: InputDecoration(
                            label: Row(children: const [
                              Text('Address:',
                                  style: TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.bold)),
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
                          controller: Csi_ID,
                          decoration: InputDecoration(
                              label: Row(children: const [
                                Text('CSI and ID:',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
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
                            controller: Time_arivel,
                            decoration: InputDecoration(
                                label: Row(children: const [
                                  Text('Time of Arrival:',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold)),
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
                              controller: Time_clear_the_call,
                              decoration: InputDecoration(
                                  label: Row(children: const [
                                    Text('Time I Cleared the Call:',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold)),
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
                                controller: Time_call_recieved,
                                decoration: InputDecoration(
                                    label: Row(children: const [
                                      Text('Time Call was Received:',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold)),
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
                                  padding:
                                      const EdgeInsets.only(left: 40, right: 24),
                                  child: TextField(
                                    controller: Primary_detective_ID,
                                    decoration: InputDecoration(
                                        label: Row(children: const [
                                          Text('Primary Detective and ID:',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold)),
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
                                        controller: Priamry_officer_Deputy_ID,
                                        decoration: InputDecoration(
                                            label: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(children: const [
                                                Text(
                                                    'Primary Officer/Deputy and ID:',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ]),
                                            ),
                                            border: const UnderlineInputBorder()),
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
                            ),
                          ),
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
                              topLeft: Radius.circular(0),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'DOB',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
                rows: List<DataRow>.generate(
                  textValues.length,
                  (index) => DataRow(
                    cells: [
                      DataCell(
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: TextField(
                                controller: controllers[index][0],
                                // Use the first column controller
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
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2.1,
                              child: TextField(
                                controller: controllers[index][1],
                                // Use the second column controller
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
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 30,
                child: Container(
                  decoration: const BoxDecoration(
                      boxShadow: [BoxShadow(blurRadius: 3.5, color: Colors.grey)],
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
                      boxShadow: [BoxShadow(blurRadius: 3.5, color: Colors.grey)],
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
                    DataCell(Row(
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: TextField(
                            controller: controllers2[index][0],
                            // Use the first column controller
                            decoration: const InputDecoration(
                              isDense: true,
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1.0),
                              ),
                              hintText: '',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.1,
                          child: TextField(
                            controller: controllers2[index][1],
                            // Use the second column controller
                            decoration: const InputDecoration(
                              isDense: true,
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1.0),
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
                      boxShadow: [BoxShadow(blurRadius: 3.5, color: Colors.grey)],
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
                      boxShadow: [BoxShadow(blurRadius: 3.5, color: Colors.grey)],
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
          widget.Edited != "true"
              ? SizedBox(
                  height: 30,
                  child: Container(
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(blurRadius: 3.5, color: Colors.grey)
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
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
                )
              : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 30,
                        child: Container(
                          decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(blurRadius: 3.5, color: Colors.grey)
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20))),
                          child: SizedBox(
                            width: 150,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            topLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20),
                                            topRight: Radius.circular(20)))),
                                onPressed: ()  {
                                  delete();
                                  saveTableData();
                                },
                                child: const Text(
                                  'Update',
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                        ),
                      ),
                    const SizedBox(width: 20,),
                    SizedBox(
                      
                      
                        height: 30,
                        child: Container(
                          decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(blurRadius: 3.5, color: Colors.grey)
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20))),
                          child: SizedBox(
                            width: 150,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            topLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20),
                                            topRight: Radius.circular(20)))),
                                onPressed: ()  {
                                  delete();
                                },
                                child: const Text(
                                  'Delete',
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
          const SizedBox(
            height: 60,
          )
        ]),
      ]))),
    );
  }

  Future<void> saveTableData() async {
    setState(() {
      _loading = true;
    });
    Map<String, dynamic> data = {
      "Type": "Basic",
      'Title': title.text,
      'Date': date.text,
      'Case': Case.text,
      'Scene': Scene.text,
      'Offense': Offense.text,
      'address': Address.text,
      'CSI_ID': Csi_ID.text,
      'Time_Arrival': Time_arivel.text,
      'Time_Call_Received': Time_clear_the_call.text,
      'Primary_Detective_Id': Time_call_recieved.text,
      'Primary_Officer/Deputy_Id': Primary_detective_ID.text,
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
      } else {
        // Show SnackBar with error message
        setState(() {
          _loading = false;
        });
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
      } else if (suspect.isEmpty && dob.isEmpty) {
        setState(() {
          _loading = false;
        });
        // Show SnackBar with error message
        showErrorMessage('Suspect and DOB fields cannot be empty');
        return; // Stop further processing
      }
    }
    print("this is the original folder Name: ${widget.FolderName!}");
    CollectionReference casesCollection = FirebaseFirestore.instance.collection('Cases');
    CollectionReference newCaseRef = casesCollection.doc(id).collection("AllFolders");

    bool folderExists = false;
    await newCaseRef
        .where('Name', isEqualTo: widget.FolderName)
        .get()
        .then((querySnapshot) {
      folderExists = querySnapshot.docs.isNotEmpty;
      print("the folder already exists: $folderExists");
      // If the folder name doesn't exist, add it
      if (!folderExists) {
        print("the folder does not exist, adding...");

        newCaseRef.add({"Name": widget.FolderName , }).then((value) {
          // Folder name added successfully
          print("Folder name added successfully");
        }).catchError((error) {
          // Handle the error if folder name couldn't be added
          print("Error adding folder name: $error");
        });
      }
    }).catchError((error) {
      print("Error checking folder name: $error");
    });
    DocumentReference allCasesCollection = newCaseRef.doc(widget.FolderName).collection("AllCases").doc();
    data['docId'] = allCasesCollection.id;
    data['Victims'] = victimsData;
    data['Suspects'] = suspectData;
    print(newCaseRef.doc(widget.FolderName).collection("AllCases"));
    allCasesCollection.set(data).then((value) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  BottomBarPage(page: 1,)),
      );
    });
    setState(() {
      _loading = false;
    });
  }


  void delete(){
    setState(() {
      _loading = true;
    });
    CollectionReference casesCollection = FirebaseFirestore.instance.collection('Cases');
    CollectionReference newCaseRef = casesCollection.doc(id).collection("AllFolders");
    DocumentReference allCasesCollection = newCaseRef.doc(widget.FolderName).collection("AllCases").doc(widget.id);
    allCasesCollection.delete().then((value) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottomBarPage()),
      );
    });
    setState(() {
      _loading = false;
    });
  }
  void showErrorMessage(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
