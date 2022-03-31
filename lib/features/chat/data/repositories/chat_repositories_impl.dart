part of '../../chat.dart';

class ChatRepositoriesImpl extends ChatRepositories {
  final ChatLocalDataSource chatLocalDataSourceImpl;
  ChatRepositoriesImpl({required this.chatLocalDataSourceImpl});
  @override
  Future<Either<Failures, ListChatModel>> getDataChat() async {
    try {
      var result = await chatLocalDataSourceImpl.getLocalDataChat();
      return Right(result);
    } catch (e) {
      return Left(ServerFailures());
    }
  }
}
