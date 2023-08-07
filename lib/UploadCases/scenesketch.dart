import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crime_investigation/UploadCases/StoryPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:crime_investigation/notebook.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signature/signature.dart';
import 'package:flutter/gestures.dart';
import 'package:uuid/uuid.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../AllCasesPage.dart';
import '../BottomBarPage/BottomBarPage.dart';

class scenesketch extends StatefulWidget {
  final String? Url;
  final String? ImageId;
  final String? FolderName;

  final String? Title;
  final String? Edited;
  final String? id;

  scenesketch(
      {Key? key,
      this.Title,
      this.Edited,
      this.id,
      this.Url,
      this.ImageId,
      this.FolderName})
      : super(key: key);

  @override
  State<scenesketch> createState() => _scenesketchState();
}

class _scenesketchState extends State<scenesketch> {
  List<Offset> points = [];
  TextEditingController CaseTitle = TextEditingController();
  // TextEditingController title = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(
        height: MediaQuery.of(context).size.height / 4,
        decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40))),
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            child: Row(
              children: [
                Container(
                  height: 30,
                  width: 160,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(30),
                          topRight: Radius.circular(30))),
                ),
                Transform.translate(
                  offset: const Offset(-130, 0),
                  child: SizedBox(
                      height: 30,
                      width: 30,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const CircleAvatar(
                          backgroundColor: Colors.black,
                          child: Icon(Icons.arrow_back_ios, size: 14),
                        ),
                      )),
                ),
                Transform.translate(
                  offset: const Offset(-120, 0),
                  child: InkWell(
                    onTap: () {},
                    child: const Text(
                      'Scene Sketch',
                    ),
                  ),
                ),
                Transform.translate(
                    offset: const Offset(-100, 0),
                    child: SvgPicture.asset('assets/book.svg'))
              ],
            ),
          ),
        ),
      ),
      const CustomPaint(),
      Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              decoration: const BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 3.5)],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30))),
              height: 30,
              child:  TextField(
                controller: title,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Add Title',
                      hintStyle: TextStyle(fontSize: 14),
                      contentPadding: EdgeInsets.all(8),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(30))))),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          widget.FolderName == "new"  ?           Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
            decoration: const BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 3.5)],
            color: Colors.white,
            borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
            bottomLeft: Radius.circular(30))),
            height: 30,
            child:  TextField(
            controller: CaseTitle,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(30))),
            filled: true,
            fillColor: Colors.white,
            hintText: 'Add Case Name',
            hintStyle: TextStyle(fontSize: 14),
            contentPadding: EdgeInsets.all(8),
            border: OutlineInputBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(30))))),
            ),
            ): const SizedBox.shrink(),
          const SizedBox(
            height: 20,
          ),
          widget.Edited == "true"
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(color: Colors.grey, blurRadius: 2)
                    ]),
                    height: 300,
                    width: double.infinity,
                    child: Image.network(widget.Url!),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(color: Colors.grey, blurRadius: 2)
                    ]),
                    height: 300,
                    width: double.infinity,
                    child: Signature(
                      controller: _controller,
                      height: 300,
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
          const SizedBox(
            height: 20,
          ),
          widget.Edited == "true"
              ? SizedBox(
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
                            CollectionReference casesCollection =
                                FirebaseFirestore.instance.collection('Cases');
                            firebase_storage.FirebaseStorage.instance
                                .ref()
                                .child('signatures')
                                .child(widget.ImageId!)
                                .delete();
                            DocumentReference newCaseRef = casesCollection
                                .doc(id)
                                .collection('Allcaes')
                                .doc(widget.id);
                            newCaseRef.delete().then((value) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AllCases()),
                              );
                            });
                          },
                          child: const Text(
                            'Delete',
                          )),
                    ),
                  ),
                )
              : SizedBox(
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
                          onPressed: _saveSignature,
                          child: const Text(
                            'Save',
                          )),
                    ),
                  ),
                ),
          const SizedBox(
            height: 20,
          ),
          widget.Edited == "true"
              ? const SizedBox(
                )
              : SizedBox(
                  height: 30,
                  child: Container(
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(blurRadius: 3.5, color: Colors.grey)
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: SizedBox(
                      width: 160,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                          onPressed: _clearSignature,
                          child: const Text(
                            'Clear',
                            style: TextStyle(color: Colors.black),
                          )),
                    ),
                  ),
                ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    ]));
  }
  void delete(){
    CollectionReference casesCollection = FirebaseFirestore.instance.collection('Cases');
    CollectionReference newCaseRef = casesCollection.doc(id).collection("AllFolders");
    DocumentReference allCasesCollection = newCaseRef.doc(widget.FolderName).collection("AllCases").doc(widget.id);
    allCasesCollection.delete().then((value) {
      Navigator.of(context).pop();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  BottomBarPage()),
      );
    });
  }
  late SignatureController _controller;
  String id = " ";

  Future<void> initialize() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    id = prefs.getString("id").toString();
    print(id);
  }

  TextEditingController title = TextEditingController();

  @override
  void initState() {
    super.initState();
    title.text = widget.Title ?? '';

    initialize();
    _controller = SignatureController(
      penColor: Colors.black,
      penStrokeWidth: 3.0,
    );
    initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _clearSignature() {
    _controller.clear();
  }
  void showErrorMessage(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  void _saveSignature() async {
    if(title.text == ""){
 return showErrorMessage("Title cannot be empty");
    }
    if(CaseTitle.text == ""){
      return showErrorMessage("Title cannot be empty");
    }
    final signatureData = await _controller.toPngBytes();
    if (signatureData != null) {
      try {
        final uniqueFilename = '${const Uuid().v4()}.png';
        final storageRef = firebase_storage.FirebaseStorage.instance
            .ref()
            .child('signatures')
            .child(uniqueFilename);
        final uploadTask = storageRef.putData(signatureData);
        Map<String, dynamic> data = {
          "Title": title.text,
          "Type": "Sketch",
          "ImageId": uniqueFilename
        };
        CollectionReference casesCollection = FirebaseFirestore.instance.collection('Cases');
        CollectionReference newCaseRef = casesCollection.doc(id).collection("AllFolders");

        if (widget.FolderName == "new") {
          if (CaseTitle.text.isEmpty) {
            showErrorMessage('Case Name cannot be empty');
          } else {
            // Your code if CaseTitle is not empty
          }
        } else {
          // Your code for a different case
        }

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
          if (CaseTitle.text.isEmpty) {
            showErrorMessage('Case Name cannot be empty');
          }else {
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
        }
        await uploadTask
            .whenComplete(() => print('Signature uploaded to Firebase'));

        DocumentReference allCasesCollection = newCaseRef.doc(widget.FolderName).collection("AllCases").doc();
        data['docId'] = allCasesCollection.id;
        allCasesCollection.set(data).then((value) {
          Navigator.push(context,MaterialPageRoute(builder: (context) =>  BottomBarPage()),
          );
        });
      } catch (e) {
        print('Error uploading signature to Firebase: $e');
      }
    } else {
      print('No signature data available');
    }
  }
}
