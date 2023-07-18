import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:crime_investigation/UploadCases/BaseLinePage.dart';
import 'package:crime_investigation/UploadCases/BodyMeasurementsPage.dart';
import 'package:crime_investigation/notebook.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../AllCasesPage.dart';
import '../BottomBarPage/BottomBarPage.dart';

class SceneMeasurementPage extends StatefulWidget {
  final String? FolderName;

  final String? Edited;
  final String? Title;
  final String? id;
  final List<dynamic>? Rooms;

  const SceneMeasurementPage({Key? key, this.Edited, this.id, this.Title, this.Rooms, this.FolderName}) : super(key: key);

  @override
  State<SceneMeasurementPage> createState() => _SceneMeasurementPageState();
}

class _SceneMeasurementPageState extends State<SceneMeasurementPage> {
  @override
  void initState() {
    super.initState();
    title.text = widget.Title ?? '';

    initialize();


    widget.Edited != "true" ? setState(() {
      textValues.add('');
      controllers.add([TextEditingController(), TextEditingController(), TextEditingController()]);
      errorMessages.add(['', '', '']);
    }) :
    setState(() {
      final int suspectLength = widget.Rooms?.length ?? 0;
      final int textValuesLength = textValues.length;
      if (suspectLength > textValuesLength) {
        for (int i = 0; i < suspectLength - textValuesLength; i++) {
          textValues.add('');
        }
      }
      controllers = (widget.Rooms ?? []).map<List<TextEditingController>>((dynamic suspect) {
        List<TextEditingController> rowControllers = [];
        for (int i = 0; i < textValues.length; i++) {
          String Rooms = suspect['Rooms 1'] ?? '';
          String direction1 = suspect['direction 1'] ?? '';
          String direction2 = suspect['direction 2'] ?? '';
          TextEditingController RoomsC = TextEditingController(text: Rooms);
          TextEditingController direction1C = TextEditingController(text: direction1);
          TextEditingController direction2C = TextEditingController(text: direction2);
          rowControllers.add(RoomsC);
          rowControllers.add(direction1C);
          rowControllers.add(direction2C);
        }
        return rowControllers;
      }).toList();

    });
    initialize();
  }

  TextEditingController title = TextEditingController();


  String id = " ";
  Future<void> initialize() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    id =  prefs.getString("id").toString();
    print(id);
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
                                  child: CircleAvatar(
                                    backgroundColor: Colors.black,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
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
                 Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
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
                                  textValues.add('');
                                  controllers.add([TextEditingController(), TextEditingController(), TextEditingController()]);
                                  errorMessages.add(['', '', '']);
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
            ),
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
        MaterialPageRoute(builder: (context) =>  const BottomBarPage()),
      );
    });
  }
  Future<void> save() async {

    List<Map<String, dynamic>> Rooms = [];

    Map<String, dynamic> data = {
      "Type" : "Measurement",
      "Title" : title.text,

    };
    if(title.text == ""){
      return  showErrorMessage('Title cannot be empty');

    }
    for (int i = 0; i < textValues.length; i++) {
      var rowControllers = controllers[i];
      String rooms = rowControllers[0].text;
      String d1 = rowControllers[1].text;
      String d2 = rowControllers[2].text;

      if (rooms.isNotEmpty && d1.isNotEmpty && d2.isNotEmpty) {
        Map<String, dynamic>  rowDataa = {
          'Rooms ${i +1}': rooms,
          'direction 1': d1,
          'direction 2': d2,
        };
        Rooms.add(rowDataa);
      } else {
        // Show SnackBar with error message
        showErrorMessage('Field values cannot be empty');
        return; // Stop further processing
      }
    }

    CollectionReference casesCollection = FirebaseFirestore.instance.collection('Cases');
    CollectionReference newCaseRef = casesCollection.doc(id).collection("AllFolders");

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
    data['Rooms'] = Rooms;
    DocumentReference allCasesCollection = newCaseRef.doc(widget.FolderName).collection("AllCases").doc();
    data['docId'] = allCasesCollection.id;
    allCasesCollection.set(data).then((value) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  const BottomBarPage()),
      );
    });
  }
}
