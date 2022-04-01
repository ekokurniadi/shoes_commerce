part of '../../category.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({required int id, required String name})
      : super(id: id, name: name);

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(id: json['id'], name: json['name']);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
    };
  }
}
