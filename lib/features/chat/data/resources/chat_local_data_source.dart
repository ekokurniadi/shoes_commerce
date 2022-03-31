part of '../../chat.dart';

abstract class ChatLocalDataSource {
  Future<ListChatModel> getLocalDataChat();
}
