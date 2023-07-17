import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crime_investigation/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:crime_investigation/courtdate.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

class AllCases extends StatefulWidget {
  final String id;
  const AllCases({Key? key, required this.id}) : super(key: key);
  @override
  State<AllCases> createState() => _AllCasesState();
}

class _AllCasesState extends State<AllCases> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<String> textValues = [];


  @override
  void initState(){
    super.initState();
    setState(() {
      initialize();
    });
    initialize();
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Create a folder'),
          content:  SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(color: Colors.grey, blurRadius: 3.6)
                    ],
                  ),
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Enter Name of the folder',
                        hintStyle: const TextStyle(fontSize: 15),
                        contentPadding: const EdgeInsets.all(10),

                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),

              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Create'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  String id = "";
  Future<void> initialize() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      id = prefs.getString("id") ?? ""; // Use an empty string as the default value if "id" is null
    });
    print(id);
  }


  @override
  Widget build(BuildContext context) {
    print(widget.id);
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.white,
      //   onPressed: (){
      //   print("object");
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => const notebook()),
      //   );
      // },child: Container(
      //   decoration: BoxDecoration(
      //       border: Border.all(
      //         color: Colors.black,
      //       )),
      //   child: SizedBox(
      //     height: 25,
      //     width: 25,
      //     child: Transform.scale(
      //       scale: 2,
      //       child: CircleAvatar(
      //           backgroundColor: Colors.white,
      //           child: Transform.translate(
      //             offset: const Offset(0, 0),
      //             child: const Icon(
      //               Icons.add,
      //               color: Colors.black,
      //               size: 25,
      //             ),
      //           )),
      //     ),
      //   ),
      // ),),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Colors.black,
      //   items: <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: InkWell(onTap: () {
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(builder: (context) =>const courtdate()),
      //         );
      //       },
      //           child: SvgPicture.asset('assets/Component 12 – 1.svg')),
      //       label: '',
      //     ),
      //
      //     BottomNavigationBarItem(
      //       icon: InkWell(
      //         onTap: (){
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => setting()),
      //           );
      //         },
      //           child: Icon(Icons.settings,color: Colors.grey,)),
      //       label: '',
      //
      //     ),
      //   ],
      // ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            decoration: const BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 3.5)],
                color: Colors.black,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30))),
            child: Column(
              children: [
                const SizedBox(height: 50,),
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: 150,
                    height: 30,
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                          hintText: ' HI! Alishba',
                          hintStyle: const TextStyle(fontWeight: FontWeight.bold),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: const [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Mobile',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    fontFamily: 'times new roman')),
                          ),
                          Align(alignment: Alignment.centerLeft,
                            child: Text('Pocket Guide',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    fontFamily: 'times new roman')),
                          ),
                        ],
                      ),
                      SizedBox(
                          width: 200,
                          child: Image.asset('assets/OBJECT.png',fit: BoxFit.scaleDown,)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),

          if (id == "") Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [const CircularProgressIndicator(), // Show circular indicator while waiting for ID
    ]

          ) else StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance.collection('Cases').doc(id).collection('Allcaes').snapshots(),


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
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // Set the desired number of columns
                      crossAxisSpacing: 30.0,
                      mainAxisSpacing: 30.0,
                    ),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      DocumentSnapshot<Map<String, dynamic>> document = snapshot.data!.docs[index];
                      Map<String, dynamic>? data = document.data();

                      return InkWell(
                        onTap: () async {
                          if(data?["Type"] == "Basic"){
                            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                              return BasicInformationPage(
                                Edited: "true",
                                Csid: data?["CSI_ID"].toString(),
                                id: data?["docId"].toString(),
                                Case: data?["Case"].toString() ,
                                Date: data?["Date"].toString()   ,
                                Offense: data?["Offense"] .toString(),
                                Primary_detective: data?["Primary_Detective_Id"] .toString(),
                                Primary_Office: data?["Primary_Officer"] .toString(),
                                Scene: data?["Scene"] .toString(),
                                TimeArrival: data?["Time_Arrival"] .toString(),
                                TimeCall: data?["Time_Call_Received"] .toString(),
                                Title: data?["Title"] .toString(),
                                address: data?["address"] .toString(),
                                Suspects: data?["Suspects"],
                                Victims: data?["Victims"],
                              );
                            }));


                            print(data?["Suspects"].runtimeType);
                          }
                          if(data?["Type"] == "Story"){
                            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                              return StoryPage(
                                Edited: "true",
                                id: data?["docId"].toString(),

                                Story: data?["Story"].toString(),
                                Title: data?["Title"].toString(),

                              );
                            }));


                            print(data?["Suspects"].runtimeType);
                          }
                          if(data?["Type"] == "Measurement"){
                            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                              return SceneMeasurementPage(
                                Rooms: data?["Rooms"],
                                Title: data?["Title"].toString(),
                                Edited: "true",
                                id: data?["docId"].toString(),
                              );
                            }));
                            print(data?["Suspects"].runtimeType);
                          }
                          if(data?["Type"] == "Body"){
                            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                              return BodyMeasurementsPage(
                                BodyOne: data?["BodyOne"],
                                BodyTwo: data?["BodyTwo"],
                                Edited: "true",
                                id: data?["docId"].toString(),
                                Title: data?["Title"].toString(),
                              );
                            }));
                            print(data?["Suspects"].runtimeType);
                          }
                          if(data?["Type"] == "Weapons"){
                            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                              return WeaponsPage(
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
                          if(data?["Type"] == "BaseLine"){
                            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                              return BaseLinePage(
                                startingpoint: data?["startingPoint"].toString(),
                                dsitanceAtoB: data?["DistanceAtoB"].toString(),
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

                          if(data?["Type"] == "Ballistic"){
                            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                              return BalisticPage(
                                Title: data?["Title"].toString(),
                                Hole: data?["Hole"],
                                EntryExit: data?["EntryorExit"],
                                HieghtGround: data?["HeightfromGround"],
                                ofSide: data?["ofSide"],
                                VerticleAngle: data?["VerticalAngle"],
                                HorizontalAngle: data?["HorizontalAngle"],
                                ProjectileRecovered: data?["ProjectileRecovered"],
                                Edited: "true",
                                id: data?["docId"].toString(),
                              );
                            }));


                            print(data?["Suspects"].runtimeType);
                          }


                          if(data?["Type"] == "Sketch"){
                            final storageRef = firebase_storage.FirebaseStorage.instance.ref().child('signatures').child(data!["ImageId"]);

                            String downloadURL = await storageRef.getDownloadURL();
                            print(downloadURL);

                            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                              return scenesketch(
                                ImageId : data["ImageId"],
                                Edited: "true",
                                Url : downloadURL,
                                Title: data["Title"].toString(),
                                id: data["docId"].toString(),
                              );
                            }));


                          }


                          //Last
                          if(data?["Type"] == "Evidence"){


                            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                              return evidence(
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
                            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2.5)],
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
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
    );
  }
}
