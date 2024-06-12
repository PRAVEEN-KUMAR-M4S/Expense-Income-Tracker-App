part of 'category_bloc.dart';

sealed class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

final class CreateCategoryEvent extends CategoryEvent {
  final CategoryModel category;

  const CreateCategoryEvent({required this.category});

   @override
  List<Object> get props => [category];
}
