part of 'create_expense_bloc.dart';

sealed class CreateExpenseEvent extends Equatable {
  const CreateExpenseEvent();

  @override
  List<Object> get props => [];
}

final class CreateExpense extends CreateExpenseEvent {
  final ExpenseModel expenseModel;
  final double newExpense;
  final double newIncome;
  final double newBalance;

  const CreateExpense({required this.newIncome,required this.newBalance,required this.newExpense, required this.expenseModel});

  @override
  List<Object> get props => [newExpense, expenseModel];
}
