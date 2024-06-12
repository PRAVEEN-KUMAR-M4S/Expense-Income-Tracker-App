import 'package:expense_tracker/constants/constants.dart';
import 'package:expense_tracker/expense/get_expense_bloc/get_expense_bloc.dart';
import 'package:expense_tracker/home/bloc/fetch_data_bloc.dart';
import 'package:expense_tracker/models/user_model.dart';
import 'package:expense_tracker/category/add_expense/add_expense.dart';
import 'package:expense_tracker/home/view/initial_screen.dart';
import 'package:expense_tracker/screens/stats/stats.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late UserModel userModel;
  int index = 0;

  @override
  void initState() {
    context.read<FetchDataBloc>().add(FetchUserData());
    context.read<GetExpenseBloc>().add(GetExpense());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          backgroundColor: whiteColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 3,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.graph_square_fill), label: 'Status')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) =>  AddExpense(userModel: userModel,))),
        shape: const CircleBorder(),
        child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                transform: const GradientRotation(3.14 / 4),
                colors: [
                  Theme.of(context).colorScheme.tertiary,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.primary
                ],
              ),
            ),
            child: const Icon(CupertinoIcons.add)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: BlocBuilder<FetchDataBloc, FetchDataState>(
        builder: (context, state) {
          if (state is FetchUserDataFailure) {
            return Center(
              child: Text(state.error),
            );
          } else if (state is! FetchUserDataSuccess) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }

          userModel = state.userModel;

          List<Widget> screen = [
            InitialScreen(userModel: userModel),
            const StatsScreen()
          ];
          return screen[index];
        },
      ),
    );
  }
}
