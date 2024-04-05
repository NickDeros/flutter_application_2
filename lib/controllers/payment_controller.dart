import 'package:flutter/material.dart';
import 'package:flutter_application_2/controllers/user_controller.dart';
import 'package:flutter_application_2/models/user_model.dart';
import 'package:flutter_application_2/repositories/auth_repository.dart';
import 'package:flutter_application_2/repositories/stripe_repository.dart';
import 'package:flutter_application_2/repositories/user_repository.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'payment_controller.g.dart';

@riverpod
class Payment extends _$Payment {
  @override
  FutureOr<bool> build() async {
    return false;
  }

  Future<void> paymentController() async {
    try {
      debugPrint('CONTROLLER STATE');
      debugPrint(state.toString());
      final result = await ref.read(stripeRepoProvider).stripeMakePayment();
      debugPrint('RESULT STRIPE PAYMENT');
      debugPrint(result.toString());
      //check result
      if (result) {
        debugPrint('RESULT STRIPE PAYMENT IF');
        debugPrint(result.toString());
        //get uid
        final uid = ref.watch(uidProvider).value;
        debugPrint(uid.toString());
        //get user
        final user = await ref.read(userRepoProvider).getUserModel(uid: uid);
        debugPrint(user.toString());
        //set user role
        final newRole = user.copyWith(role: 'basic');
        debugPrint(newRole.toString());
        // update user role
        ref.read(userRepoProvider).editUser(user: newRole);
        debugPrint('ASYNCA DATA BEFORE CHANGE');
        state = const AsyncData(true);
        debugPrint('STATE ASYNC DATA');
        debugPrint(state.toString());
        Fluttertoast.showToast(msg: 'Payment succesfully completed');
      }
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
      debugPrint(e.toString());
    }
  }
}
