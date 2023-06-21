import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:crime_investigation/courtdate.dart';
import 'AllCases.dart';

class UploadCase extends StatefulWidget {
  const UploadCase({Key? key}) : super(key: key);
  @override
  State<UploadCase> createState() => _UploadCaseState();
}

class _UploadCaseState extends State<UploadCase> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<String> textValues = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: (){
        print("object");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AllCasesPage()),
        );
      },child: Container(
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
                  offset: const Offset(0, 0),
                  child: const Icon(
                    Icons.add,
                    color: Colors.black,
                    size: 25,
                  ),
                )),
          ),
        ),
      ),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(

        backgroundColor: Colors.black,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Transform.translate(
              offset: const Offset(0, 10),
              child: InkWell(onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>const courtdate()),
                );
              },
                  child: SvgPicture.asset('assets/Component 12 – 1.svg')),
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
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                                bottomLeft: Radius.circular(0),
                              )),
                          filled: true,
                          fillColor: Colors.white,
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(0)))),
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
          StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance.collection('Cases').snapshots(),
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
                // height: 100,
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
                        onTap: () {

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
