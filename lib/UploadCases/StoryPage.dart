import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:crime_investigation/notebook.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../AllCasesPage.dart';
import '../BottomBarPage/BottomBarPage.dart';

class StoryPage extends StatefulWidget {
  final String? Story;
  final String? Title;
  final String? Edited;
  final String? id;

  @override
  State<StoryPage> createState() => _StoryPageState();
  StoryPage({Key? key, this.Story, this.Title, this.Edited, this.id, }) : super(key: key);

}

class _StoryPageState extends State<StoryPage> {
  TextEditingController story = TextEditingController();
  TextEditingController title = TextEditingController();
  String id = " ";
  Future<void> initialize() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    id =  prefs.getString("id").toString();
    print(id);
  }
  @override
  void initState(){
    super.initState();
    story.text = widget.Story ?? '';
    title.text = widget.Title ?? '';

    setState(() {
      initialize();
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // bottomNavigationBar: BottomNavigationBar(
        //   backgroundColor: Colors.black,
        //   items: <BottomNavigationBarItem>[
        //     BottomNavigationBarItem(
        //       icon: Transform.translate(
        //         offset: const Offset(0, 10),
        //         child: SvgPicture.asset('assets/Component 12 – 1.svg'),
        //       ),
        //       label: '',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Transform.translate(
        //         offset: const Offset(0, -20),
        //         child: Container(
        //           decoration: BoxDecoration(
        //               border: Border.all(
        //             color: Colors.black,
        //           )),
        //           child: SizedBox(
        //             height: 25,
        //             width: 25,
        //             child: Transform.scale(
        //               scale: 2,
        //               child: InkWell(
        //                 onTap: () {
        //                   Navigator.push(
        //                     context,
        //                     MaterialPageRoute(builder: (context) =>  StoryPage()),
        //                   );
        //                 },
        //                 child: CircleAvatar(
        //                     backgroundColor: Colors.white,
        //                     child: Transform.translate(
        //                       offset: const Offset(0, 0),
        //                       child: InkWell(
        //                         onTap: () {
        //                           Navigator.push(
        //                             context,
        //                             MaterialPageRoute(
        //                                 builder: (context) =>  StoryPage()),
        //                           );
        //                         },
        //                         child: const Icon(
        //                           Icons.add,
        //                           color: Colors.black,
        //                           size: 25,
        //                         ),
        //                       ),
        //                     )),
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //       label: '',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Transform.translate(
        //           offset: const Offset(0, 10),
        //           child: Image.asset('assets/Iconly-Bold-Setting.png')),
        //       label: '',
        //     ),
        //   ],
        // ),
        body: SingleChildScrollView(
          child: Column(children: [
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
                                Navigator.of(context).pop();

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
                        offset: const Offset(-115, 0),
                        child: InkWell(
                          onTap: () {},
                          child: const Text(
                            'My Story',
                          ),
                        ),
                      ),
                      Transform.translate(
                          offset: const Offset(-80, 0),
                          child: SvgPicture.asset('assets/Blogging-bro.svg'))
                    ],
                  ),
                ),
              ),
            ),
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
                    child:  TextField(
                      controller: title,
                        decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                    topLeft: Radius.circular(30))),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: '                                  Add Title',hintStyle: TextStyle(fontSize: 14),
                            contentPadding: EdgeInsets.all(8),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                    topLeft: Radius.circular(30))))),
                  ),
                ),
                const SizedBox(height: 10,),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                 child: Container(
                   decoration: BoxDecoration(
                     boxShadow: const [
                       BoxShadow(
                         color: Colors.grey,
                         blurRadius: 3.5
                       )
                     ],
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(20)
                   ),
                   child:  Padding(
                     padding: const EdgeInsets.all(10),
                     child: TextField(
                       controller: story,
                       style: const TextStyle(
                         fontSize: 14,
                         fontWeight: FontWeight.w400,
                         color: Colors.black
                       ),
                       decoration: const InputDecoration(
                         border: InputBorder.none

                       ),

                       maxLines: 15,
                     ),
                   ),
                 ),
               ),
                const SizedBox(
                  height: 20,
                ),
                widget.Edited != "true" ?   SizedBox(
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
                ) :
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
                  height: 30,
                )
              ],
            ),
          ]),
        ));

  }
  void delete(){
    CollectionReference casesCollection =
    FirebaseFirestore.instance.collection('Cases');

    DocumentReference newCaseRef =
    casesCollection.doc(id).collection('Allcaes').doc(widget.id);
    newCaseRef.delete().then((value) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottomBarPage()),
      );
    });
  }
  void save(){
    Map<String, dynamic> data = {
      "Type" : "Story",
      'Title': title.text,
      'Story': story.text,

    };
if(title.text == ""){
return showErrorMessage("Fields cannot be empty");
}

    CollectionReference casesCollection = FirebaseFirestore.instance.collection('Cases');


    DocumentReference newCaseRef = casesCollection.doc(id).collection('Allcaes').doc();
    data['docId'] = newCaseRef.id;

    newCaseRef.set(data).then((value) {
      Navigator.push(context,MaterialPageRoute(builder: (context) =>  BottomBarPage()),
      );
    });
  }
  void showErrorMessage(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
