import 'package:shamo/features/chat/data/models/list_chat_model.dart';
import 'package:shamo/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:shamo/features/chat/data/resources/chat_local_data_source.dart';

import 'package:shamo/features/chat/domain/repositories/chat_repositories.dart';

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
