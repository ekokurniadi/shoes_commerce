part of 'signup_cubit.dart';

abstract class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

class SignupInitial extends SignupState {}

class OnSignupLoading extends SignupState {}

class OnSignupError extends SignupState {}

class OnSignupSuccess extends SignupState {}
