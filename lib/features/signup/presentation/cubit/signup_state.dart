part of 'signup_cubit.dart';

abstract class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

class SignupInitial extends SignupState {}

class OnSignupLoading extends SignupState {}

class OnSignupError extends SignupState {
  final Failures? errorMessage;
  const OnSignupError({this.errorMessage});

  @override
  List<Object> get props => [errorMessage!];
}

class OnSignupSuccess extends SignupState {
  final UserModel? userModel;
  const OnSignupSuccess({this.userModel});

  @override
  List<Object> get props => [userModel!];
}
