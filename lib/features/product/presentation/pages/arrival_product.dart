part of '../../product.dart';

class ArrivalProduct extends StatelessWidget {
  final int? category;
  const ArrivalProduct({Key? key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ProductModel> listProductModel = [];
    bool isLoading = false;
    ScrollController scrollController = ScrollController();

    void onScroll() {
      double maxScroll = scrollController.position.maxScrollExtent;
      double currentScroll = scrollController.position.pixels;
      if (currentScroll == maxScroll) {
        isLoading = true;
        BlocProvider.of<ProductCubit>(context).getProduct(
          pages: 1,
          category: category,
        );
      }
    }

    scrollController.addListener(onScroll);

    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is OnProductLoading) {
          isLoading = true;
        } else if (state is OnProductLoaded) {
          isLoading = false;
          listProductModel
              .removeWhere((element) => element.categoryModel!.id != category);
          for (var element in state.productModel!.productModel!) {
            listProductModel.add(element);
          }
        }
        return (listProductModel.isEmpty)
            ? const EmptyProduct()
            : Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 14),
                    padding: const EdgeInsets.only(bottom: 20),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: ListView.builder(
                        controller: scrollController,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: false,
                        itemCount: listProductModel.toSet().length,
                        itemBuilder: (context, index) {
                          return isLoading
                              ? const ArrivalProductShimmer()
                              : ArrivalProductCard(
                                  productModel: listProductModel[index],
                                );
                        }),
                  ),
                  isLoading == true
                      ? Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: Center(
                              child: SpinKitCircle(
                                  color: secondaryColor, size: 60),
                            ),
                          ),
                        )
                      : const Center()
                ],
              );
      },
    );
  }
}
