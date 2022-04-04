part of '../../wishlist.dart';

class EmptyWishList extends StatelessWidget {
  const EmptyWishList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      color: backgroundColor3,
    );
  }
}
