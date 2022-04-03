part of '../../category.dart';

class CategoryItem extends StatelessWidget {
  final int index;
  final CategoryModel categoryModel;
  final int itemsLength;
  const CategoryItem({
    Key? key,
    required this.index,
    required this.categoryModel,
    required this.itemsLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int categoriesIndex = 0;
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is OnCategoriesChanges) {
          categoriesIndex = state.index!;
        }
        return Container(
          margin: index == itemsLength - 1
              ? EdgeInsets.only(right: defaultMargin)
              : index == 0
                  ? EdgeInsets.only(left: defaultMargin, right: 16)
                  : const EdgeInsets.only(right: 16),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: index == categoriesIndex ? primaryColor : transparentColor,
            border: Border.all(
              color:
                  index == categoriesIndex ? transparentColor : subtitleColor,
            ),
          ),
          child: Center(
            child: Text(
              categoryModel.name!,
              style: index == categoriesIndex
                  ? primaryTextStyle.copyWith(
                      fontSize: 13,
                      fontWeight: medium,
                    )
                  : subtitleTextStyle.copyWith(
                      fontSize: 13,
                      fontWeight: medium,
                    ),
            ),
          ),
        );
      },
    );
  }
}
