part of '../../category.dart';

abstract class CategoryLocalDataSource {
  Future<Either<Failures, ListCategoryModel>> getCategoriesFromLocal();
  Future<Either<Failures, ListCategoryModel>> insertCategoriesToLocal({
    required CategoryModel categoryModel,
  });
}
