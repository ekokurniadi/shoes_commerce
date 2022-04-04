part of '../../wishlist.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text(
          "Favorite Shoes",
          style: primaryTextStyle.copyWith(
            fontWeight: medium,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            EmptyWishList(),
          ],
        ),
      ),
    );
  }
}
