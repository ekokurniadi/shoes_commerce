part of '../../chat.dart';

abstract class ChatRepositories {
  Future<Either<Failures, ListChatModel>> getDataChat();
}
