import 'package:crime_investigation/death.dart';
import 'package:crime_investigation/drawning.dart';
import 'package:crime_investigation/hanging.dart';
import 'package:crime_investigation/homicide.dart';
import 'package:crime_investigation/robbery.dart';
import 'package:crime_investigation/setting.dart';
import 'package:crime_investigation/shooting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class checklist extends StatelessWidget {
  const checklist({Key? key}) : super(key: key);

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
                    child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Transform.translate(
                          offset: Offset(0, 0),
                          child: Icon(
                            Icons.add,
                            color: Colors.black,
                            size: 25,
                          ),
                        )),
                  ),
                ),
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Transform.translate(offset: Offset(0,10),
              child: SingleChildScrollView(scrollDirection:Axis.horizontal ,
                child: Row(
                  children: [
                    Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20)),
                            color: Colors.white),
                        child: Transform.translate(offset: Offset(-25,0),
                          child: Transform.scale(scale: 0.8,
                            child: SvgPicture.asset(
                              'assets/Iconly-Bold-Setting.svg',
                              color: Colors.black,
                            ),
                          ),
                        )),
                    Transform.translate(offset: Offset(-55,0),
                        child: Text('Setting'))
                  ],
                ),
              ),
            ),
            label: '',
          ),
        ],
      ),
      body: SingleChildScrollView(scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            Row(children: [
              Transform.translate(offset: Offset(15,0),
                child: InkWell(onTap:() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>setting()),
                  );
                },
                  child: CircleAvatar(backgroundColor: Colors.black,
                    child: InkWell(onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>setting()),
                      );
                    },
                        child: Icon(Icons.arrow_back_ios_new_outlined)),
                  ),
                ),
              ),
              Transform.translate(offset: Offset(-28,50),
                child: Container(height: 1,width: 50,
                  decoration: BoxDecoration(color: Colors.black), ),
              ),
              Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20,right: 100,top: 60),
                    child:
                    TextField(
                        decoration: InputDecoration(contentPadding: EdgeInsets.all(10),
                            suffixIcon: Image.asset('assets/assa.png'),
                            hintText: 'Check',hintStyle: TextStyle(),
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20))))),
                  ),
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                      ))),
            ]),
            SizedBox(height: 50,),
            Transform.translate(offset: Offset(-50,0),
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width/1.2,
                decoration: BoxDecoration(
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
                        MaterialPageRoute(builder: (context) =>drawning()),
                      );
                    },
                    child: Text(
                      'Drowning Investigation Checlist',
                      style: TextStyle(color: Color(0xff86898E), fontSize: 16),
                    )),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Transform.translate(offset: Offset(-50,0),
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width/1.2,
                decoration: BoxDecoration(
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
                        MaterialPageRoute(builder: (context) =>robbery()),
                      );
                    },
                    child: Text(
                      'Burglary/Robbery',
                      style: TextStyle(color: Color(0xff86898E), fontSize: 16),
                    )),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Transform.translate(offset: Offset(-50,0),
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width/1.2,
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: TextButton(
                    onPressed: () {Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>homicide()),
                    );
                    },
                    child: Text(
                      'Homicide Investigation',
                      style: TextStyle(color: Color(0xff86898E), fontSize: 16),
                    )),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Transform.translate(offset: Offset(-50,0),
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width/1.2,
                decoration: BoxDecoration(
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
                        MaterialPageRoute(builder: (context) =>hanging()),
                      );
                    },
                    child: Text(
                      'Hanging Checklist',
                      style: TextStyle(color: Color(0xff86898E), fontSize: 16),
                    )),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Transform.translate(offset: Offset(-50,0),
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width/1.2,
                decoration: BoxDecoration(
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
                        MaterialPageRoute(builder: (context) =>death()),
                      );
                    },
                    child: Text(
                      'Death Investigation',
                      style: TextStyle(color: Color(0xff86898E), fontSize: 16),
                    )),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Transform.translate(offset: Offset(-50,0),
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width/1.2,
                decoration: BoxDecoration(
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
                        MaterialPageRoute(builder: (context) =>shooting()),
                      );
                    },
                    child: Text(
                      'Shooting Investigation Checklist',
                      style: TextStyle(color: Color(0xff86898E), fontSize: 16),
                    )),
              ),
            ),


          ],
        ),

      ),

    );
  }
}
