import 'package:crime_investigation/PaymentPage/Hanlder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Paymentpage extends StatefulWidget {
  @override
  State<Paymentpage> createState() => _PaymentpageState();
}

class _PaymentpageState extends State<Paymentpage> {
  final PaymentController controller = Get.put(PaymentController());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Stripe Payment Sheet Example')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              controller.makePayment(amount: '5', currency: 'USD');

            },
            child: const Text('Pay with Stripe'),
          ),
        ),
      ),
    );
  }
}
