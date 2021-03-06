part of 'router_cubit.dart';

abstract class RouterState extends Equatable {
  const RouterState();

  @override
  List<Object> get props => [];
}

class RouterInitial extends RouterState {}

class OnSplashPage extends RouterState {}

class OnSignInPage extends RouterState {}

class OnSignUpPage extends RouterState {}

class OnHomePage extends RouterState {}

class OnChatDetailPage extends RouterState {
  final ChatModel? chatModel;

  const OnChatDetailPage({this.chatModel});

  @override
  List<Object> get props => [chatModel!];
}
