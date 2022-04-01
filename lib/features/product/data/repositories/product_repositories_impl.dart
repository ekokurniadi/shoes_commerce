part of '../../product.dart';

class ProductRepositoriesImpl extends ProductRepositories {
  final ProductRemoteDataSource productRemoteDataSource;
  ProductRepositoriesImpl({required this.productRemoteDataSource});
  @override
  Future<Either<Failures, ListProductModel>> getProduct(int page) async {
    return await productRemoteDataSource.getProduct(page);
  }

  @override
  Future<Either<Failures, ListProductModel>> getPopularProduct(int page) async {
    return await productRemoteDataSource.getPopularProduct(page);
  }
}
