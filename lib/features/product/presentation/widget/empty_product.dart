part of '../../product.dart';

class EmptyProduct extends StatelessWidget {
  const EmptyProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 278,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            "Sorry, we dont find any products for this category\nPlease try with a other category",
            textAlign: TextAlign.center,
            style: secondaryTextStyle.copyWith(
              fontWeight: medium,
            ),
          ),
        ],
      ),
    );
  }
}
