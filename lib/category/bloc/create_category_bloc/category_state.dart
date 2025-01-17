part of 'category_bloc.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

final class CategoryInitial extends CategoryState {}

final class CategorySuccessState extends CategoryState {}

final class CategoryFailureState extends CategoryState {
  final String error;

  const CategoryFailureState({required this.error});

}

final class CategoryisLoadingState extends CategoryState {}
