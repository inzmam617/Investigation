
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PaymentController extends GetxController {
  Map<String, dynamic>? paymentIntentData;

  Future<bool> makePayment(
      {required String amount, required String currency, required BuildContext context}) async {
    try {
      paymentIntentData = await createPaymentIntent(amount, currency);
      if (paymentIntentData != null) {
        await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
            googlePay: const PaymentSheetGooglePay(merchantCountryCode: 'US'),
            merchantDisplayName: 'Prospects',
            customerId: paymentIntentData!['customer'],
            paymentIntentClientSecret: paymentIntentData!['client_secret'],
            customerEphemeralKeySecret: paymentIntentData!['ephemeralKey'],
          ),
        );

        bool paymentResult = await displayPaymentSheet(context);
        return paymentResult;
      } else {
        return false; // Payment data not available
      }
    } catch (e, s) {
      print('exception:$e$s');
      return false; // Payment failed
    }
  }

  //
  // Future<void> makePayment(
  //     {required String amount, required String currency , required BuildContext context}) async {
  //   try {
  //     paymentIntentData = await createPaymentIntent(amount, currency);
  //     if (paymentIntentData != null) {
  //       await Stripe.instance.initPaymentSheet(
  //         paymentSheetParameters: SetupPaymentSheetParameters(
  //           googlePay: const PaymentSheetGooglePay(merchantCountryCode: 'US'),
  //           merchantDisplayName: 'Prospects',
  //           customerId: paymentIntentData!['customer'],
  //           paymentIntentClientSecret: paymentIntentData!['client_secret'],
  //           customerEphemeralKeySecret: paymentIntentData!['ephemeralKey'],
  //         ),
  //       );
  //
  //       // ignore: use_build_context_synchronously
  //       displayPaymentSheet(context);
  //     }
  //   } catch (e, s) {
  //     print('exception:$e$s');
  //   }
  // }

  // displayPaymentSheet(BuildContext context) async {
  //   try {
  //     await Stripe.instance.presentPaymentSheet();
  //
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //       content: Text('Payment Successful'),
  //       duration: Duration(milliseconds: 500),
  //     ));
  //   } on Exception catch (e) {
  //     if (e is StripeException) {
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         content: Text("Error from Stripe: ${e.error.localizedMessage}"),
  //         duration: const Duration(milliseconds: 500),
  //       ));
  //       print("Error from Stripe: ${e.error.localizedMessage}");
  //     } else {
  //       print("Unforeseen error: ${e}");
  //     }
  //   } catch (e) {
  //     print("exception:$e");
  //   }
  // }
  displayPaymentSheet(BuildContext context) async {
    bool paymentSuccessful = false;
    try {
      await Stripe.instance.presentPaymentSheet();
      paymentSuccessful = true;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Payment Successful'),
        duration: Duration(milliseconds: 500),
      ));
    } on Exception catch (e) {
      if (e is StripeException) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Error from Stripe: ${e.error.localizedMessage}"),
          duration: const Duration(milliseconds: 500),
        ));
        print("Error from Stripe: ${e.error.localizedMessage}");
      } else {
        print("Unforeseen error: ${e}");
      }
    } catch (e) {
      print("exception:$e");
    }
    return paymentSuccessful; // Return the payment status
  }
  Future<Map<String, dynamic>> createPaymentIntent(
      String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        body: body,
        headers: {
          'Authorization':
          'Bearer sk_test_51MwR8TAKJqb8m8FnRwFD3T1CbhzctycAEpCA8tr9BvdUS1K6A6OfrTCwzbavQR0d9lQecliHFcKicRGt7OLTlrey00KWuC3znA',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
      );
      print("Testing");
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
      return {};
    }
  }

  String calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }
}
