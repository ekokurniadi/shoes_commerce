part of '../../product.dart';

class GetPopularProductUsecase {
  final ProductRemoteDataSource productRemoteDataSource;
  GetPopularProductUsecase({required this.productRemoteDataSource});

  Future<Either<Failures, ListProductModel>> call(int page) async {
    return await productRemoteDataSource.getPopularProduct(page);
  }
}
