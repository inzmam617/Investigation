import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:crime_investigation/notebook.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../BottomBarPage/BottomBarPage.dart';

class BalisticPage extends StatefulWidget {
  final String? FolderName;
  final String? Title;
  final String? Edited;
  final String? id;
  final List<dynamic>? Hole;
  final List<dynamic>? EntryExit;
  final List<dynamic>? HieghtGround;
  final List<dynamic>? ofSide;
  final List<dynamic>? VerticleAngle;
  final List<dynamic>? HorizontalAngle;
  final List<dynamic>? ProjectileRecovered;

  const BalisticPage({Key? key, this.Title, this.Edited, this.id, this.Hole, this.EntryExit, this.HieghtGround, this.ofSide, this.VerticleAngle, this.HorizontalAngle, this.ProjectileRecovered, this.FolderName, }) : super(key: key);

  @override
  State<BalisticPage> createState() => _BalisticPageState();
}

class _BalisticPageState extends State<BalisticPage> {
  List<List<TextEditingController>> controllers = [];
  TextEditingController title = TextEditingController();

  @override
  void initState() {
    super.initState();
    initialize();
    title.text = widget.Title ?? '';

    List? Hole = widget.Hole;
    List? EntryExit = widget.EntryExit;
    List? HieghtGround = widget.HieghtGround;
    List? ofSide = widget.ofSide;
    List? VerticleAngle = widget.VerticleAngle;
    List? HorizontalAngle = widget.HorizontalAngle;
    List? ProjectileRecovered = widget.ProjectileRecovered;

    widget.Edited == "true" ?
    setState(() {
      if (Hole != null) {
        for (int i = 0; i < Hole.length; i++) {
          textValues.add('');
          for (int i = 0; i < textValues.length; i++) {
            controllers.add([
              TextEditingController(),
              TextEditingController(),
              TextEditingController(),
              TextEditingController(),
              TextEditingController(),
              TextEditingController(),
              TextEditingController(),



            ]);
          }

          if (i < controllers.length && controllers[i].isNotEmpty) {

            String markerValue = Hole[i].values.first.toString();
            controllers[i][0].text = markerValue;
          }
        }

      }



      //Second
      if (EntryExit != null) {
        for (int i = 0; i < EntryExit.length; i++) {
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

            String directionalue = EntryExit[i].values.first.toString();
            controllers[i][1].text = directionalue;
          }
        }

      }


      //Third
      if (HieghtGround != null) {
        for (int i = 0; i < HieghtGround.length; i++) {
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

            String directionalue = HieghtGround[i].values.first.toString();
            controllers[i][2].text = directionalue;
          }
        }

      }

      //Fourht
      if (ofSide != null) {
        for (int i = 0; i < ofSide.length; i++) {
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

            String directionalue = ofSide[i].values.first.toString();
            controllers[i][3].text = directionalue;
          }
        }

      }


      //fivth
      if (VerticleAngle != null) {
        for (int i = 0; i < VerticleAngle.length; i++) {
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

            String directionalue = VerticleAngle[i].values.first.toString();
            controllers[i][4].text = directionalue;
          }
        }
        //Sixth
        if (ProjectileRecovered != null) {
          for (int i = 0; i < ProjectileRecovered.length; i++) {
            textValues5.add('');
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

              String directionalue = ProjectileRecovered[i].values.first.toString();
              controllers[i][6].text = directionalue;
            }
          }


        }
        //Seven
        if (HorizontalAngle != null) {
          for (int i = 0; i < HorizontalAngle.length; i++) {
            textValues6.add('');
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

              String directionalue = HorizontalAngle[i].values.first.toString();
              controllers[i][5].text = directionalue;
            }
          }


        }



    }}) :
    setState(() {
      textValues.add('');
      textValues1.add('');
      textValues2.add('');
      textValues3.add('');
      textValues4.add('');
      textValues5.add('');
      textValues6.add('');

      // Add sublists to the controllers list for each row
      for (int i = 0; i < textValues.length; i++) {
        controllers.add([
          TextEditingController(),
          TextEditingController(),
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

// Rest of the code...
  String id = " ";
  Future<void> initialize() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    id =  prefs.getString("id").toString();
    print(id);

  }


  List<String> textValues = [];
  List<String> textValues1 = [];
  List<String> textValues2 = [];
  List<String> textValues3 = [];
  List<String> textValues4 = [];
  List<String> textValues5 = [];
  List<String> textValues6 = [];

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

                      child: const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.add,
                            color: Colors.black,
                            size: 25,
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
                      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/watch.png'),alignment: Alignment.centerRight,),
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 60, right: 130),
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
                                      child: InkWell(onTap:() {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => notebook()),
                                        );
                                      },
                                        child: CircleAvatar(
                                          backgroundColor: Colors.black,
                                          child: InkWell(onTap:() {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => notebook()),
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
                                        'Bullet Holes',
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
                  const SizedBox(height: 30,),

                ],
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
                                    'Hole #',
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
                                  textValues.add(''); // Add an empty value to the list
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
                Column(children: [const SizedBox(height: 30,),
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
                                      'Entry or Exit',
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
                                    textValues1.add(
                                        '');
                                    controllers.add([
                                      TextEditingController(),
                                      TextEditingController(),
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
                              Transform.translate(offset: const Offset(0,0),
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
                                        'Height from the Ground',
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
                                width:
                                MediaQuery.of(context).size.width / 1.14,
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
                                    textValues2.add(
                                        ''); // Add an empty value to the list
                                    controllers.add([
                                      TextEditingController(),
                                      TextEditingController(),
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
                                      '__of__Side',
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
                                width: MediaQuery.of(context).size.width /
                                    1.14,
                                child:  TextField(
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
                                    textValues3.add(
                                        ''); // Add an empty value to the list
                                    controllers.add([
                                      TextEditingController(),
                                      TextEditingController(),
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
                                      'Vertical Angle',
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
                                width: MediaQuery.of(context).size.width /
                                    1.14,
                                child:  TextField(
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
                                      'Horizontal Angle',
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ),
                            ],
                          ))
                    ],
                    rows: List<DataRow>.generate(
                      textValues5.length,
                          (index) => DataRow(
                        cells: [
                          DataCell(Row(
                            children: <Widget>[
                              SizedBox(
                                width: MediaQuery.of(context).size.width /
                                    1.14,
                                child:  TextField(
                                  controller: controllers[index][5],


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
                              borderRadius: BorderRadius.all(Radius.circular(20))),
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
                                    textValues5.add(
                                        ''); // Add an empty value to the list
                                    controllers.add([
                                      TextEditingController(),
                                      TextEditingController(),
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
                                    textValues5.remove(
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
                                      'Projectile Recovered? (Y/N)',
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ),
                            ],
                          ))
                    ],
                    rows: List<DataRow>.generate(
                      textValues6.length,
                      // Generate rows based on the number of text fields
                          (index) => DataRow(
                        cells: [
                          DataCell(Row(
                            children: <Widget>[
                              SizedBox(
                                width: MediaQuery.of(context).size.width /
                                    1.14,
                                child:  TextField(
                                  controller: controllers[index][6],


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
                                  print("object");
                                  print(textValues6.length);
                                  setState(() {
                                    textValues6.add("") ;
                                  });
                                  controllers.add([
                                    TextEditingController(),
                                    TextEditingController(),
                                    TextEditingController(),
                                    TextEditingController(),
                                    TextEditingController(),
                                    TextEditingController(),
                                    TextEditingController(),


                                  ]);


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
                                    textValues6.remove(
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

                  Column(children: [


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
        ]
    )
    );
  }
  void showErrorMessage(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  Future<void> save() async {
    Map<String, dynamic> data = {
      "Type" : "Ballistic",
      "Title" : "Ballistic",
    };

    List<Map<String, dynamic>> Hole = [];
    List<Map<String, dynamic>> EntryorExit = [];
    List<Map<String, dynamic>> HeightfromGround = [];
    List<Map<String, dynamic>> ofSide = [];
    List<Map<String, dynamic>> VerticalAngle = [];
    List<Map<String, dynamic>> HorizontalAngle = [];
    List<Map<String, dynamic>> ProjectileRecovered = [];

    if(title.text == ""){
      showErrorMessage('Title cannot be empty');

    }
    for (int i = 0; i < textValues.length; i++) {
      var rowControllers = controllers[i];
      String partOne = rowControllers[0].text;

      if (partOne.isNotEmpty) {
        Map<String, dynamic> rowDataa = {
          'Hole ${i+1}': partOne,
        };
        Hole.add(rowDataa);
      } else {
        // Show SnackBar with error message
        showErrorMessage('Field values cannot be empty');
        return; // Stop further processing
      }
    }

    for (int i = 0; i < textValues1.length; i++) {
      var rowControllers = controllers[i];
      String partOne = rowControllers[1].text;

      if (partOne.isNotEmpty) {
        Map<String, dynamic> rowData = {
          'EntryExit ${i+1}': partOne,
        };
        EntryorExit.add(rowData);
      } else {
        // Show SnackBar with error message
        showErrorMessage('Field values cannot be empty');
        return; // Stop further processing
      }
    }

    for (int i = 0; i < textValues2.length; i++) {
      var rowControllers = controllers[i];
      String partOne = rowControllers[2].text;

      if (partOne.isNotEmpty) {
        Map<String, dynamic> rowDataa = {
          'Height fromGround ${i+1}': partOne,
        };
        HeightfromGround.add(rowDataa);
      } else {
        // Show SnackBar with error message
        showErrorMessage('Field values cannot be empty');
        return; // Stop further processing
      }
    }
    for (int i = 0; i < textValues3.length; i++) {
      var rowControllers = controllers[i];
      String partOne = rowControllers[3].text;

      if (partOne.isNotEmpty) {
        Map<String, dynamic> rowDataa = {
          'ofSide ${i+1}': partOne,
        };
        ofSide.add(rowDataa);
      } else {
        // Show SnackBar with error message
        showErrorMessage('Field values cannot be empty');
        return; // Stop further processing
      }
    }
    for (int i = 0; i < textValues4.length; i++) {
      var rowControllers = controllers[i];
      String partOne = rowControllers[4].text;

      if (partOne.isNotEmpty) {
        Map<String, dynamic> rowDataa = {
          'VerticalAngle ${i+1}': partOne,
        };
        VerticalAngle.add(rowDataa);
      } else {
        // Show SnackBar with error message
        showErrorMessage('Field values cannot be empty');
        return; // Stop further processing
      }
    }
    for (int i = 0; i < textValues5.length; i++) {
      var rowControllers = controllers[i];
      String partOne = rowControllers[5].text;

      if (partOne.isNotEmpty) {
        Map<String, dynamic> rowDataa = {
          'HorizontalAngle ${i+1}': partOne,
        };
        HorizontalAngle.add(rowDataa);
      } else {
        // Show SnackBar with error message
        showErrorMessage('Field values cannot be empty');
        return; // Stop further processing
      }
    }
    for (int i = 0; i < textValues6.length; i++) {
      var rowControllers = controllers[i];
      String partOne = rowControllers[6].text;

      if (partOne.isNotEmpty) {
        Map<String, dynamic> rowDataa = {
          'ProjectileRecovered ${i+1}': partOne,
        };
        ProjectileRecovered.add(rowDataa);
      } else {
        // Show SnackBar with error message
        showErrorMessage('Field values cannot be empty');
        return; // Stop further processing
      }
    }
    CollectionReference casesCollection = FirebaseFirestore.instance.collection('Cases');
    CollectionReference newCaseRef = casesCollection.doc(id).collection("AllFolders");
    data['Hole'] = Hole;
    data['EntryorExit'] = EntryorExit;
    data['HeightfromGround'] = HeightfromGround;
    data['ofSide'] = ofSide;
    data['VerticalAngle'] = VerticalAngle;
    data['HorizontalAngle'] = HorizontalAngle;
    data['ProjectileRecovered'] = ProjectileRecovered;
    data['docId'] = newCaseRef.id;


// Check if the folder name already exists in the "AllFolders" collection
    bool folderExists = false;
    await newCaseRef
        .where('Name', isEqualTo: widget.FolderName)
        .get()
        .then((querySnapshot) {
      folderExists = querySnapshot.docs.isNotEmpty;
    })
        .catchError((error) {
      print("Error checking folder name: $error");
    });

// If the folder name doesn't exist, add it
    if (!folderExists) {
      newCaseRef.add({"Name": widget.FolderName})
          .then((value) {
        // Folder name added successfully
        print("Folder name added successfully");
      })
          .catchError((error) {
        // Handle the error if folder name couldn't be added
        print("Error adding folder name: $error");
      });
    }

    DocumentReference allCasesCollection = newCaseRef.doc(widget.FolderName).collection("AllCases").doc();
    data['docId'] = allCasesCollection.id;
    allCasesCollection.set(data).then((value) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  BottomBarPage()),
      );
    });
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
}
