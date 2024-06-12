import 'package:countup/countup.dart';
import 'package:expense_tracker/constants/constants.dart';
import 'package:expense_tracker/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final UserModel userModel;
  const CustomCard({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              blurRadius: 10,
              color: Theme.of(context).colorScheme.outline,
              offset: const Offset(2, 2)),
        ],
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(colors: [
          Theme.of(context).colorScheme.primary,
          Theme.of(context).colorScheme.secondary,
          Theme.of(context).colorScheme.tertiary
        ], transform: const GradientRotation(3.14 / 4)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Total Balance',
            style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: 16, color: whiteColor),
          ),
          const SizedBox(
            height: 10,
          ),
          Countup(
            begin: 0,
            end: userModel.totalBalance,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 32, color: whiteColor),
            duration: const Duration(seconds: 3),
            separator: ',',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.4)),
                      child: const Icon(
                        size: 14,
                        weight: 100,
                        CupertinoIcons.down_arrow,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Income',
                          style: TextStyle(
                              fontWeight: FontWeight.w300, color: whiteColor),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Countup(
                          begin: 0,
                          end: userModel.income,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: whiteColor,
                              fontSize: 16),
                          duration: const Duration(seconds: 1),
                          separator: ',',
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.4)),
                      child: const Icon(
                        size: 14,
                        weight: 100,
                        CupertinoIcons.up_arrow,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Expenses',
                          style: TextStyle(
                              fontWeight: FontWeight.w300, color: whiteColor),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                          Countup(
                          begin: 0,
                          end: userModel.expense,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: whiteColor,
                              fontSize: 16),
                          duration: const Duration(seconds: 1),
                          separator: ',',
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
