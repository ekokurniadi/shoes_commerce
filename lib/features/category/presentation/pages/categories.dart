part of '../../category.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CategoryCubit>(context).getCategory();
    List<CategoryModel>? listCategoryModel = [];
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is OnCategoryLoaded) {
          listCategoryModel = state.listCategoryModel!.listCategoryModel!;
          listCategoryModel!;
          BlocProvider.of<ProductCubit>(context)
              .getProduct(pages: 1, category: listCategoryModel![0].id);
        }
        return Container(
          margin: EdgeInsets.only(top: defaultMargin),
          child: SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listCategoryModel!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    BlocProvider.of<CategoryCubit>(context).setIndex(
                      index,
                      listCategoryModel![index].id!,
                    );
                    BlocProvider.of<ProductCubit>(context).initialStateProduct(
                        category: listCategoryModel![index].id);
                    BlocProvider.of<ProductCubit>(context).getProduct(
                        pages: 1, category: listCategoryModel![index].id);
                  },
                  child: CategoryItem(
                    index: index,
                    categoryModel: listCategoryModel![index],
                    items: listCategoryModel!,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
