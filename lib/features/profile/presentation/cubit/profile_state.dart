part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileOnProcess extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final UserModel userModel;
  const ProfileSuccess({required this.userModel});

  @override
  List<Object> get props => [userModel];
}
