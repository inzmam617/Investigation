import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:crime_investigation/notebook.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../AllCasesPage.dart';
import '../BottomBarPage/BottomBarPage.dart';

class BaseLinePage extends StatefulWidget {
  final String? FolderName;
  final String? Title;
  final String? startingpoint;
  final String? dsitanceAtoB;
  final String? Edited;
  final String? id;
  final List<dynamic>? Marker;
  final List<dynamic>? Direction;
  final List<dynamic>? onestM;
  final List<dynamic>? twostM;
  final List<dynamic>? DirectionofBase;

  const BaseLinePage(
      {Key? key,
      this.Title,
      this.Edited,
      this.id,
      this.Marker,
      this.Direction,
      this.onestM,
      this.twostM,
      this.DirectionofBase, this.startingpoint, this.dsitanceAtoB, this.FolderName})
      : super(key: key);

  @override
  State<BaseLinePage> createState() => _BaseLinePageState();
}

class _BaseLinePageState extends State<BaseLinePage> {
  List<List<TextEditingController>> controllers = [];
  TextEditingController title =TextEditingController();
  TextEditingController startingpoint =TextEditingController();
  TextEditingController dsitanceAtoB =TextEditingController();
  TextEditingController CaseTitle = TextEditingController();

  @override
  void initState() {
    super.initState();
    initialize();
    List? markerItems = widget.Marker;
    List? directionItems = widget.Direction;
    List? onestMItems = widget.onestM;
    List? twostMItems = widget.twostM;
    List? DirectionofBaseItems = widget.DirectionofBase;
    print("this is marker${markerItems}");
    title.text = widget.Title ?? '';
    startingpoint.text = widget.startingpoint ?? '';
    dsitanceAtoB.text = widget.dsitanceAtoB ?? '';

    widget.Edited == "true" ?  setState(() {
      if (markerItems != null) {
        for (int i = 0; i < markerItems.length; i++) {
          textValues.add('');
          for (int i = 0; i < textValues.length; i++) {
            controllers.add([
              TextEditingController(),
              TextEditingController(),
              TextEditingController(),
              TextEditingController(),
              TextEditingController(),
            ]);
          }

          if (i < controllers.length && controllers[i].isNotEmpty) {

            String markerValue = markerItems[i].values.first.toString();
            controllers[i][0].text = markerValue;
          }
        }

      }



      //Second
      if (directionItems != null) {
        for (int i = 0; i < directionItems.length; i++) {
          textValues1.add('');
          for (int i = 0; i < textValues.length; i++) {
            controllers.add([
              TextEditingController(),
              TextEditingController(),
              TextEditingController(),
              TextEditingController(),
              TextEditingController(),
            ]);
          }

          if (i < controllers.length && controllers[i].isNotEmpty) {

            String directionalue = directionItems[i].values.first.toString();
            controllers[i][1].text = directionalue;
          }
        }

      }


      //Third
      if (onestMItems != null) {
        for (int i = 0; i < onestMItems.length; i++) {
          textValues2.add('');
          for (int i = 0; i < textValues.length; i++) {
            controllers.add([
              TextEditingController(),
              TextEditingController(),
              TextEditingController(),
              TextEditingController(),
              TextEditingController(),
            ]);
          }

          if (i < controllers.length && controllers[i].isNotEmpty) {

            String directionalue = onestMItems[i].values.first.toString();
            controllers[i][2].text = directionalue;
          }
        }

      }

      //Fourht
      if (DirectionofBaseItems != null) {
        for (int i = 0; i < DirectionofBaseItems.length; i++) {
          textValues3.add('');
          for (int i = 0; i < textValues.length; i++) {
            controllers.add([
              TextEditingController(),
              TextEditingController(),
              TextEditingController(),
              TextEditingController(),
              TextEditingController(),
            ]);
          }

          if (i < controllers.length && controllers[i].isNotEmpty) {

            String directionalue = DirectionofBaseItems[i].values.first.toString();
            controllers[i][3].text = directionalue;
          }
        }

      }


      //fivth
      if (twostMItems != null) {
        for (int i = 0; i < twostMItems.length; i++) {
          textValues4.add('');
          for (int i = 0; i < textValues.length; i++) {
            controllers.add([
              TextEditingController(),
              TextEditingController(),
              TextEditingController(),
              TextEditingController(),
              TextEditingController(),
            ]);
          }

          if (i < controllers.length && controllers[i].isNotEmpty) {

            String directionalue = twostMItems[i].values.first.toString();
            controllers[i][4].text = directionalue;
          }
        }

      }




    }) :
    setState(() {
      textValues.add('');

      textValues1.add('');
      textValues2.add('');
      textValues3.add('');
      textValues4.add('');
      // Add sublists to the controllers list for each row
      for (int i = 0; i < textValues.length; i++) {
        controllers.add([
          TextEditingController(),
          TextEditingController(),
          TextEditingController(),
          TextEditingController(),
          TextEditingController(),
        ]);
      }

      initialize();
    });







  }

  String id = "";

  Future<void> initialize() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    id = prefs.getString("id").toString();
    print(id);
  }
  List<String> textValues = [];
  List<String> textValues1 = [];
  List<String> textValues2 = [];
  List<String> textValues3 = [];
  List<String> textValues4 = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Transform.translate(
                offset: const Offset(0, -25),
                child: Container(
                  height: MediaQuery.of(context).size.height / 3.5,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/watch.png'),
                          alignment: Alignment.centerRight),
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                      )),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 60, right: 80),
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
                                                  bottomLeft:
                                                      Radius.circular(0),
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
                                                  bottomLeft:
                                                      Radius.circular(0),
                                                  topRight:
                                                      Radius.circular(30))))),
                                ),
                                Transform.translate(
                                  offset: const Offset(-75, -28),
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
                                Transform.translate(
                                    offset: const Offset(40, -52),
                                    child: const Text(
                                      'Baseline Measurements',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Color(0xff86898E)),
                                    ))
                              ],
                            ),
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
              const SizedBox(
                height: 30,
              ),
              widget.FolderName == "new"  ?     Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: TextField(
              controller: CaseTitle,

              decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(),
              hintText: '                                  Add Case Name',
              hintStyle: TextStyle(fontSize: 14),
              border: UnderlineInputBorder()),
              ),
              ) : const SizedBox.shrink(),

              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: TextField(
                  controller: startingpoint,
                  decoration: InputDecoration(
                      label: Row(children: const [
                        Text(
                          ('Starting location on point :'),
                          style: TextStyle(fontSize: 12),
                        ),
                      ]),
                      border: const UnderlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: TextField(
                  controller: dsitanceAtoB,

                  decoration: InputDecoration(
                      label: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(children: const [
                          Text(
                            ('Distance from starting location point to point A :'),
                            style: TextStyle(fontSize: 12),
                          ),
                        ]),
                      ),
                      border: const UnderlineInputBorder()),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Column(children: [
            DataTable(
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
                        'Marker # / item',
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
                    DataCell(Row(
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.14,
                          child: TextField(
                            controller: controllers[index][0],
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
                              textValues
                                  .add(''); // Add an empty value to the list
                              controllers.add([
                                TextEditingController(),
                                TextEditingController(),
                                TextEditingController(),
                                TextEditingController(),
                                TextEditingController(),
                              ]); // Add corresponding TextEditingController instances to the controllers list
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
                              textValues
                                  .remove(''); // Add an empty value to the list
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
            Column(children: [
              const SizedBox(
                height: 30,
              ),
              DataTable(
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
                          'Direction',
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
                            width: MediaQuery.of(context).size.width / 1.14,
                            child: TextField(
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
                            ),
                          ),
                        ],
                      )),
                    ],
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
                                textValues1
                                    .add(''); // Add an empty value to the list
                                controllers.add([
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
                height: 50,
              ),
              DataTable(
                columns: [
                  DataColumn(
                      label: Row(
                    children: [
                      Transform.translate(
                        offset: const Offset(0, 0),
                        child: Container(
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
                            'Ist Measurement',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                    ],
                  ))
                ],
                rows: List<DataRow>.generate(
                  textValues2.length,
                  (index) => DataRow(
                    cells: [
                      DataCell(Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.14,
                            child: TextField(
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
                            ),
                          ),
                        ],
                      )),
                    ],
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
                                textValues2
                                    .add(''); // Add an empty value to the list
                                controllers.add([
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
                                textValues2.remove(
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
              DataTable(
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
                          'Direction of Baseline',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ],
                  ))
                ],
                rows: List<DataRow>.generate(
                  textValues3.length,
                  // Generate rows based on the number of text fields
                  (index) => DataRow(
                    cells: [
                      DataCell(Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.14,
                            child: TextField(
                              controller: controllers[index][3],
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
                                textValues3
                                    .add(''); // Add an empty value to the list
                                controllers.add([
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
                                textValues3.remove(
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
              Column(
                children: [
                  DataTable(
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
                              '2nd Measurement',
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                        ],
                      ))
                    ],
                    rows: List<DataRow>.generate(
                      textValues4.length,
                      // Generate rows based on the number of text fields
                      (index) => DataRow(
                        cells: [
                          DataCell(Row(
                            children: <Widget>[
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.14,
                                child: TextField(
                                  controller: controllers[index][4],
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
                            ],
                          )),
                        ],
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
                                    textValues4.add(
                                        ''); // Add an empty value to the list
                                    controllers.add([
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
                                    textValues4.remove(
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
                  widget.Edited != "true" ?  SizedBox(
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
                  ):
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
              )
            ])
          ])
        ]));
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
    Map<String, dynamic> data = {
      "Type": "BaseLine",
      "Title": title.text,
      "startingPoint": startingpoint.text,
      "DistanceAtoB": dsitanceAtoB.text,

    };
    if (CaseTitle.text == "") {
      showErrorMessage('Title cannot be empty');
    }
    List<Map<String, dynamic>> markerItem = [];
    List<Map<String, dynamic>> direction = [];
    List<Map<String, dynamic>> FirstMeasurement = [];
    List<Map<String, dynamic>> DirectionBaseline = [];
    List<Map<String, dynamic>> SecondMeasurement = [];

    for (int i = 0; i < textValues.length; i++) {
      var rowControllers = controllers[i];
      String partOne = rowControllers[0].text;

      // if (partOne.isNotEmpty) {
        Map<String, dynamic> rowDataa = {
          'markerItem ${i + 1}': partOne,
        };
        markerItem.add(rowDataa);
      // } else {
      //   // Show SnackBar with error message
      //   showErrorMessage(
      //       'Field values cannot be empty');
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

    for (int i = 0; i < textValues1.length; i++) {
      var rowControllers = controllers[i];
      String partOne = rowControllers[1].text;

      // if (partOne.isNotEmpty) {
        Map<String, dynamic> rowData = {
          'Direction ${i + 1}': partOne,
        };
        direction.add(rowData);
      // } else {
      //   // Show SnackBar with error message
      //   showErrorMessage(
      //       'Field values cannot be empty');
      //   return; // Stop further processing
      // }
    }

    for (int i = 0; i < textValues2.length; i++) {
      var rowControllers = controllers[i];
      String partOne = rowControllers[2].text;

      // if (partOne.isNotEmpty) {
        Map<String, dynamic> rowDataa = {
          'Measurement ${i + 1}': partOne,
        };
        FirstMeasurement.add(rowDataa);
      // } else {
      //   // Show SnackBar with error message
      //   showErrorMessage(
      //       'Field values cannot be empty');
      //   return; // Stop further processing
      // }
    }

    for (int i = 0; i < textValues3.length; i++) {
      var rowControllers = controllers[i];
      String partOne = rowControllers[3].text;

      // if (partOne.isNotEmpty) {
        Map<String, dynamic> rowDataa = {
          'DirectionofBaseline ${i + 1}': partOne,
        };
        DirectionBaseline.add(rowDataa);
      // } else {
      //   // Show SnackBar with error message
      //   showErrorMessage(
      //       'Field values cannot be empty');
      //   return; // Stop further processing
      // }
    }

    for (int i = 0; i < textValues4.length; i++) {
      var rowControllers = controllers[i];
      String partOne = rowControllers[4].text;

      // if (partOne.isNotEmpty) {
        Map<String, dynamic> rowDataa = {
          'SecondMeasurement ${i + 1}': partOne,
        };
        SecondMeasurement.add(rowDataa);
      // } else {
      //   // Show SnackBar with error message
      //   showErrorMessage(
      //       'Field values cannot be empty');
      //   return; // Stop further processing
      // }
    }

    CollectionReference casesCollection = FirebaseFirestore.instance.collection('Cases');
    CollectionReference newCaseRef = casesCollection.doc(id).collection("AllFolders");
    if (widget.FolderName == "new") {
      newCaseRef.add({"Name": CaseTitle.text,}).then((value) {
        print("Creating New CaseName");

      }).catchError((error) {
        // Handle the error if folder name couldn't be added
        print("Error adding folder name: $error");
      });
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
      data['markerItem'] = markerItem;
      data['direction'] = direction;
      data['FirstMeasurement'] = FirstMeasurement;
      data['DirectionBaseline'] = DirectionBaseline;
      data['SecondMeasurement'] = SecondMeasurement;
      data['docId'] = newCaseRef.id;
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
    }
    else{
      data['markerItem'] = markerItem;
      data['direction'] = direction;
      data['FirstMeasurement'] = FirstMeasurement;
      data['DirectionBaseline'] = DirectionBaseline;
      data['SecondMeasurement'] = SecondMeasurement;
      data['docId'] = newCaseRef.id;
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
