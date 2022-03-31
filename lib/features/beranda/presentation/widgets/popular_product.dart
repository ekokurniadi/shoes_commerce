part of '../../beranda.dart';

class PopularProductCard extends StatelessWidget {
  final List<Map<String, dynamic>>? productList;
  const PopularProductCard({Key? key, this.productList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 14),
      height: 278,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productList!.length,
          itemBuilder: (context, index) {
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
                  Image.asset(
                    productList![index]["image"],
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
                          productList![index]["categories"],
                          style: secondaryTextStyle,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          productList![index]["product_name"],
                          style: blackTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: semiBold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          productList![index]["product_price"],
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
          }),
    );
  }
}
