import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:crime_investigation/notebook.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../BottomBarPage/BottomBarPage.dart';

class BodyMeasurementsPage extends StatefulWidget {
  final String?  bodyOneLeft;
  final String?   bodyOneCenter;
  final String?  bodyOneRight;
  final String? bodyTwoLeft;
  final String?   bodyTwoCenter;
  final String?  bodyTwoRight;

  final String? FolderName;
  final String? Edited;
  final String? id;
  final String? Title;
  final List<dynamic>? BodyOne;
  final List<dynamic>? BodyTwo;
  const BodyMeasurementsPage({Key? key, this.Edited, this.id, this.Title, this.BodyOne, this.BodyTwo, this.FolderName, this.bodyOneLeft, this.bodyOneCenter, this.bodyOneRight, this.bodyTwoLeft, this.bodyTwoCenter, this.bodyTwoRight}) : super(key: key);

  @override
  State<BodyMeasurementsPage> createState() => _BodyMeasurementsPageState();
}

class _BodyMeasurementsPageState extends State<BodyMeasurementsPage> {
  List<String> predefinedValues = ['Head', 'Right Hand', 'Left Hand', 'Waist', 'Right Leg', 'Left Leg',];

  TextEditingController CaseTitle = TextEditingController();

  @override
  void initState() {


    super.initState();
    title.text = widget.Title ?? '';
    bodyOneLeft.text = widget.bodyOneLeft ?? '';
    bodyOneCenter.text = widget.bodyOneCenter ?? '';
    bodyOneRight.text = widget.bodyOneRight ?? '';
    bodyTwoLeft.text = widget.bodyTwoLeft ?? '';
    bodyTwoCenter.text = widget.bodyTwoCenter ?? '';
    bodyTwoRight.text = widget.bodyTwoRight ?? '';
    for (int i = 0; i < 6; i++) {
      textValues.add('');
      controllers.add([TextEditingController(), TextEditingController(), TextEditingController()]);
      errorMessages.add(['', '', '']);

      textValues1.add('');
      controllers1.add([TextEditingController(), TextEditingController(), TextEditingController()]);
      errorMessages1.add(['', '', '']);
    }
    for (int i = 0; i < 6; i++) {
      controllers[i][1].text = predefinedValues[i];
    }
    initialize();
    widget.Edited != "true" ? setState(() {

    }) :
    setState(() {
      final int suspectLength = widget.BodyOne?.length ?? 0;
      final int textValuesLength = textValues.length;
      if (suspectLength > textValuesLength) {
        for (int i = 0; i < suspectLength - textValuesLength; i++) {
          textValues.add('');
        }
      }
      controllers = (widget.BodyOne ?? []).map<List<TextEditingController>>((dynamic suspect) {
        List<TextEditingController> rowControllers = [];
        for (int i = 0; i < textValues1.length; i++) {
          String partOne  = suspect['partOne 1'] ?? '';
          String partTwo = suspect['partTwo 2'] ?? '';
          String partThree = suspect['partThree 3'] ?? '';
          TextEditingController partOneC = TextEditingController(text: partOne);
          TextEditingController partTwoC = TextEditingController(text: partTwo);
          TextEditingController partThreeC = TextEditingController(text: partThree);
          rowControllers.add(partOneC);
          rowControllers.add(partTwoC);
          rowControllers.add(partThreeC);
        }
        return rowControllers;
      }).toList();

      final int bodyTwo = widget.BodyTwo?.length ?? 0;
      final int textValues1Length = textValues1.length;
      if (bodyTwo > textValues1Length) {
        for (int i = 0; i < bodyTwo - textValues1Length; i++) {
          textValues1.add('');
        }
      }
      controllers1 = (widget.BodyTwo ?? []).map<List<TextEditingController>>((dynamic suspect) {
        List<TextEditingController> rowControllers = [];
        for (int i = 0; i < textValues1.length; i++) {
          String partOne  = suspect['partOne 1'] ?? '';
          String partTwo = suspect['partTwo 2'] ?? '';
          String partThree = suspect['partThree 3'] ?? '';
          TextEditingController partOneC = TextEditingController(text: partOne);
          TextEditingController partTwoC = TextEditingController(text: partTwo);
          TextEditingController partThreeC = TextEditingController(text: partThree);
          rowControllers.add(partOneC);
          rowControllers.add(partTwoC);
          rowControllers.add(partThreeC);
        }
        return rowControllers;
      }).toList();

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

  TextEditingController title =TextEditingController();
  TextEditingController bodyOneLeft =TextEditingController();
  TextEditingController bodyOneCenter =TextEditingController();
  TextEditingController bodyOneRight =TextEditingController();
  TextEditingController bodyTwoLeft =TextEditingController();
  TextEditingController bodyTwoCenter =TextEditingController();
  TextEditingController bodyTwoRight =TextEditingController();
  List<String> textValues = [];
  List<List<String>> errorMessages = [];
  List<List<TextEditingController>> controllers = [];
  List<String> textValues1 = [];
  List<List<String>> errorMessages1 = [];
  List<List<TextEditingController>> controllers1 = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
                                  enabled: false,
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
                                     Navigator.of(context).pop();
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: Colors.black,
                                      child: const Icon(
                                          Icons.arrow_back_ios_new_outlined,
                                          size: 16),
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
               Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: TextField(
                  controller: title,
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(),
                      hintText: '                                  Add Title',
                      hintStyle: TextStyle(fontSize: 14),
                      border: UnderlineInputBorder()),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              widget.FolderName == "new"  ?          Padding(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: TextField(
                    controller: CaseTitle,
                    decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(),
                    hintText: '                                  Add Case Name',
                    hintStyle: TextStyle(fontSize: 14),
                    border: UnderlineInputBorder()),
                    ),
    ): const SizedBox.shrink(),
              const SizedBox(
                height: 20,
              ),
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
                          child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: TextFormField(
                                    controller: bodyOneLeft,

                                    style: TextStyle(color:Colors.white),
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(10)
                                    ],

                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(color: Colors.white),
                                      hintText: "Left",
                                      border: InputBorder.none
                                      
                                    ),
                                  ),
                                ),
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
                          child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(

                                  child: TextFormField(
                                    controller: bodyOneCenter,

                                    style: TextStyle(color:Colors.white),
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(10)
                                    ],

                                    decoration: InputDecoration(
                                        hintStyle: TextStyle(color: Colors.white),
                                        hintText: "Center",
                                        border: InputBorder.none

                                    ),
                                  ),
                                ),
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
                          child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: TextFormField(
                                    controller: bodyOneRight,


                                    style: TextStyle(color:Colors.white),
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(10)
                                    ],

                                    decoration: InputDecoration(
                                        hintStyle: TextStyle(color: Colors.white),
                                        hintText: "Right",
                                        border: InputBorder.none

                                    ),
                                  ),
                                ),
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
                                readOnly: true,
                                controller: controllers[index][1],
                                decoration:  InputDecoration(
                                  isDense: true,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1.0),
                                  ),
                                  // hintText: predefinedValues[index],
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
                          child:Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: TextFormField(
                                    controller: bodyTwoLeft,

                                    style: TextStyle(color:Colors.white),
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(10)
                                    ],

                                    decoration: InputDecoration(
                                        hintStyle: TextStyle(color: Colors.white),
                                        hintText: "Left",
                                        border: InputBorder.none

                                    ),
                                  ),
                                ),
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
                          child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: TextFormField(
                                    controller: bodyTwoCenter,

                                    style: TextStyle(color:Colors.white),
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(10)
                                    ],

                                    decoration: InputDecoration(
                                        hintStyle: TextStyle(color: Colors.white),
                                        hintText: "Center",
                                        border: InputBorder.none

                                    ),
                                  ),
                                ),
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
                          child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: TextFormField(
                                    controller: bodyTwoRight,

                                    style: const TextStyle(color:Colors.white),
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(10)
                                    ],
                                    decoration: const InputDecoration(
                                        hintStyle: TextStyle(color: Colors.white),
                                        hintText: "Right",
                                        border: InputBorder.none

                                    ),
                                  ),
                                ),
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
                              child: TextField(

                                readOnly: true,

                                controller: controllers[index][1],
                                decoration:  InputDecoration(
                                  isDense: true,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                  // hintText:  predefinedValues[index],
                                ),
                                textAlign: TextAlign.center,
                                // Set the initial value from the predefinedValues list based on the index

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
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     SizedBox(
              //       height: 30,
              //       child: Container(
              //         decoration: const BoxDecoration(
              //             boxShadow: [
              //               BoxShadow(blurRadius: 3.5, color: Colors.grey)
              //             ],
              //             color: Colors.white,
              //             borderRadius: BorderRadius.only(
              //                 topRight: Radius.circular(20),
              //                 bottomRight: Radius.circular(20),
              //                 topLeft: Radius.circular(20),
              //                 bottomLeft: Radius.circular(20))),
              //         child: SizedBox(
              //           width: 140,
              //           child: ElevatedButton(
              //               style: ElevatedButton.styleFrom(
              //                   backgroundColor: Colors.white,
              //                   shape: const RoundedRectangleBorder(
              //                       borderRadius: BorderRadius.only(
              //                           bottomLeft: Radius.circular(20),
              //                           topLeft: Radius.circular(20),
              //                           bottomRight: Radius.circular(20),
              //                           topRight: Radius.circular(20)))),
              //               onPressed: () {
              //                 setState(() {
              //                   textValues1.add('');
              //                   controllers1.add([TextEditingController(), TextEditingController(), TextEditingController()]);
              //                   errorMessages1.add(['', '', '']);
              //                 });
              //               },
              //               child: const Text(
              //                 'Add',
              //                 style: TextStyle(color: Colors.black),
              //               )),
              //         ),
              //       ),
              //     ),
              //     SizedBox(
              //       height: 30,
              //       child: Container(
              //         decoration: const BoxDecoration(
              //             boxShadow: [
              //               BoxShadow(blurRadius: 3.5, color: Colors.grey)
              //             ],
              //             color: Colors.white,
              //             borderRadius: BorderRadius.only(
              //                 topRight: Radius.circular(20),
              //                 bottomRight: Radius.circular(20),
              //                 topLeft: Radius.circular(20),
              //                 bottomLeft: Radius.circular(20))),
              //         child: SizedBox(
              //           width: 140,
              //           child: ElevatedButton(
              //               style: ElevatedButton.styleFrom(
              //                   backgroundColor: Colors.white,
              //                   shape: const RoundedRectangleBorder(
              //                       borderRadius: BorderRadius.only(
              //                           bottomLeft: Radius.circular(20),
              //                           topLeft: Radius.circular(20),
              //                           bottomRight: Radius.circular(20),
              //                           topRight: Radius.circular(20)))),
              //               onPressed: () {
              //                 setState(() {
              //                   textValues1.remove(
              //                       ''); // Add an empty value to the list
              //                 });
              //               },
              //               child: const Text(
              //                 'Delete',
              //                 style: TextStyle(color: Colors.black),
              //               )),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              widget.Edited != "true" ? SizedBox(
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

                          save();


                        },
                        child: const Text(
                          'Save',
                        )),
                  ),
                ),
              ) :
              Padding(
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
                                save();
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
  void delete(){
    CollectionReference casesCollection = FirebaseFirestore.instance.collection('Cases');
    CollectionReference newCaseRef = casesCollection.doc(id).collection("AllFolders");
    DocumentReference allCasesCollection = newCaseRef.doc(widget.FolderName).collection("AllCases").doc(widget.id);
    allCasesCollection.delete().then((value) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  BottomBarPage()),
      );
    });
  }
  Future<void> save() async {
    List<Map<String, dynamic>> BodyOne = [];
    List<Map<String, dynamic>> BodyTwo = [];

    Map<String, dynamic> data = {
      "Type" : "Body",
      "Title" : title.text,
    };
    for (int i = 0; i < textValues.length; i++) {
      var rowControllers = controllers[i];
      String partOne = rowControllers[0].text;
      String partTwo = rowControllers[1].text;
      String partThree = rowControllers[2].text;

      // if (partOne.isNotEmpty  && partThree.isNotEmpty) {
        Map<String, dynamic>  rowDataa = {
          'partOne 1': partOne,
          'partTwo 2': partTwo,
          'partThree 3': partThree,
        };
        BodyOne.add(rowDataa);
      // } else {
      //   // Show SnackBar with error message
      //   print('Field values cannot be empty');
      //   return; // Stop further processing
      // }
    }
    for (int i = 0; i < textValues1.length; i++) {
      var rowControllers = controllers1[i];
      String partOne = rowControllers[0].text;
      String partTwo = rowControllers[1].text;
      String partThree = rowControllers[2].text;

      // if (partOne.isNotEmpty && partThree.isNotEmpty) {
        Map<String, dynamic>  rowDataa = {
          'partOne 1': partOne,
          'partTwo 2': partTwo,
          'partThree 3': partThree,
        };
        BodyTwo.add(rowDataa);
      // } else {
      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     content: Text("Field values cannot be empty"),
      //     duration: Duration(milliseconds: 300),
      //   ));
      //   showErrorMessage('Field values cannot be empty');
      //   return; // Stop further processing
      // }
    }
    if (widget.FolderName == "new") {
      if (CaseTitle.text.isEmpty) {
        showErrorMessage('Case Name cannot be empty');
      } else {
        // Your code if CaseTitle is not empty
      }
    } else {
      // Your code for a different case
    }
    if( title.text.isEmpty){
      showErrorMessage('Title cannot be empty');

    }

    CollectionReference casesCollection = FirebaseFirestore.instance.collection('Cases');
    CollectionReference newCaseRef = casesCollection.doc(id).collection("AllFolders");

    data['bodyOneLeft'] =    bodyOneLeft.text;
    data['bodyOneCenter'] =   bodyOneCenter.text;
    data['bodyOneRight'] =   bodyOneRight.text;
    data['bodyTwoLeft'] =   bodyTwoLeft.text;
    data['bodyTwoCenter'] =   bodyTwoCenter.text;
    data['bodyTwoRight'] =   bodyTwoRight.text;

    print(bodyTwoLeft.text +
        bodyTwoCenter.text+
        bodyTwoRight.text  );
    if (widget.FolderName == "new") {
      if (CaseTitle.text.isEmpty) {
        showErrorMessage('Case Name cannot be empty');
      }else {
        newCaseRef.add({"Name": CaseTitle.text,}).then((value) {
        print("Creating New CaseName");

      }).catchError((error) {
        // Handle the error if folder name couldn't be added
        print("Error adding folder name: $error");
      });
      }
    }else {
      // newCaseRef.add({"Name": widget.FolderName,}).then((value) {
      //   // Folder name added successfully
      //   print("Using  Older CaseName");
      //
      // }).catchError((error) {
      //   // Handle the error if folder name couldn't be added
      //   print("Error adding folder name: $error");
      // });
    }
    if (widget.FolderName == "new") {
      print("new");
      data['BodyOne'] = BodyOne;
      data['BodyTwo'] = BodyTwo;

      print(data);
      DocumentReference allCasesCollection = newCaseRef.doc(CaseTitle.text)
          .collection("AllCases")
          .doc();
      data['docId'] = allCasesCollection.id;
      allCasesCollection.set(data).then((value) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BottomBarPage()),
        );
      });
    }else{
      print("Else");

      data['BodyOne'] = BodyOne;
      data['BodyTwo'] = BodyTwo;
      print(data);
      DocumentReference allCasesCollection = newCaseRef.doc(widget.FolderName)
          .collection("AllCases")
          .doc();
      data['docId'] = allCasesCollection.id;
      allCasesCollection.set(data).then((value) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BottomBarPage()),
        );
      });
    }

  }
}
