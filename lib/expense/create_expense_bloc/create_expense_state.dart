part of 'create_expense_bloc.dart';

sealed class CreateExpenseState extends Equatable {
  const CreateExpenseState();

  @override
  List<Object> get props => [];
}

final class CreateExpenseInitial extends CreateExpenseState {}

final class CreateExpenseSuccessState extends CreateExpenseState {}

final class CreateExpenseFailureState extends CreateExpenseState {
 final String error;

  const CreateExpenseFailureState({required this.error});
  
}

final class CreateExpenseLoadingState extends CreateExpenseState {}
