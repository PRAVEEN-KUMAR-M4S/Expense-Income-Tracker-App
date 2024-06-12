import 'package:expense_tracker/constants/constants.dart';
import 'package:expense_tracker/screens/stats/chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExpenseScreen extends StatelessWidget {
  const ExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: whiteColor),
          child:  Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  '01 jan 2021-01 April 2021',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                      fontSize: 14),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Rs.3500',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 10,),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width*0.55,
                child: const MyChart(),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
