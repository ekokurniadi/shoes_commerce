import 'package:equatable/equatable.dart';

class ChatEntity extends Equatable {
  final int? chatID;
  final String? image;
  final String? senderName;
  final String? lastMessage;
  final String? time;
  const ChatEntity(
      {this.chatID, this.image, this.senderName, this.lastMessage, this.time});

  @override
  List<Object?> get props => [chatID, image, senderName, lastMessage, time];
}
