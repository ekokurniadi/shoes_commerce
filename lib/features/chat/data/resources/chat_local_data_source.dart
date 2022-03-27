import 'package:shamo/features/chat/data/models/list_chat_model.dart';

abstract class ChatLocalDataSource {
  Future<ListChatModel> getLocalDataChat();
}
