import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/expense/repository/expense_repo.dart';
import 'package:expense_tracker/models/expense.dart';

part 'create_expense_event.dart';
part 'create_expense_state.dart';

class CreateExpenseBloc extends Bloc<CreateExpenseEvent, CreateExpenseState> {
  final ExpenseRepo expenseRepo;
  CreateExpenseBloc(this.expenseRepo) : super(CreateExpenseInitial()) {
    on<CreateExpense>((event, emit) async {
      emit(CreateExpenseLoadingState());
      try {
        await expenseRepo.createExpense(event.expenseModel);
        await expenseRepo.updateExpense(event.newExpense,event.newIncome,event.newBalance);
        emit(CreateExpenseSuccessState());
      } catch (e) {
        emit(CreateExpenseFailureState(error: e.toString()));
      }
    });
  }
}
