import 'package:flutter/material.dart';

class SecondTable extends StatelessWidget {
  const SecondTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
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
            'Premium',
            style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            '\$200/mo',
            style: TextStyle(
                color: Colors.orangeAccent,
                fontSize: 15,
                letterSpacing: 2,
                fontWeight: FontWeight.bold),
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
            child: const Center(
              child: Text(
                'Select Plan',
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