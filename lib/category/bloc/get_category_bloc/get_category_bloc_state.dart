part of 'get_category_bloc_bloc.dart';

sealed class GetCategoryBlocState extends Equatable {
  const GetCategoryBlocState();

  @override
  List<Object> get props => [];
}

final class GetCategoryBlocInitial extends GetCategoryBlocState {}

final class GetCategoryBlocSuccessState extends GetCategoryBlocState {
  final List<CategoryModel> categories;

  const GetCategoryBlocSuccessState({required this.categories});

  
  @override
  List<Object> get props => [categories];
}

final class GetCategoryBlocFailureState extends GetCategoryBlocState {
  final String error;

  const GetCategoryBlocFailureState({required this.error});
  
}

final class GetCategoryBlocLoadingState extends GetCategoryBlocState {}
