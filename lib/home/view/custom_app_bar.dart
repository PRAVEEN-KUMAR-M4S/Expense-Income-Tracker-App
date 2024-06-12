import 'package:expense_tracker/auth/bloc/authentication_bloc.dart';
import 'package:expense_tracker/constants/constants.dart';
import 'package:expense_tracker/expense/get_expense_bloc/get_expense_bloc.dart';
import 'package:expense_tracker/home/bloc/fetch_data_bloc.dart';
import 'package:expense_tracker/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBar extends StatelessWidget {
  final UserModel userModel;
  const CustomAppBar({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 230, 211, 42)),
                      ),
                      const Icon(CupertinoIcons.person)
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome!',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.outline),
                      ),
                      Text(
                        userModel.name,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        userModel.email,
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: Colors.black),
                      )
                    ],
                  )
                ],
              ),
              BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (context, state) {
                  return Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: whiteColor,
                    ),
                    child: IconButton(
                      onPressed: () {
                        context.read<FetchDataBloc>().add(FetchUserData());
                        context.read<GetExpenseBloc>().add(GetExpense());
                      },
                      icon: Icon(CupertinoIcons.settings,
                          color: Theme.of(context).colorScheme.outline),
                    ),
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
