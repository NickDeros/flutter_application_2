import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/widgets/pricing_table/first_table.dart';
import 'package:flutter_application_2/pages/widgets/pricing_table/second_table.dart';

class PlansPage extends StatelessWidget {
  const PlansPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              FirstTable(),
              SizedBox(height: 40,),
              SecondTable(),
            ],
          ),
        ),
      ),
    );
  }
}
