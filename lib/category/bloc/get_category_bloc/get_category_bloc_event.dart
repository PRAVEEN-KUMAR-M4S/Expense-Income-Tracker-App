part of 'get_category_bloc_bloc.dart';

sealed class GetCategoryBlocEvent extends Equatable {
  const GetCategoryBlocEvent();

  @override
  List<Object> get props => [];
}

final class GetCategoryEvent extends GetCategoryBlocEvent {}
