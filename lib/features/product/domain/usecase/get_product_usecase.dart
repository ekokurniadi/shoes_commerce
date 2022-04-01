part of '../../product.dart';

class GetProductUsecase {
  final ProductRemoteDataSource productRemoteDataSource;
  GetProductUsecase({required this.productRemoteDataSource});

  Future<Either<Failures, ListProductModel>> call(int page) async {
    return await productRemoteDataSource.getProduct(page);
  }
}
