part of '../../galery.dart';

class GaleryEntity extends Equatable {
  final int? id;
  final String? url;

  const GaleryEntity({this.id, this.url});

  @override
  List<Object?> get props => [id, url];
}
