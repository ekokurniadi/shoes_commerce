import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamo/core/utility/theme_helper.dart';
import 'package:shamo/features/beranda/presentation/cubit/categories_cubit.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int categoriesIndex = 0;

    List<String> items = [
      "All Shoes",
      "Running",
      "Training",
      "Basket Ball",
      "Hiking"
    ];
    return Container(
      margin: EdgeInsets.only(top: defaultMargin),
      child: SizedBox(
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                BlocProvider.of<CategoriesCubit>(context).setIndex(index);
              },
              child: BlocBuilder<CategoriesCubit, CategoriesState>(
                builder: (context, state) {
                  if (state is OnCategoriesChanges) {
                    categoriesIndex = state.index;
                  }
                  return Container(
                    margin: index == 0
                        ? EdgeInsets.only(left: defaultMargin, right: 16)
                        : index == items.length - 1
                            ? EdgeInsets.only(right: defaultMargin)
                            : const EdgeInsets.only(right: 16),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: index == categoriesIndex
                            ? primaryColor
                            : transparentColor,
                        border: Border.all(
                            color: index == categoriesIndex
                                ? transparentColor
                                : subtitleColor)),
                    child: Center(
                      child: Text(
                        items[index],
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
              ),
            );
          },
        ),
      ),
    );
  }
}
