part of '../../wishlist.dart';

class EmptyWishList extends StatelessWidget {
  const EmptyWishList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      color: backgroundColor3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/image_wishlist.png',
            width: 74,
          ),
          const SizedBox(
            height: 23,
          ),
          Text(
            "You don't have dream shoes?",
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            "You don't have dream shoes?",
            style: secondaryTextStyle,
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 44,
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Explore Store",
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 24,
                ),
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
