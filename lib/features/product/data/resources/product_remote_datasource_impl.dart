part of '../../product.dart';

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  @override
  Future<Either<Failures, ListProductModel>> getProduct(
      int page, int? category) async {
    ListProductModel listProductModel;
    String url = "/products?page=$page";
    try {
      Response response = await DioHelper.dio!.get(
        ConstantHelper.BASE_URL +
            url +
            (category != null ? '&categories=$category' : ''),
      );
      listProductModel =
          ListProductModel.fromJson(response.data['data']['data']);
      return Right(listProductModel);
    } on DioError catch (e) {
      return Left(ServerFailures(errorMessage: e.message));
    }
  }

  @override
  Future<Either<Failures, ListProductModel>> getPopularProduct(int page) async {
    ListProductModel listProductModel;

    try {
      Response response = await DioHelper.dio!.get(
          ConstantHelper.BASE_URL + '/products',
          queryParameters: {'page': page});
      listProductModel =
          ListProductModel.fromJson(response.data['data']['data']);
      return Right(listProductModel);
    } on DioError catch (e) {
      return Left(ServerFailures(errorMessage: e.message));
    }
  }
}