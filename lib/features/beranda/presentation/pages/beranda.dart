part of '../../beranda.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProfileCubit>(context).getUserProfile();
    BlocProvider.of<ProductCubit>(context).initialStateProduct();
    BlocProvider.of<ProductCubit>(context).getProduct();
    BlocProvider.of<ProductCubit>(context).getPopularProduct();

    return Scaffold(
      backgroundColor: backgroundColor1,
      body: ListView(
        children: const [
          HeaderBeranda(),
          Categories(),
          TitleSection(title: "Popular Product"),
          PopularProductCard(),
          TitleSection(title: "New Arrivals"),
          ArrivalProductCard(),
        ],
      ),
    );
  }
}
