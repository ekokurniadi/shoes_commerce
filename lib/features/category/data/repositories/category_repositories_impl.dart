part of '../../category.dart';

class CategoryRepositoriesImpl extends CategoryRepositories {
  final CategoryRemoteDataSource categoryRemoteDataSource;
  CategoryRepositoriesImpl({required this.categoryRemoteDataSource});

  @override
  Future<Either<Failures, ListCategoryModel>> getCategories() async {
    return await categoryRemoteDataSource.getCategories();
  }
}
