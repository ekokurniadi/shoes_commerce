part of '../../product.dart';

class EmptyProduct extends StatelessWidget {
  const EmptyProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: defaultMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            child: Text(
              "Sorry, we don't find any products\nfor this category\nPlease try with another category",
              textAlign: TextAlign.center,
              style: secondaryTextStyle.copyWith(
                fontWeight: medium,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
