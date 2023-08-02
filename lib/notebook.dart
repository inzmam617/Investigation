import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crime_investigation/UploadCases/BaseLinePage.dart';
import 'package:crime_investigation/UploadCases/BodyMeasurementsPage.dart';
import 'package:crime_investigation/UploadCases/BalisticPage.dart';
import 'package:crime_investigation/UploadCases/BasicInformationPage.dart';
import 'package:crime_investigation/UploadCases/evidence.dart';
import 'package:crime_investigation/UploadCases/StoryPage.dart';
import 'package:crime_investigation/UploadCases/SceneMeasurementPage.dart';
import 'package:crime_investigation/UploadCases/scenesketch.dart';
import 'package:crime_investigation/UploadCases/WeasponsPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'PaymentPage/PaymentPage.dart';

class notebook extends StatefulWidget {
  int? FolderName;

  notebook({this.FolderName});
  @override
  State<notebook> createState() => _notebookState();
}

class _notebookState extends State<notebook> {

  late String package = ""; // Initialize with an empty string
  late bool visible  = false;
  String userId = FirebaseAuth.instance.currentUser!.uid;
  String timeLeft = "";
  String Amount = "";
  Future<int?> getHighestFolderName() async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
        .collection('Cases')
        .doc(userId)
        .collection('AllFolders')
        .orderBy('Name', descending: true)
        .limit(1)
        .get();

    if (snapshot.docs.isNotEmpty) {
      int highestFolderName =  int.parse(  snapshot.docs.first.get('Name') );
      // print("Highest Folder Name: $highestFolderName");
      return highestFolderName;
    } else {
      print("No folders found");
      return null;
    }
  }
  Future<void> reset() async {
    await FirebaseFirestore.instance.collection('Users').doc(userId).update({
      "package" : "Basic",
      "Duration" : "2030-08-31",
      "Amount" : '0'
    });
  }
  Future<void> get() async {
    FolderName = (await getHighestFolderName())!;
    print("Getting the Number: $FolderName");

    if (widget.FolderName == 0) {
      // FolderName == widget.FolderName;
      setState(() {
        FolderName++;


      });
      print(FolderName);
      print("Changes");
    } else  if(widget.FolderName != FolderName){
      setState(() {

        FolderName =   widget.FolderName!;
      });
      print(FolderName);


      // FolderName++;


      print("Same");
    }
    final data =   await FirebaseFirestore.instance.collection('Users').doc(userId).get();
    setState(() {

      timeLeft =  data["Duration"];
      Amount =  data["Amount"];
      package =  data["package"];
    });

    DateTime parsedDate = DateTime.parse(timeLeft);
    DateTime currentDate = DateTime.now();

    if (parsedDate.isBefore(currentDate)) {
      reset();

      print("The provided date is before the current date.");

      // Do something for dates before the current date
    } else if (parsedDate.isAfter(currentDate)) {
      if(package ==  "Basic"){
        print("basic");
        setState(() {
          visible = false;
        });
      }
      else{
        print("Not Basic");
        setState(() {
          visible = true;
        });
      }
      print("The provided date is after the current date.");
      // Do something for dates after the current date
    } else {
      reset();

      print("The provided date is the same as the current date.");
      // Do something for dates equal to the current date
    }
  }
  initilize() async {
    FirebaseFirestore.instance.collection('Users').doc(userId).get().then((value) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      if (value.exists) {
        setState(() {
          package = value.data()!['package']; // Assign the value from Firestore to the 'package' variable
          prefs.setString("package", package);
        });
        print("this is the id: $package");
      } else {
        print('User data does not exist');
      }
    });
  }

  @override
  void initState() {
    get();
    print("this is older:${widget.FolderName}");
    // getHighestFolderName();
    super.initState();
    print("this is the folder Name: ${widget.FolderName}");





    initilize();
  }
  DateTime now = DateTime.now();
   late int FolderName = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,physics: const NeverScrollableScrollPhysics(),
        child: SingleChildScrollView(scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(children: [
                Transform.translate(
                  offset: const Offset(15, 0),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();

                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Icon(Icons.arrow_back_ios_new_outlined),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(-28, 50),
                  child: Container(
                    height: 1,
                    width: 50,
                    decoration: const BoxDecoration(color: Colors.black),
                  ),
                ),
                Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                        )),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 100, top: 60),
                      child: TextField(
                          decoration: InputDecoration(
                              prefixIcon:
                                  Image.asset('assets/Iconly-Bold-Search.png'),
                              contentPadding: const EdgeInsets.all(10),
                              suffixIcon: Image.asset('assets/assa.png'),
                              hintText: 'Search',
                              hintStyle: const TextStyle(),
                              fillColor: Colors.white,
                              filled: true,
                              border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20))))),
                    )),
              ]),
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('Users').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  return Transform.translate(
                    offset: const Offset(-50, 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text('Package: ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                            Text(package),
                          ],
                        ),
                        package != "Basic" ?   Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text('Time Till: ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                Text(timeLeft),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text('Amount: ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                Text( "\$$Amount"),
                              ],
                            ),
                          ],
                        ) :const SizedBox() ,
                      ],
                    ),
                  );
                },
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: SizedBox(height: 50,),
              ),
              Transform.translate(
                offset: const Offset(-50, -25),
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width/1.2,
                  decoration: const BoxDecoration(
                      boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BasicInformationPage(
                            Edited: "null",
                              FolderName: FolderName.toString()


                          )),
                        );
                      },
                      child: const Text(
                        'Basic Information',
                        style: TextStyle(color: Color(0xff86898E), fontSize: 16),
                      )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Transform.translate(
                offset: const Offset(-50, -25),
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width/1.2,
                  decoration: const BoxDecoration(
                      boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>StoryPage(
                              FolderName: FolderName.toString(),

                          )),
                        );
                      },
                      child: const Text(
                        '"My Story"',
                        style: TextStyle(color: Color(0xff86898E), fontSize: 16),
                      )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Transform.translate(
                offset: const Offset(-50, -25),
                child: InkWell(onTap:() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SceneMeasurementPage(
                      FolderName: FolderName.toString(),
                    )),
                  );
                },
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width/1.2,
                    decoration: const BoxDecoration(
                        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30))),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SceneMeasurementPage(
                              FolderName: FolderName.toString(),

                            )),
                          );
                        },
                        child: const Text(
                          'Scene Measurements',
                          style: TextStyle(color: Color(0xff86898E), fontSize: 16),
                        )),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Transform.translate(
                offset: const Offset(-50, -25),
                child: InkWell(onTap:() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BodyMeasurementsPage(
                      FolderName: FolderName.toString(),

                    )),
                  );
                },
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width/1.2,
                    decoration: const BoxDecoration(
                        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30))),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BodyMeasurementsPage(
                              FolderName: FolderName.toString(),

                            )),
                          );
                        },
                        child: const Text(
                          'Body Measurements',
                          style: TextStyle(color: Color(0xff86898E), fontSize: 16),
                        )),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Transform.translate(
                    offset: const Offset(-50, -25),
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width/1.2,
                      decoration: const BoxDecoration(
                          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                            TextButton(
                              onPressed: () {
                                visible == true ?    Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => WeaponsPage(
                                    FolderName: FolderName.toString(),

                                  )),
                                ) :  NavigateToPay();
                              },
                              child: const Text(
                                'Weapon Measurements',
                                style: TextStyle(color: Color(0xff86898E), fontSize: 16),
                              )),
                          visible == false ?   const Icon(Icons.lock) : const SizedBox()

                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Transform.translate(
                    offset: const Offset(-50, -25),
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width/1.2,
                      decoration: const BoxDecoration(
                          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () {
                                visible == true ?   Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => BaseLinePage(
                                    FolderName: FolderName.toString(),

                                  )),
                                ):  NavigateToPay();
                              },
                              child: const Text(
                                'Baseline Measurements',
                                style: TextStyle(color: Color(0xff86898E), fontSize: 16),
                              )),
                          visible == false ?   const Icon(Icons.lock) : const SizedBox()

                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Transform.translate(
                    offset: const Offset(-50, -25),
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width/1.2,
                      decoration: const BoxDecoration(
                          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () {
                                visible == true ?    Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => BalisticPage(
                                    FolderName: FolderName.toString(),

                                  )),
                                ):  NavigateToPay();

                              },
                              child: const Text(
                                'Ballistic Measurements',
                                style: TextStyle(color: Color(0xff86898E), fontSize: 16),
                              )),
              visible == false ?   const Icon(Icons.lock) : const SizedBox()

    ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Transform.translate(
                    offset: const Offset(-50, -25),
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width/1.2,
                      decoration: const BoxDecoration(
                          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30))),
                      child:  Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                               child: const Text('Scene Sketch',style: TextStyle(color: Color(0xff86898E), fontSize: 16), ),
                              onPressed: () {
                                visible == true ? Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => scenesketch(
                                  FolderName: FolderName.toString(),

                                )),
                                ) :  NavigateToPay();
                            },
                            ),
                            visible == false ?   const Icon(Icons.lock) : const SizedBox()

                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Transform.translate(
                    offset: const Offset(-50, -25),
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width/1.2,
                      decoration: const BoxDecoration(
                          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30))),
                      child:  Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(onPressed: (){
                              visible == true ?  Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => evidence(
                                  FolderName: FolderName.toString(),

                                )),
                              ) : NavigateToPay();
                            }, child: const Text(
                              'Evidence List',
                              style: TextStyle(color: Color(0xff86898E), fontSize: 16),
                            ),),
                            visible == false ?   const Icon(Icons.lock) : const SizedBox()


                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  NavigateToPay(){
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
      return Paymentpage();
    }));

  }
}
