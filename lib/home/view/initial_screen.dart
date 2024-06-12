import 'package:expense_tracker/home/view/custom_app_bar.dart';
import 'package:expense_tracker/home/view/custom_card.dart';
import 'package:expense_tracker/home/view/main_page.dart';
import 'package:expense_tracker/models/user_model.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatelessWidget {
  final UserModel userModel;
  const InitialScreen({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(right: 25, left: 25, top: 15),
      child: Column(
        children: [
          CustomAppBar(userModel: userModel,),
          const SizedBox(
            height: 20,
          ),
           CustomCard(userModel: userModel,),
          const SizedBox(
            height: 30,
          ),
          const MainScreen(),
        ],
      ),
    );
  }
}
