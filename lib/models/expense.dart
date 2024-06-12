import 'package:expense_tracker/models/category_model.dart';

class ExpenseModel {
   String expenseId;
   CategoryModel category;
   DateTime dateTime;
   double amount;
  ExpenseModel({
    required this.expenseId,
    required this.category,
    required this.dateTime,
    required this.amount,
  });

  static final empty = ExpenseModel(
      expenseId: '',
      category: CategoryModel.empty,
      dateTime: DateTime.now(),
      amount: 0.0);

  ExpenseModel copyWith({
    String? expenseId,
    CategoryModel? category,
    DateTime? dateTime,
    double? amount,
  }) {
    return ExpenseModel(
      expenseId: expenseId ?? this.expenseId,
      category: category ?? this.category,
      dateTime: dateTime ?? this.dateTime,
      amount: amount ?? this.amount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'expenseId': expenseId,
      'category': category.toMap(),
      'dateTime': dateTime.millisecondsSinceEpoch,
      'amount': amount,
    };
  }

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
      expenseId: map['expenseId'] as String,
      category: CategoryModel.fromMap(map['category'] as Map<String, dynamic>),
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int),
      amount: map['amount'] as double,
    );
  }
}
