import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:crime_investigation/baseline.dart';
import 'package:crime_investigation/body.dart';
import 'package:crime_investigation/notebook.dart';

import '../AllCasesPage.dart';

class SceneMeasurementPage extends StatefulWidget {
  const SceneMeasurementPage({Key? key}) : super(key: key);

  @override
  State<SceneMeasurementPage> createState() => _SceneMeasurementPageState();
}

class _SceneMeasurementPageState extends State<SceneMeasurementPage> {
  @override
  void initState() {
    super.initState();
    setState(() {
      textValues.add('');

    });

  }



    List<String> textValues = [];
  List<List<String>> tableData = [];
  List<List<String>> errorMessages = [];
  List<List<TextEditingController>> controllers = [];

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
                    child: InkWell(
                      onTap: () {},
                      child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Transform.translate(
                            offset: const Offset(0, 0),
                            child: InkWell(
                              onTap: () {},
                              child: InkWell(
                                onTap: () {},
                                child: const Icon(
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
                offset: const Offset(0, 10),
                child: Image.asset('assets/Iconly-Bold-Setting.png')),
            label: '',
          ),
        ],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          SingleChildScrollView(scrollDirection:Axis.vertical ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.translate(
                  offset: const Offset(0, -25),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 3.7,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/capp.png'),
                            alignment: Alignment.centerRight),
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 80, right: 100),
                      child: Transform.translate(
                        offset: const Offset(-45, 0),
                        child: Align(
                          alignment: Alignment.centerLeft,
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
                                                bottomRight: Radius.circular(30),
                                                topLeft: Radius.circular(0)),
                                            borderSide: BorderSide(
                                              color: Colors.white,
                                            )),
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(0),
                                                bottomRight: Radius.circular(30),
                                                bottomLeft: Radius.circular(0),
                                                topRight: Radius.circular(30))))),
                              ),
                              Transform.translate(
                                offset: const Offset(-60, -28),
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
                                                builder: (context) => const notebook()),
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
                                    'Scene Measurement',
                                    style: TextStyle(
                                        fontSize: 18, color: Color(0xff86898E)),
                                  )),
                            ],
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
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          SingleChildScrollView(scrollDirection: Axis.vertical,
            child: Column(
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
                              color: const Color(0xff86898E),
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(0),
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(25)),
                              border: Border.all()),
                          child: const Center(
                              child: Text(
                            'Room',
                            style: TextStyle(color: Colors.white),
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
                          child: const Center(
                              child: Text(
                            '',
                            style: TextStyle(color: Colors.white),
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
                              child: Transform.translate(
                            offset: const Offset(-60, 0),
                            child: const Text(
                              'Direction',
                              style: TextStyle(color: Colors.white),
                            ),
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
                              width: MediaQuery.of(context).size.width / 3.5,
                              child: TextField(
                                controller: controllers[index][0],
                                decoration: InputDecoration(
                                  isDense: true,
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1.0),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1.0),
                                  ),
                                  hintText: '',
                                  hintStyle: const TextStyle(fontSize: 14),
                                  errorText: errorMessages[index][0], // Show error message
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 3.5,
                              child: TextField(
                                controller: controllers[index][1],
                                decoration: InputDecoration(
                                  isDense: true,
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1.0),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1.0),
                                  ),
                                  hintText: '',
                                  hintStyle: const TextStyle(fontSize: 14),
                                  errorText: errorMessages[index][1], // Show error message
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 3.5,
                              child: TextField(
                                controller: controllers[index][2],
                                decoration: InputDecoration(
                                  isDense: true,
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1.0),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1.0),
                                  ),
                                  hintText: '',
                                  hintStyle: const TextStyle(fontSize: 14),
                                  errorText: errorMessages[index][2], // Show error message
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
                                  textValues.add(
                                      ''); // Add an empty value to the list
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

                              // Clear previous table data and error messages
                              tableData.clear();
                              errorMessages.clear();

                              // Retrieve the values from the text fields and validate
                              for (int i = 0; i < textValues.length; i++) {
                                var rowControllers = controllers[i];
                                List<String> rowData = [
                                  rowControllers[0].text,
                                  rowControllers[1].text,
                                  rowControllers[2].text,
                                ];
                                tableData.add(rowData);

                                // Validate the text fields
                                List<String> rowErrorMessages = [];
                                for (var controller in rowControllers) {
                                  if (controller.text.isEmpty) {
                                    rowErrorMessages.add('Field cannot be empty');
                                  } else {
                                    rowErrorMessages.add("null");
                                  }
                                }
                                errorMessages.add(rowErrorMessages);


                              // Print the table data
                              print(tableData);
                            }
                            // Map<String, dynamic> data = {
                            //   'Title': 'Scene Title',
                            //   'Story': "tory.text",
                            // };
                            // FirebaseFirestore.instance.collection('Cases').doc().set(data).then((value) {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(builder: (context) => const AllCases()),
                            //   );
                            // });
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
          ),
        ],
      ),
    );
  }
}
