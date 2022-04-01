part of '../../product.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required int? id,
    required String? name,
    required double? price,
    required String? description,
    required String? tags,
    required CategoryModel? categoryModel,
    required DateTime? createdAt,
    required DateTime? updatedAt,
    required ListGaleryModel? galeryModel,
  }) : super(
          id: id,
          name: name,
          price: price,
          description: description,
          tags: tags,
          categoryModel: categoryModel,
          createdAt: createdAt,
          updatedAt: updatedAt,
          galeryModel: galeryModel,
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      price: double.parse(json['price'].toString()),
      description: json['description'],
      tags: json['tags'],
      categoryModel: CategoryModel.fromJson(json['category']),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      galeryModel: ListGaleryModel.fromJson(json['galleries']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'tags': tags,
      'category': categoryModel!.toJson(),
      'galleries': galeryModel!.toJson(),
      'created_at': createdAt.toString(),
      'updated_at': updatedAt.toString(),
    };
  }
}
