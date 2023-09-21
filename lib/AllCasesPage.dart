import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'BottomBarPage/BottomBarPage.dart';
import 'UploadCases/BalisticPage.dart';
import 'UploadCases/BaseLinePage.dart';
import 'UploadCases/BasicInformationPage.dart';
import 'UploadCases/BodyMeasurementsPage.dart';
import 'UploadCases/SceneMeasurementPage.dart';
import 'UploadCases/StoryPage.dart';
import 'UploadCases/WeasponsPage.dart';
import 'UploadCases/evidence.dart';
import 'UploadCases/scenesketch.dart';
import 'notebook.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:pdf/widgets.dart' as pdfWidgets;
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';

class AllCases extends StatefulWidget {
  final String? FolderName;

  const AllCases({Key? key, this.FolderName}) : super(key: key);

  @override
  State<AllCases> createState() => _AllCasesState();
}

class _AllCasesState extends State<AllCases> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<String> textValues = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      initialize();
    });
    initialize();
    print(widget.FolderName.toString());
  }

  String id = "";

  Future<void> initialize() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      id = prefs.getString("id") ??
          ""; // Use an empty string as the default value if "id" is null
    });
  }

  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _loading,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add the functionality you want here when the button is pressed
            // For example, you can add a Navigator to navigate to another page
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => notebook(
                          FolderName: widget.FolderName,
                        )));
          },
          backgroundColor: Colors.grey,
          elevation: 3.4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2.8,
              decoration: const BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 3.5)],
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30))),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          width: 150,
                          height: 30,
                          child: TextField(
                            enabled: false,
                            decoration: InputDecoration(
                                hintText: ' HI! Alishba',
                                hintStyle: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                contentPadding: const EdgeInsets.all(6),
                                prefixIcon: Image.asset(
                                  'assets/com...png',
                                ),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(30),
                                      bottomRight: Radius.circular(30),
                                    )),
                                filled: true,
                                fillColor: Colors.white,
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(30),
                                      bottomRight: Radius.circular(30),
                                    ))),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.grey),
                                  shape: MaterialStateProperty.all(
                                      const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))))),
                              onPressed: () {
                                _showDeleteConfirmationDialog(context);
                              },
                              child: const Text(
                                "Delete folder",
                                style: TextStyle(color: Colors.black),
                              )),
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.grey),
                                  shape: MaterialStateProperty.all(
                                      const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))))),
                              onPressed: () async {
                                CollectionReference casesCollection =
                                    FirebaseFirestore.instance
                                        .collection('Cases');
                                CollectionReference folderRef = casesCollection
                                    .doc(id)
                                    .collection("AllFolders");
                                CollectionReference querySnapshot = folderRef
                                    .doc(widget.FolderName)
                                    .collection("AllCases");

                                final pdf = pdfWidgets.Document();

                                QuerySnapshot collectionSnapshot =
                                    await querySnapshot.get();
                                List<QueryDocumentSnapshot> documents =
                                    collectionSnapshot.docs;

                                if (documents.isEmpty) {
                                  return; // No data to generate a table
                                }

                                Map<String, dynamic> firstDocumentData =
                                    documents[0].data() as Map<String, dynamic>;
                                List<String> columnHeaders =
                                    firstDocumentData.keys.toList();
                                columnHeaders.remove('docId');

                                List<List<String>> tableData = [];

                                for (QueryDocumentSnapshot documentSnapshot
                                    in documents) {
                                  Map<String, dynamic> data = documentSnapshot
                                      .data() as Map<String, dynamic>;
                                  data.remove('docId');

                                  List<String> rowData = columnHeaders
                                      .map((header) =>
                                          data[header]?.toString() ?? "")
                                      .toList();
                                  tableData.add(rowData);
                                }

                                final verticalTableData = <List<String>>[];
                                for (int i = 0; i < columnHeaders.length; i++) {
                                  final column = <String>[columnHeaders[i]];
                                  for (final rowData in tableData) {
                                    column.add(rowData[i]);
                                  }
                                  verticalTableData.add(column);
                                }

                                final verticalTable =
                                    pdfWidgets.Table.fromTextArray(
                                  data: verticalTableData,
                                  cellPadding: pdfWidgets.EdgeInsets.all(10),
                                  cellAlignment:
                                      pdfWidgets.Alignment.centerLeft,
                                  cellStyle: pdfWidgets.TextStyle(fontSize: 12),

                                    );

                                pdf.addPage(
                                  pdfWidgets.Page(
                                    build: (context) {
                                      return pdfWidgets.Center(
                                        child: pdfWidgets.Column(
                                          children: [
                                            pdfWidgets.Text("Table of Cases",
                                                style: pdfWidgets.TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: pdfWidgets
                                                        .FontWeight.bold)),
                                            pdfWidgets.SizedBox(height: 20),
                                            verticalTable,
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                );

                                final output = await getTemporaryDirectory();
                                final pdfFile =
                                    File('${output.path}/collection.pdf');
                                await pdfFile.writeAsBytes(await pdf.save());

                                Share.shareFiles([pdfFile.path]);
                              },
                              child: const Text(
                                "Share folder",
                                style: TextStyle(color: Colors.black),
                              )),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                                'Folder Name: ${widget.FolderName.toString()}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    fontFamily: 'times new roman')),
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Image.asset(
                              'assets/OBJECT.png',
                              fit: BoxFit.scaleDown,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            if (id == "")
              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    // Show circular indicator while waiting for ID
                  ])
            else
              StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection('Cases')
                    .doc(id)
                    .collection('AllFolders')
                    .doc(widget.FolderName.toString())
                    .collection("AllCases")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  if (snapshot.hasError) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Padding(
                        padding: EdgeInsets.only(top: 100),
                        child: Text('No documents found'));
                  }
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: GridView.builder(
                        physics: const ScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          // Set the desired number of columns
                          crossAxisSpacing: 30.0,
                          mainAxisSpacing: 30.0,
                        ),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          DocumentSnapshot<Map<String, dynamic>> document =
                              snapshot.data!.docs[index];
                          Map<String, dynamic>? data = document.data();

                          return InkWell(
                            onTap: () async {
                              print(widget.FolderName.toString());

                              if (data?["Type"] == "Basic") {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return BasicInformationPage(
                                    FolderName: widget.FolderName.toString(),
                                    Edited: "true",
                                    Csid: data?["CSI_ID"].toString(),
                                    id: data?["docId"].toString(),
                                    Case: data?["Case"].toString(),
                                    Date: data?["Date"].toString(),
                                    Offense: data?["Offense"].toString(),
                                    Primary_detective:
                                        data?["Primary_Detective_Id"]
                                            .toString(),
                                    Primary_Office:
                                        data?["Primary_Officer"].toString(),
                                    Scene: data?["Scene"].toString(),
                                    TimeArrival:
                                        data?["Time_Arrival"].toString(),
                                    TimeCall:
                                        data?["Time_Call_Received"].toString(),
                                    Title: data?["Title"].toString(),
                                    address: data?["address"].toString(),
                                    Suspects: data?["Suspects"],
                                    Victims: data?["Victims"],
                                  );
                                }));
                                print(data?["Suspects"].runtimeType);
                              }
                              if (data?["Type"] == "Story") {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return StoryPage(
                                    FolderName: widget.FolderName.toString(),
                                    Edited: "true",
                                    id: data?["docId"].toString(),
                                    Story: data?["Story"].toString(),
                                    Title: data?["Title"].toString(),
                                  );
                                }));

                                print(data?["Suspects"].runtimeType);
                              }
                              if (data?["Type"] == "Measurement") {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return SceneMeasurementPage(
                                    FolderName: widget.FolderName.toString(),
                                    Rooms: data?["Rooms"],
                                    Title: data?["Title"].toString(),
                                    Edited: "true",
                                    id: data?["docId"].toString(),
                                  );
                                }));
                                print(data?["Suspects"].runtimeType);
                              }
                              if (data?["Type"] == "Body") {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return BodyMeasurementsPage(
                                    FolderName: widget.FolderName.toString(),
                                    bodyOneLeft: data!['bodyOneLeft'],
                                    bodyOneCenter: data['bodyOneCenter'],
                                    bodyOneRight: data['bodyOneRight'],
                                    bodyTwoLeft: data['bodyTwoLeft'],
                                    bodyTwoCenter: data['bodyTwoCenter'],
                                    bodyTwoRight: data['bodyTwoRight'],
                                    BodyOne: data["BodyOne"],
                                    BodyTwo: data["BodyTwo"],
                                    Edited: "true",
                                    id: data["docId"].toString(),
                                    Title: data["Title"].toString(),
                                  );
                                }));
                                print(data?["Suspects"].runtimeType);
                              }
                              if (data?["Type"] == "Weapons") {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return WeaponsPage(
                                    FolderName: widget.FolderName.toString(),
                                    Title: data?["Title"].toString(),
                                    WeaponOne: data?["WeaponOne"],
                                    WeaponTwo: data?["WeaponTwo"],
                                    WeaponThree: data?["WeaponThree"],
                                    Edited: "true",
                                    id: data?["docId"].toString(),
                                  );
                                }));
                                print(data?["Suspects"].runtimeType);
                              }
                              if (data?["Type"] == "BaseLine") {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return BaseLinePage(
                                    FolderName: widget.FolderName.toString(),
                                    startingpoint:
                                        data?["startingPoint"].toString(),
                                    dsitanceAtoB:
                                        data?["DistanceAtoB"].toString(),
                                    Title: data?["Title"].toString(),
                                    Marker: data?["markerItem"],
                                    Direction: data?["direction"],
                                    onestM: data?["FirstMeasurement"],
                                    twostM: data?["SecondMeasurement"],
                                    DirectionofBase: data?["DirectionBaseline"],
                                    Edited: "true",
                                    id: data?["docId"].toString(),
                                  );
                                }));
                                print(data?["Suspects"].runtimeType);
                              }

                              if (data?["Type"] == "Ballistic") {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return BalisticPage(
                                    FolderName: widget.FolderName.toString(),
                                    Title: data?["Title"].toString(),
                                    Hole: data?["Hole"],
                                    EntryExit: data?["EntryorExit"],
                                    HieghtGround: data?["HeightfromGround"],
                                    ofSide: data?["ofSide"],
                                    VerticleAngle: data?["VerticalAngle"],
                                    HorizontalAngle: data?["HorizontalAngle"],
                                    ProjectileRecovered:
                                        data?["ProjectileRecovered"],
                                    Edited: "true",
                                    id: data?["docId"].toString(),
                                  );
                                }));

                                print(data?["Suspects"].runtimeType);
                              }

                              if (data?["Type"] == "Sketch") {
                                final storageRef = firebase_storage
                                    .FirebaseStorage.instance
                                    .ref()
                                    .child('signatures')
                                    .child(data!["ImageId"]);

                                String downloadURL =
                                    await storageRef.getDownloadURL();
                                print(downloadURL);

                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return scenesketch(
                                    FolderName: widget.FolderName.toString(),
                                    ImageId: data["ImageId"],
                                    Edited: "true",
                                    Url: downloadURL,
                                    Title: data["Title"].toString(),
                                    id: data["docId"].toString(),
                                  );
                                }));
                              }

                              //Last
                              if (data?["Type"] == "Evidence") {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return evidence(
                                    FolderName: widget.FolderName.toString(),
                                    Edited: "true",
                                    WhatnWhere: data!["WhatnWhere"],
                                    Notes: data["Notes"],
                                    id: data["docId"].toString(),
                                    Title: data["Title"].toString(),
                                  );
                                }));
                              }
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(color: Colors.grey, blurRadius: 2.5)
                                ],
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Column(
                                  children: [
                                    SvgPicture.asset('assets/notebook.svg'),
                                    const SizedBox(height: 10),
                                    Text(data?['Title'] ?? ''),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                10.0), // Set the border radius of the dialog
          ),
          title: Text('Delete Confirmation'),
          content: Text('Are you sure you want to delete folder?'),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Colors.grey.withOpacity(0.4)),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors
                            .black), // Set the background color of the button
                      ),
                      onPressed: () async {
                        // Implement the delete action here
                        // setState(() {
                        //   _loading = true;
                        // });

                        FirebaseFirestore firestore =
                            FirebaseFirestore.instance;

                        // Reference to the 'Cases' collection
                        CollectionReference casesCollection =
                            firestore.collection('Cases');

                        // Reference to the 'AllFolders' subcollection under the specific 'id'
                        CollectionReference folderRef =
                            casesCollection.doc(id).collection("AllFolders");

                        // Reference to the 'AllCases' subcollection under the specific folderName
                        CollectionReference casesRef = folderRef
                            .doc(widget.FolderName.toString())
                            .collection("AllCases");

                        try {
                          // Delete all documents inside the 'AllCases' subcollection
                          QuerySnapshot snapshot = await casesRef.get();
                          for (DocumentSnapshot doc in snapshot.docs) {
                            await doc.reference.delete();
                          }

                          // Delete the folder itself
                          await folderRef
                              .doc(widget.FolderName.toString())
                              .delete();

                          // Now, remove the value from newCaseRef
                          QuerySnapshot newCaseSnapshot = await folderRef
                              .where("Name",
                                  isEqualTo: widget.FolderName.toString())
                              .get();
                          if (newCaseSnapshot.docs.isNotEmpty) {
                            await newCaseSnapshot.docs.first.reference.delete();
                          }

                          // After the folder, its content, and the value are deleted, you can navigate to the desired page
                          // ignore: use_build_context_synchronously
                          // Navigator.of(context).pop();

                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BottomBarPage(page: 1),
                          ));
                          // setState(() {
                          //   _loading = false;
                          // });
                        } catch (e) {
                          // Handle any errors that might occur during the deletion process
                          print("Error deleting folder and content: $e");
                          // setState(() {
                          //   _loading = false;
                          // });
                        } // Close the dialog after deleting
                      },
                      child: Text(
                        'Delete',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
