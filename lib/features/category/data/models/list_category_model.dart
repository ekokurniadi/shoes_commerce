part of '../../category.dart';

class ListCategoryModel {
  List<CategoryModel>? listCategoryModel;
  ListCategoryModel({this.listCategoryModel});

  ListCategoryModel.fromJson(dynamic json) {
    listCategoryModel = [];
    json.forEach((value) {
      listCategoryModel!.add(CategoryModel.fromJson(value));
    });
  }
}
