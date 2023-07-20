import 'package:flutter/material.dart';
import 'package:crime_investigation/UploadCases/scenesketch.dart';


class courtdate extends StatefulWidget {
  const courtdate({Key? key}) : super(key: key);

  @override
  State<courtdate> createState() => _courtdateState();
}

class _courtdateState extends State<courtdate> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4,
              decoration: const BoxDecoration(

                  color: Colors.black,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(40))),
              child: Row(
                children: [
                  Container(
                    height: 30,
                    width: 140,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30),
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(0),
                            bottomLeft: Radius.circular(0))),
                  ),
                  Transform.translate(
                    offset: const Offset(-130, 0),
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
                              child: const Icon(Icons.arrow_back_ios, size: 14)),
                          backgroundColor: Colors.black,
                        )),
                  ),
                  Transform.translate(
                    offset: const Offset(-115, 0),
                    child: const Text(
                      'Court date',
                    ),
                  ),
                  Transform.translate(
                      offset: const Offset(10, 10),
                      child: Image.asset('assets/court.png'))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Container(
                height: MediaQuery.of(context).size.height / 2.3,
                decoration: const BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 3.5)],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(30))),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            const BoxShadow(color: Colors.grey, blurRadius: 3)
                          ],
                        ),
                        height: 40,
                        child: Container(
                          decoration: const BoxDecoration(boxShadow: [
                            BoxShadow(color: Colors.white, blurRadius: 4.0)
                          ]),
                          child: TextField(
                            decoration: InputDecoration(
                                label: Row(
                                  children: [
                                    const Text('Date:',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      children: [
                                        const Text('MM',
                                            style: TextStyle(
                                                color: Color(0xffD4D4D4))),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Container(
                                          height: 2,
                                          width: 30,
                                          decoration: const BoxDecoration(
                                            color: Color(0xffD4D4D4),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      children: [
                                        const Text('DD',
                                            style: TextStyle(
                                                color: Color(0xffD4D4D4))),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Container(
                                          height: 2,
                                          width: 30,
                                          color: const Color(0xffD4D4D4),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      children: [
                                        const Text('YYYY',
                                            style: TextStyle(
                                                color: Color(0xffD4D4D4))),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Container(
                                          height: 2,
                                          width: 30,
                                          color: const Color(0xffD4D4D4),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                contentPadding: const EdgeInsets.all(10),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
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
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            const BoxShadow(color: Colors.grey, blurRadius: 3)
                          ],
                        ),
                        height: 40,
                        child: Container(
                          decoration: const BoxDecoration(boxShadow: [
                            BoxShadow(color: Colors.white, blurRadius: 4.0)
                          ]),
                          child: TextField(
                            decoration: InputDecoration(
                                label: Row(
                                  children: [
                                    const Text('Time:',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      '05:45 min',
                                      style:
                                          TextStyle(color: Color(0xffD4D4D4)),
                                    )
                                  ],
                                ),
                                contentPadding: const EdgeInsets.all(10),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
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
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            const BoxShadow(color: Colors.grey, blurRadius: 3)
                          ],
                        ),
                        height: 40,
                        child: Container(
                          decoration: const BoxDecoration(boxShadow: [
                            BoxShadow(color: Colors.white, blurRadius: 4.0)
                          ]),
                          child: TextField(
                            decoration: InputDecoration(
                                label: Row(
                                  children: [
                                    const Text('Note:',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        )),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      'Add note number',
                                      style:
                                          TextStyle(color: Color(0xffD4D4D4)),
                                    )
                                  ],
                                ),
                                contentPadding: const EdgeInsets.all(10),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
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
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            const BoxShadow(color: Colors.grey, blurRadius: 3)
                          ],
                        ),
                        height: 40,
                        child: Container(
                          decoration: const BoxDecoration(boxShadow: [
                            BoxShadow(color: Colors.white, blurRadius: 4.0)
                          ]),
                          child: TextField(
                            decoration: InputDecoration(
                                label: Row(
                                  children: [
                                    const Text('Case#:',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        )),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text('Add case number',
                                        style: TextStyle(
                                            color: Color(0xffD4D4D4))),
                                  ],
                                ),
                                contentPadding: const EdgeInsets.all(10),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
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
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            const BoxShadow(color: Colors.grey, blurRadius: 3)
                          ],
                        ),
                        height: 40,
                        child: Container(
                          decoration: const BoxDecoration(boxShadow: [
                            BoxShadow(color: Colors.white, blurRadius: 4.0)
                          ]),
                          child: TextField(
                            decoration: InputDecoration(
                                label: Row(
                                  children: [
                                    const Text('Reminder:',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      'Add reminder',
                                      style:
                                          TextStyle(color: Color(0xffD4D4D4)),
                                    )
                                  ],
                                ),
                                contentPadding: const EdgeInsets.all(10),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
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
            const SizedBox(
              height: 20,
            ),
            SizedBox(
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

                      },

                      child: const Text(
                        'Save',

                      )),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 30,
              child: Container(
                decoration: const BoxDecoration(
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
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  topLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                  topRight: Radius.circular(20)))),
                      onPressed: () {
                      },
                      child: const Text(
                        'Add',
                        style: TextStyle(color: Colors.black),
                      )),
                ),
              ),
            ),
            const SizedBox(height: 50,),
          ],
        ),
      ),
    );
  }
}
