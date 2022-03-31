part of '../../chat.dart';

class ChatLocalDataSourceImpl extends ChatLocalDataSource {
  @override
  Future<ListChatModel> getLocalDataChat() async {
    ListChatModel _listChatModel;
    _listChatModel = ListChatModel.fromJson(ChatData.obj);
    return _listChatModel;
  }
}
