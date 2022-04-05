part of '../../chat.dart';

class ChatList extends StatelessWidget {
  final ListChatModel? messages;
  const ChatList({Key? key, this.messages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SizedBox(
      width: double.infinity,
      child: ListView.builder(
          itemCount: messages!.chatModels!.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                BlocProvider.of<RouterCubit>(context)
                    .onChatDetailPage(chatModel: messages!.chatModels![index]);
              },
              child: ChatCard(
                message: messages!.chatModels![index],
              ),
            );
          }),
    ));
  }
}
