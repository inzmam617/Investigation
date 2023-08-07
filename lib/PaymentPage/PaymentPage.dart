import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crime_investigation/PaymentPage/Hanlder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Paymentpage extends StatefulWidget {
  @override
  State<Paymentpage> createState() => _PaymentpageState();
}

class _PaymentpageState extends State<Paymentpage> {
  @override
  void initState() {
    super.initState();
    get();
  }

  String userId = FirebaseAuth.instance.currentUser!.uid;

  Future<void> Update(String Pakage, String Duration, String Amount) async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(userId)
        .update({"package": Pakage, "Duration": Duration, "Amount": Amount});
  }

  String Pakage = "";
  String timeLeft = "";

  Future<void> get() async {
    final data =
        await FirebaseFirestore.instance.collection('Users').doc(userId).get();
    setState(() {
      Pakage = data["package"];
      timeLeft = data["Duration"];
    });
  }

  String formatDateM(DateTime date) {
    // You can customize the date format as you wish
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  String formatDateY(DateTime date) {
    // You can customize the date format as you wish
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  final PaymentController controller = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     backgroundColor: Colors.black,
      //     title: const Text('Subscription Page')),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(65))),
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(32),
                                    bottomRight: Radius.circular(32))),
                            height: 35,
                            width: MediaQuery.of(context).size.width / 2,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    height: 30,
                                    width: 30,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Icon(
                                        Icons.arrow_back_ios,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Subscription Page",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SvgPicture.asset("assets/101010.svg")
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      // changes position of shadow
                    ),
                  ],
                ),
                // height: 120,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Current Package: $Pakage"),
                      const SizedBox(
                        height: 10,
                      ),
                      Pakage != "Basic"
                          ? Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 50),
                              child: Text(
                                "Please Note that you have currently $Pakage package till $timeLeft after  that your Subscription will expire ",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(

                width: MediaQuery.of(context).size.width / 1.1,
                child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      )),
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  onPressed: () {

                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        const Text(
                          'Monthly Subscription  Standard Price \$9.99/per month',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        txt("- Weapons measurement page"),
                        SizedBox(height: 5),
                        txt("- Baseline measurement page"),
                        SizedBox(height: 5),
                        txt("- Baseline measurement page"),
                        SizedBox(height: 5),
                        txt("- Ballistic measurement page"),
                        SizedBox(height: 5),
                        txt("- Scene Sketch page"),
                        SizedBox(height: 5),
                        txt("- Evidence list page"),
                        SizedBox(height: 5),
                        txt("- Drowning investigation Checklist"),
                        SizedBox(height: 5),
                        txt("- Homicide investigation Checklist"),
                        SizedBox(height: 5),
                        txt("- Shooting investigation Checklist"),
                        SizedBox(height: 10),

                        Center(child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    )),
                                backgroundColor: MaterialStateProperty.all(Colors.redAccent.withOpacity(0.8))),
                            onPressed: (){   DateTime now = DateTime.now();
                            DateTime nextMonth = now.add(const Duration(days: 30));
                            print(formatDateM(nextMonth));
                            controller
                                .makePayment(
                                amount: '10', currency: 'USD', context: context)
                                .then((value) => {
                              print(value),
                              if (value == true)
                                {
                                  Update(
                                      'Standard',
                                      formatDateM(nextMonth).toString(),
                                      "9.99"),
                                }
                            });

                            }, child: const Text("Subscribe")))
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(

                width: MediaQuery.of(context).size.width / 1.1,
                child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      )),
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  onPressed: () {

                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        const Text(
                          'Yearly Subscription Premium Price \$100/per Year',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        txt("- Get 2 months for FREE by signing up to a yearlyn subscription!"),
                        SizedBox(height: 5),
                        txt("- Includes everthing in the standard package"),
                        SizedBox(height: 10),

                        Center(child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    )),
                                backgroundColor: MaterialStateProperty.all(Colors.redAccent.withOpacity(0.8))),
                            onPressed: (){
                              DateTime now = DateTime.now();
                              DateTime nextYear = DateTime(now.year + 1, now.month,
                                  now.day, now.hour, now.minute, now.second);
                              print(formatDateY(nextYear));
                              controller
                                  .makePayment(
                                  amount: '100', currency: 'USD', context: context)
                                  .then((value) => {
                                print(value),
                                if (value == true)
                                  {
                                    Update('Premium',
                                        formatDateY(nextYear).toString(), "100"),
                                  }
                              });
                            }, child: const Text("Subscribe")))
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget txt(
    String text,
  ) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),
    );
  }
}
