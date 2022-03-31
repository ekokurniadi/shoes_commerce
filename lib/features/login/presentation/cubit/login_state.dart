part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginOnProcess extends LoginState {}

class LogOutOnProcess extends LoginState {}

class LogOutSuccess extends LoginState {}

class LoginSuccess extends LoginState {
  final UserModel? userModel;
  const LoginSuccess({this.userModel});

  @override
  List<Object> get props => [userModel!];
}

class LoginError extends LoginState {
  final Failures? errorMessage;
  const LoginError({this.errorMessage});

  @override
  List<Object> get props => [errorMessage!];
}
