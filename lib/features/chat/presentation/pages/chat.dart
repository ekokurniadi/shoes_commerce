part of '../../chat.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ChatCubit>(context).getList();

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
