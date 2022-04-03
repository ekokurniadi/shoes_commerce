part of '../../product.dart';

abstract class ProductRepositories {
  Future<Either<Failures, ListProductModel>> getProduct(
      int page, int? category);
  Future<Either<Failures, ListProductModel>> getPopularProduct(
      int page, int? category);
}
