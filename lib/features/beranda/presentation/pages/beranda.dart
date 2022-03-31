part of '../../beranda.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> productList = [
      {
        "image": "assets/image_shoes.png",
        "categories": "Hiking",
        "product_name": "COURT VISION 2.0",
        "product_price": "\$58,67"
      },
      {
        "image": "assets/image_shoes2.png",
        "categories": "Hiking",
        "product_name": "TEREX VISION 2.0",
        "product_price": "\$58,67"
      },
      {
        "image": "assets/image_shoes3.png",
        "categories": "Running",
        "product_name": "SL 200",
        "product_price": "\$58,67"
      },
    ];
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: ListView(
        children: [
          const HeaderBeranda(),
          const Categories(),
          const TitleSection(title: "Popular Product"),
          PopularProductCard(productList: productList),
          const TitleSection(title: "New Arrivals"),
          ArrivalProductCard(list: productList),
        ],
      ),
    );
  }
}
