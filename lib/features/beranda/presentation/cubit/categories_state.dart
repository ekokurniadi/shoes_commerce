part of 'categories_cubit.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

class CategoriesInitial extends CategoriesState {}

class OnCategoriesChanges extends CategoriesState {
  final int index;
  const OnCategoriesChanges(this.index);
  @override
  List<Object> get props => [index];
}
