part of 'category_cubit.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryInit extends CategoryState {
  final ListCategoryModel? listCategoryModel;
  const CategoryInit({this.listCategoryModel});

  @override
  List<Object> get props => [listCategoryModel!];
}

class OnCategoriesChanges extends CategoryState {
  final int? index;
  final int? category;
  const OnCategoriesChanges({this.index, this.category});

  @override
  List<Object> get props => [index!, category ?? 0];
}

class OnCategoryLoaded extends CategoryState {
  final ListCategoryModel? listCategoryModel;
  const OnCategoryLoaded({this.listCategoryModel});

  @override
  List<Object> get props => [listCategoryModel!];
}

class OnCategoryLoadedError extends CategoryState {
  final Failures? message;
  const OnCategoryLoadedError({this.message});

  @override
  List<Object> get props => [message!];
}
