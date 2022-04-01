part of '../../product.dart';

class ArrivalProductCard extends StatelessWidget {
  const ArrivalProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ProductModel> listProductModel = [];
    bool isLoading = false;

    ScrollController scrollController = ScrollController();
    void onScroll() {
      double maxScroll = scrollController.position.maxScrollExtent;
      double currentScroll = scrollController.position.pixels;
      if (currentScroll == maxScroll) {
        BlocProvider.of<ProductCubit>(context).getProduct();
      }
    }

    scrollController.addListener(onScroll);

    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductInitial) {
          isLoading = true;
          BlocProvider.of<ProductCubit>(context).getProduct();
        } else if (state is OnProductLoading) {
          isLoading = true;
        } else if (state is OnProductLoaded) {
          isLoading = false;
          for (var element in state.productModel!.productModel!) {
            listProductModel.add(element);
          }
        }
        return Container(
          margin: const EdgeInsets.only(top: 14, bottom: 30),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.5,
          child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.vertical,
              shrinkWrap: false,
              itemCount: listProductModel.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                      left: defaultMargin,
                      right: defaultMargin,
                      bottom: defaultMargin),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          listProductModel[index]
                              .galeryModel!
                              .galeryModel![0]
                              .url!
                              .toString(),
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            listProductModel[index].categoryModel!.name!,
                            style: subtitleTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: regular,
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            listProductModel[index].name!,
                            style: primaryTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
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
                      ))
                    ],
                  ),
                );
              }),
        );
      },
    );
  }
}
