part of '../../chat.dart';

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
            return GestureDetector(
              onTap: () {
                BlocProvider.of<RouterCubit>(context)
                    .onChatDetailPage(chatModel: messages!.chatModels![index]);
              },
              child: ChatItems(
                message: messages!.chatModels![index],
              ),
            );
          }),
    ));
  }
}
