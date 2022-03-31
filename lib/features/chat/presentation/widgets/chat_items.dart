part of '../../chat.dart';

class ChatItems extends StatelessWidget {
  final ChatModel? message;
  const ChatItems({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(top: 33, left: defaultMargin, right: defaultMargin),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                message!.image!,
                width: 54,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message!.senderName!,
                      style: primaryTextStyle.copyWith(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      message!.lastMessage!,
                      style: secondaryTextStyle.copyWith(
                        fontSize: 15,
                        fontWeight: light,
                      ),
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
              Text(
                message!.time!,
                style: secondaryTextStyle.copyWith(fontSize: 10),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(
            thickness: 1,
            color: Color(0xff2B2939),
          )
        ],
      ),
    );
  }
}
