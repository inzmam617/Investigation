import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:crime_investigation/notebook.dart';
import 'package:crime_investigation/weapon.dart';

class mystory extends StatelessWidget {
  const mystory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Transform.translate(
                offset: Offset(0, 10),
                child: SvgPicture.asset('assets/Component 12 – 1.svg'),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Transform.translate(
                offset: Offset(0, -20),
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
                            MaterialPageRoute(builder: (context) => mystory()),
                          );
                        },
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Transform.translate(
                              offset: Offset(0, 0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => mystory()),
                                  );
                                },
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => mystory()),
                                    );
                                  },
                                  child: Icon(
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
                  offset: Offset(0, 10),
                  child: Image.asset('assets/Iconly-Bold-Setting.png')),
              label: '',
            ),
          ],
        ),
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
                  physics: NeverScrollableScrollPhysics(),
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
                        offset: Offset(-130, 0),
                        child: SizedBox(
                            height: 30,
                            width: 30,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => notebook()),
                                );
                              },
                              child: CircleAvatar(
                                child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => notebook()),
                                      );
                                    },
                                    child:
                                        Icon(Icons.arrow_back_ios, size: 14)),
                                backgroundColor: Colors.black,
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
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    decoration: BoxDecoration(
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
                    child: TextField(
                        decoration: InputDecoration(
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
                SizedBox(height: 10,),
                Image.asset('assets/blank.png'),


                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 30,
                  child: Container(
                    decoration: BoxDecoration(
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
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      topLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                      topRight: Radius.circular(20)))),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => notebook()),
                            );
                          },
                          child: Text(
                            'Save',
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 30,
                  child: Container(
                    decoration: BoxDecoration(
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
                      width: 160,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      topLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                      topRight: Radius.circular(20)))),
                          onPressed: () {

                          },
                          child: Text(
                            'Add',
                            style: TextStyle(color: Colors.black),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ]),
        ));
  }
}
