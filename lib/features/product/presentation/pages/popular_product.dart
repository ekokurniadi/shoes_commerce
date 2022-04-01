part of '../../product.dart';

class PopularProductCard extends StatelessWidget {
  const PopularProductCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<ProductModel> listProductModel = [];

    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is PopularProductInitial) {
          BlocProvider.of<ProductCubit>(context).getPopularProduct();
          return const PopularProductShimmer();
        } else if (state is OnPopularProductLoaded) {
          for (var element in state.productModel!.productModel!) {
            listProductModel.add(element);
          }
        } else if (state is OnPopularProductLoading) {
          return const PopularProductShimmer();
        }
        return Container(
          margin: const EdgeInsets.only(top: 14),
          height: 278,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listProductModel.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 215,
                  height: 274,
                  margin: EdgeInsets.only(
                      right: defaultMargin,
                      left: index == 0 ? defaultMargin : 0),
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
                        listProductModel[index]
                            .galeryModel!
                            .galeryModel![0]
                            .url!
                            .toString(),
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
                              listProductModel[index].categoryModel!.name!,
                              style: secondaryTextStyle,
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              listProductModel[index].name!,
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
                              listProductModel[index].price!.toString(),
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
      },
    );
  }
}
