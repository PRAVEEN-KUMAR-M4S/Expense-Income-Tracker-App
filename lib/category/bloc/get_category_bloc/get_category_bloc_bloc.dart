import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/category/repository/category_repo.dart';
import 'package:expense_tracker/models/category_model.dart';

part 'get_category_bloc_event.dart';
part 'get_category_bloc_state.dart';

class GetCategoryBlocBloc
    extends Bloc<GetCategoryBlocEvent, GetCategoryBlocState> {
  final CategoryRepo categoryRepo;
  GetCategoryBlocBloc(this.categoryRepo) : super(GetCategoryBlocInitial()) {
    on<GetCategoryEvent>((event, emit) async {
      emit(GetCategoryBlocLoadingState());
      try {
        final List<CategoryModel> categories =
            await categoryRepo.getAllCategory();
        emit(GetCategoryBlocSuccessState(categories: categories));
      } catch (e) {
        emit(GetCategoryBlocFailureState(error: e.toString()));
      }
    });
  }
}
