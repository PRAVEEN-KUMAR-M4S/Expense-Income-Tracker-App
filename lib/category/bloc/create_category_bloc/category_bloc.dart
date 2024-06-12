import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/category/repository/category_repo.dart';
import 'package:expense_tracker/models/category_model.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepo categoryRepo;
  CategoryBloc(this.categoryRepo) : super(CategoryInitial()) {
    on<CreateCategoryEvent>((event, emit) async {
      emit(CategoryisLoadingState());
      try {
        await categoryRepo.createCategory(event.category);
        emit(CategorySuccessState());
      } catch (e) {
        emit(CategoryFailureState(error: e.toString()));
      }
    });
  }
}
