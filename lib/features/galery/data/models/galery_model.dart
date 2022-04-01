part of '../../galery.dart';

class GaleryModel extends GaleryEntity {
  const GaleryModel({required int id, required String url})
      : super(id: id, url: url);

  factory GaleryModel.fromJson(Map<String, dynamic> json) {
    return GaleryModel(id: json['id'], url: json['url']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
    };
  }
}
