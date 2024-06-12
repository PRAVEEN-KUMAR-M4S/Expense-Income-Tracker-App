import 'package:expense_tracker/screens/stats/scrrens/expense.dart';
import 'package:expense_tracker/screens/stats/scrrens/income.dart';
import 'package:flutter/material.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({super.key});

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  var screens = [const ExpenseScreen(), const IncomeScreen()];

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(right: 25, left: 25, top: 15),
        child: Column(
          children: [
            const Text(
              'Transactions',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            DefaultTabController(
                length: 2,
                child: TabBar(
                    onTap: (value) {
                      setState(() {
                        index = value;
                      });
                    },
                    tabs: const [
                      Tab(
                        child: Text('Expense'),
                      ),
                      Tab(child: Text('Income'))
                    ])),
            const SizedBox(
              height: 20,
            ),
            index == 0 ? const ExpenseScreen() : const IncomeScreen()
          ],
        ),
      ),
    );
  }
}
