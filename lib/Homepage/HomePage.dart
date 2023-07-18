import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../AllCasesPage.dart';

class HomePage extends StatefulWidget {
  final String? FolderName;
  final String? id;

  const HomePage({super.key, this.FolderName, this.id});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String id = "";

  Future<void> initialize() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      id = prefs.getString("id") ?? "";
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      initialize();
    });
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3.5,
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: const [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Home Page',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    fontFamily: 'times new roman')),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Folders Page',
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
          if (id == "")
            Column(children: const [
              CircularProgressIndicator(),
              // Show circular indicator while waiting for ID
            ])
          else
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection('Cases')
                  .doc(id)
                  .collection('AllFolders')
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
                if (!snapshot.hasData) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: Text('No documents found'),
                  );
                }

                final allFolders = snapshot.data!.docs;

                print(snapshot.data!.size);
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, // Set the desired number of columns
                        crossAxisSpacing: 30.0,
                        mainAxisSpacing: 30.0,
                      ),
                      itemCount: allFolders.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                              return AllCases(FolderName: snapshot.data!.docs[index]["Name"],);
                            }));
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 2.5)
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Column(
                                children: [
                                  Image.asset("assets/folder.png",fit: BoxFit.scaleDown,height: 50,width: 50,),
                                  const SizedBox(height: 10),
                                  Text(snapshot.data!.docs[index]["Name"] ?? ''),
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

          // Expanded(
          // child: ListView.builder(
          // itemCount: allFolders.length,
          // itemBuilder: (BuildContext context, int index) {
          // final folderName = allFolders[index].id;
          //
          // // Get the number of documents inside each folder
          // final folderLength = allFolders[index].data().length;
          //
          // return ListTile(
          // title: Text('$folderName - $folderLength'),
          // onTap: () {
          // // Do something when the user taps on a folder
          // // For example, navigate to another page to show the contents of this folder
          // // You can use folderName to identify the folder and access its contents
          //
          // // Alternatively, if you just want to show the length of the folder, you can do this
          // // Show a dialog with the folder length
          // showDialog(
          // context: context,
          // builder: (context) {
          // return AlertDialog(
          // title: Text('$folderName Length'),
          // content: Text('Number of Documents: $folderLength'),
          // actions: [
          // ElevatedButton(
          // onPressed: () {
          // Navigator.of(context).pop();
          // },
          // child: Text('OK'),
          // ),
          // ],
          // );
          // },
          // );
          // },
          // );
          // },
          // ),
          // );
        ],
      ),
    );
  }
}
