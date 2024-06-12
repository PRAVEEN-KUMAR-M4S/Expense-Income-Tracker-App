import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/expense/repository/expense_repo.dart';
import 'package:expense_tracker/models/expense.dart';

part 'get_expense_event.dart';
part 'get_expense_state.dart';

class GetExpenseBloc extends Bloc<GetExpenseEvent, GetExpenseState> {
  final ExpenseRepo expenseRepo;
  GetExpenseBloc(this.expenseRepo) : super(GetExpenseInitial()) {
    on<GetExpense>((event, emit) async {
      emit(GetExpenseLoadingState());
      try {
        final List<ExpenseModel> expense = await expenseRepo.getExpense();
        emit(GetExpenseSuccessState(expenseModel: expense));
      } catch (e) {
        emit(GetExpenseFailureState(error: e.toString()));
      }
    });
  }
}
