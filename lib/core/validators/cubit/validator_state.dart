part of 'validator_cubit.dart';

abstract class ValidatorState extends Equatable {
  const ValidatorState();

  @override
  List<Object> get props => [];
}

class ValidatorInitial extends ValidatorState {}

class IsEmailValid extends ValidatorState {
  final String? message;
  const IsEmailValid({this.message});

  @override
  List<Object> get props => [message!];
}

class IsHaveUpperCase extends ValidatorState {
  final String? message;
  const IsHaveUpperCase({this.message});

  @override
  List<Object> get props => [message!];
}

class IsHaveLowerCase extends ValidatorState {
  final String? message;
  const IsHaveLowerCase({this.message});

  @override
  List<Object> get props => [message!];
}

class IsHaveSymbol extends ValidatorState {
  final String? message;
  const IsHaveSymbol({this.message});

  @override
  List<Object> get props => [message!];
}

class IsGreaterThanEight extends ValidatorState {
  final String? message;
  const IsGreaterThanEight({this.message});

  @override
  List<Object> get props => [message!];
}

class IsPasswordValid extends ValidatorState {
  final List<String>? result;
  const IsPasswordValid({this.result});

  @override
  List<Object> get props => [result!];
}

class NameIsEmpty extends ValidatorState {
  final String? message;
  const NameIsEmpty({this.message});

  @override
  List<Object> get props => [message!];
}

class UserNameIsEmpty extends ValidatorState {
  final String? message;
  const UserNameIsEmpty({this.message});

  @override
  List<Object> get props => [message!];
}
