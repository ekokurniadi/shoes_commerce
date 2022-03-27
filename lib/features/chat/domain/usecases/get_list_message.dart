import 'package:dartz/dartz.dart';
import 'package:shamo/core/error/failures.dart';
import 'package:shamo/features/chat/data/models/list_chat_model.dart';
import 'package:shamo/features/chat/domain/repositories/chat_repositories.dart';

class GetListMessage {
  final ChatRepositories chatRepositories;

  GetListMessage({required this.chatRepositories});

  Future<Either<Failures, ListChatModel>> call() async {
    return await chatRepositories.getDataChat();
  }
}
