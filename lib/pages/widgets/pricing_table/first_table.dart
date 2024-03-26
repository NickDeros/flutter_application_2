import 'package:flutter/material.dart';
import 'package:flutter_application_2/repositories/stripe_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirstTable extends ConsumerWidget {
  const FirstTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 500,
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
          const SizedBox(
            height: 30,
          ),
          const Text(
            '\$10',
            style: TextStyle(
                color: Colors.orangeAccent,
                fontSize: 15,
                letterSpacing: 2,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            '1GB Disk Space',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 13,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            '500 MB Bandwidth',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 13,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            '1 Sub Domain',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 13,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Free Transfer',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 13,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            '1 Email Account',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 12,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'SMTP',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 13,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Email Support',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 13,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 35,
            width: 130,
            decoration: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              //BUTTON
              child: ElevatedButton(
                onPressed: () {
                  ref.read(stripeRepoProvider).stripeMakePayment();
                },
                child: const Text(
                  'Select Plan',
                  style: TextStyle(
                      fontSize: 11,
                      letterSpacing: 2,
                      color: Colors.black,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
