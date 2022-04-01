part of '../../product.dart';

class ListProductModel {
  List<ProductModel>? productModel;
  ListProductModel({this.productModel});

  ListProductModel.fromJson(dynamic json) {
    productModel = [];

    json.forEach((value) {
      productModel!.add(ProductModel.fromJson(value));
    });
  }
}
