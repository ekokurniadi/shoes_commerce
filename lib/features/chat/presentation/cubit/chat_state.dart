part of 'chat_cubit.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

class ChatInitial extends ChatState {}

class ChatErrorState extends ChatState {}

class ChatLoadingState extends ChatState {}

class GetListMessageState extends ChatState {
  final ListChatModel? listChatModel;
  const GetListMessageState({this.listChatModel});

  @override
  List<Object> get props => [listChatModel!];
}
