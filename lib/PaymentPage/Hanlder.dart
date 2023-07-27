import 'dart:convert';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:stripe_checkout/stripe_checkout.dart';

class StripeService {
  static String secretKey = "pk_test_51MwR8TAKJqb8m8FnzPItMaBA4LVkjLVRbDOOPeEWbAYQZYVuSJcFJvXlPxkHiAoZsAQEhHzRY4XtnZm1llQvRuLj00yoKZ45vL";
  static String publishableKey = "sk_test_51MwR8TAKJqb8m8FnRwFD3T1CbhzctycAEpCA8tr9BvdUS1K6A6OfrTCwzbavQR0d9lQecliHFcKicRGt7OLTlrey00KWuC3znA";

  static Future<dynamic> createCheckoutSession(List<dynamic> productItem, totalAmount) async {
    final url = Uri.parse("https://api.stripe.com/v3/checkout/session");

    String lineItem = "";
    int index = 0;
    productItem.forEach((val) {
      var productPrice = (val["productPrice"] * 100).round().toString();

      lineItem  += "&lineItems[$index][price_data][product_data][name]=${val["productName"]}&lineItems[$index][price_data][unit_amount]=$productPrice";

      lineItem  += "&lineItems[$index][price_data][currency]=USD";
      lineItem  += "&lineItems[$index][price_data][quantity]=${val['qty'].toString()}";
      index++;
    });

    final response = await http.post(
      url,
      body: "success_url=https://checkout.stripe.dev/success&mode=payment$lineItem",
      headers: {
        "Authorization": "Bearer $secretKey",
        "Content-Type": "application/x-www-form-urlencoded",
      },
    );

    return json.decode(response.body)["id"];
  }

  static Future<dynamic> stripePaymentCheckout(
      productItem,
      subTotal,
      context,
      onSuccess,
      onCancel,
      onError,
      ) async {
    final String sessionId = await createCheckoutSession(productItem, subTotal);

    redirectToCheckout(
      context: context,
      sessionId: sessionId,
      publishableKey: publishableKey,
      successUrl: "https://api.stripe.com/v3/checkout/session",
      canceledUrl: "https://api.stripe.com/v3/checkout/cancel",
    ).then((result) {
      const text = "Redirected Successfully";
      onSuccess(text);
    }).catchError((e) {
      onError(e);
    });
  }
}
