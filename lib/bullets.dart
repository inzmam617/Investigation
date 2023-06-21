import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:crime_investigation/body.dart';
import 'package:crime_investigation/notebook.dart';
import 'package:crime_investigation/UploadCases/SceneMeasurementPage.dart';

class bullets extends StatefulWidget {
  const bullets({Key? key}) : super(key: key);

  @override
  State<bullets> createState() => _bulletsState();
}

class _bulletsState extends State<bullets> {
  void initState(){
    super.initState();
    setState(() {
      textValues.add('');
      textValues1.add('');
      textValues2.add('');
      textValues3.add('');
      textValues4.add('');
      textValues5.add('');
      textValues6.add('');
    });
    setState(() {

    });
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
                offset: Offset(0, 10),
                child: SvgPicture.asset('assets/Component 12 – 1.svg'),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Transform.translate(
                offset: Offset(0, -20),
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
                  offset: Offset(0, 10),
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
                    offset: Offset(0, -25),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 3.5,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/watch.png'),alignment: Alignment.centerRight,),
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 60, right: 130),
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
                                    offset: Offset(-45, -28),
                                    child: SizedBox(
                                      height: 26,
                                      width: 26,
                                      child: InkWell(onTap:() {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) =>notebook()),
                                        );
                                      },
                                        child: CircleAvatar(
                                          backgroundColor: Colors.black,
                                          child: InkWell(onTap:() {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) =>notebook()),
                                            );
                                          },
                                            child: Icon(
                                                Icons.arrow_back_ios_new_outlined,
                                                size: 16),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Transform.translate(
                                      offset: Offset(40, -52),
                                      child: Text(
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
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: TextField(
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(),
                          hintText: '                                  Add Title',
                          hintStyle: TextStyle(fontSize: 14),
                          border: UnderlineInputBorder()),
                    ),
                  ),
                  SizedBox(height: 30,),

                ],
              ),


              Column(
                children: [
                  Column(
                    children: [
                      DataTable(
                        columns: [
                          DataColumn(
                              label: Row(
                                children: [
                                  Container(
                                    height: 100,
                                    width: MediaQuery.of(context).size.width /1.14,
                                    decoration: BoxDecoration(
                                      color: Color(0xff86898E),
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(25),
                                          bottomLeft: Radius.circular(0),
                                          bottomRight: Radius.circular(0),
                                          topLeft: Radius.circular(25)),
                                    ),
                                    child: Center(
                                        child: Text(
                                          'Hole#',
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
                                  Container(
                                    width: MediaQuery.of(context).size.width / 1.14,
                                    child: TextField(
                                      decoration: InputDecoration(
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
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: 30,
                            child: Container(
                              decoration: BoxDecoration(
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
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                topLeft: Radius.circular(20),
                                                bottomRight: Radius.circular(20),
                                                topRight: Radius.circular(20)))),
                                    onPressed: () {
                                      setState(() {
                                        textValues.add(
                                            ''); // Add an empty value to the list
                                      });
                                    },
                                    child: Text(
                                      'Add',
                                      style: TextStyle(color: Colors.black),
                                    )),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: Container(
                              decoration: BoxDecoration(
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
                                        shape: RoundedRectangleBorder(
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
                                    child: Text(
                                      'Delete',
                                      style: TextStyle(color: Colors.black),
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 30,
                        child: Container(
                          decoration: BoxDecoration(
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
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            topLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20),
                                            topRight: Radius.circular(20)))),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => notebook()),
                                  );
                                },
                                child: Text(
                                  'Save',
                                )),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
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
                                        width: MediaQuery.of(context).size.width /1.14,
                                        decoration: BoxDecoration(
                                          color: Color(0xff86898E),
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(25),
                                              bottomLeft: Radius.circular(0),
                                              bottomRight: Radius.circular(0),
                                              topLeft: Radius.circular(25)),
                                        ),
                                        child: Center(
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
                              // Generate rows based on the number of text fields
                                  (index) => DataRow(
                                cells: [
                                  DataCell(Row(
                                    children: <Widget>[
                                      Container(
                                        width: MediaQuery.of(context).size.width / 1.14,
                                        child: TextField(
                                          decoration: InputDecoration(
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
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                height: 30,
                                child: Container(
                                  decoration: BoxDecoration(
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
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft: Radius.circular(20),
                                                    topLeft: Radius.circular(20),
                                                    bottomRight: Radius.circular(20),
                                                    topRight: Radius.circular(20)))),
                                        onPressed: () {
                                          setState(() {
                                            textValues1.add(
                                                ''); // Add an empty value to the list
                                          });
                                        },
                                        child: Text(
                                          'Add',
                                          style: TextStyle(color: Colors.black),
                                        )),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                                child: Container(
                                  decoration: BoxDecoration(
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
                                            shape: RoundedRectangleBorder(
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
                                        child: Text(
                                          'Delete',
                                          style: TextStyle(color: Colors.black),
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 30,
                            child: Container(
                              decoration: BoxDecoration(
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
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                topLeft: Radius.circular(20),
                                                bottomRight: Radius.circular(20),
                                                topRight: Radius.circular(20)))),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => notebook()),
                                      );
                                    },
                                    child: Text(
                                      'Save',
                                    )),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
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
                                            width: MediaQuery.of(context).size.width /1.14,
                                            decoration: BoxDecoration(
                                              color: Color(0xff86898E),
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(25),
                                                  bottomLeft: Radius.circular(0),
                                                  bottomRight: Radius.circular(0),
                                                  topLeft: Radius.circular(25)),
                                            ),
                                            child: Center(
                                                child: Text(
                                                  'Height from the Ground',
                                                  style: TextStyle(color: Colors.white),
                                                )),
                                          ),

                                        ],
                                      ))
                                ],
                                rows: List<DataRow>.generate(
                                  textValues2.length,
                                  // Generate rows based on the number of text fields
                                      (index) => DataRow(
                                    cells: [
                                      DataCell(Row(
                                        children: <Widget>[
                                          Container(
                                            width: MediaQuery.of(context).size.width / 1.14,
                                            child: TextField(
                                              decoration: InputDecoration(
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
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    height: 30,
                                    child: Container(
                                      decoration: BoxDecoration(
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
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.only(
                                                        bottomLeft: Radius.circular(20),
                                                        topLeft: Radius.circular(20),
                                                        bottomRight: Radius.circular(20),
                                                        topRight: Radius.circular(20)))),
                                            onPressed: () {
                                              setState(() {
                                                textValues2.add(
                                                    ''); // Add an empty value to the list
                                              });
                                            },
                                            child: Text(
                                              'Add',
                                              style: TextStyle(color: Colors.black),
                                            )),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                    child: Container(
                                      decoration: BoxDecoration(
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
                                                shape: RoundedRectangleBorder(
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
                                            child: Text(
                                              'Delete',
                                              style: TextStyle(color: Colors.black),
                                            )),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 30,
                                child: Container(
                                  decoration: BoxDecoration(
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
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft: Radius.circular(20),
                                                    topLeft: Radius.circular(20),
                                                    bottomRight: Radius.circular(20),
                                                    topRight: Radius.circular(20)))),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => notebook()),
                                          );
                                        },
                                        child: Text(
                                          'Save',
                                        )),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
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
                                                width: MediaQuery.of(context).size.width /1.14,
                                                decoration: BoxDecoration(
                                                  color: Color(0xff86898E),
                                                  borderRadius: BorderRadius.only(
                                                      topRight: Radius.circular(25),
                                                      bottomLeft: Radius.circular(0),
                                                      bottomRight: Radius.circular(0),
                                                      topLeft: Radius.circular(25)),
                                                ),
                                                child: Center(
                                                    child: Text(
                                                      '____of____Side',
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
                                              Container(
                                                width: MediaQuery.of(context).size.width / 1.14,
                                                child: TextField(
                                                  decoration: InputDecoration(
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
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(
                                        height: 30,
                                        child: Container(
                                          decoration: BoxDecoration(
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
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.only(
                                                            bottomLeft: Radius.circular(20),
                                                            topLeft: Radius.circular(20),
                                                            bottomRight: Radius.circular(20),
                                                            topRight: Radius.circular(20)))),
                                                onPressed: () {
                                                  setState(() {
                                                    textValues3.add(
                                                        ''); // Add an empty value to the list
                                                  });
                                                },
                                                child: Text(
                                                  'Add',
                                                  style: TextStyle(color: Colors.black),
                                                )),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                        child: Container(
                                          decoration: BoxDecoration(
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
                                                    shape: RoundedRectangleBorder(
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
                                                child: Text(
                                                  'Delete',
                                                  style: TextStyle(color: Colors.black),
                                                )),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    height: 30,
                                    child: Container(
                                      decoration: BoxDecoration(
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
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.only(
                                                        bottomLeft: Radius.circular(20),
                                                        topLeft: Radius.circular(20),
                                                        bottomRight: Radius.circular(20),
                                                        topRight: Radius.circular(20)))),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => notebook()),
                                              );
                                            },
                                            child: Text(
                                              'Save',
                                            )),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
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
                                                    width: MediaQuery.of(context).size.width /1.14,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xff86898E),
                                                      borderRadius: BorderRadius.only(
                                                          topRight: Radius.circular(25),
                                                          bottomLeft: Radius.circular(0),
                                                          bottomRight: Radius.circular(0),
                                                          topLeft: Radius.circular(25)),
                                                    ),
                                                    child: Center(
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
                                                  Container(
                                                    width: MediaQuery.of(context).size.width / 1.14,
                                                    child: TextField(
                                                      decoration: InputDecoration(
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
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          SizedBox(
                                            height: 30,
                                            child: Container(
                                              decoration: BoxDecoration(
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
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.only(
                                                                bottomLeft: Radius.circular(20),
                                                                topLeft: Radius.circular(20),
                                                                bottomRight: Radius.circular(20),
                                                                topRight: Radius.circular(20)))),
                                                    onPressed: () {
                                                      setState(() {
                                                        textValues4.add(
                                                            ''); // Add an empty value to the list
                                                      });
                                                    },
                                                    child: Text(
                                                      'Add',
                                                      style: TextStyle(color: Colors.black),
                                                    )),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 30,
                                            child: Container(
                                              decoration: BoxDecoration(
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
                                                        shape: RoundedRectangleBorder(
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
                                                    child: Text(
                                                      'Delete',
                                                      style: TextStyle(color: Colors.black),
                                                    )),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        child: Container(
                                          decoration: BoxDecoration(
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
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.only(
                                                            bottomLeft: Radius.circular(20),
                                                            topLeft: Radius.circular(20),
                                                            bottomRight: Radius.circular(20),
                                                            topRight: Radius.circular(20)))),
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => notebook()),
                                                  );
                                                },
                                                child: Text(
                                                  'Save',
                                                )),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
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
                                                        width: MediaQuery.of(context).size.width /1.14,
                                                        decoration: BoxDecoration(
                                                          color: Color(0xff86898E),
                                                          borderRadius: BorderRadius.only(
                                                              topRight: Radius.circular(25),
                                                              bottomLeft: Radius.circular(0),
                                                              bottomRight: Radius.circular(0),
                                                              topLeft: Radius.circular(25)),
                                                        ),
                                                        child: Center(
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
                                              // Generate rows based on the number of text fields
                                                  (index) => DataRow(
                                                cells: [
                                                  DataCell(Row(
                                                    children: <Widget>[
                                                      Container(
                                                        width: MediaQuery.of(context).size.width / 1.14,
                                                        child: TextField(
                                                          decoration: InputDecoration(
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
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              SizedBox(
                                                height: 30,
                                                child: Container(
                                                  decoration: BoxDecoration(
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
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.only(
                                                                    bottomLeft: Radius.circular(20),
                                                                    topLeft: Radius.circular(20),
                                                                    bottomRight: Radius.circular(20),
                                                                    topRight: Radius.circular(20)))),
                                                        onPressed: () {
                                                          setState(() {
                                                            textValues5.add(
                                                                ''); // Add an empty value to the list
                                                          });
                                                        },
                                                        child: Text(
                                                          'Add',
                                                          style: TextStyle(color: Colors.black),
                                                        )),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 30,
                                                child: Container(
                                                  decoration: BoxDecoration(
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
                                                            shape: RoundedRectangleBorder(
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
                                                        child: Text(
                                                          'Delete',
                                                          style: TextStyle(color: Colors.black),
                                                        )),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          SizedBox(
                                            height: 30,
                                            child: Container(
                                              decoration: BoxDecoration(
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
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.only(
                                                                bottomLeft: Radius.circular(20),
                                                                topLeft: Radius.circular(20),
                                                                bottomRight: Radius.circular(20),
                                                                topRight: Radius.circular(20)))),
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) => notebook()),
                                                      );
                                                    },
                                                    child: Text(
                                                      'Save',
                                                    )),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 30,
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
                                                            width: MediaQuery.of(context).size.width /1.14,
                                                            decoration: BoxDecoration(
                                                              color: Color(0xff86898E),
                                                              borderRadius: BorderRadius.only(
                                                                  topRight: Radius.circular(25),
                                                                  bottomLeft: Radius.circular(0),
                                                                  bottomRight: Radius.circular(0),
                                                                  topLeft: Radius.circular(25)),
                                                            ),
                                                            child: Center(
                                                                child: Text(
                                                                  'Projectile Recovered ? (Y/N)',
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
                                                          Container(
                                                            width: MediaQuery.of(context).size.width / 1.14,
                                                            child: TextField(
                                                              decoration: InputDecoration(
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
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  SizedBox(
                                                    height: 30,
                                                    child: Container(
                                                      decoration: BoxDecoration(
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
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.only(
                                                                        bottomLeft: Radius.circular(20),
                                                                        topLeft: Radius.circular(20),
                                                                        bottomRight: Radius.circular(20),
                                                                        topRight: Radius.circular(20)))),
                                                            onPressed: () {
                                                              setState(() {
                                                                textValues6.add(
                                                                    ''); // Add an empty value to the list
                                                              });
                                                            },
                                                            child: Text(
                                                              'Add',
                                                              style: TextStyle(color: Colors.black),
                                                            )),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 30,
                                                    child: Container(
                                                      decoration: BoxDecoration(
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
                                                                shape: RoundedRectangleBorder(
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
                                                            child: Text(
                                                              'Delete',
                                                              style: TextStyle(color: Colors.black),
                                                            )),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              SizedBox(
                                                height: 30,
                                                child: Container(
                                                  decoration: BoxDecoration(
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
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.only(
                                                                    bottomLeft: Radius.circular(20),
                                                                    topLeft: Radius.circular(20),
                                                                    bottomRight: Radius.circular(20),
                                                                    topRight: Radius.circular(20)))),
                                                        onPressed: () {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) => notebook()),
                                                          );
                                                        },
                                                        child: Text(
                                                          'Save',
                                                        )),
                                                  ),
                                                ),
                                              ),
                           
                      SizedBox(
                        height: 50,
                      ),

                    ],
                  ),
                ],
              ),
            ]
        )
        ]
    )
        ]
    )
        ]
    )
        ]
    )
        ]
    )
        ]
    )
    );
  }
}
