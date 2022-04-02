part of '../../beranda.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int? category;
    BlocProvider.of<ProfileCubit>(context).getUserProfile();
    BlocProvider.of<ProductCubit>(context).initialStateProduct();
    BlocProvider.of<PopularProductCubit>(context).getPopularProduct();

    return Scaffold(
      backgroundColor: backgroundColor1,
      body: ListView(
        children: [
          const HeaderBeranda(),
          const Categories(),
          const TitleSection(title: "Popular Product"),
          const PopularProductCard(),
          const TitleSection(title: "New Arrivals"),
          BlocBuilder<CategoryCubit, CategoryState>(
            builder: (context, state) {
              if (state is OnCategoriesChanges) {
                category = state.category!;
              }
              return ArrivalProductCard(
                category: category,
              );
            },
          )
        ],
      ),
    );
  }
}
