import 'package:flutter/material.dart';
import 'package:flutter_application_2/controllers/payment_controller.dart';
import 'package:flutter_application_2/controllers/user_controller.dart';
import 'package:flutter_application_2/repositories/auth_repository.dart';
import 'package:flutter_application_2/repositories/stripe_repository.dart';
import 'package:flutter_application_2/repositories/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirstTable extends ConsumerWidget {
  const FirstTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue paymentState = ref.watch(paymentProvider);
    final uid = ref.watch(uidProvider).value;
    final userRole = ref.watch(userUpdateProvider(uid));
    debugPrint(userRole.value!['role']);
    debugPrint('paymentState');
    debugPrint(paymentState.value.toString());
    return Container(
      width: 300,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(70),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Basic',
            style: TextStyle(
                color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            '\$100',
            style: TextStyle(
                color: Colors.orangeAccent,
                fontSize: 15,
                letterSpacing: 2,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            //BUTTON
            child: paymentState.value != true && userRole.value!['role'] != "basic"
                ? ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.deepOrange),
                    ),
                    onPressed: () {
                      ref.read(paymentProvider.notifier).paymentController();
                    },
                    child: const Text(
                      'Select Plan',
                      style: TextStyle(
                          fontSize: 11,
                          letterSpacing: 2,
                          color: Colors.black,
                          fontWeight: FontWeight.w800),
                    ),
                  )
                : ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Your Plan',
                      style: TextStyle(
                          fontSize: 11,
                          letterSpacing: 2,
                          color: Colors.black,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
