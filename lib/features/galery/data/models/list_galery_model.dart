part of '../../galery.dart';

class ListGaleryModel {
  List<GaleryModel>? galeryModel;
  ListGaleryModel({this.galeryModel});

  ListGaleryModel.fromJson(dynamic json) {
    galeryModel = [];
    json.forEach((value) {
      galeryModel!.add(GaleryModel.fromJson(value));
    });
  }

  List<Map<String, dynamic>> toJson() {
    return galeryModel!.map((GaleryModel galery) => galery.toJson()).toList();
  }
}
