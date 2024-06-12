part of 'get_expense_bloc.dart';

sealed class GetExpenseState extends Equatable {
  const GetExpenseState();

  @override
  List<Object> get props => [];
}

final class GetExpenseInitial extends GetExpenseState {}

final class GetExpenseFailureState extends GetExpenseState {
  final String error;

  const GetExpenseFailureState({required this.error});
}

final class GetExpenseLoadingState extends GetExpenseState {}

final class GetExpenseSuccessState extends GetExpenseState {
  final List<ExpenseModel> expenseModel;

  const GetExpenseSuccessState({required this.expenseModel});
  
  @override
  List<Object> get props => [expenseModel];
}
