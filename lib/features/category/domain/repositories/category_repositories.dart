part of '../../category.dart';

abstract class CategoryRepositories {
  Future<Either<Failures, ListCategoryModel>> getCategories();
}
