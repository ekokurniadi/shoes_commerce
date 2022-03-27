import 'package:flutter/material.dart';
import 'package:shamo/features/chat/data/models/list_chat_model.dart';
import 'package:shamo/features/chat/presentation/widgets/chat_items.dart';

class Chats extends StatelessWidget {
  final ListChatModel? messages;
  const Chats({Key? key, this.messages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SizedBox(
      width: double.infinity,
      child: ListView.builder(
          itemCount: messages!.chatModels!.length,
          itemBuilder: (context, index) {
            return ChatItems(
              message: messages!.chatModels![index],
            );
          }),
    ));
  }
}
