// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stripe_repository.g.dart';

class StripeRepo {
  Map<String, dynamic>? paymentIntent;
  static const String stripeSecret = String.fromEnvironment("STRIPE_PRIV_KEY");
  static const String stripePublic = String.fromEnvironment("STRIPE_API_KEY");

  Future<bool> stripeMakePayment() async {
    try {
      Stripe.publishableKey = stripePublic;
      paymentIntent = await createPaymentIntent('100', 'EUR');
      debugPrint('paymentIntent.toString()');
      debugPrint(paymentIntent.toString());
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  billingDetails: BillingDetails(
                      name: 'YOUR NAME',
                      email: 'YOUREMAIL@gmail.com',
                      phone: 'YOUR NUMBER',
                      address: Address(
                          city: 'YOUR CITY',
                          country: 'YOUR COUNTRY',
                          line1: 'YOUR ADDRESS 1',
                          line2: 'YOUR ADDRESS 2',
                          postalCode: 'YOUR PINCODE',
                          state: 'YOUR STATE')),
                  paymentIntentClientSecret: paymentIntent!['client_secret'],
                  //Gotten from payment intent
                  customFlow: false,
                  style: ThemeMode.dark,
                  merchantDisplayName: 'Store Demo'))
          .then((value) {
        debugPrint("value.toString()");
        debugPrint(value.toString());
      });
      //STEP 3: Display Payment sheet
      final bool displaySheet = await displayPaymentSheet();
      return displaySheet;
    } on StripeConfigException catch (e) {
      debugPrint('MAKE PAYMENT STRIPE EXCEPTION');
      debugPrint(e.toString());
      debugPrint(e.toString());
      debugPrint(e.message.toString());
      Fluttertoast.showToast(msg: e.toString());
      rethrow;
    } catch (e) {
      debugPrint('MAKE PAYMENT');
      debugPrint(e.toString());
      Fluttertoast.showToast(msg: e.toString());
      rethrow;
    }
  }

  Future displayPaymentSheet() async {
    try {
      // 3. display the payment sheet.
      await Stripe.instance
          .presentPaymentSheet()
          .then((value) => debugPrint(value.toString()));
      debugPrint("sheet.toString()");
      debugPrint('PAYMENT STATUS');
      debugPrint(paymentIntent!['status']);
      return true;
    } on Exception catch (e) {
      if (e is StripeException) {
        debugPrint('DISPLAY PAYMENT IF TRUE');
        Fluttertoast.showToast(
            msg: 'Error from Stripe: ${e.error.localizedMessage}');
      } else {
        Fluttertoast.showToast(msg: 'Unforeseen error: ${e}');
      }
    }
  }

  //create Payment
  createPaymentIntent(String amount, String currency) async {
    try {
      //Request body
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
      };

      //Make post request to Stripe
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer $stripeSecret',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      return json.decode(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }

//calculate Amount
  calculateAmount(String amount) {
    final calculatedAmount = (int.parse(amount)) * 100;
    return calculatedAmount.toString();
  }
}

@riverpod
StripeRepo stripeRepo(StripeRepoRef ref) {
  return StripeRepo();
}
