part of '../../category.dart';

class GetCategoryUseCases {
  final CategoryRemoteDataSource categoryRemoteDataSource;
  GetCategoryUseCases({required this.categoryRemoteDataSource});

  Future<Either<Failures, ListCategoryModel>> call() async {
    return await categoryRemoteDataSource.getCategories();
  }
}
