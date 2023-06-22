import 'package:crime_investigation/filter.dart';
import 'package:crime_investigation/notebook.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:crime_investigation/UploadCases/BaseLinePage.dart';
import 'package:crime_investigation/UploadCases/BodyMeasurementsPage.dart';
import 'package:crime_investigation/drawning.dart';
import 'package:crime_investigation/AllCasesPage.dart';

class mobile extends StatefulWidget {
  const mobile({Key? key}) : super(key: key);

  @override
  State<mobile> createState() => _mobileState();
}

class _mobileState extends State<mobile> {
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
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => drawning()),
                    );
                  },
                  child: SvgPicture.asset('assets/Component 12 – 1.svg')),
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
                        child: Transform.translate(
                          offset: Offset(0, 0),
                          child: Icon(
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
                offset: Offset(0, 10),
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => drawning()),
                      );
                    },
                    child: Image.asset('assets/Iconly-Bold-Setting.png'))),
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
                  height: MediaQuery.of(context).size.height / 3.3,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/Filter-amico.png'),
                          alignment: Alignment.centerRight),
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60, right: 100),
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
                                offset: Offset(-60, -28),
                                child: SizedBox(
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
                                  offset: Offset(100, -72),
                                  child: Row(
                                    children: [
                                      Image.asset('assets/c.png'),
                                      Text(
                                        'HI!',
                                        style:
                                            TextStyle(color: Color(0xff86898E)),
                                      ),
                                      Text(
                                        'Alishba',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )),
                              Transform.translate(
                                offset: Offset(-40, -60),
                                child: Column(
                                  children: [
                                    Text(
                                      'Mobile',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          fontFamily: 'times new roman'),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '            Pocket Guide',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          fontFamily: 'times new roman'),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 50,width: MediaQuery.of(context).size.width/1.4,
                      child: Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(blurRadius: 3.5, color: Colors.grey)
                            ],
                            color: Colors.grey,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: TextField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(6),
                              label: Text(' Body Measurement'),
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                      topLeft: Radius.circular(20),
                                      bottomLeft: Radius.circular(20)),
                                  borderSide: BorderSide(color: Colors.white)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      topLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                      topRight: Radius.circular(20)))),
                        ),
                      ),
                    ),
                    Container(
                        height: 50,
                        width: 30,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(color: Colors.grey, blurRadius: 3.5)
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10))),
                        child: Transform.scale(
                            scale: 0.6,
                            child:
                            SvgPicture.asset('assets/Iconly-Bold-Search.svg'))),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => filter()),
                        );
                      },
                      child: Transform.translate(offset: Offset(-5,0),
                        child: Container(
                            height: 50,
                            width: 30,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(color: Colors.grey, blurRadius: 3.5)
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    topLeft: Radius.circular(10))),
                            child: Transform.scale(
                                scale: 0.6,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => filter()),
                                    );
                                  },
                                  child: SvgPicture.asset(
                                      'assets/Iconly-Bold-Filter 2.svg'),
                                ))),
                      ),
                    ),
                  ],
                ),
              ),

SizedBox(height: 20,),
              Text('Anarkali Death case body measurement'),
              SizedBox(height: 10,),
            ],
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
                        width: MediaQuery.of(context).size.width / 3.5,
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
                          '',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                      Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width / 3.5,
                        decoration: BoxDecoration(
                          color: Color(0xff86898E),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(0),
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(0)),
                        ),
                        child: Center(
                            child: Text(
                          'Name:____',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                      Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width / 3.5,
                        decoration: BoxDecoration(
                            color: Color(0xff86898E),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(25),
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                                topLeft: Radius.circular(0))),
                        child: Center(
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
                  // Generate rows based on the number of text fields
                  (index) => DataRow(
                    cells: [
                      DataCell(Row(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width / 3.5,
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
                                hintText: '____corner',
                              ),

                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 3.5,
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

                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 3.5,
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
                                hintText: '____corner',
                              ),

                            ),
                          )
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
              SizedBox(height: 20,),
              Text('Feroz Pur Road Death case body measurement'),
              SizedBox(height: 10,)
            ],
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
                        width: MediaQuery.of(context).size.width / 3.5,
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
                          '',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                      Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width / 3.5,
                        decoration: BoxDecoration(
                          color: Color(0xff86898E),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(0),
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(0)),
                        ),
                        child: Center(
                            child: Text(
                          'Name:____',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                      Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width / 3.5,
                        decoration: BoxDecoration(
                            color: Color(0xff86898E),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(25),
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                                topLeft: Radius.circular(0))),
                        child: Center(
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
                  // Generate rows based on the number of text fields
                  (index) => DataRow(
                    cells: [
                      DataCell(Row(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width / 3.5,
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
                                hintText: '____corner',
                              ),

                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 3.5,
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

                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 3.5,
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
                                hintText: '____corner',
                              ),

                            ),
                          )
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
                height: 50,
              ),
            ],
          ),
        ],
        scrollDirection: Axis.vertical,
      ),
    );
  }
}
