import 'package:crime_investigation/PaymentPage/Hanlder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class Paymentpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Stripe Payment Sheet Example')),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              var item = [
                {
                  "productPrice" : 4,
                    "productName": "apple",
                  "qty" : 10
                },
                {
                  "productPrice" : 8,
                  "productName": "banana",
                  "qty" : 50
                }
              ];

              await StripeService.stripePaymentCheckout(
                item,
                500,
                context, // The first context parameter, assuming it's for the UI context.
                    () {
                  print("Success");
                },
                    () {
                  print("Cancelled");
                },
                    (error) {
                  print("Error: $error");
                },
              );
            },
            child: const Text('Pay with Stripe'),
          ),
        ),
      ),
    );
  }


}
