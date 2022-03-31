part of '../../chat.dart';

class ListChatModel {
  List<ChatModel>? chatModels;
  ListChatModel({this.chatModels});

  ListChatModel.fromJson(dynamic json) {
    chatModels = [];
    json.forEach((value) {
      chatModels!.add(ChatModel.fromJson(value));
    });
  }
}
