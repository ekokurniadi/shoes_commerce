import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shamo/core/error/failures.dart';
import 'package:shamo/features/category/category.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final GetCategoryUseCases getCategoryUseCases;
  CategoryCubit({required this.getCategoryUseCases}) : super(CategoryInitial());

  void setIndex(int index, int category) async {
    emit(OnCategoriesChanges(index: index, category: category));
  }

  Future<void> getCategory() async {
    emit(CategoryInitial());
    final result = await getCategoryUseCases.call();
    result.fold((failures) {
      emit(OnCategoryLoadedError(message: failures));
    }, (response) {
      emit(CategoryInit(listCategoryModel: response));
      emit(OnCategoryLoaded(listCategoryModel: response));
    });
  }
}
