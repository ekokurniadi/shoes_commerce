part of '../../category.dart';

class CategoryRemoteDataSourceImpl extends CategoryRemoteDataSource {
  @override
  Future<Either<Failures, ListCategoryModel>> getCategories() async {
    ListCategoryModel _listCategoryModel;

    try {
      Response response =
          await DioHelper.dio!.get(ConstantHelper.BASE_URL + "/categories");

      _listCategoryModel =
          ListCategoryModel.fromJson(response.data['data']['data']);

      return Right(_listCategoryModel);
    } on DioError catch (e) {
      return Left(ServerFailures(errorMessage: e.message));
    }
  }
}
