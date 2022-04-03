part of '../../product.dart';

class PopularProductCard extends StatelessWidget {
  final int? category;
  const PopularProductCard({Key? key, this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<ProductModel> listProductModel = [];

    return BlocBuilder<PopularProductCubit, PopularProductState>(
      builder: (context, state) {
        if (state is PopularProductInitial) {
          return const PopularProductShimmer();
        } else if (state is OnPopularProductLoaded) {
          listProductModel
              .removeWhere((element) => element.categoryModel!.id != category);
          for (var element in state.productModel!.productModel!) {
            listProductModel.add(element);
          }
          if (listProductModel.isEmpty) {
            return Container(
              margin: const EdgeInsets.only(top: 14),
              height: 78,
              child: const EmptyProduct(),
            );
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
                  height: 278,
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
                              "\$${listProductModel[index].price!.toString()}",
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
