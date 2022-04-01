part of '../../category.dart';

class CategoryEntity extends Equatable {
  final int? id;
  final String? name;
  const CategoryEntity({this.id, this.name});

  @override
  List<Object?> get props => [id, name];
}
