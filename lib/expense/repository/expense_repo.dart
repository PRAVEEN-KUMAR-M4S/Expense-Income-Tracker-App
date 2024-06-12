import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ExpenseRepo {
  final expenseCollection = FirebaseFirestore.instance
      .collection('user')
      .doc(FirebaseAuth.instance.currentUser!.email)
      .collection('expense');

  Future<void> createExpense(ExpenseModel expense) async {
    try {
      await expenseCollection.doc(expense.expenseId).set(expense.toMap());
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> updateExpense(
      double newExpense, double newIncome, double newBalance) async {
    try {
      await FirebaseFirestore.instance
          .collection('user')
          .doc(FirebaseAuth.instance.currentUser!.email)
          .update({
        'expense': newExpense,
        'income':newIncome,
        'totalBalance':newBalance
      });
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<List<ExpenseModel>> getExpense() async {
    try {
      return await expenseCollection.get().then((value) =>
          value.docs.map((e) => ExpenseModel.fromMap(e.data())).toList());
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
