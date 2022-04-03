part of '../../product.dart';

class PopularProduct extends StatelessWidget {
  final int? category;
  const PopularProduct({Key? key, this.category}) : super(key: key);
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
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 14),
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
              return PopularProductCard(
                index: index,
                productModel: listProductModel[index],
              );
            },
          ),
        );
      },
    );
  }
}
