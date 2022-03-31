part of '../../chat.dart';

class GetListMessage {
  final ChatRepositories chatRepositories;

  GetListMessage({required this.chatRepositories});

  Future<Either<Failures, ListChatModel>> call() async {
    return await chatRepositories.getDataChat();
  }
}
