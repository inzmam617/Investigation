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

class scenesketch extends StatefulWidget {
  final String? Url;
  final String? ImageId;

  final String? Title;
  final String? Edited;
  final String? id;

  scenesketch ({Key? key, this.Title, this.Edited, this.id, this.Url, this.ImageId}) : super(key: key);

  @override
  State<scenesketch> createState() => _scenesketchState();
}

class _scenesketchState extends State<scenesketch> {

  List<Offset> points = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /*bottomNavigationBar: BottomNavigationBar(
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
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => StoryPage()),
                          );
                        },
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Transform.translate(
                              offset: const Offset(0, 0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => StoryPage()),
                                  );
                                },
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => StoryPage()),
                                    );
                                  },
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
        ),*/
        body: Column(children: [
          Container(
            height: MediaQuery.of(context).size.height / 4,
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius:
                BorderRadius.only(bottomLeft: Radius.circular(40))),
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
                                  child:
                                  const Icon(Icons.arrow_back_ios, size: 14)),
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
                      boxShadow: [
                        BoxShadow(color: Colors.grey, blurRadius: 3.5)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30))),
                  height: 30,
                  child: const TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.all(Radius.circular(30))),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Add Title',hintStyle: TextStyle(fontSize: 14),
                          contentPadding: EdgeInsets.all(8),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30))))),
                ),
              ),


              SizedBox(height: 20,),
              widget.Edited == "true"  ?  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2
                        )
                      ]
                  ),
                  height: 300,
                  width: double.infinity,
                  child: Image.network(widget.Url!),
                ),
              ) : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2
                      )
                    ]
                  ),
                  height: 300,
                  width: double.infinity,
                  child: Signature(
                    controller: _controller,
                    height: 300,
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20,),

              widget.Edited == "true"  ?   SizedBox(
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
                        onPressed:(){
                          CollectionReference casesCollection = FirebaseFirestore.instance.collection('Cases');
                          firebase_storage.FirebaseStorage.instance.ref().child('signatures').child(widget.ImageId!).delete();
                          DocumentReference newCaseRef = casesCollection.doc(id).collection('Allcaes').doc(widget.id);
                          newCaseRef.delete().then((value) {
                            Navigator.push(context,MaterialPageRoute(builder: (context) =>  AllCases(id: id)),
                            );
                          });
                        },
                        child: const Text(
                          'Delete',
                        )),
                  ),
                ),
              ):SizedBox(
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
                        onPressed:_saveSignature,
                        child: const Text(
                          'Save',
                        )),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              widget.Edited == "true" ? SizedBox() : SizedBox(
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
                                borderRadius: BorderRadius.all(Radius.circular(20)))),
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


  late SignatureController _controller;
  String id = " ";
  Future<void> initialize() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    id =  prefs.getString("id").toString();
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
  void _saveSignature() async {

    final signatureData = await _controller.toPngBytes();
    if (signatureData != null) {
      try {
        final uniqueFilename = '${Uuid().v4()}.png';
        final storageRef = firebase_storage.FirebaseStorage.instance.ref().child('signatures').child(uniqueFilename);
        final uploadTask = storageRef.putData(signatureData);
        Map<String, dynamic> data = {
          "Title" : "Sketch",
          "Type" : "Sketch",
          "ImageId" : uniqueFilename

        };
        CollectionReference casesCollection = FirebaseFirestore.instance.collection('Cases');


        DocumentReference newCaseRef = casesCollection.doc(id).collection('Allcaes').doc();
        await uploadTask.whenComplete(() => print('Signature uploaded to Firebase'));

        data['docId'] = newCaseRef.id;

        newCaseRef.set(data).then((value) {
          Navigator.push(context,MaterialPageRoute(builder: (context) =>  AllCases(id: id,)),
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


