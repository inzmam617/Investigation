import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:crime_investigation/UploadCases/BodyMeasurementsPage.dart';
import 'package:crime_investigation/UploadCases/BalisticPage.dart';
import 'package:crime_investigation/notebook.dart';

class evidence extends StatefulWidget {
  const evidence({Key? key}) : super(key: key);

  @override
  State<evidence> createState() => _evidenceState();
}

class _evidenceState extends State<evidence> {
  List<List<TextEditingController>> controllers = [];

  @override
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
      for (int i = 0; i < textValues1.length; i++) {
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
      controllers = List.generate(
        textValues.length,
            (_) => List.generate(
          2, // Number of columns
              (_) => TextEditingController(),
        ),
      );
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
    const SizedBox(height: 40,),
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
              SizedBox(height: 20,),
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const notebook()),
                              );
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
        ]));
  }
}
