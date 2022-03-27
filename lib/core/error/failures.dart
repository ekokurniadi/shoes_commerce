import 'package:equatable/equatable.dart';

abstract class Failures extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class ServerFailures extends Failures {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class LocalFailures extends Failures {
  @override
  List<Object?> get props => throw UnimplementedError();
}
