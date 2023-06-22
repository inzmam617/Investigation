import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:crime_investigation/UploadCases/BodyMeasurementsPage.dart';
import 'package:crime_investigation/BalisticPage.dart';
import 'package:crime_investigation/notebook.dart';

class evidence extends StatefulWidget {
  const evidence({Key? key}) : super(key: key);

  @override
  State<evidence> createState() => _evidenceState();
}

class _evidenceState extends State<evidence> {
  void initState() {
    super.initState();
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
    setState(() {});
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
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BodyMeasurementsPage()),
                          );
                        },
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Transform.translate(
                              offset: Offset(0, 0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BodyMeasurementsPage()),
                                  );
                                },
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => BodyMeasurementsPage()),
                                    );
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                ),
                              ),
                            )),
                      ),
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
        body: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.translate(
                offset: Offset(0, -25),
                child: Container(
                  height: MediaQuery.of(context).size.height / 3.5,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/Checklist-bro.png'),alignment: Alignment.centerRight),
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60, right: 120),
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
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => notebook()),
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
                                                    notebook()),
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
    decoration: InputDecoration(
    enabledBorder: UnderlineInputBorder(),
    hintText: '                                  Add Title',
    hintStyle: TextStyle(fontSize: 14),
    border: UnderlineInputBorder()),
    ),
    ),
    SizedBox(height: 40,),
]
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
                        width: MediaQuery.of(context).size.width / 2.5,
                        decoration: BoxDecoration(
                          color: Color(0xff86898E),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(0),
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(25)),
                        ),
                        child: Center(
                            child: Text(
                          'What is it?',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                      Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width / 2.1,
                        decoration: BoxDecoration(
                          color: Color(0xff86898E),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(0)),
                        ),
                        child: Center(
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
                      DataCell(Row(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width / 2.5,
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
                          Container(
                            width: MediaQuery.of(context).size.width / 2.1,
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
                height: 20,
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
                              'Notes',
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
                    height: 50,
                  ),
                ],
              ),
            ],
          ),
        ]));
  }
}
