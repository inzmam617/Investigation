import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crime_investigation/PaymentPage/Hanlder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Paymentpage extends StatefulWidget {
  @override
  State<Paymentpage> createState() => _PaymentpageState();
}

class _PaymentpageState extends State<Paymentpage> {


 @override
  void initState(){
    super.initState();
    get();

 }

  String userId = FirebaseAuth.instance.currentUser!.uid;
  Future<void> Update(String Pakage, String Duration, String Amount ) async {
    await FirebaseFirestore.instance.collection('Users').doc(userId).update({

      "package" : Pakage,
     "Duration" : Duration,
       "Amount" : Amount
    });
  }
    String Pakage = "";
  Future<void> get( ) async {
    final data =   await FirebaseFirestore.instance.collection('Users').doc(userId).get();
    setState(() {
      Pakage =data["package"];
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
        appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Text('Subscription Page')),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 50,),

              Text("Current Package: $Pakage"),
              const SizedBox(height: 50,),
              SizedBox(
                height: 150,
                width: MediaQuery.of(context).size.width / 1.5,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                    backgroundColor: MaterialStateProperty.all(Colors.black54)
                  ),
                  onPressed: () {
                    DateTime now = DateTime.now();
                    DateTime nextMonth = now.add(const Duration(days: 30));
                    print(formatDateM(nextMonth));
                    controller.makePayment(amount: '10', currency: 'USD', context: context).then((value) => {
                      print(value),
                      if(value == true){
                        Update('Standard' , formatDateM(nextMonth).toString() , "9.99"),
                      }
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:   [
                      const Text('Monthly Subscription  Standard',style: TextStyle(fontWeight: FontWeight.bold),),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("Price:",style: TextStyle(fontWeight: FontWeight.bold),),
                          Text(' \$9.99 per month',),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                height: 150,
                width: MediaQuery.of(context).size.width / 1.5,
                child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                      backgroundColor: MaterialStateProperty.all(Colors.redAccent)
                  ),
                  onPressed: () {
                    DateTime now = DateTime.now();
                    DateTime nextYear = DateTime(now.year + 1, now.month, now.day, now.hour, now.minute, now.second);
                    print(formatDateY(nextYear));
                    controller.makePayment(amount: '100', currency: 'USD', context: context).then((value) => {
                      print(value),
                      if(value == true){
                        Update('Premium' , formatDateY(nextYear).toString(), "100"),
                      }
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:   [
                      const Text('Yearly Subscription Premium',style: TextStyle(fontWeight: FontWeight.bold),),
                      const SizedBox(height: 10,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("Price:",style: TextStyle(fontWeight: FontWeight.bold),),
                          Text(' \$100 per month',),
                        ],
                      ),


                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

    );
  }
}
