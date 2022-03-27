import 'package:shamo/features/chat/data/models/list_chat_model.dart';
import 'package:shamo/features/chat/data/resources/chat_data.dart';
import 'package:shamo/features/chat/data/resources/chat_local_data_source.dart';

class ChatLocalDataSourceImpl extends ChatLocalDataSource {
  @override
  Future<ListChatModel> getLocalDataChat() async {
    ListChatModel _listChatModel;
    _listChatModel = ListChatModel.fromJson(ChatData.obj);
    return _listChatModel;
  }
}
