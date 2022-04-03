part of '../../product.dart';

class PopularProductCard extends StatelessWidget {
  final int index;
  final ProductModel productModel;
  const PopularProductCard({
    Key? key,
    required this.index,
    required this.productModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 215,
      height: 278,
      margin: EdgeInsets.only(
          right: defaultMargin, left: index == 0 ? defaultMargin : 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xffECEDEF),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: defaultMargin,
          ),
          Image.network(
            productModel.galeryModel!.galeryModel![0].url!.toString(),
            width: 215,
            height: 150,
            fit: BoxFit.cover,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModel.categoryModel!.name!,
                  style: secondaryTextStyle,
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  productModel.name!,
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semiBold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  "\$${productModel.price!.toString()}",
                  style: priceTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
