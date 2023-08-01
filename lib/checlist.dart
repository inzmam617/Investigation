import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crime_investigation/death.dart';
import 'package:crime_investigation/drawning.dart';
import 'package:crime_investigation/hanging.dart';
import 'package:crime_investigation/homicide.dart';
import 'package:crime_investigation/robbery.dart';
import 'package:crime_investigation/setting.dart';
import 'package:crime_investigation/shooting.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class checklist extends StatefulWidget {
  const checklist({Key? key}) : super(key: key);

  @override
  State<checklist> createState() => _checklistState();
}

class _checklistState extends State<checklist> {
  late bool visible  = false;
  String userId = FirebaseAuth.instance.currentUser!.uid;

  String timeLeft = "";
  String Amount = "";
  String package = "";

  Future<void> reset() async {
    await FirebaseFirestore.instance.collection('Users').doc(userId).update({

      "package" : "Basic",
      "Duration" : "2030-08-31",
      "Amount" : '0'
    });
  }
  Future<void> get() async {
    final data =   await FirebaseFirestore.instance.collection('Users').doc(userId).get();
    setState(() {
      timeLeft =  data["Duration"];
      Amount =  data["Amount"];
      package =  data["package"];
    });
    print("the time ledt : "  +  timeLeft);
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
  @override
  void initState(){
    get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Row(children: [
              Transform.translate(offset: const Offset(15,0),
                child: InkWell(onTap:() {
                  Navigator.of(context).pop();
                },
                  child: const CircleAvatar(backgroundColor: Colors.black,
                    child: Icon(Icons.arrow_back_ios_new_outlined),
                  ),
                ),
              ),
              Transform.translate(offset: const Offset(-28,50),
                child: Container(height: 1,width: 50,
                  decoration: const BoxDecoration(color: Colors.black), ),
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
                    padding: const EdgeInsets.only(left: 20,right: 100,top: 60),
                    child:
                    TextField(
                        decoration: InputDecoration(contentPadding: const EdgeInsets.all(10),
                            suffixIcon: Image.asset('assets/assa.png'),
                            hintText: 'Check',hintStyle: const TextStyle(),
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
                      ) :SizedBox() ,
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 50,),
            Column(
              children: [
                Transform.translate(offset: const Offset(-50,0),
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
                                MaterialPageRoute(builder: (context) =>const drawning()),
                              ) : const SizedBox();
                            },
                            child: const Text(
                              'Drowning Investigation Checklist',
                              style: TextStyle(color: Color(0xff86898E), fontSize: 16),
                            )),
                        visible == false ?   Icon(Icons.lock) : SizedBox()

                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Transform.translate(offset: const Offset(-50,0),
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
                              visible == true ?  Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>const homicide()),
                            ) : SizedBox();
                            },
                            child: const Text(
                              'Homicide Investigation',
                              style: TextStyle(color: Color(0xff86898E), fontSize: 16),
                            )),
                       visible == false ?   Icon(Icons.lock) : SizedBox()
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Transform.translate(offset: const Offset(-50,0),
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
                              visible == true ?  Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>const shooting()),
                              ) : SizedBox();
                            },
                            child: const Text(
                              'Shooting Investigation Checklist',
                              style: TextStyle(color: Color(0xff86898E), fontSize: 16),
                            )),
                        visible == false ?   Icon(Icons.lock) : SizedBox()
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Transform.translate(offset: const Offset(-50,0),
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
                        MaterialPageRoute(builder: (context) =>const hanging()),
                      );
                    },
                    child: const Text(
                      'Hanging Checklist',
                      style: TextStyle(color: Color(0xff86898E), fontSize: 16),
                    )),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Transform.translate(offset: const Offset(-50,0),
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
                        MaterialPageRoute(builder: (context) =>const death()),
                      );
                    },
                    child: const Text(
                      'Death Investigation',
                      style: TextStyle(color: Color(0xff86898E), fontSize: 16),
                    )),
              ),
            ),
            const SizedBox(
              height: 15,
            ),

            Transform.translate(offset: const Offset(-50,0),
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
                        MaterialPageRoute(builder: (context) =>const robbery()),
                      );
                    },
                    child: const Text(
                      'Burglary/Robbery',
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
