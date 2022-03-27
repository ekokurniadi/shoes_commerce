import 'package:dartz/dartz.dart';
import 'package:shamo/core/error/failures.dart';
import 'package:shamo/features/chat/data/models/list_chat_model.dart';

abstract class ChatRepositories {
  Future<Either<Failures, ListChatModel>> getDataChat();
}
