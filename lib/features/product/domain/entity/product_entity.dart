part of '../../product.dart';

class ProductEntity extends Equatable {
  final int? id;
  final String? name;
  final double? price;
  final String? description;
  final String? tags;
  final CategoryModel? categoryModel;
  final DateTime? createdAt, updatedAt;
  final ListGaleryModel? galeryModel;
  const ProductEntity({
    this.id,
    this.name,
    this.price,
    this.description,
    this.tags,
    this.categoryModel,
    this.createdAt,
    this.updatedAt,
    this.galeryModel,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        price,
        description,
        tags,
        categoryModel,
        createdAt,
        updatedAt,
        galeryModel,
      ];
}
