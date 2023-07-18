import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:crime_investigation/AllCasesPage.dart';
import 'package:crime_investigation/UploadCases/scenesketch.dart';

class courtdate extends StatelessWidget {
  const courtdate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Colors.black,
      //   items: <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //         icon: Padding(
      //           padding: const EdgeInsets.only(left: 20.0),
      //           child: Row(
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               Expanded(
      //                 child: Transform.translate(
      //                   offset: Offset(10, 10),
      //                   child: Container(
      //                     height: 30,
      //                     width: 110,
      //                     decoration: BoxDecoration(
      //                       borderRadius: BorderRadius.only(
      //                           bottomLeft: Radius.circular(30),
      //                           bottomRight: Radius.circular(30),
      //                           topRight: Radius.circular(30),
      //                           topLeft: Radius.circular(30)),
      //                       color: Colors.white,
      //                     ),
      //                     child: Transform.translate(
      //                         offset: Offset(30, 4),
      //                         child: Transform.translate(
      //                           offset: Offset(-10, -4),
      //                           child: SingleChildScrollView(scrollDirection:Axis.horizontal ,
      //                             child: Row(
      //                               children: [
      //                                 SvgPicture.asset(
      //                                     'assets/Component 12 – 1.svg',
      //                                     color: Colors.black),
      //                                 SizedBox(
      //                                   width: 5,
      //                                 ),
      //                                 Text('Court')
      //                               ],
      //                             ),
      //                           ),
      //                         )),
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //         label: ''),
      //     BottomNavigationBarItem(
      //       icon: Transform.translate(
      //         offset: Offset(0, -20),
      //         child: Container(
      //           decoration: BoxDecoration(
      //               border: Border.all(
      //                 color: Colors.black,
      //               )),
      //           child: SizedBox(
      //             height: 25,
      //             width: 25,
      //             child: Transform.scale(
      //               scale: 2,
      //
      //               child: CircleAvatar(
      //                   backgroundColor: Colors.white,
      //                   child: Transform.translate(
      //
      //                     offset: Offset(0, 0),
      //                     child: Icon(
      //                       Icons.add,
      //                       color: Colors.black,
      //                       size: 25,
      //                     ),
      //                   )),
      //             ),
      //           ),
      //         ),
      //       ),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Transform.translate(
      //           offset: Offset(0, 10),
      //           child: Image.asset('assets/Iconly-Bold-Setting.png')),
      //       label: '',
      //     ),
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(''),
                  ),
                  color: Colors.black,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(40))),
              child: Row(
                children: [
                  Container(
                    height: 30,
                    width: 140,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30),
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(0),
                            bottomLeft: Radius.circular(0))),
                  ),
                  Transform.translate(
                    offset: Offset(-130, 0),
                    child: SizedBox(
                        height: 30,
                        width: 30,
                        child: CircleAvatar(
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => scenesketch()),
                                );
                              },
                              child: Icon(Icons.arrow_back_ios, size: 14)),
                          backgroundColor: Colors.black,
                        )),
                  ),
                  Transform.translate(
                    offset: Offset(-115, 0),
                    child: Text(
                      'Court date',
                    ),
                  ),
                  Transform.translate(
                      offset: Offset(10, 10),
                      child: Image.asset('assets/court.png'))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Container(
                height: MediaQuery.of(context).size.height / 2.3,
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 3.5)],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(30))),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.grey, blurRadius: 3)
                          ],
                        ),
                        height: 40,
                        child: Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(color: Colors.white, blurRadius: 4.0)
                          ]),
                          child: TextField(
                            decoration: InputDecoration(
                                label: Row(
                                  children: [
                                    Text('Date:',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      children: [
                                        Text('MM',
                                            style: TextStyle(
                                                color: Color(0xffD4D4D4))),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Container(
                                          height: 2,
                                          width: 30,
                                          decoration: BoxDecoration(
                                            color: Color(0xffD4D4D4),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      children: [
                                        Text('DD',
                                            style: TextStyle(
                                                color: Color(0xffD4D4D4))),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Container(
                                          height: 2,
                                          width: 30,
                                          color: Color(0xffD4D4D4),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      children: [
                                        Text('YYYY',
                                            style: TextStyle(
                                                color: Color(0xffD4D4D4))),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Container(
                                          height: 2,
                                          width: 30,
                                          color: Color(0xffD4D4D4),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                contentPadding: EdgeInsets.all(10),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                    borderRadius: BorderRadius.circular(30)),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30))),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.grey, blurRadius: 3)
                          ],
                        ),
                        height: 40,
                        child: Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(color: Colors.white, blurRadius: 4.0)
                          ]),
                          child: TextField(
                            decoration: InputDecoration(
                                label: Row(
                                  children: [
                                    Text('Time:',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '05:45 min',
                                      style:
                                          TextStyle(color: Color(0xffD4D4D4)),
                                    )
                                  ],
                                ),
                                contentPadding: EdgeInsets.all(10),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                    borderRadius: BorderRadius.circular(30)),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30))),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.grey, blurRadius: 3)
                          ],
                        ),
                        height: 40,
                        child: Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(color: Colors.white, blurRadius: 4.0)
                          ]),
                          child: TextField(
                            decoration: InputDecoration(
                                label: Row(
                                  children: [
                                    Text('Note:',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        )),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Add note number',
                                      style:
                                          TextStyle(color: Color(0xffD4D4D4)),
                                    )
                                  ],
                                ),
                                contentPadding: EdgeInsets.all(10),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                    borderRadius: BorderRadius.circular(30)),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30))),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.grey, blurRadius: 3)
                          ],
                        ),
                        height: 40,
                        child: Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(color: Colors.white, blurRadius: 4.0)
                          ]),
                          child: TextField(
                            decoration: InputDecoration(
                                label: Row(
                                  children: [
                                    Text('Case#:',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        )),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('Add case number',
                                        style: TextStyle(
                                            color: Color(0xffD4D4D4))),
                                  ],
                                ),
                                contentPadding: EdgeInsets.all(10),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                    borderRadius: BorderRadius.circular(30)),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30))),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.grey, blurRadius: 3)
                          ],
                        ),
                        height: 40,
                        child: Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(color: Colors.white, blurRadius: 4.0)
                          ]),
                          child: TextField(
                            decoration: InputDecoration(
                                label: Row(
                                  children: [
                                    Text('Reminder:',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Add reminder',
                                      style:
                                          TextStyle(color: Color(0xffD4D4D4)),
                                    )
                                  ],
                                ),
                                contentPadding: EdgeInsets.all(10),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                    borderRadius: BorderRadius.circular(30)),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30))),
                          ),
                        ),
                      ),
                    ),
                  ],
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
                              builder: (context) => AllCases()),
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
            SizedBox(height: 50,),
          ],
        ),
      ),
    );
  }
}
