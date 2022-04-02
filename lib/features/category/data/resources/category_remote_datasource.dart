part of '../../category.dart';

abstract class CategoryRemoteDataSource {
  Future<Either<Failures, ListCategoryModel>> getCategories();
}
