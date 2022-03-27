import 'package:shamo/features/chat/domain/entity/chat_entity.dart';

class ChatModel extends ChatEntity {
  const ChatModel({
    required int? chatID,
    required String? image,
    required String? senderName,
    required String? lastMessage,
    required String? time,
  }) : super(
          chatID: chatID,
          image: image,
          senderName: senderName,
          lastMessage: lastMessage,
          time: time,
        );

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      chatID: json['id'],
      image: json['image'],
      senderName: json['sender_name'],
      lastMessage: json['last_message'],
      time: json['time'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "chat_id": chatID,
      "image": image,
      "sender_name": senderName,
      "lastMessage": lastMessage,
      "time": time
    };
  }
}
