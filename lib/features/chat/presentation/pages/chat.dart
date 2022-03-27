import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:shamo/core/utility/theme_helper.dart';
import 'package:shamo/features/chat/data/models/list_chat_model.dart';
import 'package:shamo/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:shamo/features/chat/presentation/widgets/chats.dart';
import 'package:shamo/features/chat/presentation/widgets/empty_chat.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ListChatModel listChatModel = ListChatModel();
    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text(
          "Message Support",
          style: primaryTextStyle.copyWith(
            fontWeight: medium,
            fontSize: 18,
          ),
        ),
      ),
      body: BlocBuilder<ChatCubit, ChatState>(
        builder: (context, state) {
          if (state is ChatInitial) {
            BlocProvider.of<ChatCubit>(context).getList();
            return Center(
              child: SpinKitThreeBounce(color: secondaryColor, size: 20),
            );
          } else if (state is ChatLoadingState) {
            return Center(
              child: SpinKitThreeBounce(color: secondaryColor, size: 20),
            );
          } else if (state is GetListMessageState) {
            listChatModel = state.listChatModel!;
          }
          return Column(
            children: [
              listChatModel.chatModels == null ||
                      listChatModel.chatModels!.isEmpty
                  ? const EmptyChat()
                  : Chats(messages: listChatModel),
            ],
          );
        },
      ),
    );
  }
}
